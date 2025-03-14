// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  compatibilityDate: '2024-11-01',
  devtools: { enabled: true },

  modules: [
    '@nuxt/content',
    '@nuxt/eslint',
    '@nuxt/fonts',
    '@nuxt/icon',
    '@nuxt/image',
    '@nuxt/scripts',
    '@nuxt/test-utils',
    '@nuxtjs/tailwindcss'
  ],
  
  css: [
    '~/assets/css/main.css'
  ],
  
  tailwindcss: {
    configPath: '~/tailwind.config.js',
  },
  
  postcss: {
    plugins: {
      tailwindcss: {},
      autoprefixer: {},
    },
  },
  
  // Configure image module
  image: {
    provider: 'ipx',
    quality: 80,
    format: ['webp', 'jpg', 'png', 'jpeg'],
    screens: {
      xs: 320,
      sm: 640,
      md: 768,
      lg: 1024,
      xl: 1280,
      xxl: 1536,
    },
  },
  
  // Configure @nuxt/content
  content: {
    // Disable Nuxt Studio
    studio: false,
    // Content module options
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
  },
  
  // Configure Nitro (Nuxt server engine) for better performance
  nitro: {
    preset: 'node-server',
    routeRules: {
      '/**': { 
        headers: { 
          'cache-control': 'public,max-age=3600'
        } 
      }
    },
    // Configuration for Cloud Run
    runtimeConfig: {
      // Public keys accessible on client
      public: {
        apiBase: '/api'
      }
    },
    // Configure port for production
    server: process.env.NODE_ENV === 'production' ? {
      port: process.env.PORT || 8080,
      host: '0.0.0.0'
    } : undefined
  },
  
  app: {
    head: {
      title: 'Focused - AI-Powered Productivity for ADHD/ADD Minds',
      meta: [
        { name: 'viewport', content: 'width=device-width, initial-scale=1' },
        { name: 'description', content: 'AI-Powered Productivity Tool for Deep Work & Distraction Management' }
      ],
      htmlAttrs: {
        lang: 'en'  // Add HTML lang attribute
      },
      link: [
        { rel: 'preconnect', href: 'https://fonts.googleapis.com' },
        { rel: 'preconnect', href: 'https://fonts.gstatic.com', crossorigin: '' },
        // Update Google Fonts with display=swap
        { rel: 'stylesheet', href: 'https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap&display=swap' }
      ]
    }
  }
})