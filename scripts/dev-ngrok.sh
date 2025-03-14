#!/bin/bash

# Setup for running the Nuxt app with ngrok in development mode
echo "Starting Nuxt development server with ngrok tunnel"
echo "================================================="

# Ensure we're in the project root
cd "$(dirname "$0")/.." || exit

# Reset the nuxt development directory cache
echo "Resetting Nuxt cache..."
rm -rf .nuxt
rm -rf node_modules/.vite

# Set required environment variables
export NODE_ENV=development
export NUXT_HOST=0.0.0.0
export NUXT_PORT=3000
export NUXT_PUBLIC_SITE_URL=https://befocused.ngrok.io

# Start ngrok tunnel in background
echo "Starting ngrok tunnel to befocused.ngrok.io..."
ngrok http --domain=befocused.ngrok.io 3000 > /tmp/ngrok.log 2>&1 &
NGROK_PID=$!

# Give ngrok a moment to start
sleep 3

# Check if ngrok started successfully
if ps -p $NGROK_PID > /dev/null; then
  echo "Tunnel established. Starting Nuxt development server..."
  echo "Access your site at: https://befocused.ngrok.io"
  echo "============================================================="
  echo "Note: If you get 'host not allowed' errors, you may need to add the ngrok domain"
  echo "to allowedHosts in nuxt.config.ts and restart this script."
  echo ""
else
  echo "Error: ngrok failed to start. Check /tmp/ngrok.log for details."
  exit 1
fi

# Start Nuxt development server with special flags for compatibility
NITRO_HOST=0.0.0.0 NITRO_PORT=3000 pnpm nuxt dev --dotenv .env

# Clean up the ngrok process when we exit
kill $NGROK_PID