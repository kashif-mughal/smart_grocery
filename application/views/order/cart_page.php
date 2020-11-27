<?php
$CI = & get_instance();
$CI->load->model('Users');
$users = $CI->Users->profile_edit_data();
if(is_array($users) && !empty($users[0])){
  $users = $users[0];
}else{
  $users = null;
}

$CI->load->library('lcategory');
$menuCatList = $CI->lcategory->get_category_hierarchy();
?>

<style>
  .table-hover tbody tr:hover{
        background-color: transparent;
    }
   .ui-autocomplete {
      max-height: 200px;
      overflow-y: auto;
      overflow-x: hidden;
      padding-right: 1px;
      font-size: 13px;
      position: absolute;
      overflow: auto;
   }
    .content-box1{
        position: relative;
        background-color: #ffffff;
        margin-top: 28px;
        border-radius: 10px 10px 0 0;
        /* padding: 20px; */
        border: 1px solid #cccccc;
        -moz-transition: opacity 0.4s ease-in-out;
        -o-transition: opacity 0.4s ease-in-out;
        -webkit-transition: opacity 0.4s ease-in-out;
        transition: opacity 0.4s ease-in-out;   
    }
    .content-box2{
        position: relative;
        background-color: #ffffff;
        margin-top: 20px;
        border-radius: 0px 0px 10px 10px;
        padding: 20px;
        border: 1px solid #cccccc;
        width:100%;
        -moz-transition: opacity 0.4s ease-in-out;
        -o-transition: opacity 0.4s ease-in-out;
        -webkit-transition: opacity 0.4s ease-in-out;
        transition: opacity 0.4s ease-in-out;   
    }
    .content-box3{
        position: relative;
        background-color: #ffffff;
        margin-top: 20px;
        border-radius: 0px 0px 10px 10px;
        padding: 28px;
        border: 1px solid #cccccc;
        width: 100%;
        -moz-transition: opacity 0.4s ease-in-out;
        -o-transition: opacity 0.4s ease-in-out;
        -webkit-transition: opacity 0.4s ease-in-out;
        transition: opacity 0.4s ease-in-out;   
    }
    .content-box4{
        position: relative;
        background-color: #ffffff;
        margin-top: 20px;
        /* border-radius: 0px 0px 10px 10px; */
        width: 89%;  
        margin-left: 16px; 
    }
    .row2{
    display: -ms-flexbox;
    display: flex;
    -ms-flex-wrap: wrap;
    flex-wrap: wrap;
    }
    .coupon::placeholder {
    font-size: 13px;
    }
    .table>tbody>tr>td, .table>tfoot>tr>td{
        vertical-align: middle;
    }
    @media screen and (max-width: 600px){

        table#cart tbody td .form-control{
            width:20%;
            display: inline !important;
        }
        .actions .btn{
            width:36%;
            margin:1.5em 0;
        }
        
        .actions .btn-info{
            float: left;
        }
        .actions .btn-danger{
            float: right;
        }
        
        table #cart thead{ 
            display: none;
        }
        table #cart tbody td{ 
            display: block;
            padding: .6rem; 
            min-width: 320px;
            }
        table#cart tbody tr td:first-child{ 
            background: #333; 
            color: #fff; 
            }
        table#cart tbody td:before {
            content: attr(data-th);
            font-weight: bold;
            display: inline-block; 
            width: 8rem;
        }
        table#cart tfoot td{
            display:block; 
        }
        table #cart tfoot td .btn{
            display:block;
        }
    }
</style>

