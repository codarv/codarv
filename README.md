- 👋 Hi, I’m @codarv
- 👀 I’m interested in writing effective code and make it as simple as it could be.
- 🌱 I’m currently working on my own Python project.
- 💞️ I’m looking to collaborate soon in future.
- 📫 How to reach me arvind.dass@outlook.com

<!---
codarv/codarv is a ✨ special ✨ repository because its `README.md` (this file) appears on your GitHub profile.
You can click the Preview link to take a look at your changes.
--->

# PDF Management App

This application allows you to merge and split PDF files using a Shiny app interface. The app provides a simple UI to select PDF files and perform the desired operations.

## Prerequisites

- R (version 4.0 or higher)
- R packages: `shiny`, `pdftools`, `tcltk`

You can install the required R packages using the following commands:

```r
install.packages("shiny")
install.packages("pdftools")
install.packages("tcltk")
```

## Usage

### Running the Application

To run the application, use the `runpdfapp` script. This script provides a menu to choose between merging and splitting PDF files.

1. Open a terminal.
2. Navigate to the directory containing the `runpdfapp` script.
3. Run the script using the following command:

```bash
./runpdfapp
```

### Creating an Alias

To make it easier to run the `runpdfapp` script from any directory, you can create an alias. Add the following line to your shell configuration file (e.g., `.bashrc`, `.zshrc`, or `.bash_profile`):

```bash
alias runpdfapp='/path/to/your/script/runpdfapp'
```

Replace `/path/to/your/script` with the actual path to the directory containing the `runpdfapp` script. After adding the alias, reload your shell configuration file:

```bash
source ~/.bashrc  # or source ~/.zshrc, source ~/.bash_profile
```

Now you can run the `runpdfapp` script from any directory by simply typing `runpdfapp` in the terminal.

### Menu Options

When you run the `runpdfapp` script, you will see the following menu:

```
Select an option:
1. Merge PDFs
2. Split PDF
Enter your choice [1-2]:
```

#### Option 1: Merge PDFs

1. Select option `1` to merge PDFs.
2. The Shiny app for merging PDFs will start.
3. Click the "Select PDF Files" button to choose the PDF files you want to merge. The file dialog will default to the `~/Documents` directory.
4. Enter the desired output file name (without extension) in the "Output File Name" field.
5. Click the "Merge PDFs" button to merge the selected PDF files.
6. The merged PDF will be saved in the `~/Documents/Merged_PDFs` directory, and the directory will be opened automatically.

#### Option 2: Split PDF

1. Select option `2` to split a PDF.
2. The Shiny app for splitting PDFs will start.
3. Click the "Select PDF File" button to choose the PDF file you want to split. The file dialog will default to the `~/Documents` directory.
4. Enter the desired page ranges in the "Page Ranges" field (e.g., `1-3,5,7-9`). If no ranges are provided, the PDF will be split into individual pages.
5. Click the "Split PDF" button to split the selected PDF file.
6. The split PDF files will be saved in the `~/Documents/Split_PDFs` directory, and the directory will be opened automatically.

## Troubleshooting

If you encounter any issues while running the application, please check the following:

- Ensure that R and the required packages are installed.
- Ensure that you have the necessary permissions to read and write files in the `~/Documents` directory.
- Check the terminal output for any error messages.

If you need further assistance, please contact the developer.

## License

This project is licensed under the MIT License.