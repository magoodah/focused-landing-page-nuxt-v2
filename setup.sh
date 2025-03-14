#!/bin/bash

# Define the URLs for software downloads
GCLOUD_SDK_URL="https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-linux-x86_64.tar.gz"
CLOUD_SQL_PROXY_URL="https://storage.googleapis.com/cloud-sql-connectors/cloud-sql-proxy/v2.13.0/cloud-sql-proxy.linux.amd64"

# Define the base directory for software installations
SOFTWARE_DIR="software"
# Define a separate directory for Google Cloud SDK to avoid cluttering root folder
GCLOUD_DIR="$SOFTWARE_DIR/google-cloud"

# Create the software directories if they don't exist
if [ ! -d "$SOFTWARE_DIR" ]; then
  echo "Creating directory: $SOFTWARE_DIR"
  mkdir $SOFTWARE_DIR
fi

if [ ! -d "$GCLOUD_DIR" ]; then
  echo "Creating directory: $GCLOUD_DIR"
  mkdir -p $GCLOUD_DIR
fi

# Interactive software selection menu
echo "Welcome to the setup script!"
echo "Please select which software you would like to install:"

# Initialize selection variables (0=not selected, 1=selected)
install_gcloud=0
install_cloudsql=0
install_stripe=0
install_ngrok=0

# Display menu
echo ""
echo "Available software:"
echo "1) Google Cloud SDK"
echo "2) Cloud SQL Proxy"
echo "3) Stripe CLI"
echo "4) ngrok"
echo "5) All of the above"
echo "6) None"
echo ""

# Ask for selection
read -p "Enter your choices (space-separated numbers, e.g. '1 3 4'): " choices

# Process choices
for choice in $choices; do
  case $choice in
    1) install_gcloud=1 ;;
    2) install_cloudsql=1 ;;
    3) install_stripe=1 ;;
    4) install_ngrok=1 ;;
    5) install_gcloud=1; install_cloudsql=1; install_stripe=1; install_ngrok=1 ;;
    6) echo "No software selected. Exiting."; exit 0 ;;
    *) echo "Invalid choice: $choice" ;;
  esac
done

# Confirm selections
echo ""
echo "You've selected to install:"
[[ $install_gcloud -eq 1 ]] && echo "- Google Cloud SDK"
[[ $install_cloudsql -eq 1 ]] && echo "- Cloud SQL Proxy"
[[ $install_stripe -eq 1 ]] && echo "- Stripe CLI"
[[ $install_ngrok -eq 1 ]] && echo "- ngrok"
echo ""

read -p "Proceed with installation? (y/n): " confirm
if [[ "$confirm" != "y" && "$confirm" != "Y" ]]; then
  echo "Installation cancelled. Exiting."
  exit 0
fi

# Change to the software directory
cd $SOFTWARE_DIR

# Check if Google Cloud SDK installation is requested and not already installed
if [[ $install_gcloud -eq 1 ]]; then
  if command -v gcloud >/dev/null 2>&1; then
    echo "Google Cloud SDK is already installed. Skipping installation."
  else
    # Navigate to the Google Cloud directory
    cd $GCLOUD_DIR
    
    # Download the Gcloud SDK tarball
    echo "Downloading Gcloud SDK..."
    curl -O $GCLOUD_SDK_URL

    # Extract the Gcloud SDK tarball
    echo "Extracting Gcloud SDK..."
    tar -xvf $(basename $GCLOUD_SDK_URL)

    # Navigate into the extracted directory
    cd google-cloud-sdk

    # Run the installation script
    echo "Installing Gcloud SDK..."
    ./install.sh

    # Add the gcloud binary to the PATH for the current script
    export PATH=$PWD/bin:$PATH

    # Initialize the Gcloud SDK
    echo "Initializing Gcloud SDK..."
    ./bin/gcloud init

    # Authenticate with application-default login
    echo "Authenticating with application-default login..."
    gcloud auth application-default login

    # Navigate back to the software directory
    cd ../../

    # Clean up by removing the downloaded tarball
    echo "Cleaning up..."
    rm $GCLOUD_DIR/$(basename $GCLOUD_SDK_URL)
  fi
else
  echo "Google Cloud SDK installation skipped as per user selection."
fi

