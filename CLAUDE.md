# CLAUDE.md - Instructions for Working with this Codebase

## Build and Development Commands
- `pnpm dev` - Start development server
- `pnpm build` - Build for production
- `pnpm generate` - Generate static site
- `pnpm preview` - Preview production build
- `pnpm lint` - Run ESLint (requires setup)
- `pnpm test` - Run tests (requires setup)

## Code Style Guidelines
- **Framework**: Nuxt.js 3.16.0 with Vue 3.5.13
- **TypeScript**: Use TypeScript for all new code
- **Naming**: Use kebab-case for component files, camelCase for functions/variables
- **Components**: Use the Nuxt-recommended component structure
- **Imports**: Group imports by external libraries, then internal modules
- **Error Handling**: Use Vue's error handling patterns
- **Testing**: Use @nuxt/test-utils for component/integration tests

## Modules in Use
Content (@nuxt/content), ESLint, Fonts, Icon, Image, Scripts, Test Utils

## Problem Solving Guidelines
When facing problems or technical challenges:
- Use **brave-search** to search the web for solutions
- Use **firecrawl** to crawl a specific website when needing more detailed information
- Always search for up-to-date information about the specific versions being used (Nuxt 3.16.x, Content 2.x, etc.)
- Check official documentation first, then look for community examples

## IMPORTANT: No Temporary Fixes Without Approval
- NEVER apply temporary fixes, hacks, or workarounds without first discussing with the user and getting explicit consent
- Always explain the problem, the proposed solution, and why it's a temporary fix
- Provide information about what a proper long-term solution would involve
- Wait for user approval before implementing any temporary solution
- Document any applied temporary fixes clearly in code comments

Follow the Nuxt 3 documentation for best practices: https://nuxt.com/docs