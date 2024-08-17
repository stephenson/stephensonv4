const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: ["./source/**/*.{html,js,erb,markdown}"],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
        iawriter: ["IA Writer Mono", "sans-serif"],
        iawriterbold: ["IA Writer Mono Bold", "sans-serif"],
      },
    },
  },
  plugins: [
    require('@tailwindcss/typography'),
    require('@tailwindcss/forms'),
  ],
}
