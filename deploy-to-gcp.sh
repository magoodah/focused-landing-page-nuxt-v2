#!/bin/bash

# Exit on any error
set -e

# Color codes for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Configuration (edit these values)
PROJECT_ID="focused-prod"  # Replace with your actual GCP project ID
REGION="us-central1"         # Default region
SERVICE_NAME="focused-landing-page"
IMAGE_NAME="gcr.io/$PROJECT_ID/$SERVICE_NAME"
MEMORY="512Mi"
CPU="1"
MIN_INSTANCES=0
MAX_INSTANCES=10

# Log function for prettier output
log() {
  echo -e "${GREEN}[$(date +'%Y-%m-%d %H:%M:%S')]${NC} $1"
}

error() {
  echo -e "${RED}[ERROR]${NC} $1"
  exit 1
}

warning() {
  echo -e "${YELLOW}[WARNING]${NC} $1"
}

# Check if gcloud is installed
if ! command -v gcloud &> /dev/null; then
  error "gcloud CLI not found. Please install it: https://cloud.google.com/sdk/docs/install"
fi

# Check if docker is installed
if ! command -v docker &> /dev/null; then
  error "Docker not found. Please install it: https://docs.docker.com/get-docker/"
fi

# Check if project ID has been set
if [ "$PROJECT_ID" == "YOUR_PROJECT_ID" ]; then
  error "Please edit the script and set your PROJECT_ID before running."
fi

# Ensure we're authenticated and set to the right project
log "Configuring gcloud to use project: $PROJECT_ID"
gcloud config set project $PROJECT_ID || error "Failed to set GCP project"

# Build the Docker image
log "Building Docker image: $IMAGE_NAME"
docker build -t $IMAGE_NAME . || error "Docker build failed"

# Configure Docker to use gcloud as a credential helper
log "Configuring Docker to use gcloud credentials"
gcloud auth configure-docker --quiet || warning "Failed to configure Docker credentials, may need to authenticate manually"

# Push the image to Google Container Registry
log "Pushing Docker image to GCR: $IMAGE_NAME"
docker push $IMAGE_NAME || error "Failed to push Docker image to GCR"

# Deploy to Cloud Run
log "Deploying to Cloud Run in region $REGION"
gcloud run deploy $SERVICE_NAME \
  --image $IMAGE_NAME \
  --platform managed \
  --region $REGION \
  --allow-unauthenticated \
  --memory $MEMORY \
  --cpu $CPU \
  --min-instances $MIN_INSTANCES \
  --max-instances $MAX_INSTANCES \
  --port 8080 \
  || error "Deployment to Cloud Run failed"

# Get the URL of the deployed service
SERVICE_URL=$(gcloud run services describe $SERVICE_NAME --platform managed --region $REGION --format='value(status.url)')

log "Deployment successful! Your application is available at:"
echo -e "${GREEN}$SERVICE_URL${NC}"
log "You can manage your service at: https://console.cloud.google.com/run/detail/$REGION/$SERVICE_NAME"