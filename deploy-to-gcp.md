# Deploying to Google Cloud Run

This document outlines the steps needed to deploy this Nuxt.js application to Google Cloud Run.

## Prerequisites

1. Google Cloud account
2. Google Cloud CLI installed and configured
3. Docker installed locally (for testing)

## Local Docker Testing

Before deploying to Cloud Run, you can test the Docker build locally:

```bash
# Build the Docker image
docker build -t focused-landing-page .

# Run the container locally
docker run -p 8080:8080 focused-landing-page
```

Visit `http://localhost:8080` to test the application.

## Deployment to Cloud Run

### 1. Build and Push Docker Image to Google Container Registry

```bash
# Set your Google Cloud project ID
export PROJECT_ID=focused-prod

# Build the image
gcloud builds submit --tag gcr.io/$PROJECT_ID/focused-landing-page

# Or use Docker to build and push
docker build -t gcr.io/$PROJECT_ID/focused-landing-page .
docker push gcr.io/$PROJECT_ID/focused-landing-page
```

### 2. Deploy to Cloud Run

```bash
gcloud run deploy focused-landing-page \
  --image gcr.io/$PROJECT_ID/focused-landing-page \
  --platform managed \
  --region us-central1 \
  --allow-unauthenticated \
  --memory 512Mi
```

### 3. Set Environment Variables (if needed)

```bash
gcloud run services update focused-landing-page \
  --set-env-vars "KEY=value"
```

## Continuous Deployment

For continuous deployment, you can set up Cloud Build triggers to automatically build and deploy when changes are pushed to your repository.

## Monitoring and Logging

Access logs and monitoring data from the Google Cloud Console:

- Logs: https://console.cloud.google.com/logs
- Monitoring: https://console.cloud.google.com/monitoring

## Custom Domain Setup

To set up a custom domain for your Cloud Run service:

1. Go to the Cloud Run service in Google Cloud Console
2. Click on "Domain Mappings"
3. Follow the instructions to map your domain