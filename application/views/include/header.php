<?php
$CI = & get_instance();
$CI->load->model('Users');
$users = $CI->Users->profile_edit_data();
?>

<div class="section-head">
   <div class="top-bar">
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
   </div>
   <div class="main-nav bg-light">
      <div class="container-fluid">
         <div class="row align-items-center py-4">
            <!-- Brand Logo & Sidebar Button -->
            <div class="col-lg-3 col-sm-6 mb-sm-4 mb-lg-0 col-6 order-1">
               <div class="logo-container d-flex flex-row align-item-center justify-content-end">
                  <div class="sidebar-button">
                     <button class="navbar-toggler h-100" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                     aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                     <img src="<?php echo base_url() ?>assets/img/toggler_icon.png?>" alt="Toggle navigation">
                  </button>
               </div>
               <div class="logo ml-2">
                  <div class="logo_content">
                     <img src="<?php echo base_url() ?>assets/img/logo.png?>" alt="Sauda Express" class="img-fluid d-block">
                     <small class="text-white tag-line">Where technology meets tradition</small> 
                  </div>
               </div>
            </div>
         </div>
         <!-- Search Bar -->
         <div class="col-lg-6 col-sm-12 order-lg-2 order-3 text-lg-left text-right">
            <div class="header_search">
               <div class="header_search_content">
                  <div class="header_search_form_container">
                     <form action="#">
                        <div class="input-group mb-3">
                           <div class="input-group-prepend">
                              <button class="btn btn-outline-secondary dropdown-toggle font-weight-400 category-button" type="button"
                              data-toggle="dropdown">
                              All
                              <img src="<?php echo base_url() ?>assets/img/chevron.png?>" alt="" class="img-fluid">
                           </button>
                           <div class="dropdown-menu">
                              <?php foreach($CatList as $key => $value) {?>
                                 <a class="dropdown-item" href="javascript:void(0);" data-value="<?=$value->catId?>"><?=$key?></a>
                              <?php } ?>
                           </div>
                        </div>
                        <input type="text" class="form-control font-weight-400 border-none" placeholder="I'm shopping for...">
                        <div class="input-group-append">
                           <button class="btn btn-outline-secondary btn-black border-none" type="button">Search</button>
                        </div>
                     </div>
                  </div>
               </form>
            </div>
         </div>
      </div>
      <!-- Phone Number & Add to Cart Button -->
      <div class="col-lg-3 col-6 order-lg-3 order-2 text-lg-left text-left">
         <div class="phone_cart mb-1 d-flex flex-row align-item-center justify-content-start">
            <!-- Phone -->
            <div class="phone mx-4 d-flex flex-row align-item-center justify-content-start">
               <div class="phone_icon mr-2">
                  <img src="<?php echo base_url() ?>assets/img/hotline_phone_icon.png?>" alt="">
               </div>
               <div class="phone_content text-white">
                  <div class="phone_text">
                     <h6 class="mb-0">Hotline</h6>
                  </div>
                  <div class="phone_number">
                     <h6 class="font-weight-bold">+92 300 123 1234</h6>
                  </div>
               </div>
            </div>
            <!-- Cart -->
            <div class="cart">
               <div class="cart_container d-flex flex-row align-item-center justify-content-start">
                  <!-- Cart Icon -->
                  <div class="cart_icon">
                     <a href="javascript:void(0)" id="cartBtn" data-toggle="modal" data-target="#shoppingCartModal">
                        <img src="<?php echo base_url() ?>assets/img/basket.png?>" alt="" id="basket-img">
                        <div class="cart_icon_text">
                           <span id="add_to_cart_items" class="badge badge-pill badge-light">0</span>
                        </div>
                     </a>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</div>
</div>
</div>
<!-- Shopping Cart Modal Start -->
<div id="shoppingCartModal" class="modal fade" role="dialog">
   <div class="modal-dialog modal-lg">

      <!-- Modal content-->
      <div class="modal-content">
         <div class="modal-body w-100 p-0">
            <div class="card">
               <div class="card-header">
                  Shopping Cart
               </div>
               <div class="card-body" id="shoppingCartBody">
                  <table class="table table-sm table-bordered table-responsive-md">
                     <thead>
                        <tr>
                           <th>Image</th>
                           <th colspan="3">Product Name</th>
                           <th>Quantity</th>
                           <th colspan="2">Price</th>
                           <th>Total</th>
                           <th>Action</th>
                        </tr>
                     </thead>
                     <tbody>
                        
                     </tbody>
                  </table>
                  <div class="text-right">
                     <a href="#" class="btn btn-sm btn-primary">
                        <i class="fa fa-shopping-cart" aria-hidden="true"></i> Checkout
                     </a>
                     <a href="#" class="btn btn-sm btn-secondary">
                        <i class="fa fa-trash" aria-hidden="true"></i> Clear
                     </a>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</div>

