const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,html}',
    './config/locales/*.yml',
    './app/content/**/*.{erb,html,rb,md}'
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
        heading: ['Calibre']
      },
      container: {
        center: true,
        padding: {
          DEFAULT: '1rem',
          sm: '1rem',
          md: '2rem',
          lg: '4rem',
          xl: '5rem',
          '2xl': '6rem'
        }
      }
    }
  },
  daisyui: {
    themes: [
      {
        parisrb: {
          primary: '#D62828',
          'primary-content': '#FFFFFF',
          secondary: '#efe7E9',
          accent: '#fcd34d',
          neutral: '#EFE7E9',
          'base-100': '#FFFFFF',
          'base-200': '#EFE7E9',
          'base-300': '#D1CDD1',
          info: '#bfdbfe',
          success: '#86efac',
          warning: '#fde68a',
          error: '#f87171',
          '--animation-btn': 'none'
        }
      }
    ]
  },
  plugins: [require('daisyui'), require('@tailwindcss/typography')],
  safelist: ['markdown']
}
