<?php
$CI = & get_instance();
$CI->load->model('Users');
$users = $CI->Users->profile_edit_data();
if(is_array($users) && !empty($users[0])){
  $users = $users[0];
}else{
  $users = null;
}
?>
<style type="text/css">
   .emptyCart{
      background: red;
      padding: 20px;
      margin: 35px;
      text-align: center;
      border-radius: 10px;
      color: white;
      font-weight: 400;
      font-size: 20px;
      min-width: 360px;
   }
    input[type=number]::-webkit-inner-spin-button, 
    input[type=number]::-webkit-outer-spin-button { 
      -webkit-appearance: none; 
      margin: 0; 
    }
</style>

<!-- Sidebar -->
    
    <div id="mySidenav" class="sidenav">
        <div class="sidenav-content">
            <a href="javascript:void(0)" class="closebtn" id="btn-close-sidebar">&times;</a>
            <h3 class="sidebar-heading"><?php echo !is_null($users) ? "Welcome, ".$users['first_name'].'&nbsp;'.$users['last_name'] : "<a href='".base_url()."account/login'>Login or Register</a>"?></h3>

            <div class="sidebar-menu">
                <div class="accordion" id="accordionExample">
                    <div class="card border-none">
                        <div class="card-header sidebar-menu-title p-0" id="headingOne">
                            <button class="btn-block d-flex justify-content-around align-items-center" type="button" data-toggle="collapse" 
                                data-target="#collapseOne"
                                aria-expanded="true" aria-controls="collapseOne">
                                <img src="<?php echo base_url() ?>assets/img/sidenav-toggle.png" class="d-inline" alt="">
                                <h4 class="d-inline">Shop Categories</h4>
                                <img src="<?php echo base_url() ?>assets/img/sidenav-chevron.png" class="d-inline" alt="">
                            </button>
                        </div>
                
                        <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
                            <div class="card-body">
                               <ul class="sidebar-menu-items navbar-nav">
                                <?php foreach($CatList as $key => $value) {?>
                                   <li><a target="_blank" href="<?=base_url('Cproduct/products?categoryId='.$value->catId) ?>"><?=$key?></a></li>
                                <?php } ?>
                               </ul>
                            </div>
                        </div>
                    </div>
                    <?php if(!is_null($users)){?>
                       <div class="card border-none">
                           <div class="card-header" id="headingTwo"> 
                               <div class="card-header sidebar-menu-title p-0" id="headingOne">
                                   <button class="btn-block bg-transparent d-flex justify-content-start align-items-center" type="button" data-toggle="collapse"
                                       data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                       <img src="<?php echo base_url() ?>assets/img/profile.png" class="d-inline" alt="">
                                       <h4 class="d-inline ml-4">Profile</h4>
                                   </button>
                               </div>
                           </div>
                       </div>
                       <div class="card border-none">
                           <div class="card-header" id="headingTwo">
                               <div class="card-header sidebar-menu-title p-0" id="headingOne">
                                   <button class="btn-block bg-transparent d-flex justify-content-start align-items-center" type="button"
                                       data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                       <img src="<?php echo base_url() ?>assets/img/my_order_history.png" class="d-inline" alt="">
                                       <h4 class="d-inline ml-4">My Order History</h4>
                                   </button>
                               </div>
                           </div>
                       </div>
                       <div class="card border-none">
                           <div class="card-header" id="headingTwo">
                               <div class="card-header sidebar-menu-title p-0" id="headingOne">
                                   <button class="btn-block bg-transparent d-flex justify-content-start align-items-center" type="button"
                                       data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                       <img src="<?php echo base_url() ?>assets/img/track_your_order.png" class="d-inline" alt="">
                                       <h4 class="d-inline ml-4">Track Your Order</h4>
                                   </button>
                               </div>
                           </div>
                       </div>
                    <?php }?>
                    <div class="card border-none">
                        <div class="card-header" id="headingTwo">
                            <div class="card-header sidebar-menu-title p-0" id="headingOne">
                                <button class="btn-block bg-transparent d-flex justify-content-start align-items-center" type="button"
                                    data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                    <img src="<?php echo base_url() ?>assets/img/call_us.png" class="d-inline" alt="">
                                    <h4 class="d-inline ml-4">Call Us</h4>
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="card border-none">
                        <div class="card-header" id="headingTwo">
                            <div class="card-header sidebar-menu-title p-0" id="headingOne">
                                <button class="btn-block bg-transparent d-flex justify-content-start align-items-center" type="button"
                                    data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                    <img src="<?php echo base_url() ?>assets/img/sign-in.png" class="d-inline" alt="">
                                    <?php if(is_null($users)){?>
                                       <h4 class="d-inline ml-4">Sign In</h4>
                                    <?php } else{?>
                                       <h4 class="d-inline ml-4">Sign Out</h4>
                                    <?php } ?>
                                </button>
                            </div>
                        </div>
                    </div>

                </div>

            </div>
        </div>
    </div>
    
    <!-- Sidebar -->

