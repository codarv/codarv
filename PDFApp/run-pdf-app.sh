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
    "$SCRIPT_DIR/run-merge-pdf.sh"
    ;;
  2)
    echo "Starting PDF Splitter..."
    "$SCRIPT_DIR/run-split-pdf.sh"
    ;;
  *)
    echo "Invalid choice. Exiting."
    exit 1
    ;;
esac