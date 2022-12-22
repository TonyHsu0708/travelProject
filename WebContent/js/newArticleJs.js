//sticky navbar
let header = document.querySelector("header");
window.addEventListener("scroll", () => {
  if (window.pageYOffset != 0) {
    header.style.backgroundColor = "#80c058";
    header.style.color = "white";
    header.style.opacity = "0.9";
  } else {
    header.style = "";
  }
});
