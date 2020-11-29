$(document).ready(function(){
  $(".featured-product-slider").slick({
    dots: true,
    infinite: true,
    speed: 300,
    slidesToShow: 4,
    slidesToScroll: 4,
    responsive: [
      {
        breakpoint: 1440,
        settings: {
          slidesToShow: 4,
          slidesToScroll: 4,
          dots: true
        }
      },
      {
        breakpoint: 1140,
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
          slidesToScroll: 3,
          dots: true
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
        breakpoint: 425,
        settings: {
          slidesToShow: 2,
          slidesToScroll: 2,
          centerMode: true
       }
      }
    ]
  });
 
   
  $("#btn-sidebar").click(function() {
    document.getElementById("mySidenav").style.width = "315px";
    document.getElementById("body-content").style.marginLeft = "315px";
   //  $('.sidebar-menu').fadeIn("slow");
    // document.body.style.backgroundColor = "rgba(0,0,0,0.4)";
  });

  $("#btn-close-sidebar").click(function() {
    document.getElementById("mySidenav").style.width = "0";
    document.getElementById("body-content").style.marginLeft = "0";
   //  $('.sidebar-menu').fadeOut(1000);
    // document.body.style.backgroundColor = "white";
  });

  $('#myCollapsible').collapse({
     toggle: false
  })
 
});