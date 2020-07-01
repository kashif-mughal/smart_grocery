<?php
$CI = & get_instance();
$CI->load->model('Users');
$users = $CI->Users->profile_edit_data();
$out_of_stock = $CI->Reports->out_of_stock_count();
?>

<header class="section-header">
      <section class="top-bar">
         <div class="container-fluid">
            <div class="row">
               <nav class="navbar navbar-expand-sm ml-md-auto">
                  <ul class="navbar-nav">
                     <li class="nav-item">
                        <a class="nav-link" href="#">My Account</a>
                     </li>
                     <li>
                        <p class="seperator">|</p>
                     </li>
                     <li class="nav-item">
                        <a class="nav-link" href="#">Wishlist</a>
                     </li>
                     <li>
                        <p class="seperator">|</p>
                     </li>
                     <li class="nav-item">
                        <a class="nav-link" href="#">Track your order</a>
                     </li>
                  </ul>
               </nav>
            </div>
         </div>
      </section>
      <section class="header-main">
         <div class="container-fluid">
            <div class="row align-items-center py-xl-1">
               <div class="col-xl-2 col-lg-2 col-md-12">

                  <div class="brand-area">
                     <button class="navbar-toggler float-right" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <img src="<?php echo base_url() ?>assets/img/toggler_icon.png?>" alt="Toggle navigation">
                     </button>
                     <div class="company-logo">
                        <img src="<?php echo base_url() ?>assets/img/logo.png?>" alt="Sauda Express" class="img-fluid">
                        <p class="tag-line">Where technology meets tradition</p>   
                     </div>
                  </div>

                  <!-- <div class="brand-area d-flex justify-content-center">
                     <button class="navbar-toggler p-2" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <img src="<?php echo base_url() ?>assets/img/toggler_icon.png?>" alt="Toggle navigation">
                     </button>
                     <div class="company-logo mr-auto">
                        <img src="<?php echo base_url() ?>assets/img/logo.png?>" alt="Sauda Express">
                        <p class="tag-line">Where technology meets tradition</p>   
                     </div>
                  </div> -->

               </div>
               <div class="col-xl-8 col-lg-7 col-md-7 mb-sm-3 pr-sm-0">
                  <div class="input-group mb-3 main-search-bar pl-sm-4 pl-md-0">
                     <div class="input-group-prepend search-fields">
                       <button class="btn btn-outline-secondary dropdown-toggle font-weight-400 category-button" type="button" data-toggle="dropdown" >
                          All
                          <img src="<?php echo base_url() ?>assets/img/chevron.png?>" alt="" class="img-fluid">
                        </button>
                       <div class="dropdown-menu">
                         <a class="dropdown-item" href="#">Fruits</a>
                         <a class="dropdown-item" href="#">Vegetables</a>
                         <a class="dropdown-item" href="#">Dry Fruits</a>
                         <a class="dropdown-item" href="#">Rice</a>
                       </div>
                     </div>
                     <input type="text" class="form-control font-weight-400" 
                        placeholder="I'm shopping for...">
                     <div class="input-group-append">
                        <button class="btn btn-outline-secondary btn-black search-button" 
                              type="button">Search</button>
                      </div>
                  </div>
               </div>
               <div class="col-xl-2 col-lg-3 col-md-5 mb-sm-2">
                  <div class="cart-basket-main">
                     <img src="<?php echo base_url() ?>assets/img/hotline_phone_icon.png?>" alt="" class="mt-2">
                     <div class="hotline ml-2">
                        <h6 class="hotline-text mb-1">Hotline</h6>
                        <h6 class="font-weight-bold mb-1 hotline-number">+92 300 123 1234</h6>
                     </div>
                     <!-- <div class="hotline-main">
                     </div> -->
                     <div class="cart-basket ml-0">
                        <img src="<?php echo base_url() ?>assets/img/basket.png?>" alt="" id="basket-img">
                        <span id="add_to_cart_items" class="badge badge-pill badge-light">2</span>
                     </div>

                  </div>
               </div>
               <!-- <div class="col-xl-3 col-lg-3 col-md-4 mb-sm-3 cart-basket-main">
                  <div class="float-left hotline-main">
                     <img src="<?php echo base_url() ?>assets/img/hotline_phone_icon.png?>" alt="" class="float-left mt-2">
                     <div class="hotline float-right ml-2">
                        <h6 class="hotline-text mb-1">Hotline</h6>
                        <h6 class="font-weight-bold mb-1 hotline-number">+92 300 123 1234</h6>
                     </div>
                  </div>
                  <div class="cart-basket float-left">
                     <img src="<?php echo base_url() ?>assets/img/basket.png?>" alt="" id="basket-img">
                     <span id="add_to_cart_items" class="badge badge-pill badge-light">2</span>
                  </div>
               </div> -->
            </div>
         </div>
      </section>
   </header>