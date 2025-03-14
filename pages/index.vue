<template>
  <!-- Hero Section -->
  <section class="hero-gradient py-16 px-6">
    <div class="max-w-7xl mx-auto relative z-10">
      <div class="flex flex-col md:flex-row items-center">
        <div class="md:w-1/2 mb-10 md:mb-0 relative">
          <!-- Decorative dots pattern -->
          <div class="absolute -left-16 -top-16 opacity-10 hidden lg:block">
            <div class="grid grid-cols-4 gap-4">
              <div v-for="i in 16" :key="i" class="w-2 h-2 bg-indigo-500 rounded-full"></div>
            </div>
          </div>
          
          <h1 class="text-4xl md:text-5xl font-bold text-gray-900 leading-tight">Reclaim Your Focus.</h1>
          <h2 class="text-xl md:text-2xl mt-4 text-indigo-700 font-medium">AI-Powered Focus System for ADHD/ADD Minds</h2>
          <p class="mt-6 text-gray-600">
            Real-time distraction monitoring, voice coaching, and analytics for deeper work sessions.
          </p>
          <div class="mt-8 flex flex-col sm:flex-row gap-4">
            <a :href="getSignupUrl()" class="btn-primary flex items-center justify-center">
              <span>Start Focusing</span>
            </a>
            <button @click="showVideoModal = true" class="btn-secondary flex items-center justify-center">
              <div v-html="featherIcon('play-circle')" class="mr-2"></div>
              <span>Watch Demo</span>
            </button>
          </div>
          <p class="mt-4 text-sm text-gray-500">*No credit card required. 14-day free access to all features.</p>
        </div>
        <div class="md:w-1/2 md:pl-10 relative z-10">
          <div class="relative">
            <!-- Decorative element behind image -->
            <div class="absolute -top-6 -right-6 w-64 h-64 bg-indigo-100 rounded-full opacity-50 filter blur-3xl"></div>
            <!-- Small decorative rings -->
            <div class="absolute top-10 -left-4 w-8 h-8 border-2 border-indigo-200 rounded-full opacity-40"></div>
            <div class="absolute bottom-20 right-8 w-12 h-12 border-2 border-indigo-300 rounded-full opacity-30"></div>
            <NuxtImg
              src="https://storage.googleapis.com/audioscribe-demo-public-1/0_Hero_Section_no_background.png"
              alt="Focused App Dashboard"
              class="w-full relative z-10"
              width="800"
              height="600"
              format="webp"
              loading="eager"
              quality="80"
              :placeholder="true"
              preload
            />
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- Features Section -->
  <section id="features" class="py-16 px-6 bg-white">
    <div class="max-w-7xl mx-auto">
      <h2 class="text-3xl font-bold text-center text-gray-900 mb-4">How Focused Works</h2>
      <p class="text-center text-gray-600 mb-12 max-w-3xl mx-auto">Intelligent tools built specifically for your ADHD/ADD brain</p>
      
      <!-- Feature Cards Grid -->
      <div class="grid md:grid-cols-2 lg:grid-cols-4 gap-6">
        <!-- Feature 1 -->
        <div class="feature-card">
          <div class="w-full h-48 overflow-hidden">
            <NuxtImg 
              src="https://storage.googleapis.com/audioscribe-demo-public-1/1_Distraction_Detection.png" 
              alt="Distraction Detection" 
              class="w-full h-full object-cover"
              width="400" 
              height="192" 
              format="webp"
              loading="lazy"
              quality="80"
            />
          </div>
          <div class="p-5">
            <div class="flex items-start">
              <div class="flex-shrink-0 mr-3 mt-1">
                <div class="w-7 h-7 rounded-full bg-indigo-100 flex items-center justify-center text-indigo-600">
                  <div v-html="featherIcon('eye')" class="w-4 h-4"></div>
                </div>
              </div>
              <div>
                <h3 class="text-xl font-semibold mb-2">Distraction Detection</h3>
                <p class="text-gray-600">
                  AI instantly spots when you're off-track, keeping you focused on what matters.
                </p>
              </div>
            </div>
          </div>
        </div>
        
        <!-- Feature 2 -->
        <div class="feature-card">
          <div class="w-full h-48 overflow-hidden">
            <NuxtImg 
              src="https://storage.googleapis.com/audioscribe-demo-public-1/2_Customize_Durations.png" 
              alt="Personalized Focus Sessions" 
              class="w-full h-full object-cover"
              width="400" 
              height="192" 
              format="webp"
              loading="lazy"
              quality="80"
            />
          </div>
          <div class="p-5">
            <div class="flex items-start">
              <div class="flex-shrink-0 mr-3 mt-1">
                <div class="w-7 h-7 rounded-full bg-indigo-100 flex items-center justify-center text-indigo-600">
                  <div v-html="featherIcon('clock')" class="w-4 h-4"></div>
                </div>
              </div>
              <div>
                <h3 class="text-xl font-semibold mb-2">Focus Sessions</h3>
                <p class="text-gray-600">
                  Work intervals that adapt to your rhythm—from short sprints to deep work marathons.
                </p>
              </div>
            </div>
          </div>
        </div>
        
        <!-- Feature 3 -->
        <div class="feature-card relative">
          <div class="absolute top-3 right-3 bg-indigo-600 text-white text-xs px-2 py-1 rounded-full z-10">Coming Soon!</div>
          <div class="w-full h-48 overflow-hidden">
            <NuxtImg 
              src="https://storage.googleapis.com/audioscribe-demo-public-1/3_Voice_Coaching.png" 
              alt="Smart Voice Coaching" 
              class="w-full h-full object-cover"
              width="400" 
              height="192" 
              format="webp"
              loading="lazy"
              quality="80"
            />
          </div>
          <div class="p-5">
            <div class="flex items-start">
              <div class="flex-shrink-0 mr-3 mt-1">
                <div class="w-7 h-7 rounded-full bg-indigo-100 flex items-center justify-center text-indigo-600">
                  <div v-html="featherIcon('volume-2')" class="w-4 h-4"></div>
                </div>
              </div>
              <div>
                <h3 class="text-xl font-semibold mb-2">Voice Coaching</h3>
                <p class="text-gray-600">
                  Gentle voice nudges bring you back to task when your attention drifts.
                </p>
              </div>
            </div>
          </div>
        </div>
        
        <!-- Feature 4 -->
        <div class="feature-card">
          <div class="w-full h-48 overflow-hidden">
            <NuxtImg 
              src="https://storage.googleapis.com/audioscribe-demo-public-1/4_Analytics.png" 
              alt="Focus Analytics" 
              class="w-full h-full object-cover"
              width="400" 
              height="192" 
              format="webp"
              loading="lazy"
              quality="80"
            />
          </div>
          <div class="p-5">
            <div class="flex items-start">
              <div class="flex-shrink-0 mr-3 mt-1">
                <div class="w-7 h-7 rounded-full bg-indigo-100 flex items-center justify-center text-indigo-600">
                  <div v-html="featherIcon('bar-chart-2')" class="w-4 h-4"></div>
                </div>
              </div>
              <div>
                <h3 class="text-xl font-semibold mb-2">Focus Analytics</h3>
                <p class="text-gray-600">
                  Discover your peak hours and common distractions with intuitive visual insights.
                </p>
              </div>
            </div>
          </div>
        </div>
      </div>
      
      <div class="mt-12 text-center">
        <a :href="getSignupUrl()" class="btn-primary">Try All Features Free</a>
      </div>
    </div>
  </section>

  <!-- How It Works Section -->
  <section class="py-16 px-6 bg-gray-50">
    <div class="max-w-7xl mx-auto">
      <h2 class="text-3xl font-bold text-center text-gray-900 mb-12">How It Works</h2>
      
      <div class="flex flex-col lg:flex-row gap-8 mb-12">
        <!-- Vertical Tabs Navigation -->
        <div class="lg:w-1/3">
          <!-- Step tabs -->
          <div v-for="i in 4" :key="i" 
              class="how-it-works-tab"
              :class="{ 'active': activeStep === i }"
              @mouseenter="setActiveStep(i)" 
              @click="setActiveStep(i)">
            <div class="w-12 h-12 bg-indigo-600 rounded-full flex-shrink-0 flex items-center justify-center text-white font-bold text-xl">
              {{ i }}
            </div>
            <div class="ml-4">
              <h3 class="text-xl font-semibold">{{ stepTitles[i-1] }}</h3>
              <p class="text-gray-600 mt-1">{{ stepSubtitles[i-1] }}</p>
            </div>
          </div>
        </div>
        
        <!-- Content Area -->
        <div class="lg:w-2/3 flex items-center justify-center bg-white rounded-lg shadow-md overflow-hidden">
          <!-- Tab Contents -->
          <div class="tab-content w-full">
            <div v-for="i in 4" :key="i" 
                 class="step-content p-8"
                 :class="{ 'hidden': activeStep !== i }">
              <h3 class="text-2xl font-bold text-indigo-600 mb-4">{{ stepTitles[i-1] }}</h3>
              <p class="text-gray-700 mb-4">{{ stepDescriptions[i-1] }}</p>
              <div class="rounded-lg overflow-hidden mb-3">
                <NuxtImg 
                  :src="'https://placehold.co/800x400/EEF2FF/6366F1.png?text=' + stepTitles[i-1].replace(' ', '+')" 
                  :alt="stepTitles[i-1]" 
                  class="w-full"
                  width="800"
                  height="400"
                  format="webp"
                  loading="lazy"
                  quality="80"
                />
              </div>
            </div>
          </div>
        </div>
      </div>
      
      <div class="text-center">
        <a :href="getSignupUrl()" class="btn-primary">Get Started</a>
      </div>
    </div>
  </section>

  <!-- Perfect For Section -->
  <section class="py-16 px-6 bg-white">
    <div class="max-w-7xl mx-auto">
      <h2 class="text-3xl font-bold text-center text-gray-900 mb-12">Perfect For</h2>
      
      <div class="grid md:grid-cols-2 lg:grid-cols-4 gap-6">
        <div v-for="(useCase, index) in useCases" :key="index" class="bg-gray-50 rounded-lg p-6 shadow-sm flex flex-col items-center text-center">
          <div class="w-16 h-16 bg-indigo-100 rounded-full flex items-center justify-center mb-4">
            <div v-html="featherIcon(useCase.icon)" class="text-indigo-600 w-6 h-6"></div>
          </div>
          <h3 class="text-xl font-semibold mb-3">{{ useCase.title }}</h3>
          <p class="text-gray-600">{{ useCase.description }}</p>
        </div>
      </div>
      
      <div class="mt-12 text-center">
        <a :href="getSignupUrl()" class="btn-primary">Start Free Trial</a>
      </div>
    </div>
  </section>

  <!-- Comparison Section -->
  <section class="py-16 px-6 bg-gray-50">
    <div class="max-w-7xl mx-auto">
      <h2 class="text-2xl font-bold text-gray-900 mb-8 text-center">Why Choose Focused</h2>
      
      <div class="overflow-x-auto">
        <table class="comparison-table min-w-full bg-white rounded-lg overflow-hidden shadow-sm">
          <thead>
            <tr>
              <th>What We Solve</th>
              <th>Time Trackers</th>
              <th>Body Doubling Apps</th>
              <th>Focused</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="(row, index) in comparisonData" :key="index">
              <td class="font-medium">{{ row.feature }}</td>
              <td :class="row.timeTrackers.class">
                <div class="flex items-center">
                  <span :class="getCellClass(row.timeTrackers.type)">
                    <span v-html="row.timeTrackers.type === 'yes' ? featherIcon('check') : (row.timeTrackers.type === 'no' ? featherIcon('x') : featherIcon('minus'))" class="w-3 h-3 flex items-center justify-center"></span>
                  </span>
                  <span>{{ row.timeTrackers.text }}</span>
                </div>
              </td>
              <td :class="row.bodyDoubling.class">
                <div class="flex items-center">
                  <span :class="getCellClass(row.bodyDoubling.type)">
                    <span v-html="row.bodyDoubling.type === 'yes' ? featherIcon('check') : (row.bodyDoubling.type === 'no' ? featherIcon('x') : featherIcon('minus'))" class="w-3 h-3 flex items-center justify-center"></span>
                  </span>
                  <span>{{ row.bodyDoubling.text }}</span>
                </div>
              </td>
              <td :class="row.focused.class">
                <div class="flex items-center">
                  <span :class="getCellClass(row.focused.type)">
                    <span v-html="row.focused.type === 'yes' ? featherIcon('check') : (row.focused.type === 'no' ? featherIcon('x') : featherIcon('minus'))" class="w-3 h-3 flex items-center justify-center"></span>
                  </span>
                  <span>{{ row.focused.text }}</span>
                </div>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
      
      <div class="mt-8 text-center">
        <a href="#pricing" class="btn-secondary">See Pricing Details</a>
      </div>
    </div>
  </section>

  <!-- Pricing Section -->
  <section id="pricing" class="py-16 px-6 bg-white">
    <div class="max-w-7xl mx-auto">
      <h2 class="text-3xl font-bold text-center text-gray-900 mb-4">Simple, Transparent Pricing</h2>
      <p class="text-center text-gray-600 mb-12 max-w-3xl mx-auto">
        Choose the plan that works for your needs. Start free and upgrade when you're ready.
      </p>
      
      <div class="flex flex-col lg:flex-row gap-8 max-w-5xl mx-auto">
        <!-- Free Tier -->
        <div class="w-full lg:w-1/2 bg-white rounded-lg border border-gray-200 shadow-sm hover:shadow-md transition-shadow duration-300">
          <div class="p-8 border-b border-gray-100">
            <h3 class="text-xl font-bold text-gray-900 mb-2">Free Trial</h3>
            <div class="flex items-baseline mb-4">
              <span class="text-3xl font-extrabold text-gray-900">$0</span>
              <span class="text-gray-500 ml-2">/ 14 days</span>
            </div>
            <p class="text-gray-600">Perfect for trying out Focused and testing if it works for you.</p>
          </div>
          
          <div class="p-8">
            <ul class="space-y-4">
              <li v-for="(feature, index) in freePlanFeatures" :key="index" class="flex items-start">
                <span v-if="feature.included" class="inline-block w-6 h-6 bg-green-100 rounded-full text-center leading-6 text-green-600 mr-2 flex-shrink-0">✓</span>
                <span v-else class="inline-block w-6 h-6 bg-gray-100 rounded-full text-center leading-6 text-gray-400 mr-2 flex-shrink-0">×</span>
                <span :class="{ 'opacity-50': !feature.included }">{{ feature.text }}</span>
              </li>
            </ul>
            
            <div class="mt-8">
              <a :href="getSignupUrl()" class="block w-full py-3 px-4 text-center bg-indigo-50 hover:bg-indigo-100 text-indigo-600 font-medium rounded-md transition-colors">Start Free Trial</a>
            </div>
            <p class="text-xs text-gray-500 text-center mt-3">No credit card required</p>
          </div>
        </div>
        
        <!-- Pro Tier -->
        <div class="w-full lg:w-1/2 bg-white rounded-lg border border-indigo-200 shadow-md hover:shadow-lg transition-shadow duration-300 relative">
          <div class="absolute top-0 right-0 bg-indigo-600 text-white text-xs px-3 py-1 uppercase tracking-wider font-semibold rounded-bl-lg rounded-tr-lg">Most Popular</div>
          
          <div class="p-8 border-b border-gray-100">
            <h3 class="text-xl font-bold text-gray-900 mb-2">Pro Plan</h3>
            <div class="flex items-baseline mb-4">
              <span class="text-3xl font-extrabold text-gray-900">$9.99</span>
              <span class="text-gray-500 ml-2">/ month</span>
            </div>
            <p class="text-gray-600">Everything you need for maximum productivity and focus.</p>
          </div>
          
          <div class="p-8">
            <ul class="space-y-4">
              <li v-for="(feature, index) in proPlanFeatures" :key="index" class="flex items-start">
                <span class="inline-block w-6 h-6 bg-green-100 rounded-full text-center leading-6 text-green-600 mr-2 flex-shrink-0">✓</span>
                <span>{{ feature.text }}</span>
              </li>
            </ul>
            
            <div class="mt-8">
              <a :href="getSignupUrl()" class="block w-full py-3 px-4 text-center bg-indigo-600 hover:bg-indigo-700 text-white font-medium rounded-md transition-colors">Start 14-Day Free Trial</a>
            </div>
            <p class="text-xs text-gray-500 text-center mt-3">Cancel anytime. 30-day money-back guarantee.</p>
          </div>
        </div>
      </div>
      
      <!-- FAQ Section -->
      <div class="mt-16 max-w-3xl mx-auto">
        <h3 class="text-xl font-bold text-center text-gray-900 mb-8">Frequently Asked Questions</h3>
        
        <div class="space-y-6">
          <div v-for="(faq, index) in faqs" :key="index" class="bg-gray-50 rounded-lg p-6">
            <h4 class="font-semibold text-gray-900 mb-2">{{ faq.question }}</h4>
            <p class="text-gray-600">{{ faq.answer }}</p>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- Testimonials Section -->
  <section id="testimonials" class="py-16 px-6 bg-white">
    <div class="max-w-7xl mx-auto">
      <h2 class="text-3xl font-bold text-center text-gray-900 mb-12">Success Stories</h2>
      
      <div class="grid md:grid-cols-3 gap-8">
        <div v-for="(testimonial, index) in testimonials" :key="index" class="bg-gray-50 rounded-lg p-6 shadow-sm">
          <div class="flex items-center mb-4">
            <NuxtImg 
              :src="testimonial.image" 
              :alt="testimonial.name" 
              class="w-12 h-12 rounded-full mr-4"
              width="48"
              height="48"
              format="webp"
              loading="lazy"
            />
            <div>
              <h4 class="font-semibold">{{ testimonial.name }}</h4>
              <p class="text-sm text-gray-600">{{ testimonial.title }}</p>
            </div>
          </div>
          <p class="text-lg font-medium text-indigo-700 mb-3">"{{ testimonial.quote }}"</p>
          <p class="text-gray-600">{{ testimonial.text }}</p>
        </div>
      </div>
      
      <div class="mt-12 text-center">
        <a :href="getSignupUrl()" class="btn-primary">Join Them Today</a>
      </div>
    </div>
  </section>

  <!-- Privacy Section -->
  <section class="py-16 px-6 bg-gray-50">
    <div class="max-w-7xl mx-auto">
      <h2 class="text-3xl font-bold text-center text-gray-900 mb-12">Your Privacy Matters</h2>
      
      <div class="grid md:grid-cols-3 gap-8">
        <div v-for="(privacyItem, index) in privacyFeatures" :key="index" class="bg-white rounded-lg p-6 shadow-sm">
          <div class="feature-icon">
            <div v-html="featherIcon(privacyItem.icon)"></div>
          </div>
          <h3 class="text-xl font-semibold mb-3">{{ privacyItem.title }}</h3>
          <p class="text-gray-600">{{ privacyItem.description }}</p>
        </div>
      </div>
    </div>
  </section>

  <!-- CTA Section -->
  <section class="py-16 px-6 bg-indigo-600 text-white">
    <div class="max-w-3xl mx-auto text-center">
      <h2 class="text-3xl font-bold">Ready to Transform Your Focus?</h2>
      <p class="mt-4 text-indigo-100 text-lg">
        Join thousands of professionals who've reclaimed their attention span and productivity with Focused.
      </p>
      
      <div class="mt-8 flex flex-col sm:flex-row gap-4 justify-center">
        <a :href="getSignupUrl()" class="bg-white text-indigo-600 hover:bg-indigo-50 px-6 py-3 rounded-md font-medium">
          Start Free Trial
        </a>
        <button @click="showVideoModal = true" class="border border-white text-white hover:bg-indigo-700 px-6 py-3 rounded-md font-medium flex items-center justify-center">
          <div v-html="featherIcon('play-circle')" class="mr-2"></div>
          <span>Watch Demo</span>
        </button>
      </div>
    </div>
  </section>

  <!-- Footer -->
  <footer class="bg-gray-800 text-gray-300 pt-16 pb-12 px-6">
    <div class="max-w-7xl mx-auto">
      <div class="grid grid-cols-1 md:grid-cols-4 gap-12 mb-12">
        <!-- Company Info -->
        <div class="md:col-span-1">
          <div class="text-white font-bold text-2xl mb-4">Focused</div>
          <p class="text-gray-400 mb-4">AI-powered productivity tools that help you maintain concentration and achieve deeper work.</p>
          <!-- Social media links hidden for now
          <div class="flex space-x-4 mt-6">
            <a v-for="(social, index) in socialLinks" :key="index" href="#" class="social-icon">
              <div v-html="featherIcon(social)"></div>
            </a>
          </div>
          -->
        </div>
        
        
        <!-- Navigation Links -->
        <div v-for="(footerSection, index) in footerLinks" :key="index">
          <h3 class="text-white font-semibold text-lg mb-4">{{ footerSection.title }}</h3>
          <ul class="space-y-2">
            <li v-for="(link, linkIndex) in footerSection.links" :key="linkIndex">
              <a :href="link.url" class="footer-link">{{ link.text }}</a>
            </li>
          </ul>
        </div>
      </div>
      
      <div class="border-t border-gray-700 pt-8 mt-8 flex flex-col md:flex-row justify-between items-center">
        <p class="text-gray-400 text-sm">© {{ new Date().getFullYear() }} Focused. All rights reserved.</p>
        <div class="mt-4 md:mt-0">
          <NuxtLink 
            v-for="(link, index) in legalLinks" 
            :key="index" 
            :to="link.url" 
            class="text-gray-400 hover:text-indigo-400 text-sm mx-3"
          >
            {{ link.text }}
          </NuxtLink>
        </div>
      </div>
    </div>
  </footer>

  <!-- Video Modal Component -->
  <VideoModal 
    :show="showVideoModal" 
    @close="showVideoModal = false"
    title="Watch Demo: Focused App"
    video-id="a0CVCcb0RJM"
  />
