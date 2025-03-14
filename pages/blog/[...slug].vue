<template>
  <div>
    <div v-if="pending" class="text-center py-12">
      <p class="text-lg text-gray-600">Loading article...</p>
    </div>
    
    <div v-else-if="article">
      <!-- Article Hero Section -->
      <div class="relative bg-gradient-to-b from-indigo-900 to-indigo-700 text-white">
        <!-- Featured Image -->
        <div v-if="article.image" class="absolute inset-0 opacity-20">
          <div class="absolute inset-0 bg-cover bg-center" :style="`background-image: url(${article.image})`"></div>
        </div>
        
        <div class="relative max-w-4xl mx-auto py-16 px-4 sm:px-6 lg:px-8">
          <NuxtLink to="/blog" class="inline-flex items-center text-indigo-200 hover:text-white mb-8 transition">
            <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 19l-7-7m0 0l7-7m-7 7h18"></path>
            </svg>
            Back to Blog
          </NuxtLink>
          
          <h1 class="text-3xl md:text-4xl font-bold mb-4">{{ article.title }}</h1>
          
          <div class="flex flex-wrap items-center text-sm md:text-base opacity-80 mt-6">
            <div v-if="article.date" class="flex items-center mr-6 mb-2">
              <svg class="w-4 h-4 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"></path>
              </svg>
              {{ formatDate(article.date) }}
            </div>
            
            <div v-if="article.readTime" class="flex items-center mr-6 mb-2">
              <svg class="w-4 h-4 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"></path>
              </svg>
              {{ article.readTime }}
            </div>
            
            <div v-if="article.category" class="flex items-center mb-2">
              <svg class="w-4 h-4 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 7h.01M7 3h5c.512 0 1.024.195 1.414.586l7 7a2 2 0 010 2.828l-7 7a2 2 0 01-2.828 0l-7-7A1.994 1.994 0 013 12V7a4 4 0 014-4z"></path>
              </svg>
              {{ article.category }}
            </div>
          </div>
        </div>
      </div>
      
      <!-- Article Content -->
      <div class="max-w-3xl mx-auto py-12 px-4 sm:px-6 lg:px-8">
        <article class="prose prose-indigo lg:prose-lg max-w-none article-content">
          <div class="rich-content" v-html="article.content"></div>
        </article>
        
        <!-- Author Section -->
        <div class="mt-12 pt-6 border-t border-gray-200">
          <div class="flex items-center">
            <div class="h-12 w-12 rounded-full bg-indigo-100 flex items-center justify-center text-indigo-600 text-xl font-bold mr-4">
              F
            </div>
            <div>
              <h3 class="font-medium text-gray-900">Focused Team</h3>
              <p class="text-gray-600 text-sm">Experts in ADHD and productivity tools. We're on a mission to help you achieve your full potential.</p>
            </div>
          </div>
        </div>
        
        <!-- Related Articles -->
        <div class="mt-12 pt-6 border-t border-gray-200">
          <h2 class="text-2xl font-bold text-gray-900 mb-6">You might also enjoy</h2>
          <div class="grid gap-6 md:grid-cols-2">
            <div v-for="relatedArticle in relatedArticles" :key="relatedArticle._path" class="bg-white rounded-lg shadow overflow-hidden flex flex-col">
              <NuxtLink :to="relatedArticle._path" class="block h-full hover:opacity-90 transition">
                <div class="h-32 bg-gray-200 relative">
                  <div class="absolute inset-0 bg-cover bg-center" :style="`background-image: url(${relatedArticle.image})`"></div>
                </div>
                <div class="p-4">
                  <h3 class="font-bold text-gray-900 mb-1 line-clamp-2">{{ relatedArticle.title }}</h3>
                  <p class="text-sm text-gray-600">{{ formatDate(relatedArticle.date) }}</p>
                </div>
              </NuxtLink>
            </div>
          </div>
        </div>
        
        <div class="mt-10 flex justify-center">
          <NuxtLink to="/blog" class="inline-flex items-center text-indigo-600 hover:text-indigo-800 font-medium transition">
            <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 19l-7-7m0 0l7-7m-7 7h18"></path>
            </svg>
            Back to all articles
          </NuxtLink>
        </div>
      </div>
      
      <!-- Newsletter CTA -->
      <div class="bg-gray-100 py-12">
        <div class="max-w-3xl mx-auto px-4 sm:px-6 lg:px-8 text-center">
          <h3 class="text-2xl font-bold text-gray-900 mb-3">Never miss an update</h3>
          <p class="text-gray-700 mb-6 max-w-2xl mx-auto">Subscribe to our newsletter for the latest productivity tips, ADHD resources, and app updates. Join our growing community today!</p>
          <div class="flex flex-col sm:flex-row gap-3 max-w-md mx-auto">
            <input type="email" placeholder="Your email address" class="flex-1 px-4 py-3 rounded-md border border-gray-300 focus:outline-none focus:ring-2 focus:ring-indigo-500">
            <button class="bg-indigo-600 text-white px-6 py-3 rounded-md font-medium hover:bg-indigo-700 transition-colors">Subscribe</button>
          </div>
        </div>
      </div>
    </div>
    
    <div v-else class="text-center py-16 px-4">
      <div class="max-w-md mx-auto">
        <h2 class="text-2xl font-bold text-gray-900 mb-4">Article not found</h2>
        <p class="text-gray-600 mb-8">The article you're looking for doesn't seem to exist. It may have been moved or deleted.</p>
        <NuxtLink to="/blog" class="inline-flex items-center text-indigo-600 hover:text-indigo-800 font-medium">
          <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 19l-7-7m0 0l7-7m-7 7h18"></path>
          </svg>
          Back to Blog
        </NuxtLink>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, computed } from 'vue'