# Check if Cloud SQL Proxy installation is requested
if [[ $install_cloudsql -eq 1 ]]; then
  # Check if Cloud SQL Proxy is already installed
  if [ -f "$SOFTWARE_DIR/cloud-sql-proxy" ] && [ -x "$SOFTWARE_DIR/cloud-sql-proxy" ]; then
    echo "Cloud SQL Proxy is already installed. Skipping download."
  else
    # Download the Cloud SQL Proxy
    echo "Downloading Cloud SQL Proxy..."
    cd $SOFTWARE_DIR
    curl -o cloud-sql-proxy $CLOUD_SQL_PROXY_URL

    # Make the Cloud SQL Proxy executable
    chmod +x cloud-sql-proxy
  fi
else
  echo "Cloud SQL Proxy installation skipped as per user selection."
fi

# Check if Stripe CLI installation is requested
if [[ $install_stripe -eq 1 ]]; then
  # Check if Stripe CLI is already installed
  if command -v stripe >/dev/null 2>&1; then
    echo "Stripe CLI is already installed. Skipping installation."
    # Verify Stripe CLI installation
    stripe --version
  else
    echo "Installing Stripe CLI..."

    # Step 1: Import Stripe CLI GPG key
    echo "Importing Stripe CLI GPG key..."
    curl -s https://packages.stripe.dev/api/security/keypair/stripe-cli-gpg/public | gpg --dearmor | sudo tee /usr/share/keyrings/stripe.gpg > /dev/null

    # Step 2: Add Stripe CLI apt repository
    echo "Adding Stripe CLI repository to apt sources..."
    echo "deb [signed-by=/usr/share/keyrings/stripe.gpg] https://packages.stripe.dev/stripe-cli-debian-local stable main" | sudo tee -a /etc/apt/sources.list.d/stripe.list > /dev/null

    # Step 3: Update package list
    echo "Updating package list..."
    sudo apt update

    # Step 4: Install Stripe CLI
    echo "Installing Stripe CLI..."
    sudo apt install stripe -y

    # Verify Stripe CLI installation
    stripe --version

    echo "Stripe CLI installation completed successfully."
  fi
else
  echo "Stripe CLI installation skipped as per user selection."
fi

# Check if ngrok installation is requested
if [[ $install_ngrok -eq 1 ]]; then
  # Check if ngrok is already installed
  if command -v ngrok >/dev/null 2>&1; then
    echo "ngrok is already installed. Skipping installation."
    # Verify ngrok installation
    ngrok --version
    
    # Check if ngrok is already configured
    if ngrok config check >/dev/null 2>&1; then
      echo "ngrok is already configured. Skipping token configuration."
    else
      # Prompt user for ngrok auth token
      echo "Please enter your ngrok auth token (from your ngrok account):"
      read -r NGROK_AUTH_TOKEN

      # Add the provided ngrok auth token
      echo "Configuring ngrok with the provided auth token..."
      ngrok config add-authtoken "$NGROK_AUTH_TOKEN"
    fi
  else
    echo "Installing ngrok..."
    curl -sSL https://ngrok-agent.s3.amazonaws.com/ngrok.asc \
      | sudo tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null \
      && echo "deb https://ngrok-agent.s3.amazonaws.com buster main" \
      | sudo tee /etc/apt/sources.list.d/ngrok.list > /dev/null \
      && sudo apt update \
      && sudo apt install ngrok -y

    # Verify ngrok installation
    echo "Verifying ngrok installation..."
    ngrok --version

    # Prompt user for ngrok auth token
    echo "Please enter your ngrok auth token (from your ngrok account):"
    read -r NGROK_AUTH_TOKEN

    # Add the provided ngrok auth token
    echo "Configuring ngrok with the provided auth token..."
    ngrok config add-authtoken "$NGROK_AUTH_TOKEN"

    echo "ngrok installation and configuration completed successfully."
  fi
else
  echo "ngrok installation skipped as per user selection."
fi

# Summary of installations
echo ""
echo "Setup completed successfully."
echo "Installation summary:"
[[ $install_gcloud -eq 1 ]] && echo "- Google Cloud SDK: Installed in $GCLOUD_DIR"
[[ $install_cloudsql -eq 1 ]] && echo "- Cloud SQL Proxy: Installed in $SOFTWARE_DIR"
[[ $install_stripe -eq 1 ]] && echo "- Stripe CLI: Installed"
[[ $install_ngrok -eq 1 ]] && echo "- ngrok: Installed"
echo ""