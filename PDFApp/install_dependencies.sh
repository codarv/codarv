#!/bin/bash

# Function to install R packages
install_r_packages() {
  Rscript -e "if (!require('shiny')) install.packages('shiny', repos='https://cran.rstudio.com/')"
  Rscript -e "if (!require('pdftools')) install.packages('pdftools', repos='https://cran.rstudio.com/')"
  Rscript -e "if (!require('tcltk')) install.packages('tcltk', repos='https://cran.rstudio.com/')"
}

# Function to install dependencies on macOS
install_macos_dependencies() {
  echo "Installing dependencies on macOS..."
  
  # Install Homebrew if not installed
  if ! command -v brew &> /dev/null; then
    echo "Homebrew not found. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi

  # Install R
  if ! command -v R &> /dev/null; then
    echo "R not found. Installing R..."
    brew install r
  fi

  # Install R packages
  install_r_packages
}

# Function to install dependencies on Windows
install_windows_dependencies() {
  echo "Installing dependencies on Windows..."

  # Install Chocolatey if not installed
  if ! command -v choco &> /dev/null; then
    echo "Chocolatey not found. Installing Chocolatey..."
    powershell -NoProfile -ExecutionPolicy Bypass -Command "Set-ExecutionPolicy Bypass -Scope Process; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))"
  fi

  # Install R
  if ! command -v R &> /dev/null; then
    echo "R not found. Installing R..."
    choco install r.project -y
  fi

  # Install R packages
  install_r_packages
}

# Detect the operating system and install dependencies accordingly
if [[ "$OSTYPE" == "darwin"* ]]; then
  install_macos_dependencies
elif [[ "$OSTYPE" == "msys" || "$OSTYPE" == "win32" ]]; then
  install_windows_dependencies
else
  echo "Unsupported operating system: $OSTYPE"
  exit 1
fi

echo "All necessary components have been installed."