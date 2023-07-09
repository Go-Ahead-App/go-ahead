module.exports = {
  darkMode: "class",
  content: [
    "./app/views/**/*.html.erb",
    "./app/helpers/**/*.rb",
    "./app/assets/stylesheets/**/*.css",
    "./app/javascript/**/*.js",
    "./app/javascript/**/*.jsx",
  ],
  theme: {
    fontFamily: {
      'display': ["Miratrix", "sans-serif"],
      'title': ["Syne", "sans-serif"],
    },
    extend: {
      fontSize: {
        '10xl': '10rem',
        '11xl': '11rem',
        '12xl': '12rem',
        '13xl': '13rem',
        '14xl': '14rem',
        '15xl': '15rem',
      }
    }
  },
}
