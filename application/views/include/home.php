<section class="main-content">
   <div class="container">
      <div class="row">
         <div class="col-xl-8 col-lg-8 col-md-12 pr-md-0">
            <div class="featured-products">
               <div class="header">
                  <h2 class="d-inline">FEATURED PRODUCTS</h2>
                  <a href="javascript:void(0)">
                  <img src="<?php echo base_url() ?>assets/img/featured_product_arrow_icon.png?>" class="float-right" alt="">
                  </a>
                  <a href="javascript:void(0)">
                  <img src="<?php echo base_url() ?>assets/img/featured_product_arrow_icon_left.png?>" style="right: 65px;position:absolute;top: 30px;" alt="">
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
                                  if($discountPercentage > 0) { ?> 
                              <h5 class="card-title float-left"><?php echo round($discountPercentage)."% OFF"; ?></h5>
                              <?php } ?>
                              <!-- <a href="javascript:void(0)" class="add_to_favorite">
                              <i class="fas fa-heart float-right"></i>
                              </a> -->
                           </div>
                        </div>
                        <img class="card-img-bottom text-center" src="<?php echo base_url().$value['ProductImg']; ?>" alt="Card image cap">
                        <div class="product-info text-center">
                           <p class="card-text product-card-inner-name" title="<?php echo $value['ProductName']; ?>"><?php echo $value['ProductName']; ?></p>
                           <p class="card-text product-card-inner-weight"><?= empty($value['SaleUnitName']) ? $value['UnitName'] : $value['SaleUnitQty']. ' ' .$value['SaleUnitName'] ; ?></p>
                           <p class="card-text product-card-inner-price d-inline">Rs. <?php echo $value['SalePrice']; ?></p>
                           <?php if($discountPercentage > 0) { ?> 
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
                        <div class="card-footer p-1" style="border-top: none; background-color: transparent;">
                           <a href="javascript:void(0);" class="product-card-btn mx-auto add-cart d-block"
                              data-json="<?php echo htmlentities(json_encode($productObject), ENT_QUOTES, 'UTF-8'); ?>"
                              >Add to Cart</a>
                           <a href="javascript:void(0);" style="display: none;" class="product-card-btn mx-auto remove-cart"
                              data-json="<?php echo htmlentities(json_encode($productObject), ENT_QUOTES, 'UTF-8'); ?>"
                              >Remove From Cart</a>   
                        </div>
                        
                     </div>
                  </div>
                  <?php }} ?>
               </div>
            </div>
         </div>
         <div class="col-xl-4 col-lg-4 col-md-12">
            <div class="row">
               <div class="col-lg-12 col-md-6 grocery-features-columns">
                  <div class="grocery-features shop-assistant-feature">
                     <div class="card">
                        <div class="card-body grocery-assistant-card">
                           <div class="container-fluid px-0">
                              <h6 class="card-title mb-0">Walk through all sections of the store with our assistant</h6>
                              <div class="row">
                                 <div class="col-md-7 pr-0">
                                    <h4 class="card-heading pt-3 mb-2">SHOP ASSISTANT</h4>
                                    <button class="card-button" id="shopAssistantButton" data-toggle="modal" data-target="#virtualAssistant">Use Assistant</button>
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
                                 <a href="<?='Cproduct/products?categoryId='.$value->childCats[$i]['CategoryId'] ?>"><?=$value->childCats[$i]['Alias']?></a>
                              </div>
                              <?php } ?>
                           </div>
                           <div class="card-footer">
                              <a href="<?='Cproduct/products?categoryId='.$value->childCats[0]['ParentId'] ?>">VIEW ALL</a>
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
                                       <p class="product-card-title" title="<?php echo $value->childCats[$i]['CatName']; ?>"><?php echo $value->childCats[$i]['CatName']; ?></p>
                                       <a href="javascript:void(0)" class="product-card-details-btn">View more details</a>
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
            <a href="javascript:void(0)" class="close" data-dismiss="modal" data-target="virtualAssistant" id="virtualAssistantDismiss">
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
                  <span class="heading-primary d-block">Categoy: <span id="va-panel-heading-category"></span></span>
                  <span class="heading-secondary d-block">Sub Category: <span id="va-panel-heading-sub-category"></span></span>
               </div> 
               <div class="va-panel-content">
                  <div class="container-fluid">
                     <div class="row">
                        <div class="col-md-4 px-0">
                           <div class="filter-sidebar">
                              <button onclick="filterAssistantProduct()" id="showFilterResultBtn" style="display: none; background-color: transparent; border: none;">
                                 <h4 class="ribbon">
                                    <strong class="ribbon-content">SHOW RESULT</strong>
                                 </h4>
                              </button>
                              <div class="filter-header d-flex px-4 py-3 border-b-primary">
                                 <div class="filter-icon mr-2">
                                    <img src="<?=base_url("assets/img/GroceryAssistant/filter.png")?>">   
                                 </div>                           
                                 <span class="filter-heading">Use Filters to Find your Product</span>
                                 <button onclick="clearAllFilters();" id="clearFilter" class="align-items-top justify-content-center ml-auto" style="display: none;">
                                    <div class="clearFilterContainer mr-2" style="position: relative;margin-top: 3px;background: #fff;">
                                       <i class="fas fa-filter" style="position: absolute;color: #808080;"></i>
                                       <i class="fas fa-slash" style="position: absolute;left: -2px;top: 0px;"></i>
                                    </div>
                                    <span class="ml-2 clearFilterText">Clear Filters</span>
                                 </button>
                              </div>

                              <div class="filter-brand px-4 py-3 border-b-primary">
                                 <div class="heading-primary mb-3">Filter by Brand:</div>                                    
                                 <div class="filter-brand-button" id="brand-filter-area">
                                 </div>
                              </div>

                              <div class="filter-weight px-4 py-3 border-b-primary">
                                 <div class="heading-primary mb-3">Filter by Weight:</div>                                    
                                 <div class="filter-weight-button" id="saleunit-filter">
                                 </div>
                              </div>

                              <div class="filter-type px-4 py-3 border-b-primary">
                                 <div class="heading-primary mb-3">Filter by Tags:</div>
                                 <div class="filter-type-checkbox" id="tag-filter-area">
                                    
                                 </div>                                    
                              </div>

                           </div>
                        </div>
                        <div class="col-md-8 pl-0 pt-3">
                           <div class="product-content">
                              <div class="container-fluid">
                                 <div class="row" id="product-wrt-cat">
                                    
                                 </div>
                              </div>
                           </div>

                           <div class="product-content-button my-4 text-center" id="pagination-btn">
                              
                           </div>

                        </div>
                     </div>
                  </div>
               </div>  

               <div class="va-panel-footer">
                  <div class="d-flex flex-column flex-md-row justify-content-around align-items-center">
                     <button class="btn btn-link va-panel-footer-btn-red mb-2 mb-md-0 text-center" data-dismiss="modal">Leave Grocery Assistant</button>
                     <button class="btn btn-link va-panel-footer-btn-black mb-2 mb-md-0" id="nextCategoryBtn">Previous Category</button>
                     <button class="btn btn-link va-panel-footer-btn-black mb-2 mb-md-0" id="prevCategoryBtn">Next Category</button>
                     <button class="btn btn-link va-panel-footer-btn-green mb-2 mb-md-0" id="popup-checkout">Checkout</button>
                  </div>
               </div>

            </div>
            
         </div>
      </div>
   </div>