<div id="main-page">
        <!-- Bread Crumb -->
        <div class="bread_crumb">
            <div class="container">
                <div class="row d-block">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="<?=base_url()?>">Home</a></li>
                            <li class="breadcrumb-item">Cart</li>
                        </ol>
                    </nav>
                    <h3 class="mb-0">Shopping Cart</h3>
                </div>
            </div>
        </div>

        <!-- Bread Crumb -->


        <section class="main-content mx-4">
            <div class="container">
                <!-- Alert Message -->
                <?php
                    $message = $this->session->userdata('message');
                    if (isset($message)) {
                        ?>
                        <div class="alert alert-info alert-dismissable">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                            <?php echo $message ?>
                        </div>
                        <?php
                        $this->session->unset_userdata('message');
                    }
                    $error_message = $this->session->userdata('error_message');
                    if (isset($error_message)) {
                        ?>
                        <div class="alert alert-danger alert-dismissable">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                            <?php echo $error_message ?>                    
                        </div>
                        <?php
                        $this->session->unset_userdata('error_message');
                    }
                ?>
                <!-- Alert Message -->
                <div class="row">
                    <div class="col-md-8">
                        <div class="content-box1">
                            <div class="container" id="shoppingCartBody1">
                                <table class="table table-hover table-condensed">
                                    <thead>
                                        <tr>
                                            <!-- <th colspan="3">Product Name</th>
                                            <th>Price</th>
                                            <th>Quantity</th> 
                                            <th class="text-center">total</th> -->
                                            <!-- <th style="width: 110px; height:70px ">Image</th> -->
                                            <th colspan="4" style="color: #25bfa9;">Product Name</th>
                                            <th colspan="2" style="text-align: center; color: #25bfa9;">Price</th>
                                            <th style="text-align: center; color: #25bfa9;">Quantity</th>
                                            <th style="text-align: center; color: #25bfa9;">Total</th>
                                            <th style="text-align: center; color: #25bfa9;">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="row2">
                            <div class="content-box2">
                                <a href="<?=base_url()?>" style="color:white; background-color:#25bfa9;" class="btn"><i class="fas fa-long-arrow-alt-left"></i> Continue Shopping</a>
                                <a href="#" class="btn" style="float: right; color:white; background-color:#333333;" onClick="window.location.reload();">Update Cart<i class="fas fa-sync" style="padding-left:7px;"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="content-box order-box">
                                    <h4>Your Order</h4>
                                    <div class="content-box-gray">
                                        <div class="orderbox-header d-flex justify-content-between">
                                            <h6 class="font-weight-600">Subtotal</h6>
                                            <h6 class="subtotal-price font-size-15"></h6>
                                        </div>
                                        <div class="orderbox-content">
                                            <div class="orderbox-content-charges d-flex justify-content-between mb-3">
                                                <h6>Delivery Charges</h6>
                                                <h6 id="dCharges">RS 0.00</h6>
                                            </div>
                                            <?php if($_POST['coupon'] === '1234'){?>
                                                <div class="orderbox-content-charges d-flex justify-content-between mb-3">
                                                    <h6>Coupon Discount</h6>
                                                    <h6 id="cDiscount">RS 20.00</h6>
                                                </div>
                                            <?php } ?>
                                            <div class="orderbox-content-footer d-inline-flexbox align-self-start">
                                                <h6>Shipping options will be updated during checkout.</h6>
                                            </div>
        
                                        </div>
                                    </div>
                                    <div class="orderbox-footer d-flex justify-content-between mx-3">
                                        <h6>TOTAL</h6>
                                        <h6 class="total-price font-size-15 sub-total"></h6>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="content-box order-box" style="border-radius: 0px 0px 10px 10px;">
                                    <h3 class="text-center">Apply Coupon Here</h3>
                                    <div class="input-group">
                                        <form method="POST" action="" style="width: 100%;">
                                            <input name="coupon" type="text" class="form-control coupon" placeholder="Enter coupon code here...">
                                            <div class="input-group-append">
                                                <button class="btn" style="width:100%; margin-top:5px; margin-bottom: 2px; background-color:#333333; color:white;" type="submit">Apply</button>
                                            </div>
                                        </form>
                                    </div>
                                    <a href="<?=base_url("corder/checkout_form")?>" style="text-decoration:none;"><button class="btn btn-block" style="color:white; background-color:#25bfa9;" type="button">Proceed To Checkout</button></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- HOUSEHOLD ESSENTIALS -->

            </div>
        </section>
    </div>
