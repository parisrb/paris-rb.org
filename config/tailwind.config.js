const defaultTheme = require("tailwindcss/defaultTheme");

module.exports = {
  content: [
    "./public/*.html",
    "./app/helpers/**/*.rb",
    "./app/javascript/**/*.js",
    "./app/views/**/*.{erb,html}",
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ["Inter var", ...defaultTheme.fontFamily.sans],
      },
      container: {
        center: true,
        padding: {
          DEFAULT: "1rem",
          sm: "1rem",
          md: "2rem",
          lg: "4rem",
          xl: "5rem",
          "2xl": "6rem",
        },
      },
    },
  },
  daisyui: {
    themes: [
      {
        parisrb: {
          primary: "#D62828",
          "primary-content": "#FFFFFF",
          secondary: "#F4A261",
          accent: "#10B981",
          neutral: "#EFE7E9",
          "base-100": "#FFFFFF",
          "base-200": "#EFE7E9",
          info: "#2A9D8F",
          success: "#22C55E",
          warning: "#F4A261",
          error: "#E76F51",
        },
      },
    ],
  },
  plugins: [require("daisyui"), require("@tailwindcss/typography")],
};