</div>
<div style="display: none;">
    <script type="text" id="clone-cart">

      <div class="col-sm-6 col-md-4">
           <div class="mb-3 mx-auto">
            <div class="card product-card each-prod">
               <img class="card-img-top" src="{Img}" alt="Card image cap">
               <div class="card-body p-0 text-center">
                  <p class="product-card-title" title="{ProductName}">{ProductName}</p>
                  <p class="product-card-weight mb-0">{UnitName}</p>
                  <p class="card-text product-card-inner-price">{SalePrice}</p>
                  <div class="quantity-area d-flex justify-content-center align-items-center mt-2">
                     <span class="d-inline-flex quantity-text mr-1">Qty</span>
                     <input type="number" min="0" class="d-inline-flex quantity quantity-input">
                     <span class="d-block quantity-button">
                         <a href="javascript:void(0)" class="qty-pls d-block">+</a>
                         <div class="separator"></div>
                         <a href="javascript:void(0)" class="qty-mns d-block">-</a>
                     </span>
                  </div>
                  <a href="javascript:void(0);" class="product-card-btn mt-2 mx-auto add-cart"
                     data-json="{Jsn}"
                     >Add to Cart</a>
                  <a href="javascript:void(0);" style="display: none;" class="product-card-btn mt-2 mx-auto remove-cart va-panel-remove-cart"
                     data-json="{Jsn}"
                     >Remove From Cart</a>
               </div>
            </div>
           </div>
      </div>

    </script>
