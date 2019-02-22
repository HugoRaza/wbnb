const ongoing = document.querySelector("#reservations-ongoing");
const past = document.querySelector("#reservations-declined");
const tabs = document.querySelectorAll(".tab");

tabs.forEach((tab) => {
  tab.addEventListener("click", (event) => {
    ongoing.classList.toggle("hidden");
    past.classList.toggle("hidden");
    tabs.forEach((subtab) => {
      subtab.classList.toggle("disabled");
      subtab.classList.toggle("active");
    });
  });
})