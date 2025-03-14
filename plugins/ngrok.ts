// plugins/ngrok.ts
export default defineNuxtPlugin(() => {
  // Check if running in browser and fix Vite HMR connection
  if (process.client) {
    // This runs in the browser context
    const hostname = window.location.hostname;
    
    // If we're running on ngrok, adjust the Vite HMR connection
    if (hostname.includes('ngrok') || hostname === 'befocused.ngrok.io') {
      console.log('[Plugin] Running on ngrok, fixing HMR connection...');
      
      // Create a custom event to notify Vite to use a different HMR host
      window.dispatchEvent(new CustomEvent('vite:beforeUpdate', { 
        detail: { type: 'update', updates: [] }
      }));
      
      // Add a meta tag to signal to Vite that ngrok is allowed
      const meta = document.createElement('meta');
      meta.name = 'vite-allowed-host';
      meta.content = hostname;
      document.head.appendChild(meta);
    }
  }
});