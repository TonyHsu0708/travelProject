// Get the button
let mybutton = document.getElementById("myBtn");

// When the user scrolls down 20px from the top of the document, show the button
window.onscroll = function () {
  scrollFunction();
};

function scrollFunction() {
  if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
    mybutton.style.display = "block";
  } else {
    mybutton.style.display = "none";
  }
}

// When the user clicks on the button, scroll to the top of the document
function topFunction() {
  document.body.scrollTop = 0;
  document.documentElement.scrollTop = 0;
}

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
