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
  
  // Development config
  devServer: {
    port: 3000,
    host: '0.0.0.0',
  },
  
  devtools: { enabled: true },
  
  // Disable Nuxt Telemetry
  telemetry: false,
  
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
  
  // Runtime config for app-wide variables (accessible in the browser)
  runtimeConfig: {
    // Private keys (server only)
    // Add any non-public environment variables here
    
    // Public keys (accessible on client)
    public: {
      apiBase: '/api',
      appUrl: process.env.APP_URL || 'http://localhost:5173'
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
        { name: 'description', content: 'AI-Powered Productivity Tool for Deep Work & Distraction Management' },
        { name: 'theme-color', content: '#6d28d9' },
        { name: 'apple-mobile-web-app-capable', content: 'yes' },
        { name: 'apple-mobile-web-app-status-bar-style', content: 'black-translucent' }
      ],
      htmlAttrs: {
        lang: 'en'  // Add HTML lang attribute
      },
      link: [
        // Favicon settings
        { rel: 'icon', type: 'image/x-icon', href: '/favicon.ico' },
        { rel: 'icon', type: 'image/png', sizes: '16x16', href: '/favicon-16x16.png' },
        { rel: 'icon', type: 'image/png', sizes: '32x32', href: '/favicon-32x32.png' },
        { rel: 'apple-touch-icon', sizes: '180x180', href: '/apple-touch-icon.png' },
        { rel: 'manifest', href: '/site.webmanifest' },
        
        // Fonts
        { rel: 'preconnect', href: 'https://fonts.googleapis.com' },
        { rel: 'preconnect', href: 'https://fonts.gstatic.com', crossorigin: '' },
        { rel: 'stylesheet', href: 'https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap' }
      ]
    }
  }
})