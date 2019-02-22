import "bootstrap";

import { initAutocomplete } from '../plugins/init_autocomplete';
initAutocomplete();

import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
import initMapbox from '../plugins/init_mapbox';
initMapbox();

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
});
