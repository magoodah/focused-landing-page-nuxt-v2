#!/bin/bash

# Local development script for Focused landing page
echo "Focused Landing Page - Local Development"
echo "========================================"

# Ensure we're in the project root
cd "$(dirname "$0")/.." || exit

# Check for environment variable file
if [ -f .env ]; then
  echo "Loading environment variables from .env file..."
  export $(grep -v '^#' .env | xargs)
fi

# Set APP_URL for local development if not already set
if [ -z "$APP_URL" ]; then
  echo "APP_URL environment variable not found, using localhost:5173..."
  export APP_URL="http://localhost:5173"
fi

echo "Using APP_URL: $APP_URL"

# Start the development server
echo "Starting development server..."
pnpm dev