import { useRoute } from 'vue-router'

const route = useRoute()
const slug = Array.isArray(route.params.slug) 
  ? route.params.slug.join('/') 
  : route.params.slug

const pending = ref(false)

// Enhanced sample blog content with category, readTime, and images
const blogContent = {
  'getting-started-with-focused': {
    title: 'Getting Started with Focused: An AI-Powered Productivity Tool for ADHD/ADD Minds',
    date: '2024-03-12',
    category: 'productivity',
    readTime: '6 min read',
    image: 'https://images.unsplash.com/photo-1517245386807-bb43f82c33c4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=800&q=80',
    content: `
      <h1>Getting Started with Focused</h1>
      <p>For individuals with ADHD or ADD, maintaining consistent focus can be challenging. Traditional productivity methods often fall short because they don't address the unique way neurodivergent minds work. <strong>Focused</strong> is designed specifically to help bridge this gap, using AI technology to create an environment conducive to deep work.</p>
      
      <h2>How Focused Works</h2>
      <p>Focused uses advanced AI to:</p>
      <ol>
        <li><strong>Detect distractions in real-time</strong>: The system monitors your screen activity to identify when you're veering off-task.</li>
        <li><strong>Create personalized focus sessions</strong>: Set work intervals that match your natural productivity rhythm.</li>
        <li><strong>Provide gentle interventions</strong>: Receive subtle nudges when distracted to help you regain focus without breaking flow.</li>
        <li><strong>Track your productivity patterns</strong>: Gain insights about your focus habits through comprehensive analytics.</li>
      </ol>
      
      <h2>Setting Up Your First Focus Session</h2>
      <p>Getting started with Focused is simple:</p>
      
      <h3>Step 1: Define Your Task</h3>
      <p>Begin by clearly defining what you're working on. The more specific you are, the better our AI can help identify when you're on or off task.</p>
      
      <h3>Step 2: Select Session Duration</h3>
      <p>Choose a session length that works for you. We recommend starting with shorter intervals (25-35 minutes) and gradually increasing as your focus stamina improves.</p>
      
      <h3>Step 3: Start Your Timer</h3>
      <p>Once you begin your session, Focused quietly monitors your activity in the background. You'll receive gentle reminders if you become distracted, helping you maintain productivity throughout your session.</p>
      
      <h2>Tips for Success</h2>
      <ul>
        <li><strong>Start small</strong>: Begin with achievable goals and shorter focus periods</li>
        <li><strong>Use the analytics</strong>: Review your focus patterns to identify your most productive times of day</li>
        <li><strong>Customize your settings</strong>: Adjust the sensitivity of distraction detection to match your work style</li>
        <li><strong>Combine with other techniques</strong>: Focused works well alongside methods like time-blocking or the Pomodoro Technique</li>
      </ul>
      
      <h2>Next Steps</h2>
      <p>Ready to experience deeper focus and increased productivity? <a href="/signup">Start your free trial</a> today and discover how Focused can transform your workday.</p>
      
      <p>Remember, building focus is a skill that improves with practice. With Focused as your companion, you'll develop stronger concentration habits that last.</p>
    `
  },
  '5-productivity-techniques-for-adhd': {
    title: '5 Productivity Techniques for ADHD',
    date: '2024-03-10',
    category: 'adhd',
    readTime: '8 min read',
    image: 'https://images.unsplash.com/photo-1606326608606-aa0b62935f2b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=800&q=80',
    content: `
      <h1>5 Productivity Techniques for ADHD</h1>
      <p>Living with ADHD presents unique challenges when it comes to productivity. Traditional approaches often don't account for how the ADHD brain works. Here are five techniques specifically designed to work with—not against—your neurodivergent mind.</p>
      
      <h2>1. Body Doubling</h2>
      <p>Body doubling involves working alongside another person who is also focused on their own task. This creates a subtle accountability that can help maintain focus.</p>
      <p><strong>How to implement:</strong> Work with a friend in-person, use virtual co-working spaces, or try Focused's AI companion feature.</p>
      
      <h2>2. The Pomodoro Technique (Modified)</h2>
      <p>The standard Pomodoro technique uses 25-minute work intervals with 5-minute breaks. For ADHD minds, customizing these intervals can be more effective.</p>
      <p><strong>How to implement:</strong> Experiment with different time frames (15-45 minutes) based on your energy levels and task type. Focused helps you track your optimal intervals.</p>
      
      <h2>3. Task Batching by Energy Level</h2>
      <p>Not all hours of your day are equally productive. Group similar tasks and match them to your energy levels.</p>
      <p><strong>How to implement:</strong> Identify your high-energy times for complex work, medium-energy times for routine tasks, and low-energy times for simple, automatic activities.</p>
      
      <h2>4. External Working Memory Systems</h2>
      <p>ADHD often affects working memory. Creating external systems reduces cognitive load.</p>
      <p><strong>How to implement:</strong> Use digital tools like Focused's task tracker, visual boards, or analog methods like bullet journaling.</p>
      
      <h2>5. Mindful Transitions</h2>
      <p>Task switching is particularly challenging with ADHD. Creating mindful transitions helps reduce the friction.</p>
      <p><strong>How to implement:</strong> Before ending a work session, write down exactly where you are and what needs to happen next. Focused can help capture these transition notes automatically.</p>
      
      <h2>Bringing It All Together</h2>
      <p>These techniques work best when combined thoughtfully. The Focused app integrates elements from all five approaches, helping you establish a productivity system that works with your natural tendencies rather than fighting against them.</p>
      
      <p>Remember that finding what works for you is a journey. Be patient with yourself and celebrate progress, not perfection.</p>
    `
  },
  'adhd-in-the-workplace': {
    title: 'ADHD in the Workplace',
    date: '2024-03-05',
    category: 'adhd',
    readTime: '7 min read',
    image: 'https://images.unsplash.com/photo-1497032628192-86f99bcd76bc?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=800&q=80',
    content: `
      <h1>ADHD in the Workplace</h1>
      <p>Navigating professional environments with ADHD presents unique challenges and opportunities. This article explores strategies for success in the workplace when you have ADHD.</p>
      
      <h2>Understanding Your ADHD at Work</h2>
      <p>ADHD can manifest differently in workplace settings compared to academic or home environments. Common workplace challenges include:</p>
      <ul>
        <li>Managing deadlines and prioritizing tasks</li>
        <li>Maintaining focus during meetings</li>
        <li>Handling administrative paperwork</li>
        <li>Navigating open office environments with multiple distractions</li>
        <li>Managing time effectively</li>
      </ul>
      
      <h2>Leveraging Your ADHD Strengths</h2>
      <p>While ADHD presents challenges, it also comes with unique strengths that can be valuable in the workplace:</p>
      <ul>
        <li>Creative thinking and innovation</li>
        <li>Hyperfocus on engaging tasks</li>
        <li>Energy and enthusiasm</li>
        <li>Crisis management abilities</li>
        <li>Outside-the-box problem solving</li>
      </ul>
      
      <h2>Workplace Accommodations</h2>
      <p>Many employers are willing to provide reasonable accommodations for employees with ADHD. Consider requesting:</p>
      <ul>
        <li>Noise-cancelling headphones for open offices</li>
        <li>Written follow-ups to verbal instructions</li>
        <li>Permission to record meetings</li>
        <li>A quieter workspace or flexible work location</li>
        <li>Regular check-ins with supervisors</li>
      </ul>
      
      <h2>Technology Solutions for ADHD at Work</h2>
      <p>Leverage technology to support your productivity:</p>
      <ul>
        <li>Project management tools for task organization</li>
        <li>Calendar systems with multiple reminders</li>
        <li>Note-taking apps that sync across devices</li>
        <li>Focus apps like Focused that help minimize distractions</li>
        <li>Time tracking tools to improve time awareness</li>
      </ul>
      
      <h2>When and How to Disclose Your ADHD</h2>
      <p>Deciding whether to disclose your ADHD at work is a personal choice. Consider:</p>
      <ul>
        <li>The company culture and attitude toward neurodiversity</li>
        <li>Your specific needs for accommodation</li>
        <li>The potential benefits vs. risks of disclosure</li>
        <li>Whether to disclose during the hiring process or after starting</li>
      </ul>
      
      <h2>Building a Support System</h2>
      <p>Creating a network of support can significantly improve your workplace experience:</p>
      <ul>
        <li>Find a mentor who understands ADHD</li>
        <li>Connect with other professionals with ADHD</li>
        <li>Consider working with an ADHD coach</li>
        <li>Build relationships with colleagues who complement your work style</li>
      </ul>
      
      <p>Remember that ADHD doesn't define your professional capabilities. With the right strategies and support systems in place, you can thrive in your career while managing your ADHD effectively.</p>
    `
  },
  'digital-minimalism-for-adhd': {
    title: 'Digital Minimalism for ADHD',
    date: '2024-02-28',
    category: 'productivity',
    readTime: '5 min read',
    image: 'https://images.unsplash.com/photo-1508739773434-c26b3d09e071?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=800&q=80',
    content: `
      <h1>Digital Minimalism for ADHD</h1>
      <p>In today's hyper-connected world, digital minimalism offers a powerful framework for individuals with ADHD to reduce overwhelm and reclaim their attention.</p>
      
      <h2>The Digital Overload Problem</h2>
      <p>For people with ADHD, the constant bombardment of notifications, endless scroll feeds, and digital clutter can be particularly challenging. The dopamine-driven feedback loops of many digital platforms are specifically designed to capture attention - exactly what those with ADHD already struggle to regulate.</p>
      
      <h2>Core Principles of Digital Minimalism for ADHD</h2>
      <ul>
        <li><strong>Intentional Tool Selection</strong>: Choose digital tools based on their value to your core goals, not just convenience or habit</li>
        <li><strong>Digital Decluttering</strong>: Regularly audit and remove apps and services that don't provide substantial value</li>
        <li><strong>High-Quality Leisure</strong>: Replace passive consumption with active, rewarding activities</li>
        <li><strong>Attention Restoration</strong>: Create dedicated time for your brain to operate without digital inputs</li>
      </ul>
      
      <h2>Practical Implementation Steps</h2>
      <ol>
        <li><strong>Conduct a 30-day digital detox</strong>: Temporarily eliminate optional technologies to reset your relationship with them</li>
        <li><strong>Define your digital purpose</strong>: For each tool, clearly articulate why you're using it and what specific value it brings</li>
        <li><strong>Create intentional usage rules</strong>: Establish when and how you'll use different digital tools</li>
        <li><strong>Optimize your digital environment</strong>: Remove unnecessary notifications, organize apps, and create friction for distracting technology</li>
        <li><strong>Build alternative activities</strong>: Develop offline hobbies and interests to fill the void left by reduced digital consumption</li>
      </ol>
      
      <h2>ADHD-Specific Digital Minimalism Strategies</h2>
      <ul>
        <li><strong>Mono-tasking setups</strong>: Configure devices for single-purpose use when possible</li>
        <li><strong>Friction by design</strong>: Add intentional steps before accessing distracting apps</li>
        <li><strong>Scheduled dopamine</strong>: Batch social media and email checking to specific times</li>
        <li><strong>Visual simplicity</strong>: Minimize visual clutter on digital interfaces</li>
        <li><strong>Analog alternatives</strong>: Use physical tools like paper notebooks for certain tasks</li>
      </ul>
      
      <h2>How Focused Supports Digital Minimalism</h2>
      <p>Focused is designed with digital minimalism principles in mind. Our app helps you:</p>
      <ul>
        <li>Monitor and gain awareness of your digital usage patterns</li>
        <li>Create intentional focus sessions free from digital distractions</li>
        <li>Gradually build healthier digital habits through gentle interventions</li>
        <li>Track your progress as you implement digital minimalism practices</li>
      </ul>
      
      <p>Remember that digital minimalism isn't about rejecting technology—it's about using it deliberately to support your goals rather than letting it control your attention. For individuals with ADHD, this intentional approach can be particularly transformative.</p>
    `
  },
  'how-ai-is-transforming-productivity-tools': {
    title: 'How AI is Transforming Productivity Tools',
    date: '2024-02-20',
    category: 'technology',
    readTime: '6 min read',
    image: 'https://images.unsplash.com/photo-1488229297570-58520851e868?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=800&q=80',
    content: `
      <h1>How AI is Transforming Productivity Tools</h1>
      <p>Artificial intelligence is revolutionizing productivity software, creating smarter tools that adapt to individual work styles and needs. This evolution is particularly significant for those with focus challenges like ADHD.</p>
      
      <h2>The Evolution of Productivity Tools</h2>
      <p>Productivity software has evolved through several generations:</p>
      <ol>
        <li><strong>First generation</strong>: Basic digital versions of analog tools (calendars, to-do lists)</li>
        <li><strong>Second generation</strong>: Connected cloud-based solutions with collaboration features</li>
        <li><strong>Third generation</strong>: AI-powered adaptive tools that learn from user behavior</li>
      </ol>
      
      <h2>Key AI Technologies Changing Productivity</h2>
      <ul>
        <li><strong>Machine Learning</strong>: Systems that learn patterns in work habits and adapt accordingly</li>
        <li><strong>Natural Language Processing</strong>: The ability to understand and generate human language</li>
        <li><strong>Computer Vision</strong>: AI that can "see" and interpret visual information</li>
        <li><strong>Predictive Analytics</strong>: Forecasting future behavior based on historical patterns</li>
        <li><strong>Personalization Algorithms</strong>: Custom-tailored experiences for each user</li>
      </ul>
      
      <h2>AI-Powered Features Transforming Work</h2>
      <h3>Intelligent Scheduling</h3>
      <p>AI scheduling assistants can analyze your calendar patterns, understand meeting priorities, and automatically suggest optimal times for focused work, breaks, and collaborative sessions.</p>
      
      <h3>Smart Task Management</h3>
      <p>Modern task managers use AI to prioritize your to-do list based on deadlines, importance, energy levels, and past completion patterns – helping overcome the executive function challenges common with ADHD.</p>
      
      <h3>Distraction Detection and Management</h3>
      <p>Using advanced computer vision and activity monitoring, tools like Focused can detect when your attention drifts and provide timely interventions based on your personal distraction patterns.</p>
      
      <h3>Automated Workflows</h3>
      <p>AI can identify repetitive tasks in your workflow and suggest or implement automations, reducing cognitive load and the opportunity for procrastination.</p>
      
      <h2>The Future of AI and Productivity</h2>
      <p>Looking ahead, we can expect to see:</p>
      <ul>
        <li>Increasingly personalized experiences that adapt to individual cognitive styles</li>
        <li>Ambient computing that supports productivity without requiring direct interaction</li>
        <li>AI-facilitated deep work that optimizes both focus conditions and creative connections</li>
        <li>Ethical frameworks for balancing productivity enhancement with privacy and autonomy</li>
      </ul>
      
      <h2>How Focused Uses AI</h2>
      <p>At Focused, we're harnessing these AI advances specifically for neurodiverse minds. Our approach includes:</p>
      <ul>
        <li>Custom distraction detection models tailored to individual ADHD patterns</li>
        <li>Adaptive intervention timing based on your receptivity and flow state</li>
        <li>Personalized focus recommendations that evolve with your productivity data</li>
        <li>Privacy-first design that keeps your data secure and on your devices</li>
      </ul>
      
      <p>The integration of AI into productivity tools represents a significant shift from rigid, one-size-fits-all solutions to adaptable systems that work with your unique cognitive style. For those with ADHD, this evolution makes technology a more effective ally in managing attention and achieving goals.</p>
    `
  }
}