<script type="text/javascript">
    var baskit = getCookie('baskit');
    var selectedAddress = false;
    var deliveryTime = false;
    var step1Verified = true;
    var step2Verified = false;
    var step3Verified = false;
    var step4Verified = true;
    if(!baskit || JSON.parse(baskit).length == 0)
        window.location.href = '<?=base_url();?>';
    $(document).ready(() => {
        $('#newAddressLocation').select2('destroy');
        $('#newAddressForm').validate();
        loadCheckoutCartArea();
        $("#addressForm").submit(function(e) {
            e.preventDefault();
            if(!selectedAddress){
                $.notify("Kindly select at least one address", "error");
                return false;
            }
            if(($('input[name="selectedAddress[]"]')).length == 0){
                $('#deliveryAddressTitle').html("Your Delivery Address Is");
                $('#deliveryAddressText').html($('#selectedFinalAddress').val());
                $('#address-success').show();
                $('#address-process').hide();
                $('#collapseTwo').collapse('hide');
                step2Verified = true;
                return true;
                //close tab
            }
            submitForm($(this));
        });

        
    });

    function loadCheckoutCartArea(){
         var cartBody = $('#cartProductsArea');
         cartBody.empty();
         var eachProdTemplate = `<div data-id="{pId}" data-name="{prodName}" class="my-box-order d-flex">
                                    <img src="{imgValue}" alt="" class="img-fluid">
                                    <div class="my-box-order-content ml-3 d-flex flex-column justify-content-center">
                                        <h6>{prodName}  X {qty}</h6>
                                        <h6 class="mt-2 my-order-price">{totalPrice}</h6>
                                    </div>
                                </div>`;
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
               eachProdTemplateCopy = eachProdTemplateCopy.replace('{qty}', cart[i].quantity);
               eachProdTemplateCopy = eachProdTemplateCopy.replace('{totalPrice}', formatCurrency(parseInt(cart[i].quantity) * parseInt(cart[i].price)));
               //append newly created row in card body
               cartBody.append(eachProdTemplateCopy);
            }
            $('.item-counts').html(`${cart.length} ${cart.length > 1 ? 'Items' : 'Item'}`);
            subTotal = sum;
            <?php if($_POST['coupon'] === '1234'){?>
             subTotal = sum + parseFloat('20');
             $('.total-price').text(subTotal);
             //alert(sum);
             <?php }else{ ?>

             <?php } ?>
             $('.subtotal-price').html(formatCurrency(sum));
            if(cart.length >= 15){
                $('#delivery-date').html('Next working day');
            }else{
                $('#delivery-date').html('Today');
            }
         }
         else{
            //show empty message
            return false;
         }
    }   
    
    var subTotal = 0;
    var addressCounter = 1;

    
</script>


<script type="text/javascript">
//    const currency = 'Rs';
   function getCookie(name) {
      const value = `; ${document.cookie}`;
      const parts = value.split(`; ${name}=`);
      if(parts.length > 1){
         while(parts.length == 1)
            parts.shift();
         return parts.pop()
      }
   }
   function formatCurrency(total, toFixed = 2) {
      var neg = false;
      if(total < 0) {
         neg = true;
         total = Math.abs(total);
      }
      return (neg ? `-${currency} ` : `${currency} `) + parseFloat(total, 10).toFixed(toFixed).replace(/(\d)(?=(\d{3})+\.)/g, "$1,").toString();
   }
 $(document).ready(() => {
  var urlVars = getUrlVars();
  var searchText = urlVars["q"];
  if(searchText){
    $("#q").val(searchText);
  }
  var selectedCat = urlVars["categoryId"];
  if(selectedCat){
    $("#cat-" + selectedCat).trigger("click");
  }
   loadCartData();
   $(document).on('keydown', '.quantity', function () {
      if(event.keyCode == 189)
        return false;
   });
   loadShoppingCart1();

});

