// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.

const channels = require.context('.', true, /_channel\.js$/)
channels.keys().forEach(channels)

// start hamburger js
const menu = document.getElementById("menu")
const nav = document.getElementById("nav")
const menuBg = document.getElementById("menu-bg")

function onClickMenu(){
  menu.classList.toggle("change");
  nav.classList.toggle("change");
  menuBg.classList.toggle("change-bg");
};
// end hamburger js
