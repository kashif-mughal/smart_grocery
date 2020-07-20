<section class="main-content">
   <div class="container">
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
                  <?php foreach($ProdList as $value) { ?>
                  <div class="featured-products-content mb-3">
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
                           <p class="card-text product-card-inner-weight"><?php echo $value['Unit'].$value['UnitName']; ?></p>
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
                              <input type="text" class="d-inline-flex quantity quantity-input">
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
                     <div class="col-md-9">
                        <div class="container-fluid">
                           <div class="row featured-products-content">
                              <?php for ($i=0; $i < count($value->products); $i++) {?>
                              <div class="card mr-2 each-prod product-card-inner">
                                 <?php if(!empty($value->products[$i]['ProductName'])){?>
                                 <div class="card-body p-0">
                                    <div class="header">
                                       <?php 
                                          if($value->products[$i]['IsFeatured'] == 1) {
                                           $discountPercentage = (($value->products[$i]['Price'] - $value->products[$i]['SalePrice'])/$value->products[$i]['Price']) * 100;
                                          }
                                          if($discountPercentage != 0) { ?> 
                                       <h5 class="card-title float-left"><?php echo round($discountPercentage)."% OFF"; ?></h5>
                                       <?php } ?>
                                       <a href="#" class="add_to_favorite">
                                       <i class="fas fa-heart float-right"></i>
                                       </a>
                                    </div>
                                 </div>
                                 <img class="card-img-bottom text-center" src="<?php echo base_url().$value->products[$i]['ProductImg']; ?>" alt="Card image cap">
                                 <div class="product-info text-center">
                                    <p class="card-text product-card-inner-name"><?php echo $value->products[$i]['ProductName']; ?></p>
                                    <p class="card-text product-card-inner-weight"><?php echo $value->products[$i]['Unit'].$value->products[$i]['UnitName']; ?></p>
                                    <p class="card-text product-card-inner-price d-inline">Rs. <?php echo $value->products[$i]['SalePrice']; ?></p>
                                    <?php if($discountPercentage != 0) { ?> 
                                    <span class="product-discount"><del>Rs. <?php echo $value->products[$i]['Price']; ?></del></span>
                                    <?php } 
                                       $productObject = (object) [
                                        'id' => $value->products[$i]['ProductId'],
                                        'pName' => $value->products[$i]['ProductName'],
                                        'price' => $value->products[$i]['SalePrice'],
                                        'img' => base_url().$value->products[$i]['ProductImg']
                                       ];
                                       ?>
                                    <div class="quantity-area d-flex justify-content-center align-items-center mt-2">
                                       <span class="d-inline-flex quantity-text mr-1">Qty</span>
                                       <input type="text" class="d-inline-flex quantity quantity-input">
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
                                 <?php }else{ ?>
                                 <div class="card-img-bottom text-center" style="margin-top: 50%;background: #80808052;padding: 20%;">
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