function loadShoppingCart1(){
   var cartBody = $('#shoppingCartBody1');
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
      //<td style="text-align:center;"><b>{qty}</b></td>
      $(cartBody).show();
      $($('.emptyCart')[0]).hide();
      $(document).off('click', '.checkout-btn', handleCheckout(event));
      var eachProdTemplate1 = `<tr class="each-prod">
      <td class="text-center">
      <img style="width: 110px;" src="{imgValue}" alt="" class="img-fluid">
      </td>
      <td colspan="3">{prodName}</td>
      <td class="" style="text-align: center;" colspan="2"><b>{price}</b></td>
      <td>
        <span class="add-cart" pId="{pId}" style="display:none;">remove from cart</span>
          <div kashif class="quantity-area d-flex justify-content-center align-items-center mt-2">
              <input type="number" min="0" class="d-inline-flex quantity quantity-input" value="{qty}">
              <span class="d-block quantity-button">
                 <a href="javascript:void(0);" class="qty-pls d-block">+</a>
                 <div class="separator"></div>
                 <a href="javascript:void(0);" class="qty-mns d-block">-</a>
              </span>
           </div>
        </td>
    <td class="" style="text-align: center;"><b>{totalPrice}</b></td>
      <td class="" style="text-align: center;">
      <a href="javascript:void(0)" data-id="{pId}" data-name="{prodName}" class="remove-item-from-cart">
      <i class="fas fa-times" data-id="{pId}" data-name="{prodName}" style="font-size:25px; color:red;"></i>
      </a>
      </td>
      </tr>`;

      var sum = 0;
      for (var i = 0; i < cart.length; i++) {
         var eachProdTemplateCopy1 = eachProdTemplate1;
         sum += parseInt(cart[i].quantity) * parseInt(cart[i].price);
         eachProdTemplateCopy1 = eachProdTemplateCopy1.replace(/{pId}/g, cart[i].id);
         eachProdTemplateCopy1 = eachProdTemplateCopy1.replace('{imgValue}', cart[i].img);
         eachProdTemplateCopy1 = eachProdTemplateCopy1.replace(/{prodName}/g, cart[i].pName);
         eachProdTemplateCopy1 = eachProdTemplateCopy1.replace('{price}', formatCurrency(cart[i].price));
         eachProdTemplateCopy1 = eachProdTemplateCopy1.replace('{qty}', cart[i].quantity);
         eachProdTemplateCopy1 = eachProdTemplateCopy1.replace('{totalPrice}', formatCurrency(parseInt(cart[i].quantity) * parseInt(cart[i].price)));
         //append newly created row in card body
         $(cartBody.find('tbody')).append(eachProdTemplateCopy1);
         }

      }
      else{
         //show empty response here
         showEmptyResponse(cartBody);
         return false;
      }   
   }

   function showEmptyResponse(cartBody){
      if(cartBody)
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
      showEmptyResponse($('#shoppingCartBody1'));
      loadCartData();
   }

   function getUrlVars(){
      var vars = [], hash;
      var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
      for(var i = 0; i < hashes.length; i++)
      {
          hash = hashes[i].split('=');
          vars.push(hash[0]);
          vars[hash[0]] = hash[1];
      }
      return vars;
  }
</script>

<script type='text/javascript'>
  $(document).ready(function(){
  
     $( "#q" ).autocomplete({
        source: function( request, response )
        {
             $.ajax({
                url: "<?php echo base_url(); ?>Autocomplete/userdata",
                type: 'post',
                dataType: "json",
                data: {
                  search: request.term
                },
                success: function( data ) 
                {
                  response( data );
                }
             });
        },
        select: function (values, ui) {
             $('#q').val(ui.item.label);
             return false;
        }
     });

  });
  </script>
   <!-- Cart Scripts End -->