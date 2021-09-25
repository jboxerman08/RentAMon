
// const hamburger = () => {
//   console.log('Hello')
// const menu = document.getElementById("menu")
// const nav = document.getElementById("nav")
// const menuBg = document.getElementById("menu-bg")

// // I want to toggle class menu to class change when I click on it
// // I want to toggle class nav to class change when I click on it
// // I want to toggle class menuBg to change-bg when I click on it
// menu.addEventListener ("click", (event) => {
//   console.log(event);
//     console.log(event.currentTarget);
// };

// export { hamburger };
function onClickMenu (){ menu.addEventListener("click", (event)=> {
const menu = document.getElementById("menu")
const nav = document.getElementById("nav")
event.preventDefault();
console.log(event.currentTarget);
menu.classList.toggle("change");
nav.classList.toggle("change");
});
}

export { onClickMenu };
