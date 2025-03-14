// Middleware to handle ngrok requests and prevent hostname conflicts
export default defineEventHandler((event) => {
  const headers = getRequestHeaders(event);
  const host = headers.host || '';
  
  // Check if the request is coming from ngrok
  if (host.includes('ngrok') || host === 'befocused.ngrok.io') {
    // Set allowed cross-origin headers
    setResponseHeaders(event, {
      'Access-Control-Allow-Origin': `https://${host}`,
      'Access-Control-Allow-Methods': 'GET, POST, OPTIONS',
      'Access-Control-Allow-Headers': 'Content-Type, Authorization',
      'Access-Control-Allow-Credentials': 'true',
    });
  }
});