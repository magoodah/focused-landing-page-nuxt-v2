<template>
  <Teleport to="body">
    <div v-if="show" class="fixed inset-0 z-50 overflow-y-auto" @click.self="close">
      <div class="flex items-center justify-center min-h-screen p-4 sm:p-6 md:p-8">
        <div class="fixed inset-0 bg-black bg-opacity-80 transition-opacity" @click="close"></div>
        
        <div class="bg-white rounded-lg shadow-xl overflow-hidden z-50 w-full max-w-screen-sm md:max-w-screen-md lg:max-w-screen-lg xl:max-w-screen-xl">
          <div class="flex justify-between items-center p-3 sm:p-4 md:p-5 border-b bg-gray-50">
            <h3 class="text-lg sm:text-xl font-semibold text-gray-900">{{ title }}</h3>
            <button 
              class="text-gray-500 hover:text-gray-700 focus:outline-none" 
              @click="close"
              aria-label="Close"
            >
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg>
            </button>
          </div>
          
          <div class="aspect-w-16 aspect-h-9">
            <iframe 
              :src="videoUrl" 
              frameborder="0"
              allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
              allowfullscreen
              class="w-full h-full"
            ></iframe>
          </div>
        </div>
      </div>
    </div>
  </Teleport>
</template>

<script setup>
import { ref, watch, computed } from 'vue';

const props = defineProps({
  show: {
    type: Boolean,
    default: false
  },
  videoId: {
    type: String,
    required: true
  },
  title: {
    type: String,
    default: 'Watch Demo'
  }
});

const emit = defineEmits(['close']);

// Construct YouTube URL with autoplay
const videoUrl = computed(() => {
  return `https://www.youtube.com/embed/${props.videoId}?autoplay=1`;
});

// Close modal function
const close = () => {
  emit('close');
};

// Add/remove scroll lock to body when modal is shown/hidden
watch(() => props.show, (newVal) => {
  if (newVal) {
    document.body.style.overflow = 'hidden';
  } else {
    document.body.style.overflow = '';
  }
});
</script>

