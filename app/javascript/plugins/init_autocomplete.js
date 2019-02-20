import places from 'places.js';

const initAutocomplete = () => {
  const autoInput = document.querySelector('#autocompletion');
  if (autoInput) {
    places({ container: autoInput });
  }
};

export {initAutocomplete};
