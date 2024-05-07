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
      fontSize: {
        xs: ['0.75rem', { lineHeight: '1rem' }],
        sm: ['0.875rem', { lineHeight: 'rfs(1.25rem)' }],
        base: ['rfs(1rem)', { lineHeight: 'rfs(1.5rem)' }],
        lg: ['rfs(1.125rem)', { lineHeight: 'rfs(1.75rem)' }],
        xl: ['rfs(1.25rem)', { lineHeight: 'rfs(1.75rem)' }],
        '2xl': ['rfs(1.5rem)', { lineHeight: 'rfs(2rem)' }],
        '3xl': ['rfs(1.875rem)', { lineHeight: 'rfs(2.25rem)' }],
        '4xl': ['rfs(2.25rem)', { lineHeight: 'rfs(2.5rem)' }],
        '5xl': ['rfs(3rem)', { lineHeight: '1' }],
        '6xl': ['rfs(3.75rem)', { lineHeight: '1' }],
        '7xl': ['rfs(4.5rem)', { lineHeight: '1' }],
        '8xl': ['rfs(6rem)', { lineHeight: '1' }],
        '9xl': ['rfs(8rem)', { lineHeight: '1' }]
      },
      container: {
        center: true,
        padding: {
          DEFAULT: '1rem'
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
          secondary: 'fbf2f4',
          'secondary-content': '#D62828',
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
