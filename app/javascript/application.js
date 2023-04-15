// Entry point for the build script in your package.json

// Support component names relative to this directory:
var componentRequireContext = require.context("components", true);
var ReactRailsUJS = require("react_ujs");
ReactRailsUJS.useContext(componentRequireContext);

// Change theme color on click on data-theme add to html tag class .dark
const themeSwitch = document.querySelector("[data-theme]");

themeSwitch.addEventListener("click", (e) => {
  e.preventDefault();

  document.documentElement.classList.toggle("dark");

  if (document.documentElement.classList.contains("dark")) {
    localStorage.setItem("theme", "dark");
  } else {
    localStorage.setItem("theme", "light");
  }
});

// Check if the user has previously chosen a theme
const currentTheme = localStorage.getItem("theme")
  ? localStorage.getItem("theme")
  : null;

if (currentTheme) {
  document.documentElement.classList.add(currentTheme);
}