</template>

<script setup>
import { ref } from 'vue';
import VideoModal from '~/components/VideoModal.vue';

// Video modal state
const showVideoModal = ref(false);

// Get app URLs for signup/login links
const { getSignupUrl } = useAppUrl();

// How It Works section
const activeStep = ref(1);

const setActiveStep = (step) => {
  activeStep.value = step;
};

const stepTitles = [
  'Set Your Intention',
  'Enter Deep Work Mode',
  'Receive Feedback',
  'Review & Improve'
];

const stepSubtitles = [
  'Define your task',
  'Start your focus timer',
  'Get gentle distraction alerts',
  'Track your focus patterns'
];

const stepDescriptions = [
  'Tell Focused what you\'re working on so our AI can identify when you\'re on or off task.',
  'Start your timer and let our AI monitor your screen in the background.',
  'Get gentle nudges when distracted, designed to redirect you without breaking your flow.',
  'See what distracts you most and when you\'re most productive with detailed focus analytics.'
];

// SVG icons directly in component
const iconSvg = {
  code: `<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-code"><polyline points="16 18 22 12 16 6"></polyline><polyline points="8 6 2 12 8 18"></polyline></svg>`,
  book: `<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-book"><path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"></path><path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"></path></svg>`,
  zap: `<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-zap"><polygon points="13 2 3 14 12 14 11 22 21 10 12 10 13 2"></polygon></svg>`,
  home: `<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-home"><path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path><polyline points="9 22 9 12 15 12 15 22"></polyline></svg>`,
  shield: `<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-shield"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"></path></svg>`,
  'eye-off': `<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-eye-off"><path d="M17.94 17.94A10.07 10.07 0 0 1 12 20c-7 0-11-8-11-8a18.45 18.45 0 0 1 5.06-5.94M9.9 4.24A9.12 9.12 0 0 1 12 4c7 0 11 8 11 8a18.5 18.5 0 0 1-2.16 3.19m-6.72-1.07a3 3 0 1 1-4.24-4.24"></path><line x1="1" y1="1" x2="23" y2="23"></line></svg>`,
  'check-circle': `<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-check-circle"><path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"></path><polyline points="22 4 12 14.01 9 11.01"></polyline></svg>`,
  'play-circle': `<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-play-circle"><circle cx="12" cy="12" r="10"></circle><polygon points="10 8 16 12 10 16 10 8"></polygon></svg>`,
  twitter: `<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-twitter"><path d="M23 3a10.9 10.9 0 0 1-3.14 1.53 4.48 4.48 0 0 0-7.86 3v1A10.66 10.66 0 0 1 3 4s-4 9 5 13a11.64 11.64 0 0 1-7 2c9 5 20 0 20-11.5a4.5 4.5 0 0 0-.08-.83A7.72 7.72 0 0 0 23 3z"></path></svg>`,
  linkedin: `<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-linkedin"><path d="M16 8a6 6 0 0 1 6 6v7h-4v-7a2 2 0 0 0-2-2 2 2 0 0 0-2 2v7h-4v-7a6 6 0 0 1 6-6z"></path><rect x="2" y="9" width="4" height="12"></rect><circle cx="4" cy="4" r="2"></circle></svg>`,
  instagram: `<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-instagram"><rect x="2" y="2" width="20" height="20" rx="5" ry="5"></rect><path d="M16 11.37A4 4 0 1 1 12.63 8 4 4 0 0 1 16 11.37z"></path><line x1="17.5" y1="6.5" x2="17.51" y2="6.5"></line></svg>`,
  github: `<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-github"><path d="M9 19c-5 1.5-5-2.5-7-3m14 6v-3.87a3.37 3.37 0 0 0-.94-2.61c3.14-.35 6.44-1.54 6.44-7A5.44 5.44 0 0 0 20 4.77A5.07 5.07 0 0 0 19.91 1S18.73.65 16 2.48a13.38 13.38 0 0 0-7 0C6.27.65 5.09 1 5.09 1A5.07 5.07 0 0 0 5 4.77a5.44 5.44 0 0 0-1.5 3.78c0 5.42 3.3 6.61 6.44 7A3.37 3.37 0 0 0 9 18.13V22"></path></svg>`,
  menu: `<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-menu"><line x1="3" y1="12" x2="21" y2="12"></line><line x1="3" y1="6" x2="21" y2="6"></line><line x1="3" y1="18" x2="21" y2="18"></line></svg>`,
  check: `<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3" stroke-linecap="round" stroke-linejoin="round" class="feather feather-check"><polyline points="20 6 9 17 4 12"></polyline></svg>`,
  x: `<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg>`,
  minus: `<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3" stroke-linecap="round" stroke-linejoin="round" class="feather feather-minus"><line x1="5" y1="12" x2="19" y2="12"></line></svg>`,
  eye: `<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-eye"><path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path><circle cx="12" cy="12" r="3"></circle></svg>`,
  clock: `<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-clock"><circle cx="12" cy="12" r="10"></circle><polyline points="12 6 12 12 16 14"></polyline></svg>`,
  'volume-2': `<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-volume-2"><polygon points="11 5 6 9 2 9 2 15 6 15 11 19 11 5"></polygon><path d="M19.07 4.93a10 10 0 0 1 0 14.14M15.54 8.46a5 5 0 0 1 0 7.07"></path></svg>`,
  'bar-chart-2': `<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-bar-chart-2"><line x1="18" y1="20" x2="18" y2="10"></line><line x1="12" y1="20" x2="12" y2="4"></line><line x1="6" y1="20" x2="6" y2="14"></line></svg>`
};

