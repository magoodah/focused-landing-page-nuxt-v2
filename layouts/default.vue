<template>
  <div class="min-h-screen bg-white text-gray-800">
    <!-- Direct navigation in the layout -->
    <nav class="bg-white py-4 px-6 shadow-sm">
      <div class="max-w-7xl mx-auto flex justify-between items-center">
        <div class="flex items-center">
          <NuxtLink to="/" class="font-bold text-2xl text-indigo-600">Focused</NuxtLink>
          <div class="hidden md:flex ml-10 space-x-8">
            <NuxtLink to="/#features" class="text-gray-700 hover:text-indigo-600">Features</NuxtLink>
            <NuxtLink to="/#testimonials" class="text-gray-700 hover:text-indigo-600">Testimonials</NuxtLink>
            <NuxtLink to="/#pricing" class="text-gray-700 hover:text-indigo-600">Pricing</NuxtLink>
            <NuxtLink to="/blog" class="text-gray-700 hover:text-indigo-600">Blog</NuxtLink>
          </div>
        </div>
        <div class="flex items-center space-x-4">
          <a :href="getLoginUrl()" class="text-indigo-600 hover:text-indigo-800 font-medium hidden md:inline-block">
            Log in
          </a>
          <a :href="getSignupUrl()" class="btn-primary hidden md:inline-block">
            Sign up
          </a>
          <button class="md:hidden text-gray-500 focus:outline-none">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16" />
            </svg>
          </button>
        </div>
      </div>
    </nav>
    <slot />
  </div>
</template>

<script setup>
const { getLoginUrl, getSignupUrl } = useAppUrl();
</script>