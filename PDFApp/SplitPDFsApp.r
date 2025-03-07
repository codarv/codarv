library(shiny)
library(pdftools)
library(tcltk)

# Function to select a PDF file using a file dialog
select_file <- function(prompt) {
  original_dir <- getwd()
  setwd(normalizePath("~/Documents"))
  file <- tk_choose.files(caption = prompt)
  setwd(original_dir)
  
  if (length(file) == 0 || all(file == "")) {
    stop("No file selected")
  }
  if (tolower(tools::file_ext(file)) != "pdf") {
    stop("Selected file is not a PDF")
  }
  return(normalizePath(file))
}

# Function to create a directory if it doesn't exist
create_dir_if_not_exists <- function(dir) {
  if (!dir.exists(dir)) {
    dir.create(dir, recursive = TRUE)
  }
}

# Function to split PDF
split_pdf <- function(pdf_file, output_dir, ranges = NULL) {
  pdf_info <- pdf_info(pdf_file)
  total_pages <- pdf_info$pages
  base_name <- tools::file_path_sans_ext(basename(pdf_file))

  if (is.null(ranges) || ranges == "") {
    ranges <- lapply(1:total_pages, function(x) x)
  } else {
    ranges <- strsplit(ranges, ",")[[1]]
    ranges <- lapply(ranges, function(x) {
      range <- as.numeric(strsplit(x, "-")[[1]])
      if (length(range) == 1) {
        return(range)
      } else {
        return(seq(range[1], range[2]))
      }
    })
  }

  for (i in seq_along(ranges)) {
    range <- ranges[[i]]
    output_file <- file.path(output_dir, paste0(base_name, "-part", i, ".pdf"))
    pdf_subset(pdf_file, pages = range, output = output_file)
  }
}

ui <- fluidPage(
  titlePanel("PDF Splitter"),
  sidebarLayout(
    sidebarPanel(
      actionButton("select_file", "Select PDF File"),
      textInput("ranges", "Page Ranges (e.g., 1-3,5,7-9)", value = ""),
      actionButton("split_pdf", "Split PDF")
    ),
    mainPanel(
      verbatimTextOutput("status")
    )
  )
)

server <- function(input, output, session) {
  pdf_file <- reactiveVal(NULL)

  observeEvent(input$select_file, {
    tryCatch({
      file <- select_file("Select a PDF file to split")
      pdf_file(file)
      output$status <- renderText({
        paste("Selected file:", basename(file))
      })
    }, error = function(e) {
      showModal(modalDialog(
        title = "Error",
        paste("An error occurred:", e$message),
        easyClose = TRUE,
        footer = NULL
      ))
    })
  })

  observeEvent(input$split_pdf, {
    tryCatch({
      file <- pdf_file()
      if (is.null(file)) {
        stop("No file selected")
      }

      # Create the target directory if it doesn't exist
      target_dir <- file.path(Sys.getenv("HOME"), "Documents/Split_PDFs")
      create_dir_if_not_exists(target_dir)

      # Split the PDF
      split_pdf(file, target_dir, input$ranges)

      # Print success message
      output$status <- renderText({
        paste("PDF split successfully. Files saved in", target_dir)
      })

      # Open the target directory
      system(paste("open", target_dir))
    }, error = function(e) {
      showModal(modalDialog(
        title = "Error",
        paste("An error occurred:", e$message),
        easyClose = TRUE,
        footer = NULL
      ))
    })
  })
}

shinyApp(ui = ui, server = server)