<section class="main-content">
   <div class="container">
      <div class="row">
         <div class="col-xl-8 col-lg-8 col-md-12 pr-md-0">
            <div class="featured-products">
               <div class="header">
                  <h2 class="d-inline">FEATURED PRODUCTS</h2>
                  <a href="#">
                  <img src="<?php echo base_url() ?>assets/img/featured_product_arrow_icon.png?>" class="float-right" alt="">
                  </a>
               </div>
               <div class="slider featured-product-slider">
                  <?php foreach($ProdList as $value) { ?>
                  <div class="featured-products-content pb-1">
                     <div class="card mr-2 each-prod product-card-inner">
                        <div class="card-body p-0">
                           <div class="header">
                              <?php 
                                 if($value['IsFeatured'] == 1) {
                                  $discountPercentage = (($value['Price'] - $value['SalePrice'])/$value['Price']) * 100;
                                  if($discountPercentage != 0) { ?> 
                              <h5 class="card-title float-left"><?php echo round($discountPercentage)."% OFF"; ?></h5>
                              <?php } ?>
                              <a href="#" class="add_to_favorite">
                              <i class="fas fa-heart float-right"></i>
                              </a>
                           </div>
                        </div>
                        <img class="card-img-bottom text-center" src="<?php echo base_url().$value['ProductImg']; ?>" alt="Card image cap">
                        <div class="product-info text-center">
                           <p class="card-text product-card-inner-name"><?php echo $value['ProductName']; ?></p>
                           <p class="card-text product-card-inner-weight"><?php echo $value['UnitName']; ?></p>
                           <p class="card-text product-card-inner-price d-inline">Rs. <?php echo $value['SalePrice']; ?></p>
                           <?php if($discountPercentage != 0) { ?> 
                           <span class="product-discount"><del>Rs. <?php echo $value['Price']; ?></del></span>
                           <?php } 
                              $productObject = (object) [
                               'id' => $value['ProductId'],
                               'pName' => $value['ProductName'],
                               'price' => $value['SalePrice'],
                               'img' => base_url().$value['ProductImg']
                              ];
                              ?>
                           <div class="quantity-area d-flex justify-content-center align-items-center mt-2">
                              <span class="d-inline-flex quantity-text mr-1">Qty</span>
                              <input type="number" min="0" class="d-inline-flex quantity quantity-input">
                              <span class="d-block quantity-button">
                                 <a href="javascript:void(0);" class="qty-pls d-block">+</a>
                                 <div class="separator"></div>
                                 <a href="javascript:void(0);" class="qty-mns d-block">-</a>
                              </span>
                           </div>
                        </div>
                        <a href="javascript:void(0);" class="product-card-btn mx-auto add-cart"
                           data-json="<?php echo htmlentities(json_encode($productObject), ENT_QUOTES, 'UTF-8'); ?>"
                           >Add to Cart</a>
                        <a href="javascript:void(0);" style="display: none;" class="product-card-btn mx-auto remove-cart"
                           data-json="<?php echo htmlentities(json_encode($productObject), ENT_QUOTES, 'UTF-8'); ?>"
                           >Remove From Cart</a>
                     </div>
                  </div>
                  <?php }} ?>
               </div>
            </div>
         </div>
         <div class="col-xl-4 col-lg-4 col-md-12">
            <div class="row">
               <div class="col-lg-12 col-md-6 grocery-features-columns">
                  <div class="grocery-features">
                     <div class="card">
                        <div class="card-body grocery-assistant-card">
                           <div class="container-fluid px-0">
                              <h6 class="card-title mb-0">Our Shop Assistant will systematically walk you through all sections of the store</h6>
                              <div class="row">
                                 <div class="col-md-7 pr-0">
                                    <h4 class="card-heading pt-3 mb-2">SHOP ASSISTANT</h4>
                                    <button class="card-button" data-toggle="modal" data-target="#virtualAssistant">Use Assistant</button>
                                 </div>
                                 <div class="image-container">
                                    <img src="<?php echo base_url() ?>assets/img/grocery-assitant-icon.png?>" alt="Grocery Assistant Icon" class="img-fluid" />
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="col-lg-12 col-md-6 grocery-features-columns">
                  <div class="grocery-features value-cart-feature">
                     <div class="card">
                        <div class="card-body value-cart">
                           <div class="container-fluid px-0">
                              <h4 class="card-heading">Value Cart</h4>
                              <div class="row">
                                 <div class="col-md-7 pr-0">                                    
                                    <h6 class="card-title mb-3">Let us assist you in building the most economical cart</h6>
                                    <button class="card-button" onclick="window.location.href = '<?=base_url("user/value_cart")?>'">Build Value Cart</button>
                                 </div>
                                 <div class="value-cart-feature-image">
                                    <img src="<?= base_url("assets/img/value-cart.png") ?>" alt="Grocery Assistant Icon" class="img-fluid" />
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
                     <div class="col-md-3 pl-0">
                        <h2 class="products-widget-heading"><?=$key?></h2>
                        <div class="card product-category">
                           <div class="card-body product-card-category-list">
                              <?php for ($i=0; $i < count($value->childCats); $i++) {?>
                              <div>
                                 <a href="<?='Cproduct/products?categoryId='.$value->childCats[$i]['CategoryId'] ?>" target="_blank"><?=$value->childCats[$i]['Alias']?></a>
                              </div>
                              <?php } ?>
                           </div>
                           <div class="card-footer">
                              <a href="javascript:void(0)">VIEW ALL</a>
                           </div>
                        </div>
                     </div>

                     <div class="col-md-9 px-0">

                        <div class="container-fluid">
                           <div class="container-fluid">
                              <div class="row d-flex align-items-center justify-content-start">
                                 <?php if(is_array($value->childCats)) for ($i=0; $i < count($value->childCats); $i++) {?>
                                 <div class="card product-card mx-2">
                                    <?php if(!empty($value->childCats[$i]['CatName'])){?>
                                    <img class="card-img-top" src="<?php echo base_url().$value->childCats[$i]['Img']; ?>" alt="Card image cap">
                                    <div class="card-body p-0">
                                       <p class="product-card-title"><?php echo $value->childCats[$i]['CatName']; ?></p>
                                       <a href="#" class="product-card-details-btn">View more details</a>
                                    </div>
                                    <div class="card-footer p-0">
                                       <a href="<?php echo base_url().'Cproduct/products?categoryId='.$value->childCats[$i]['CategoryId']; ?>"
                                          class="product-card-viewmore-btn">View more</a>
                                    </div>
                                    <?php } else { ?>
                                    <div class="card-img-bottom text-center" style="margin-top: 80%;background: #80808052;padding: 20%;">
                                       No Product
                                    </div>
                                    <?php } ?>
                                 </div>
                                 <?php } ?>
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
   </div>