<!-- Shopping Cart Modal End -->

<!-- Cart Scripts Start -->

<script type="text/javascript">

   function getCookie(name) {
      const value = `; ${document.cookie}`;
      const parts = value.split(`; ${name}=`);
      if(parts.length > 1){
         while(parts.length == 1)
            parts.shift();
         return parts.pop()
      }
   }

   $(document).ready(() => {
      loadCartData();
      $(document).on('keydown', '.quantity', function () {
         return false;
      });
      $(document).on('click', '.remove-item-from-cart', function () {
         removeItemFromShoppingCart($(this));
      });
      $(document).on('click', '#cartBtn', function () {
         loadShoppingCart();
      });
      $(document).on('click', '.remove-cart', function () {
         var productJson = $(this).data('json');
         removeAndUpdateFromCart(productJson, $(this));
      });
      $(document).on('click', '.add-cart', function () {
        var productJson = $(this).data('json');
        var quantity = parseInt($(this).parent().find('.quantity')[0].value);
        if(!isNaN(quantity) && quantity > 0){
         var cart = getCookie('baskit');
         if(cart)
            cart = JSON.parse(cart);
         addOrUpdateCart(cart && cart.length > 0 ? cart : [], productJson, quantity, $(this))

      }else{
         $.notify("Select a valid quantity, quantity must be greater then 0", "error");
      }
   });
      function addOrUpdateCart(cart, productJson, quantity, addCartObj){
         var currentProduct = cart.filter((each)=>{return each.id == productJson.id});
         var oldQty = 0;
         if(currentProduct.length > 0){
            oldQty = currentProduct[0].quantity;
            currentProduct[0].quantity = quantity;
         }
         else{
            productJson.quantity = quantity;
            cart.push(productJson);
         }
         document.cookie = `baskit=${JSON.stringify(cart)};path=/`;
         if(currentProduct.length > 0)
            $.notify(`${productJson.pName} quantity updated from ${oldQty} to ${currentProduct[0].quantity}`, "success");
         else
            $.notify(`${productJson.pName} added into cart`, "success");
         $('#add_to_cart_items').html(cart.length);
         $(addCartObj.parent().find('.remove-cart')[0]).show();
         addCartObj.html('Update to Cart');
         return true;
      }
      function removeAndUpdateFromCart(productJson, removeCartObj){
         var cart = getCookie('baskit');
         if(!cart)
            return true;
         cart = JSON.parse(cart);
         var cartExceptCurrentProduct = cart.filter((each)=>{return each.id != productJson.id});
         document.cookie = `baskit=${JSON.stringify(cartExceptCurrentProduct)};path=/`;
         $('#add_to_cart_items').html(cartExceptCurrentProduct.length);

         removeCartObj.hide();
         $(removeCartObj.parent().find('.quantity')[0]).val('');
         $(removeCartObj.parent().find('.add-cart')[0]).html('Add to Cart');
         $.notify(`${productJson.pName} removed from cart`, "warn");
         return true;
      }
      function loadCartData(){
         var cart = getCookie('baskit');
         if(!cart)
            return true;
         cart = JSON.parse(cart);
         var allProducts = $('.each-prod');
         for (var i = 0; i < allProducts.length; i++) {
            var productJson = $($(allProducts[i]).find('.add-cart')[0]).data('json');
            var currentProduct = cart.filter((each)=>{return each.id == productJson.id});
            if(currentProduct.length > 0){
               $($(allProducts[i]).find('.remove-cart')[0]).show();
               $($(allProducts[i]).find('.quantity')[0]).val(currentProduct[0].quantity);
               $($(allProducts[i]).find('.add-cart')[0]).html('Update to Cart');
            }else{
               $($(allProducts[i]).find('.remove-cart')[0]).hide();
               $($(allProducts[i]).find('.quantity')[0]).val('');
               $($(allProducts[i]).find('.add-cart')[0]).html('Add to Cart');
            }
         }
         $('#add_to_cart_items').html(cart.length);
      }
      $(document).on('click', '.qty-pls', function () {
         changeQtyOfProductAndPutInCart($(this), 'plus');
      });
      $(document).on('click', '.qty-mns', function () {
         changeQtyOfProductAndPutInCart($(this), 'minus');
      });
      function changeQtyOfProductAndPutInCart(targetElem, operation){
         var prodContainer = $(targetElem.closest('.each-prod')[0]);
         var prodCountObj = prodContainer.find('.quantity')[0];
         if(!prodCountObj || isNaN(prodCountObj.value)){
            $.notify(`Please add a valid quantity`, "error");
            return false;
         }
         else{
            var qty = prodCountObj.value == "" ? 0 : prodCountObj.value;
            if(qty <= 0 && operation == 'minus')
               return false;
            prodCountObj.value = operation == 'plus' ? ++qty : --qty;
            var addCartObj = $(prodContainer.find('.add-cart')[0]);
            if(addCartObj.html().toLocaleLowerCase() == 'add to cart'){
               return true;
            }
            var cart = getCookie('baskit');
            if(cart)
               cart = JSON.parse(cart);

            if(qty == 0){
               removeAndUpdateFromCart(addCartObj.data('json'), $(prodContainer.find('.remove-cart')[0]));
               return true;
            }else{
               addOrUpdateCart(cart && cart.length > 0 ? cart : [], 
                  addCartObj.data('json'), 
                  qty,
                  addCartObj
                  );
               return true;
            }
         }
      }
      function removeItemFromShoppingCart(currentElem){
         var productId = parseInt(currentElem.data('id'));
         var prodName = currentElem.data('name');
         var cart = getCookie('baskit');
         if(cart)
            cart = JSON.parse(cart);
         var cartExceptCurrentProduct = cart.filter((each)=>{return each.id != productId});
         document.cookie = `baskit=${JSON.stringify(cartExceptCurrentProduct)};path=/`;
         $(currentElem.closest('tbody')).remove(currentElem.closest('tr')[0]);
         $.notify(`${prodName} removed from cart`, "warn");
         loadCartData();
      }
      function loadShoppingCart(){
         var cartBody = $('#shoppingCartBody');
         $(cartBody.find('tbody')).empty();
         var eachProdTemplate = `<tr>
                           <td class="text-center">
                              <img src="{imgValue}" alt="" class="img-fluid">
                           </td>
                           <td colspan="3">{prodName}</td>
                           <td>{qty}</td>
                           <td class="text-right" colspan="2">{price}</td>
                           <td class="text-right">{totalPrice}</td>
                           <td class="text-right">
                              <a href="javascript:void(0)" data-id="{pId}" data-name="{prodName}" class="btn btn-sm btn-block btn-danger remove-item-from-cart">
                                 <i class="fa fa-times"></i> Remove
                              </a>
                           </td>
                        </tr>`;
         var cartTotalRow = `<tr>
                           <td colspan="7" class="text-right">Total</td>
                           <td class="text-right">{grandTotal}</td>
                           <td></td>
                        </tr>`;
         var cart = getCookie('baskit');
         if(cart){
            cart = JSON.parse(cart);
            var sum = 0;
            for (var i = 0; i < cart.length; i++) {
               var eachProdTemplateCopy = eachProdTemplate;
               sum += parseInt(cart[i].quantity) * parseInt(cart[i].price);
               eachProdTemplateCopy = eachProdTemplateCopy.replace('{pId}', cart[i].id);
               eachProdTemplateCopy = eachProdTemplateCopy.replace('{imgValue}', cart[i].img);
               eachProdTemplateCopy = eachProdTemplateCopy.replace(/{prodName}/g, cart[i].pName);
               eachProdTemplateCopy = eachProdTemplateCopy.replace('{price}', cart[i].price);
               eachProdTemplateCopy = eachProdTemplateCopy.replace('{qty}', cart[i].quantity);
               eachProdTemplateCopy = eachProdTemplateCopy.replace('{totalPrice}', parseInt(cart[i].quantity) * parseInt(cart[i].price));
               //append newly created row in card body
               $(cartBody.find('tbody')).append(eachProdTemplateCopy);
            }
            cartTotalRow = cartTotalRow.replace('{grandTotal}', sum);
            $(cartBody.find('tbody')).append(cartTotalRow);
         }
         else{
            //show empty message
            return false;
         }   
      }
   });

</script>

   <!-- Cart Scripts End -->