// Get the article based on the slug
const article = computed(() => {
  return blogContent[slug] || null
})

// Get 2 related articles (excluding the current article)
const relatedArticles = computed(() => {
  if (!article.value) return []
  
  // Filter for articles with the same category first, then by most recent
  const sameCategory = Object.values(blogContent)
    .filter(post => post.title !== article.value.title && post.category === article.value.category)
    .sort((a, b) => new Date(b.date) - new Date(a.date))
    
  // If we have at least 2 in the same category, return those
  if (sameCategory.length >= 2) {
    return sameCategory.slice(0, 2)
  }
  
  // Otherwise, get the most recent articles from any category
  const otherArticles = Object.values(blogContent)
    .filter(post => post.title !== article.value.title && post.category !== article.value.category)
    .sort((a, b) => new Date(b.date) - new Date(a.date))
    
  // Combine the same category articles with others to get 2 total
  return [...sameCategory, ...otherArticles].slice(0, 2)
})

function formatDate(date) {
  if (!date) return ''
  return new Date(date).toLocaleDateString('en-US', {
    year: 'numeric',
    month: 'long', 
    day: 'numeric'
  })
}
</script>

<style>
.article-content {
  @apply text-gray-800 leading-relaxed;
}

.article-content h1 {
  @apply text-3xl font-bold mb-6 mt-8 text-gray-900;
}

