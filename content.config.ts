// content.config.ts
export default {
  // Customize content module options
  documentDriven: false,
  // Add explicit content path
  contentDir: 'content',
  experimental: {
    clientDB: true
  },
  highlight: {
    theme: 'github-light'
  },
  markdown: {
    toc: {
      depth: 3,
      searchDepth: 3
    }
  }
}