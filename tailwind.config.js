const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: ["./source/**/*.{html,js,erb,markdown}"],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
    },
  },
  plugins: [
    require('@tailwindcss/typography'),
    require('@tailwindcss/forms'),
  ],
}
