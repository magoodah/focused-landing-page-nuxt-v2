# Focused Landing Page

Marketing website for the Focused app, built with Nuxt 3.

## Setup

```bash
# Install dependencies
pnpm install

# Setup environment variables (optional)
cp .env.example .env
# Edit .env file to customize settings
```

## Development

```bash
# Start development server with default environment settings
pnpm dev

# Start development server with environment variables from .env
pnpm dev:local
```

## Environment Variables

The application uses the following environment variables:

- `APP_URL`: The URL for the Focused app (used for login/signup links)
  - Default for local development: `http://localhost:5173`
  - Default for production: `https://app.befocused.ai`

## Deployment

```bash
# Build for production
pnpm deploy:prod

# Generate static site
pnpm generate
```

## Scripts

The application includes several utility scripts:

- `scripts/dev.sh`: Starts the development server with environment variables from .env
- `scripts/deploy.sh`: Builds the application for production with proper environment settings
- `setup.sh`: Interactive setup for development tools and environment
