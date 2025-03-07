#!/bin/bash

# Get the directory of the current script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Select an option:"
echo "1. Merge PDFs"
echo "2. Split PDF"
read -p "Enter your choice [1-2]: " choice

case $choice in
  1)
    echo "Starting PDF Merger..."
    if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "win32" ]]; then
      Rscript -e "shiny::runApp('$SCRIPT_DIR/MergePDFsApp.r')"
    else
      "$SCRIPT_DIR/run-merge-pdf.sh"
    fi
    ;;
  2)
    echo "Starting PDF Splitter..."
    if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "win32" ]]; then
      Rscript -e "shiny::runApp('$SCRIPT_DIR/SplitPDFsApp.r')"
    else
      "$SCRIPT_DIR/run-split-pdf.sh"
    fi
    ;;
  *)
    echo "Invalid choice. Exiting."
    exit 1
    ;;
esac