.article-content h2 {
  @apply text-2xl font-bold mb-4 mt-8 text-gray-900 border-b border-gray-200 pb-2;
}

.article-content h3 {
  @apply text-xl font-bold mb-3 mt-6 text-gray-900;
}

.article-content p {
  @apply mb-5 text-lg leading-relaxed;
}

.article-content ul, .article-content ol {
  @apply mb-6 ml-6 text-lg;
}

.article-content ul {
  @apply list-disc;
}

.article-content ol {
  @apply list-decimal;
}

.article-content li {
  @apply mb-3;
}

.article-content a {
  @apply text-indigo-600 hover:text-indigo-800 underline;
}

.article-content strong {
  @apply font-bold text-gray-900;
}

.article-content blockquote {
  @apply pl-6 border-l-4 border-indigo-400 italic my-6 text-gray-700;
}

.article-content pre {
  @apply bg-gray-100 p-4 rounded-lg overflow-x-auto mb-6;
}

.article-content code {
  @apply bg-gray-100 px-1.5 py-0.5 rounded text-sm;
}

.article-content img {
  @apply rounded-lg shadow-md my-6 max-w-full h-auto;
}

/* Add a light hover effect to the related articles */
.article-content .related-articles-item:hover {
  @apply transform transition duration-300 hover:-translate-y-1 hover:shadow-lg;
}
</style>