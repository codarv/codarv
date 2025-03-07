#!/bin/bash

# Get the directory of the current script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Start the Shiny app in the background and redirect output to a temporary file
Rscript -e "shiny::runApp('$SCRIPT_DIR/SplitPDFsApp.r')" > shiny_app_output.log 2>&1 &

# Wait for a few seconds to ensure the Shiny app has started
sleep 5

# Extract the URL from the Shiny app output log file
shiny_url=$(grep -o "http://127.0.0.1:[0-9]*" shiny_app_output.log | head -n 1)
echo "Shiny app should be running at: $shiny_url"

# Check if the Shiny app is running
if [ -n "$shiny_url" ] && curl --output /dev/null --silent --head --fail "$shiny_url"; then
  echo "Shiny app is running. Opening in browser..."
  # Open the default web browser to the Shiny app's URL
  open "$shiny_url"
else
  echo "Shiny app is not running. Please check for errors."
fi

# Clean up the temporary log file
rm shiny_app_output.log