</section>
 <!-- Virtual Assistant -->
<div id="virtualAssistant" class="modal fades" role="dialog">
   <div class="modal-dialog modal-lg">
      <!-- Modal content-->
      <div class="modal-content p-0">
         <div class="modal-body p-0">
            <a href="javascript:void(0)" class="close" data-dismiss="modal" data-target="virtualAssistant">
               <span>&times;</span>
            </a>
            <!-- <a href="javascript:void(0)" type="button" class="close mx-auto" data-dismiss="modal" aria-label="Close">
             <span aria-hidden="true">&times;</span>
           </a> -->
            <div id="va-panel">
               <div class="va-panel-header d-flex justify-content-between p-3">
                  <img src="<?=base_url("assets/img/GroceryAssistant/logo_colored.png");?>">
                  <div class="d-flex align-items-center ml-2">
                     <img src="<?=base_url("assets/img/GroceryAssistant/grocery_assistant_logo.png")?>" class="d-block">
                     <span class="va-panel-heading d-block">Grocery Assistant</span>
                  </div>
               </div>
               <div class="va-panel-header-sub py-3 text-center">
                  <span class="heading-primary d-block">Categoy: Edibles</span>
                  <span class="heading-secondary d-block">Sub Category: Atta</span>
               </div> 
               <div class="va-panel-content">
                  <div class="container-fluid">
                     <div class="row">
                        <div class="col-md-4 px-0">
                           <div class="filter-sidebar">
                              <div class="filter-header d-flex px-4 py-3 border-b-primary">
                                 <div class="filter-icon mr-2">
                                    <img src="<?=base_url("assets/img/GroceryAssistant/filter.png")?>">   
                                 </div>                                    
                                 <span class="filter-heading">Use Filters to Find your Product</span>
                              </div>

                              <div class="filter-brand px-4 py-3 border-b-primary">
                                 <div class="heading-primary mb-3">Filter by Brand:</div>                                    
                                 <div class="filter-brand-button">
                                    <button class="btn btn-link mb-2">Punjab Atta</button>
                                    <button class="btn btn-link mb-2">Floor Mill</button>
                                    <button class="btn btn-link mb-2">Chakki Atta</button>
                                    <button class="btn btn-link mb-2">Sindh Atta</button>
                                    <button class="btn btn-link mb-2">Yousuf Floor Mill</button>
                                 </div>
                              </div>

                              <div class="filter-weight px-4 py-3 border-b-primary">
                                 <div class="heading-primary mb-3">Filter by Weight:</div>                                    
                                 <div class="filter-weight-button">
                                    <button class="btn btn-link mb-2">5KG</button>
                                    <button class="btn btn-link mb-2">10KG</button>
                                    <button class="btn btn-link mb-2">20KG</button>
                                 </div>
                              </div>

                              <div class="filter-type px-4 py-3 border-b-primary">
                                 <div class="heading-primary mb-3">Filter by Weight:</div>
                                 <div class="filter-type-checkbox">
                                    <div class="form-check">
                                      <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios1" value="option1" checked>
                                      <label class="form-check-label" for="exampleRadios1">
                                        Chakki
                                      </label>
                                    </div>
                                    <div class="form-check">
                                      <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios2" value="option2">
                                      <label class="form-check-label" for="exampleRadios2">
                                        Fine
                                      </label>
                                    </div>
                                 </div>                                    
                              </div>

                           </div>
                        </div>
                        <div class="col-md-8 pl-0 pt-3">
                           <div class="product-content">
                              <div class="container-fluid">
                                 <div class="row">
                                    <?php for ($i=0; $i < count($Assistant); $i++) { ?>
                                    <div class="col-sm-4">
                                         <div class="mb-3">
                                          <div class="card product-card each-prod">
                                             <img class="card-img-top" src="<?=base_url($Assistant[$i]['ProductImg']);?>" alt="Card image cap">
                                             <div class="card-body p-0 text-center">
                                                <p class="product-card-title"><?=$Assistant[$i]['ProductName']?></p>
                                                <p class="product-card-weight mb-0"><?=$Assistant[$i]['UnitName']?></p>
                                                <p class="card-text product-card-inner-price"><script type="text/javascript">document.write(formatCurrency('<?=$Assistant[$i]['SalePrice']?>', 0));</script></p>
                                                <div class="quantity-area d-flex justify-content-center align-items-center mt-2">
                                                   <?php
                                                      $productObject = (object) [
                                                       'id' => $Assistant[$i]['ProductId'],
                                                       'pName' => $Assistant[$i]['ProductName'],
                                                       'price' => $Assistant[$i]['SalePrice'],
                                                       'img' => base_url($Assistant[$i]['ProductImg'])
                                                      ];
                                                   ?>
                                                   <span class="d-inline-flex quantity-text mr-1">Qty</span>
                                                   <input type="number" min="0" class="d-inline-flex quantity quantity-input">
                                                   <span class="d-block quantity-button">
                                                       <a href="#" class="qty-pls d-block">+</a>
                                                       <div class="separator"></div>
                                                       <a href="#" class="qty-mns d-block">-</a>
                                                   </span>
                                                </div>
                                                <a href="javascript:void(0);" class="product-card-btn mt-2 mx-auto add-cart"
                                                   data-json="<?php echo htmlentities(json_encode($productObject), ENT_QUOTES, 'UTF-8'); ?>"
                                                   >Add to Cart</a>
                                                <a href="javascript:void(0);" style="display: none;" class="product-card-btn mt-2 mx-auto remove-cart va-panel-remove-cart"
                                                   data-json="<?php echo htmlentities(json_encode($productObject), ENT_QUOTES, 'UTF-8'); ?>"
                                                   >Remove From Cart</a>
                                             </div>
                                          </div>
                                         </div>
                                    </div>
                                    <?php } ?>
                                 </div>
                              </div>
                           </div>

                           <div class="product-content-button my-4 text-center">
                              <button class="btn btn-link nav-btn-primary">1</button>
                              <button class="btn btn-link nav-btn-dismiss">2</button>
                              <button class="btn btn-link nav-btn-dismiss">3</button>
                              <button class="btn btn-link nav-btn-dismiss">4</button>
                              <button class="btn btn-link nav-btn-dismiss">5</button>
                              <button class="btn btn-link nav-btn-dismiss">6</button>
                              <button class="btn btn-link nav-btn-dismiss">7</button>
                              <button class="btn btn-link nav-btn-dismiss">8</button>
                           </div>

                        </div>
                     </div>
                  </div>
               </div>  

               <div class="va-panel-footer">
                  <div class="d-flex justify-content-around align-items-center">
                     <button class="btn btn-link va-panel-footer-btn-red text-center" data-dismiss="modal">Leave Grocery Assistant</button>
                     <button class="btn btn-link va-panel-footer-btn-black">Previous Category</button>
                     <button class="btn btn-link va-panel-footer-btn-black">Next Category</button>
                     <button class="btn btn-link va-panel-footer-btn-green" id="popup-checkout">Checkout</button>
                  </div>
               </div>

            </div>
            
         </div>
      </div>
   </div>
</div>
   <!-- Virtual Assistant -->
<script type="text/javascript">
   
   $(document).ready(function(){
      $(document).on('click', '#popup-checkout', function () {
         checkout($(this));
      });

      function checkout(currentElement){
         var cart = getCookie('baskit');
         if(!cart){
            $.notify(`Please add some product before checkout`, "error");
         }
         cart = JSON.parse(cart);
         if(cart.length > 0){
            var url = "<?php echo base_url() ?>Corder/checkout_form";
            window.location.href = url;
         }
         else{
            $.notify(`Please add some product before checkout`, "error");
         }
      }
      
   });
</script>