// Function to get the icon SVG
const featherIcon = (name) => {
  return iconSvg[name] || '';
};

// Perfect For section
const useCases = [
  {
    icon: 'code',
    title: 'Knowledge Workers',
    description: 'Developers, writers, and designers who need uninterrupted deep work time.'
  },
  {
    icon: 'book',
    title: 'Students',
    description: 'Complete assignments more efficiently by eliminating study distractions.'
  },
  {
    icon: 'zap',
    title: 'ADD/ADHD',
    description: 'Specialized system designed for neurodivergent minds with adaptive coaching.'
  },
  {
    icon: 'home',
    title: 'Remote Workers',
    description: 'Maintain productivity while working from home without video sessions.'
  }
];

// Comparison table
const comparisonData = [
  {
    feature: 'Real-time Intervention',
    timeTrackers: { type: 'no', text: 'Just tracks time', class: 'no' },
    bodyDoubling: { type: 'no', text: 'Needs other humans', class: 'no' },
    focused: { type: 'yes', text: 'AI detects distractions', class: 'yes' }
  },
  {
    feature: 'For ADHD/ADD',
    timeTrackers: { type: 'no', text: 'One-size-fits-all', class: 'no' },
    bodyDoubling: { type: 'yes', text: 'Can be awkward', class: 'yes' },
    focused: { type: 'yes', text: 'Adaptive system', class: 'yes' }
  },
  {
    feature: 'Cost-Effective',
    timeTrackers: { type: 'partial', text: 'Limited free version', class: 'partial' },
    bodyDoubling: { type: 'partial', text: '$40/month', class: 'partial' },
    focused: { type: 'yes', text: '$9.99/month', class: 'yes' }
  },
  {
    feature: 'Privacy',
    timeTrackers: { type: 'partial', text: 'Tracks all activity', class: 'partial' },
    bodyDoubling: { type: 'no', text: 'Shares your workspace', class: 'no' },
    focused: { type: 'yes', text: 'Full user control', class: 'yes' }
  }
];