</div>
   <!-- Virtual Assistant -->
<script type="text/javascript">
   var numberOfPageList = [];
   var groceryAssistantData = [];
   var currentCategoryName;
   var assistantJsonArray;
   $(document).ready(function() {
      $(document).on('click', '#popup-checkout', function () {
         checkout($(this));
      });

      var groceryAssistantNumber = 0;
      var categoryByName = [];
      var assistantJson = JSON.parse('<?=$Assistant?>');
      assistantJsonArray = assistantJson;
      
      for(each in assistantJson["Assistant"])
      {
         categoryByName.push(each);
      }

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

      $('#shopAssistantButton').click(function() {
         document.body.style.position = 'fixed';
         document.body.style.top = `-${window.scrollY}px`;
      });

      $('#virtualAssistant').on('hidden.bs.modal', function (e) {
         const scrollY = document.body.style.top;
         document.body.style.position = '';
         document.body.style.top = '';
         window.scrollTo(0, parseInt(scrollY || '0') * -1);
      });
      
      groceryAssistantData = setupGroceryAssistant(groceryAssistantNumber);
      
      $('#prevCategoryBtn').click(function() {

         var foundCurrentCat = false;
         var nextCat;
         for(each in groceryAssistantData) {
            if(foundCurrentCat) {
               nextCat = each;
               break;
            }
            if(each == currentCategoryName)
               foundCurrentCat = true;
         }
         if(nextCat) {
            $('#nextCategoryBtn').attr('disabled', false);
            $('#prevCategoryBtn').attr('disabled', false);
            $('#product-wrt-cat').empty();
            $("#va-panel-heading-category").text(assistantJson["Assistant"][nextCat][0]["parentCategory"]);
            $("#va-panel-heading-sub-category").text(assistantJson["Assistant"][nextCat][0]["CatName"]);
            var productContainer = $('#product-wrt-cat');
            if(groceryAssistantData[nextCat]) {
               productContainer.append(groceryAssistantData[nextCat][0]);
               $('#pagination-btn').empty();
               for(var i = 0; i < numberOfPageList[nextCat]; i++) {
                  $('#pagination-btn').append(`<button class="btn btn-link nav-btn-primary" onclick="renderCatPaginate(${i},'${nextCat}')">${i+1}</button>`);
               }
               currentCategoryName = nextCat;
            }
         }
         else {
            $('#nextCategoryBtn').attr('disabled', false);
            $('#prevCategoryBtn').attr('disabled', true);
         }
      });
        
      // nextCategoryBtn
      $('#nextCategoryBtn').click(function() {
         var foundCurrentCat = false;
         var prevCat;
         var catIndex;
         var isLastCat;
         for(each in groceryAssistantData) {
            if(each == currentCategoryName) {
               foundCurrentCat = true;
               break;
            }
            prevCat = each;
         }

         if(prevCat) {
            $('#prevCategoryBtn').attr('disabled', false);
            $('#nextCategoryBtn').attr('disabled', false);
            $('#product-wrt-cat').empty();
            $("#va-panel-heading-category").text(assistantJson["Assistant"][prevCat][0]["parentCategory"]);
            $("#va-panel-heading-sub-category").text(assistantJson["Assistant"][prevCat][0]["CatName"]);
            var productContainer = $('#product-wrt-cat');
            if(groceryAssistantData[prevCat]) {
               productContainer.append(groceryAssistantData[prevCat][0]);
               $('#pagination-btn').empty();
               for(var i = 0; i < numberOfPageList[prevCat]; i++) {
                  $('#pagination-btn').append(`<button class="btn btn-link nav-btn-primary" onclick="renderCatPaginate(${i},'${prevCat}')">${i+1}</button>`);
               }
               currentCategoryName = prevCat;
            }
         }
         else {
            $('#nextCategoryBtn').attr('disabled', true);
            $('#prevCategoryBtn').attr('disabled', false);
         }
      });
   });

   function filterAssistantProduct() {
      var assistantJson2 = JSON.parse('<?=$Assistant?>');
      var assistantData = assistantJson2["Assistant"];
      var brandSelector = $('.filter-brand .filterSelected');
      var weightSelector = $('.filter-weight .filterSelected');
      var tagSelector = $('.filter-type .filterSelected');
      var selectedBrands = [];
      var selectedWeights = [];
      var selectedTags = [];
      for(var b = 0; b < $('.filter-brand .filterSelected').length; b++) {
         selectedBrands.push($(brandSelector[b]).data('value'));
      }
      for(var b = 0; b < $('.filter-weight .filterSelected').length; b++) {
         selectedWeights.push($(weightSelector[b]).data('value'));
      }
      for(var b = 0; b < $('.filter-type .filterSelected').length; b++) {
         selectedTags.push($(tagSelector[b]).data('value'));
      }
      var finalFilterData = [];
      var container = $('#product-wrt-cat');
      $('#product-wrt-cat').empty();
      var eachPage = 6;
      var cartTemplate = $('#clone-cart').text();
      var baseUrl = '<?=base_url()?>';

      for(each in assistantData) {debugger
         if(!currentCategoryName) 
            currentCategoryName = each;
         var pages = [];
         var brands;
         var weights;
         var tags;
         var numberOfPagesCurrent = 0;
         // for(item in assistantData[each]) {
            for(var m = 0; m < assistantData[each].length; m++) {
               var brands = selectedBrands.length != 0 ? selectedBrands.includes(assistantData[each][m].BrandName) : true;
               var weights = selectedWeights.length != 0 ? selectedWeights.includes(assistantData[each][m].SaleUnitQuantity) : true;
               
               var tags;
               if(selectedTags.length) {
                  var currentProductTagsArray = assistantData[each][m].tags.split(',');
                  for(var t = 0; t < selectedTags.length; t++) {
                     if( currentProductTagsArray.includes(selectedTags[t]) ) {
                        tags = true;
                     }
                     else {
                        tags = false;
                     }
                  }
               }

               if(brands && weights && tags) {
                  numberOfPagesCurrent++;
               }

            }
         // }

         var totalProducts = numberOfPagesCurrent; // total products
         var numberOfPages = Math.ceil(totalProducts/eachPage); // number of pages
         numberOfPageList[each] = numberOfPages;
         for (var i = 0; i < numberOfPageList[each]; i++) {
            var catProductList = [];
            for(var k = i * eachPage; k < eachPage + (eachPage * i); k++) {
               if(!assistantData[each][k]) break;
               var brandAvailable = selectedBrands.length != 0 ? selectedBrands.includes(assistantData[each][k].BrandName) : true;
               var weightAvailable = selectedWeights.length != 0 ? selectedWeights.includes(assistantData[each][k].SaleUnitQuantity) : true;
               
               var tagsAvailable;
               if(selectedTags.length) {
                  var currentProductTagsArray = assistantData[each][k].tags.split(',');
                  for(var t = 0; t < selectedTags.length; t++) {
                     if( currentProductTagsArray.includes(selectedTags[t]) ) {
                        tagsAvailable = true;
                     }
                     else {
                        tagsAvailable = false;
                     }
                  }
               }

               if( brandAvailable && weightAvailable && tagsAvailable ) {
                  var cartTemplateCopy = cartTemplate;
                  cartTemplateCopy = cartTemplateCopy.replace(/{Img}/g, baseUrl + assistantData[each][k].ProductImg);
                  cartTemplateCopy = cartTemplateCopy.replace(/{ProductName}/g, assistantData[each][k].ProductName);
                  cartTemplateCopy = cartTemplateCopy.replace(/{UnitName}/g, !assistantData[each][k].UnitName ? assistantData[each][k].UnitName : 
                     (assistantData[each][k].SaleUnitQty + " " + assistantData[each][k].SaleUnitName)
                     );
                  cartTemplateCopy = cartTemplateCopy.replace(/{SalePrice}/g, formatCurrency(assistantData[each][k].SalePrice,0));
                  cartTemplateCopy = cartTemplateCopy.replace(/{Jsn}/g, assistantData[each][k].Jsn);
                  catProductList.push(cartTemplateCopy);
               }
            }
            if(catProductList.length > 0) { pages.push(catProductList); }
         }
         if(pages.length > 0) { finalFilterData[each] = pages; }
      }
      if(finalFilterData[currentCategoryName]) { 
         $("#va-panel-heading-category").text(assistantData[currentCategoryName][0]["parentCategory"]);
         $("#va-panel-heading-sub-category").text(assistantData[currentCategoryName][0]["CatName"]);
         container.append(finalFilterData[currentCategoryName][0]); 
      }
      $('#pagination-btn').empty();
      for(var i = 0; i < numberOfPageList[currentCategoryName]; i++) {
         $('#pagination-btn').append(`<button class="btn btn-link nav-btn-primary" onclick="renderCatPaginate(${i},'${currentCategoryName}')">${i+1}</button>`);
      }
      groceryAssistantData = finalFilterData;
   }

   function toggleAndCheckActiveFilter(currentElement){
      currentElement = $(currentElement);
      if(currentElement.hasClass("filterSelected")){
         currentElement.removeClass("filterSelected");
      }
      else
         currentElement.addClass("filterSelected");

      if(anyFilterSelected()) {
         $("#showFilterResultBtn").show();
         $('#clearFilter').css("display", "flex");
         $("#clearFilter").show();
      }
      else {
         $("#showFilterResultBtn").hide();
         $("#clearFilter").hide();
      }
      var selectedItemsLength = $('.filterSelected').length;
      if(selectedItemsLength == 0) {
         clearAllFilters();
      }
   }

   function clearAllFilters() {
      var brandFilter = $('.filter-sidebar .filter-brand .filter-brand-button button');
      var weightFilter = $('.filter-sidebar .filter-weight .filter-weight-button button');
      var tagsFilter = $('.filter-sidebar .filter-type .filter-type-button button');
      if(brandFilter.hasClass("filterSelected")) {
         brandFilter.removeClass("filterSelected");
      }
      if(weightFilter.hasClass("filterSelected")) {
         weightFilter.removeClass("filterSelected");
      }
      if(tagsFilter.hasClass("filterSelected")) {
         tagsFilter.removeClass("filterSelected");
      }
      $("#showFilterResultBtn").hide();
      $('#product-wrt-cat').empty();
      $("#brand-filter-area").empty();
      $("#saleunit-filter").empty();
      $("#tag-filter-area").empty();
      groceryAssistantData = setupGroceryAssistant();
      $("#clearFilter").hide();
   }

   function anyFilterSelected(){
      return $(".filterSelected").length > 0;
   }

   function setupGroceryAssistant(){
      var container = $('#product-wrt-cat');
      var assistantJson = JSON.parse('<?=$Assistant?>');
      var brandArea = $("#brand-filter-area");
      var weightArea = $("#saleunit-filter");

      var tagArea = $("#tag-filter-area");
      for(var each in assistantJson["Brands"]){
         if(assistantJson["Brands"][each])
            brandArea.append(`<button onclick="toggleAndCheckActiveFilter(this);" class="btn btn-link mb-2" data-value="${assistantJson["Brands"][each]}">${assistantJson["Brands"][each]}</button>`);
      }
      for(var each in assistantJson["SaleUnitQty"]){
         if(assistantJson["SaleUnitQty"][each])
            weightArea.append(`<button onclick="toggleAndCheckActiveFilter(this);" data-value="${assistantJson["SaleUnitQty"][each]}" class="btn btn-link mb-2">${assistantJson["SaleUnitQty"][each]}</button>`);
      }
      var counter = 0;
      for(var each in assistantJson["Tags"]){
         if(assistantJson["Tags"][each])
            tagArea.append(`<div class="form-check">
                          <input class="form-check-input" data-value="${assistantJson["Tags"][each]}" onclick="toggleAndCheckActiveFilter(this);" type="checkbox" name="tag${++counter}" id="tag${counter}" value="${assistantJson["Tags"][each]}">
                          <label class="form-check-label" for="tag${counter}">
                            ${assistantJson["Tags"][each]}
                          </label>
                        </div>`);
      }

      var eachPage = 6;

      var cartTemplate = $('#clone-cart').text();
      var baseUrl = '<?=base_url()?>';
      var finalData = [];
      for(each in assistantJson["Assistant"])
      {
         if(!currentCategoryName) 
            currentCategoryName = each;
         var pages = [];
         var totalProducts = assistantJson["Assistant"][each].length; // total products
         var numberOfPages = Math.ceil(totalProducts/eachPage); // number of pages
         numberOfPageList[each] = numberOfPages;
         
         
         for (var i = 0; i < numberOfPageList[each]; i++) {
            var catProductList = [];
            for(var k = i * eachPage; k < eachPage + (eachPage * i); k++) {
               if(!assistantJson["Assistant"][each][k]) break;
               var cartTemplateCopy = cartTemplate;
               cartTemplateCopy = cartTemplateCopy.replace(/{Img}/g, baseUrl + assistantJson["Assistant"][each][k].ProductImg);
               cartTemplateCopy = cartTemplateCopy.replace(/{ProductName}/g, assistantJson["Assistant"][each][k].ProductName);
               cartTemplateCopy = cartTemplateCopy.replace(/{UnitName}/g, !assistantJson["Assistant"][each][k].SaleUnitName ? assistantJson["Assistant"][each][k].UnitName : 
                  (assistantJson["Assistant"][each][k].SaleUnitQty + " " + assistantJson["Assistant"][each][k].SaleUnitName)
                  );
               cartTemplateCopy = cartTemplateCopy.replace(/{SalePrice}/g, formatCurrency(assistantJson["Assistant"][each][k].SalePrice,0));
               cartTemplateCopy = cartTemplateCopy.replace(/{Jsn}/g, assistantJson["Assistant"][each][k].Jsn);
               catProductList.push(cartTemplateCopy);
            }
            
            pages.push(catProductList);
         }
         finalData[each] = pages;
      }
      if(finalData[currentCategoryName]) { 
         $("#va-panel-heading-category").text(assistantJson["Assistant"][currentCategoryName][0]["parentCategory"]);
         $("#va-panel-heading-sub-category").text(assistantJson["Assistant"][currentCategoryName][0]["CatName"]);
         container.append(finalData[currentCategoryName][0]);
         for(var i = 0; i < numberOfPageList[currentCategoryName]; i++) {
            $('#pagination-btn').append(`<button class="btn btn-link nav-btn-primary" onclick="renderCatPaginate(${i},'${currentCategoryName}')">${i+1}</button>`);
         }
      }
      return finalData;
   }

   function renderCatPaginate(pageNumber, category) {
      $('#product-wrt-cat').empty();
      $('#product-wrt-cat').append(groceryAssistantData[category][pageNumber]);
   }

</script>
<style type="text/css">
   .slick-next{
       top: -34px !important;
       right: 0px !important;
   }
   .slick-prev{
      top: -34px !important;
      right: 40px !important;
      left: auto !important;
   }

   .slick-next:before{
      color: black;
      content: '';
   }
   .slick-prev:before{
      color: black;
      content: '';
   }
   .grocery-features .grocery-assistant-card .image-container {
      top: 48px;
   }
   .grocery-features .card {
      height: 224px;
   }
   .grocery-features .grocery-assistant-card .image-container {
      top: 48px;
   }
   .product-card-inner-name {
      /* white-space: nowrap; */
      width: 100%;
      overflow: hidden;
      text-overflow: ellipsis;
   }
   .product-card-title {
      /* white-space: nowrap; */
      width: 100%;
      overflow: hidden;
      text-overflow: ellipsis;
   }
   .form-check{
      display: inline-block;
      margin-right: 10px;
   }
   .filterSelected{
      box-shadow: 1px 1px 10px 1px green;
   }
   .filterSelected : focus{
      box-shadow: 1px 1px 10px 1px green;
   }
</style>