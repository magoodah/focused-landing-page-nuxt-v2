#!/bin/bash

# Check if scripts directory exists, create if not
if [ ! -d "scripts" ]; then
  echo "Creating scripts directory..."
  mkdir -p scripts
fi

# Production deployment script for Focused landing page
echo "Focused Landing Page - Production Deployment"
echo "============================================="

# Ensure we're in the project root
cd "$(dirname "$0")/.." || exit

# Check for production environment variable
if [ -f .env ]; then
  echo "Loading environment variables from .env file..."
  export $(grep -v '^#' .env | xargs)
fi

# Set APP_URL for production if not already set
if [ -z "$APP_URL" ]; then
  echo "APP_URL environment variable not found, using default production URL..."
  export APP_URL="https://app.befocused.ai"
fi

echo "Using APP_URL: $APP_URL"

# Build the application for production
echo "Building the application for production..."
pnpm build

# Output success message
echo ""
echo "Deployment build completed successfully!"
echo "The application is configured to use: $APP_URL for login/signup links"
echo ""
echo "To deploy to your hosting platform, follow these steps:"
echo "1. Upload the .output directory to your server"
echo "2. Set APP_URL environment variable on your server"
echo "3. Start the application using 'node .output/server/index.mjs'"
echo ""