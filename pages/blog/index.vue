<template>
  <div>
    <!-- Hero Section -->
    <div class="bg-gradient-to-r from-indigo-600 to-purple-600 text-white">
      <div class="max-w-6xl mx-auto py-16 px-4 sm:px-6 lg:px-8">
        <div class="text-center">
          <h1 class="text-4xl md:text-5xl font-extrabold mb-4">Focused Blog</h1>
          <p class="text-xl md:text-2xl max-w-3xl mx-auto opacity-90">Insights, strategies, and stories to help you master productivity with ADHD/ADD</p>
        </div>
      </div>
    </div>
    
    <!-- Content Section -->
    <div class="max-w-6xl mx-auto py-12 px-4 sm:px-6 lg:px-8">
      <!-- Featured Article -->
      <div v-if="articles && articles.length" class="mb-16">
        <div class="flex justify-between items-center mb-8">
          <h2 class="text-2xl font-bold text-gray-900">Latest Articles</h2>
          <div class="relative">
            <select v-model="selectedCategory" class="appearance-none bg-white border border-gray-300 rounded-md px-4 py-2 pr-8 text-gray-700 focus:outline-none focus:ring-2 focus:ring-indigo-500">
              <option value="all">All Categories</option>
              <option value="productivity">Productivity</option>
              <option value="adhd">ADHD</option>
              <option value="technology">Technology</option>
            </select>
            <div class="pointer-events-none absolute inset-y-0 right-0 flex items-center px-2 text-gray-700">
              <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"></path>
              </svg>
            </div>
          </div>
        </div>
        
        <div v-if="pending" class="text-center py-12">
          <p class="text-lg text-gray-600">Loading articles...</p>
        </div>
        
        <div v-else class="grid gap-10 md:grid-cols-2 lg:grid-cols-3">
          <div v-for="article in filteredArticles" :key="article._path" class="bg-white rounded-lg shadow-lg overflow-hidden transition-all duration-300 hover:shadow-xl hover:translate-y-[-5px]">
            <NuxtLink :to="article._path" class="block h-full">
              <div class="h-48 bg-gray-200 relative overflow-hidden">
                <div class="absolute inset-0 bg-cover bg-center" :style="`background-image: url(${article.image || getDefaultImage(article.category)})`"></div>
                <div class="absolute top-0 right-0 bg-indigo-600 text-white text-xs font-bold uppercase px-3 py-1 rounded-bl-lg">
                  {{ article.category }}
                </div>
              </div>
              <div class="p-6">
                <div class="flex items-center text-gray-500 text-sm mb-3">
                  <span v-if="article.date" class="flex items-center">
                    <svg class="w-4 h-4 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"></path>
                    </svg>
                    {{ formatDate(article.date) }}
                  </span>
                  <span class="mx-2">•</span>
                  <span class="flex items-center">
                    <svg class="w-4 h-4 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                    </svg>
                    {{ article.readTime || '5 min read' }}
                  </span>
                </div>
                <h2 class="text-xl font-bold text-gray-900 mb-3 line-clamp-2">{{ article.title }}</h2>
                <p class="text-gray-700 mb-4 line-clamp-3">{{ article.description }}</p>
                <p class="text-indigo-600 font-medium">Read more →</p>
              </div>
            </NuxtLink>
          </div>
        </div>
      </div>
      
      <div v-else class="text-center py-12">
        <p class="text-lg text-gray-600">No articles found</p>
        <div v-if="error" class="mt-4 p-4 bg-gray-100 rounded text-left">
          <pre>{{ error }}</pre>
        </div>
      </div>
      
      <!-- Newsletter Signup -->
      <div class="bg-gray-100 rounded-xl p-8 mt-12">
        <div class="max-w-3xl mx-auto text-center">
          <h2 class="text-2xl font-bold text-gray-900 mb-3">Subscribe to our newsletter</h2>
          <p class="text-gray-700 mb-6">Get the latest productivity tips, ADHD strategies, and Focused updates delivered to your inbox.</p>
          <div class="flex flex-col sm:flex-row gap-3 max-w-md mx-auto">
            <input type="email" placeholder="Your email address" class="flex-1 px-4 py-3 rounded-md border border-gray-300 focus:outline-none focus:ring-2 focus:ring-indigo-500">
            <button class="bg-indigo-600 text-white px-6 py-3 rounded-md font-medium hover:bg-indigo-700 transition-colors">Subscribe</button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, computed } from 'vue'

// Mock blog post data with enhanced information
const articles = ref([
  {
    _path: '/blog/getting-started-with-focused',
    title: 'Getting Started with Focused: An AI-Powered Productivity Tool for ADHD/ADD Minds',
    description: 'Learn how Focused helps people with ADHD/ADD achieve greater productivity through AI-powered distraction detection and personalized focus sessions',
    date: '2024-03-12',
    category: 'productivity',
    readTime: '6 min read',
    image: 'https://images.unsplash.com/photo-1517245386807-bb43f82c33c4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=800&q=80'
  },
  {
    _path: '/blog/5-productivity-techniques-for-adhd',
    title: '5 Productivity Techniques for ADHD',
    description: 'Discover five effective productivity techniques specifically designed for individuals with ADHD',
    date: '2024-03-10',
    category: 'adhd',
    readTime: '8 min read',
    image: 'https://images.unsplash.com/photo-1606326608606-aa0b62935f2b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=800&q=80'
  },
  {
    _path: '/blog/adhd-in-the-workplace',
    title: 'ADHD in the Workplace',
    description: 'How to navigate challenges and leverage strengths in professional settings when you have ADHD',
    date: '2024-03-05',
    category: 'adhd',
    readTime: '7 min read',
    image: 'https://images.unsplash.com/photo-1497032628192-86f99bcd76bc?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=800&q=80'
  },
  {
    _path: '/blog/digital-minimalism-for-adhd',
    title: 'Digital Minimalism for ADHD',
    description: 'How reducing digital clutter can help ADHD minds focus better and reduce overwhelm',
    date: '2024-02-28',
    category: 'productivity',
    readTime: '5 min read',
    image: 'https://images.unsplash.com/photo-1508739773434-c26b3d09e071?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=800&q=80'
  },
  {
    _path: '/blog/how-ai-is-transforming-productivity-tools',
    title: 'How AI is Transforming Productivity Tools',
    description: 'An exploration of how artificial intelligence is creating more effective tools for focus and productivity',
    date: '2024-02-20',
    category: 'technology',
    readTime: '6 min read',
    image: 'https://images.unsplash.com/photo-1488229297570-58520851e868?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=800&q=80'
  }
])

const pending = ref(false)
const error = ref(null)
const selectedCategory = ref('all')

// Filter articles based on selected category
const filteredArticles = computed(() => {
  if (selectedCategory.value === 'all') {
    return articles.value
  }
  return articles.value.filter(article => article.category === selectedCategory.value)
})

// Default images for categories if no specific image is provided
function getDefaultImage(category) {
  const images = {
    'productivity': 'https://images.unsplash.com/photo-1484480974693-6ca0a78fb36b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=800&q=80',
    'adhd': 'https://images.unsplash.com/photo-1511632765486-a01980e01a18?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=800&q=80',
    'technology': 'https://images.unsplash.com/photo-1451187580459-43490279c0fa?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=800&q=80'
  }
  return images[category] || images['productivity']
}

function formatDate(date) {
  if (!date) return ''
  return new Date(date).toLocaleDateString('en-US', {
    year: 'numeric',
    month: 'long', 
    day: 'numeric'
  })
}
</script>