const getCellClass = (type) => {
  if (type === 'yes') {
    return 'inline-flex w-6 h-6 bg-green-100 rounded-full items-center justify-center text-green-600 mr-1';
  } else if (type === 'no') {
    return 'inline-flex w-6 h-6 bg-red-100 rounded-full items-center justify-center text-red-600 mr-1';
  } else {
    return 'inline-flex w-6 h-6 bg-yellow-100 rounded-full items-center justify-center text-yellow-600 mr-1';
  }
};

// Pricing plans
const freePlanFeatures = [
  { text: 'Basic distraction detection', included: true },
  { text: 'Standard focus sessions', included: true },
  { text: 'Basic analytics dashboard', included: true },
  { text: 'Single device support', included: true },
  { text: 'Advanced AI distraction detection', included: false },
  { text: 'Voice coaching', included: false },
  { text: 'Detailed productivity reporting', included: false },
  { text: 'Priority support', included: false }
];

const proPlanFeatures = [
  { text: 'Advanced distraction detection with AI', included: true },
  { text: 'Customizable focus sessions', included: true },
  { text: 'Comprehensive analytics and insights', included: true },
  { text: 'Multi-device support (up to 3 devices)', included: true },
  { text: 'Advanced AI distraction detection', included: true },
  { text: 'Voice coaching (Coming Soon)', included: true },
  { text: 'Detailed productivity reporting', included: true },
  { text: 'Priority support', included: true }
];

