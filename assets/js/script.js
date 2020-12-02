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
      },
      {
        breakpoint: 400,
        settings: {
          slidesToShow: 1,
          slidesToScroll: 1,
          centerMode: true,
          mobileFirst: true
       }
      },
      {
        breakpoint: 375,
        settings: {
          slidesToShow: 1,
          slidesToScroll: 1,
          centerMode: true,
          mobileFirst: true
       }
      },
      {
        breakpoint: 320,
        settings: {
          slidesToShow: 1,
          slidesToScroll: 1,
          centerMode: true,
          mobileFirst: true
       }
      }
    ]
  });
 
   
  $("#btn-sidebar").click(function() {
    document.getElementById("mySidenav").style.width = "315px";
    var bodyContent = document.getElementById("body-content")
    if(bodyContent)
      bodyContent.style.marginLeft = "315px";
   //  $('.sidebar-menu').fadeIn("slow");
    // document.body.style.backgroundColor = "rgba(0,0,0,0.4)";
  });

  $("#btn-close-sidebar").click(function() {
    document.getElementById("mySidenav").style.width = "0";
    var bodyContent = document.getElementById("body-content")
    if(bodyContent)
      bodyContent.style.marginLeft = "0";
   //  $('.sidebar-menu').fadeOut(1000);
    // document.body.style.backgroundColor = "white";
  });

  if ($(window).width() < 768) {
    $(".edibles-main .product-category").removeClass('show');
    $(".filter-brand-button").removeClass('show');
    $(".filter-weight-button").removeClass('show');
    $(".filter-type-checkbox").removeClass('show');
    $("#InnerPageMenuContent").removeClass('show');
  }

  function WindowsResizeFunc() {
    if ($(window).width() >  768) {
      $(".edibles-main .product-category").addClass('show');
      $(".filter-brand-button").addClass('show');
      $(".filter-weight-button").addClass('show');
      $(".filter-type-checkbox").addClass('show');
      $("#InnerPageMenuContent").addClass('show');
    }
    else {
      $(".edibles-main .product-category").removeClass('show');
      $(".filter-brand-button").removeClass('show');
      $(".filter-weight-button").removeClass('show');
      $(".filter-type-checkbox").removeClass('show');
      $("#InnerPageMenuContent").removeClass('show');
    }
  }
  
  $(window).resize(WindowsResizeFunc);
 
});