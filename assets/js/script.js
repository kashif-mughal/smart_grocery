$(document).ready(function(){
   
   $(".featured-product-slider").slick({
     dots: true,
     infinite: false,
     speed: 300,
     responsive: [
       {
         breakpoint: 2559,
         settings: {
           slidesToShow: 5,
           slidesToScroll: 5,
           infinite: true,
           dots: true
         }
       },
       {
         breakpoint: 1440,
         settings: {
           slidesToShow: 4,
           slidesToScroll: 4,
           dots: true
         }
       },
       {
         breakpoint: 1200,
         settings: {
           slidesToShow: 3,
           slidesToScroll: 3,
           dots: true
         }
       },
       {
         breakpoint: 1024,
         settings: {
           slidesToShow: 3,
           slidesToScroll: 3,
           dots: true
         }
       },
       {
         breakpoint: 992,
         settings: {
           slidesToShow: 3,
           slidesToScroll: 3
         }
       },
       {
         breakpoint: 768,
         settings: {
           slidesToShow: 2,
           slidesToScroll: 2
         }
       },
       {
         breakpoint: 576,
         settings: {
           slidesToShow: 1,
           slidesToScroll: 1,
           centerMode: true
         }
       }
     ]
   });


   

   $(".featured-products-content img").on("error", function() {
     $(this).attr(
       "src",
       "https://via.placeholder.com/190x110?text=Add+Product+Image"
     );
   });
    
 });