// FAQs
const faqs = [
  {
    question: 'Can I cancel my subscription anytime?',
    answer: 'Yes, you can cancel your subscription at any time with no questions asked. If you cancel within the first 30 days, you\'re eligible for a full refund.'
  },
  {
    question: 'Is my data private and secure?',
    answer: 'Your privacy is our top priority. While screen data is sent to our servers for AI analysis, all data is automatically purged within 60 minutes. We never permanently store screenshots or sensitive information. You can customize what\'s monitored in the privacy settings.'
  },
  {
    question: 'Do you offer any discounts?',
    answer: 'We offer special discounts for students, educators, and non-profit organizations. Contact our support team at support@befocused.ai to learn more about these options.'
  }
];

// Testimonials
const testimonials = [
  {
    name: 'Alex R.',
    title: 'Content Writer',
    image: 'https://placehold.co/60x60/EEF2FF/6366F1.png?text=AR',
    quote: 'Game-changing for my ADHD brain.',
    text: 'The non-judgmental feedback helped me complete projects I would have abandoned. Analytics showed I\'m most productive in 35-minute intervals.'
  },
  {
    name: 'Jamie L.',
    title: 'Software Developer',
    image: 'https://placehold.co/60x60/EEF2FF/6366F1.png?text=JL',
    quote: 'Finally adapts to how I work.',
    text: 'Focused identified that social media was breaking my concentration 37% of the time. After two weeks, my distraction rate dropped by half.'
  },
  {
    name: 'Taylor M.',
    title: 'Marketing Strategist',
    image: 'https://placehold.co/60x60/EEF2FF/6366F1.png?text=TM',
    quote: 'Like a personal productivity mentor.',
    text: 'The contextual reminders help develop better focus habits. My focus score improved from 68 to 91 in just one month.'
  }
];

