/**
 * Composable for getting the app URL based on environment variables
 * Returns the configured app URL for login and signup links
 */
export const useAppUrl = () => {
  const config = useRuntimeConfig();
  
  /**
   * Get the base app URL from environment variable with fallbacks
   * Handles cases where the config value might be literal "undefined"
   */
  const appUrl = computed(() => {
    const defaultUrl = 'http://localhost:5173';
    
    // Fix for when the value is literally "undefined" as a string
    // or when it's undefined as a value
    if (!config.public.appUrl || config.public.appUrl === 'undefined') {
      return defaultUrl;
    }
    
    return config.public.appUrl;
  });
  
  /**
   * Get the login URL
   * @returns {string} The full login URL
   */
  const getLoginUrl = () => `${appUrl.value}/login`;
  
  /**
   * Get the signup URL
   * @returns {string} The full signup URL
   */
  const getSignupUrl = () => `${appUrl.value}/signup`;
  
  return {
    appUrl,
    getLoginUrl,
    getSignupUrl
  };
};