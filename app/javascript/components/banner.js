import Typed from 'typed.js';

function loadDynamicBannerText() {
  new Typed('#banner-typed-text', {
    strings: ["Find the cocktail you love", "make it yourself!"],
    typeSpeed: 100,
    loop: true
  });
}

export { loadDynamicBannerText };