// Privacy features
const privacyFeatures = [
  {
    icon: 'shield',
    title: 'Secure By Design',
    description: 'State-of-the-art encryption with auto-purging of screen content within 60 minutes.'
  },
  {
    icon: 'eye-off',
    title: 'You Control Your Data',
    description: 'Minimal data collection with easy session pausing and exclusion lists for sensitive apps.'
  },
  {
    icon: 'check-circle',
    title: 'Built for Trust',
    description: 'Our practices comply with GDPR, CCPA, and other privacy regulations—built for your productivity, not surveillance.'
  }
];

// Footer links
const socialLinks = ['twitter', 'linkedin', 'instagram', 'github'];

const footerLinks = [
  {
    title: 'Product',
    links: [
      { text: 'Features', url: '#features' },
      { text: 'Pricing', url: '#pricing' },
      { text: 'Roadmap', url: 'https://befocused-dev.canny.io/' }
    ]
  },
  {
    title: 'Company',
    links: [
      { text: 'About', url: '/about' },
      { text: 'Blog', url: '/blog' }
      // Contact link commented out for now
      // { text: 'Contact', url: '#contact' }
    ]
  },
  {
    title: 'Legal',
    links: [
      { text: 'Privacy Policy', url: '/privacy' },
      { text: 'Terms of Service', url: '/terms' }
    ]
  }
];

const legalLinks = [
  { text: 'Privacy', url: '/privacy' },
  { text: 'Terms', url: '/terms' },
  { text: 'Cookies', url: '#cookies' }
];
</script>