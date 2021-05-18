document.addEventListener("DOMContentLoaded", function(){
  const mySwiper = new Swiper('.swiper-container', {
    // Optional parameters
    direction: 'horizontal',
    loop: true,
    speed: 1500,
  
    // autoplay: {
    //   delay: 3000,
    //   stopOnLastSlide: false,
    //   disableOnInteraction: false,
    //   reverseDirection: false
    // },

    // If we need pagination
    pagination: {
      el: '.swiper-pagination',
    },
  
    // Navigation arrows
    navigation: {
      nextEl: '.swiper-button-next',
      prevEl: '.swiper-button-prev',
    },
  });
});