<!-- Sidebar Ends -->


<div class="section-head">
      <div class="top-bar">
         <div class="container">
            <div class="row">
               <nav class="navbar navbar-expand-sm ml-md-auto px-2 px-md-0">
                  <ul class="navbar-nav">
                    <?php if(!is_null($users)){?>
                     <!-- <li class="nav-item">
                        <a class="nav-link" href="<?=base_url();?>Dashboard/user_authentication">My Account</a>
                     </li>
                     <li>
                        <p class="seperator">|</p>
                     </li>
                     <li class="nav-item">
                        <a class="nav-link" href="<?=base_url().'Corder/my_order'?>">Track your order</a>
                     </li>
                     <li>
                        <p class="seperator">|</p>
                     </li> -->
                     <li class="nav-item">
                        <a class="nav-link" href="javascript:void(0);">Wellcome&nbsp;<?=$users['first_name'].'&nbsp;'.$users['last_name']?></a>
                     </li>
                     <li>
                        <p class="seperator">|</p>
                     </li>
                     <li class="nav-item">
                        <a class="nav-link" href="<?=base_url().'Dashboard/logout'?>">Logout</a>
                     </li>
                   <?php }else{?>
                     <li class="nav-item">
                        <a class="nav-link" href="<?=base_url().'Dashboard/user_authentication'?>">Register Or Login</a>
                     </li>
                   <?php } ?>
                  </ul>
               </nav>
            </div>
         </div>
      </div>
      <div class="main-nav bg-light">
         <div class="container">
            <div class="row align-items-center py-4">
               <!-- Brand Logo & Sidebar Button -->
               <div class="col-lg-3 col-md-6 col-sm-12 mb-sm-4 mb-md-2 mb-lg-0 col-12 order-1 text-center">
                  <div class="logo-container d-flex flex-row align-item-center 
                     justify-content-end justify-content-md-end justify-content-sm-center">
                     <div class="sidebar-button">
                        <button class="navbar-toggler h-100" id="btn-sidebar" type="button" data-toggle="collapse"
                              data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                              aria-expanded="false" aria-label="Toggle navigation">
                              <img src="<?php echo base_url() ?>assets/img/toggler_icon.png" alt="Toggle navigation">
                        </button>
                     </div>
                     <div class="logo ml-2">
                        <div style="cursor: pointer;" class="logo_content text-center" onclick="window.location.href = '<?=base_url();?>'">
                           <img src="<?php echo base_url() ?>assets/img/logo.png" alt="Sauda Express" class="img-fluid d-block">
                           <p class="text-white tag-line mb-0">Where technology meets tradition</p> 
                        </div>
                     </div>
                  </div>
               </div>
               <!-- Search Bar -->
               <div class="col-lg-6 col-md-12 col-sm-12 order-lg-2 order-3 text-lg-left text-right">
                  <div class="header_search">
                     <div class="header_search_content">
                        <div class="header_search_form_container">
                           <form action="<?=base_url('cproduct/products')?>" method="get">
                              <div class="input-group mb-3">
                                 <div class="input-group-prepend">
                                    <button class="btn btn-outline-secondary dropdown-toggle font-weight-400 category-button" type="button"
                                       data-toggle="dropdown">
                                       All
                                       <img src="<?php echo base_url() ?>assets/img/chevron.png" alt="" class="img-fluid">
                                    </button>
                                    <div class="dropdown-menu">
                                      <?php foreach($CatList as $key => $value) {?>
                                         <a class="dropdown-item" onclick="changeSelectedCat(this);" href="javascript:void(0);" data-value="<?=$value->catId?>"><?=$key?></a>
                                      <?php } ?>
                                   </div>
                                 </div>
                                 <input type="text" name="q" class="form-control font-weight-400 border-none" placeholder="I'm shopping for...">
                                 <div class="input-group-append">
                                    <button class="btn btn-outline-secondary btn-black border-none" type="submit">Search</button>
                                 </div>
                              </div>
                              </div>
                              <div class="input-group mb-3" style="position: absolute; color: white;">
                                <span>Searching in &nbsp;</span><span id="searching-cat-name">ALL</span> <input type="hidden" name="categoryId" id="categoryId">
                              </div>
                           </form>
                        </div>
                     </div>
                  </div>
                  <!-- Phone Number & Add to Cart Button -->
                  <div class="col-lg-3 col-md-6 col-sm-12 mb-sm-2 order-lg-3 order-2 text-lg-left text-left">
                     <div class="phone_cart mb-1 d-flex flex-row align-item-center 
                        justify-content-start justify-content-md-start justify-content-sm-center">
                        <!-- Phone -->
                        <div class="phone mx-4 d-flex flex-row align-item-center justify-content-start">
                           <div class="phone_icon mr-2">
                              <img src="<?php echo base_url() ?>assets/img/hotline_phone_icon.png" alt="">
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
                                    <img src="<?php echo base_url() ?>assets/img/basket.png" alt="" id="basket-img">
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
               <div class="emptyCart" style="display: none;">The cart is empty!!!</div>
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
                     <a href="<?php echo base_url() ?>corder/checkout" target="_blank" class="checkout-btn btn btn-sm btn-primary">
                        <i class="fa fa-shopping-cart" aria-hidden="true"></i> Checkout
                     </a>
                     <a href="javascript:void(0);" onclick="emptyCart();" class="btn btn-sm btn-secondary">
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
   const currency = 'Rs';
   function getCookie(name) {
      const value = `; ${document.cookie}`;
      const parts = value.split(`; ${name}=`);
      if(parts.length > 1){
         while(parts.length == 1)
            parts.shift();
         return parts.pop()
      }
   }
   function formatCurrency(total) {
     var neg = false;
     if(total < 0) {
       neg = true;
       total = Math.abs(total);
    }
    return (neg ? `-${currency} ` : `${currency} `) + parseFloat(total, 10).toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,").toString();
 }
 $(document).ready(() => {
   loadCartData();
   $(document).on('keydown', '.quantity', function () {
      if(event.keyCode == 189)
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
   $(document).on('click', '.qty-pls', function () {
      changeQtyOfProductAndPutInCart($(this), 'plus');
   });
   $(document).on('click', '.qty-mns', function () {
      changeQtyOfProductAndPutInCart($(this), 'minus');
   });
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
   document.cookie = `baskit=${JSON.stringify(cart)};path=/;`;
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
   var cookieString = `baskit=${JSON.stringify(cartExceptCurrentProduct)};path=/;`;
   if(cartExceptCurrentProduct.length == 0){
      var oldDt = new Date(1);
      cookieString += `expires=${oldDt}`;
   }
   document.cookie = cookieString;
   $('#add_to_cart_items').html(cartExceptCurrentProduct.length);

   // removeCartObj.hide();
   // $(removeCartObj.parent().find('.quantity')[0]).val('');
   // $(removeCartObj.parent().find('.add-cart')[0]).html('Add to Cart');
   loadCartData();
   $.notify(`${productJson.pName} removed from cart`, "warn");
   return true;
}
function loadCartData(){
   var cart = getCookie('baskit');
   if(!cart)
      cart = '[]';
   cart = JSON.parse(cart);
   var allProducts = $('.each-prod');
   for (var i = 0; i < allProducts.length; i++) {
      var productJson = $($(allProducts[i]).find('.add-cart')[0]).data('json');
      if(!productJson)
         continue;
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
   var cookieString = `baskit=${JSON.stringify(cartExceptCurrentProduct)};path=/;`;
   if(cartExceptCurrentProduct.length == 0){
      var oldDt = new Date(1);
      cookieString += `expires=${oldDt}`;
   }
   document.cookie = cookieString;
   currentElem.closest('tr').remove();
   $.notify(`${prodName} removed from cart`, "warn");
   if(cartExceptCurrentProduct.length == 0){
      var cartObj = $('#shoppingCartBody');
      if(cartObj && cartObj.length > 0)
         showEmptyResponse(cartObj)
   }
   loadCartData();
}
function loadShoppingCart(){
   var cartBody = $('#shoppingCartBody');
   var cart = getCookie('baskit');
   $(cartBody.find('tbody')).empty();
   if(cart){
      cart = JSON.parse(cart);
      if(cart.length == 0)
      {
         //show empty response here
         showEmptyResponse(cartBody);
         return;
      }
      $(cartBody).show();
      $($('.emptyCart')[0]).hide();
      $(document).off('click', '.checkout-btn', handleCheckout(event));
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
         //show empty response here
         showEmptyResponse(cartBody);
         return false;
      }   
   }
   function showEmptyResponse(cartBody){
      $(cartBody).hide();
      $($('.emptyCart')[0]).show();
      $(document).on('click', '.checkout-btn', handleCheckout(event));
   }
   function handleCheckout(e){
    if(event)
      event.preventDefault();
      return false;
   }
   function emptyCart(){
      var oldDt = new Date(1);
      document.cookie = `baskit=[];path=/;expires=${oldDt}`;
      showEmptyResponse($('#shoppingCartBody'));
      loadCartData();
   }
   function changeSelectedCat(currentElem){
      $('#categoryId').val($(currentElem).data('value'));
      $('#searching-cat-name').html($(currentElem).text());
   }
</script>

   <!-- Cart Scripts End -->