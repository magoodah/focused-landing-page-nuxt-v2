FROM node:20-alpine AS build

WORKDIR /app

# Install pnpm
RUN corepack enable
RUN corepack prepare pnpm@latest --activate

# Copy package.json and pnpm-lock.yaml
COPY package.json pnpm-lock.yaml ./

# Install dependencies
RUN pnpm install --frozen-lockfile

# Copy the rest of the application
COPY . .

# Build the application
RUN pnpm build

# Production stage
FROM node:20-alpine

WORKDIR /app

ENV NODE_ENV=production

# Install pnpm
RUN corepack enable
RUN corepack prepare pnpm@latest --activate

# Copy built app from build stage
COPY --from=build /app/.output /app/.output

# Expose the port
EXPOSE 8080

# Set the command to run the app
CMD ["node", ".output/server/index.mjs"]