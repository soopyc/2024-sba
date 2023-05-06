const config = {
  content: ['./src/**/*.{html,js,svelte,ts}'],

  theme: {
    extend: {}
  },

  plugins: [
    require('daisyui')
  ],

  daisyui: {
    base: true,
    logs: false,
    themes: [
      {
        'light': {
          "primary": "#3c9fce",
          "secondary": "#6ec1e4",   
          "accent": "#1d86a8",
          "neutral": "#000000",
          "base-100": "#ffffff",
          "info": "#95e0f8",
          "success": "#1f9352",
          "warning": "#ffa800",
          "error": "#eb2455",
        }
      }
    ]
  }
};

module.exports = config;
