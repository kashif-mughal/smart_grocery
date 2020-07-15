<section class="main-content">
      <div class="container-fluid">
         <div class="row">
            <div class="col-xl-9 col-lg-9 col-md-12">
               <div class="featured-products">
                  <div class="header">
                     <h2 class="d-inline">FEATURED PRODUCTS</h2>
                     <a href="#">
                        <img src="<?php echo base_url() ?>assets/img/featured_product_arrow_icon.png?>" class="float-right" alt="">
                     </a>
                  </div>
                  <div class="slider featured-product-slider">
                     <?php foreach($ProdList as $value) { 
                           if($value['IsFeatured'] == 1) {
                              $discountPercentage = (($value['Price'] - $value['SalePrice'])/$value['Price']) * 100;
                        ?>
                     <div class="featured-products-content">
                        <div class="card mr-2">
                           <div class="card-body p-0">
                              <div class="header">
                              <?php if($discountPercentage != 0) { ?> 
                                 <h5 class="card-title float-left"><?php echo round($discountPercentage)."% OFF"; ?></h5>
                              <?php } ?>
                                 <a href="#" class="add_to_favorite">
                                    <i class="fas fa-heart float-right"></i>
                                 </a>
                              </div>
                           </div>
                           <img class="card-img-bottom text-center" src="<?php echo base_url().$value['ProductImg']; ?>" alt="<?php echo $value['ProductName']; ?>">
                           <div class="product-info">
                              <p class="card-text product-name"><?php echo $value['ProductName']; ?></p>
                              <p class="card-text product-weight"><?php echo $value['Unit'].'kg'; ?></p>
                              <p class="card-text product-price d-inline">Rs. <?php echo $value['SalePrice']; ?></p>
                              <?php if($discountPercentage != 0) { ?> 
                              <span class="product-discount"><del>Rs. <?php echo $value['Price']; ?></del></span>
                              <?php } ?>
                           </div>
                           <a href="#" class="product-card-btn mx-auto">Add to Cart</a>
                         </div>
                     </div>
                     <?php }} ?>

                   </div>
                  
                  
               </div>
            </div>
            <!-- <div class="col-xl-3 col-lg-3 col-md-12">
               <div class="grocery-assistant-card">
                  <div class="card">
                     <div class="card-body">
                        <h3 class="card-title">Use our shop assistant to help you build your cart</h3>
                              <h2 class="card-heading">GROCERY ASSISTANT</h2>
                              <button class="card-button">Use Assistant</button>
                              <img src="<?php echo base_url() ?>assets/img/grocery-assitant-icon.png?>" alt="Grocery Assistant Icon" class="card-image">
                        </div>
                     </div>
                  </div>
               </div>

               <div class="grocery-assistant-card">
                  <div class="card">
                     <div class="card-body">
                        <h3 class="card-title">Use our shop assistant to help you build your cart</h3>
                              <h2 class="card-heading">GROCERY ASSISTANT</h2>
                              <button class="card-button">Use Assistant</button>
                              <img src="<?php echo base_url() ?>assets/img/grocery-assitant-icon.png?>" alt="Grocery Assistant Icon" class="card-image">
                        </div>
                     </div>
                  </div>
               </div>
               
            </div> -->

            <div class="col-xl-3 col-lg-3 col-md-12">
               <div class="row">
                  <div class="col-lg-12 col-md-6">
                     <div class="grocery-features">

                        <div class="card">
                           <div class="card-body grocery-assistant-card">
                              <div class="container-fluid px-0">
                                 
                                 <h6 class="card-title mb-0">Use our shop assistant to help you build your cart</h6>
                                 <div class="row">
                                    <div class="col-md-7 pr-0">
                                       <h4 class="card-heading pt-3">GROCERY ASSISTANT</h4>
                                       <button class="card-button">Use Assistant</button>
                                    </div>
                                    <div class="col-md-5 pl-0">
                                       <img src="<?php echo base_url() ?>assets/img/grocery-assitant-icon.png?>" alt="Grocery Assistant Icon" class="img-fluid" />
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>

                     </div>
                  </div>
                  <div class="col-lg-12 col-md-6">
                     <div class="grocery-features">

                        <div class="card">
                           <div class="card-body grocery-assistant-card">
                              <div class="container-fluid px-0">
                                 
                                 <h6 class="card-title mb-0">Use our shop assistant to help you build your cart</h6>
                                 <div class="row">
                                    <div class="col-md-7 pr-0">
                                       <h4 class="card-heading pt-3">GROCERY ASSISTANT</h4>
                                       <button class="card-button">Use Assistant</button>
                                    </div>
                                    <div class="col-md-5 pl-0">
                                       <img src="<?php echo base_url() ?>assets/img/grocery-assitant-icon.png?>" alt="Grocery Assistant Icon" class="img-fluid" />
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>
                        
                     </div>
                  </div>
               </div>
            </div>

         </div>

         <?php
            foreach($CatList as $key => $value) {?>
               <div class="row">
                  <div class="col-xl-12 col-lg-12 col-md-12">
                     <section class="edibles-main products-widget">
                        <div class="container-fluid">
                           <div class="row">
                              <div class="col-md-2 pl-0">
                                 <h2 class="products-widget-heading"><?=$key?></h2>
                                 <div class="card product-category">
                                    <div class="card-body product-card-category-list">
                                       <?php for ($i=0; $i < count($value); $i++) {?>
                                          <div>
                                             <a href="#"><?=$value[$i]['Alias']?></a>
                                          </div>
                                       <?php } ?>
                                    </div>
                                    <div class="card-footer">
                                       <a href="javascript:void(0)">VIEW ALL</a>
                                    </div>
                                 </div>
                              </div>
                              <div class="col-md-10 pr-0">
                                 <div class="container-fluid">
                                    <div class="row">
                                       <div class="col-lg-3 col-md-4 col-sm-6">

                                          <div>
                                             <?php  ?>
                                             <div class="card product-card">
                                                <img class="card-img-top" src="<?php echo base_url() ?>assets/img/products/edibles/Daalain, Rice & Flour.png?>" alt="Card image cap">
                                                <div class="card-body p-0">
                                                   <p class="product-card-title">Women Care</p>
                                                   <a href="#" class="product-card-details-btn">View more details</a>
                                                </div>
                                                <div class="card-footer p-0">
                                                   <a href="#" class="product-card-viewmore-btn">View more</a>
                                                </div>
                                              </div>
                                          </div>

                                       </div>
                                       
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </section>
                  </div>
               </div>
            <?php } ?>
         <!-- HOUSEHOLD ESSENTIALS -->

         <!-- Call to Action -->

         <div class="row my-4">
            <div class="col-md-4">

               <div class="call_to_action_grid border-right-full">
                  <div class="call_to_action_image">
                     <img src="<?php echo base_url() ?>assets/img/footer/call_to_action/SameNextDayDelivery_icon.png?>" alt="Icon">
                  </div>
                  <div class="call_to_action_content">
                     <h5 class="call_to_action_title">Same/Next Day Delivery</h5>
                     <h6 class="call_to_action_content">Free delivery on all orders over Rs. 4,000 Rs 100 for orders below Rs. 4,000</h6>
                  </div>
               </div>

            </div>
            <div class="col-md-4">

               <div class="call_to_action_grid border-right-full">
                  <div class="call_to_action_image">
                     <h4 class="call_to_action_custom_img m-0">Rs.</h4> 
                  </div>
                  <div class="call_to_action_content">
                     <h5 class="call_to_action_title">Cash On Delivery</h5>
                     <h6 class="call_to_action_content">You pay when rider comes at your address.</h6>
                  </div>
               </div>

            </div>
            <div class="col-md-4">

               <div class="call_to_action_grid">
                  <div class="call_to_action_image">
                     <img src="<?php echo base_url() ?>assets/img/footer/call_to_action/OnlineSupport_icon.png?>" alt="Icon">
                  </div>
                  <div class="call_to_action_content">
                     <h5 class="call_to_action_title">Online Support</h5>
                     <h6 class="call_to_action_content">Customer support from 9AM - Midnight (021) 111 111 123</h6>
                  </div>
               </div>

            </div>
         </div>

         <!-- Call to Action -->

      </div>
   </section>
