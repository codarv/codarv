library(shiny)
library(pdftools)
library(tcltk)

# Function to select multiple files using a file dialog
select_files <- function(prompt) {
  original_dir <- getwd()
  setwd(normalizePath("~/Documents"))
  files <- tk_choose.files(caption = prompt)
  setwd(original_dir)
  
  if (length(files) == 0 || all(files == "")) {
    stop("No files selected")
  }
  for (file in files) {
    if (tolower(tools::file_ext(file)) != "pdf") {
      stop("One or more selected files are not PDFs")
    }
  }
  return(normalizePath(files))
}

# Function to create a directory if it doesn't exist
create_dir_if_not_exists <- function(dir) {
  if (!dir.exists(dir)) {
    dir.create(dir, recursive = TRUE)
  }
}

# Function to merge PDFs
merge_pdfs <- function(pdf_files, output_pdf) {
  pdf_combine(pdf_files, output_pdf)
}

ui <- fluidPage(
  titlePanel("PDF Merger"),
  sidebarLayout(
    sidebarPanel(
      actionButton("select_files", "Select PDF Files"),
      textInput("output_name", "Output File Name", value = ""),
      actionButton("merge_pdfs", "Merge PDFs")
    ),
    mainPanel(
      verbatimTextOutput("status")
    )
  )
)

server <- function(input, output, session) {
  pdf_files <- reactiveVal(NULL)

  observeEvent(input$select_files, {
    tryCatch({
      files <- select_files("Select PDF files to merge")
      pdf_files(files)
      output$status <- renderText({
        paste("Selected files:", paste(basename(files), collapse = ", "))
      })
      
      # Set the default output file name based on the first selected file
      if (length(files) > 0) {
        first_file_name <- tools::file_path_sans_ext(basename(files[1]))
        updateTextInput(session, "output_name", value = paste0(first_file_name, "_merged"))
      }
    }, error = function(e) {
      showModal(modalDialog(
        title = "Error",
        paste("An error occurred:", e$message),
        easyClose = TRUE,
        footer = NULL
      ))
    })
  })

  observeEvent(input$merge_pdfs, {
    tryCatch({
      files <- pdf_files()
      if (is.null(files)) {
        stop("No files selected")
      }

      # Create the target directory if it doesn't exist
      target_dir <- file.path(Sys.getenv("HOME"), "Documents/Merged_PDFs")
      create_dir_if_not_exists(target_dir)

      # Generate the output file name
      timestamp <- format(Sys.time(), "%Y%m%d%H%M%S")
      base_names <- sapply(files, function(x) tools::file_path_sans_ext(basename(x)))
      output_file_name <- paste0(input$output_name, "_", timestamp, ".pdf")
      output_pdf <- file.path(target_dir, output_file_name)

      # Call the function to merge PDFs
      merge_pdfs(files, output_pdf)

      # Print success message
      output$status <- renderText({
        paste("PDFs merged successfully into", output_pdf)
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