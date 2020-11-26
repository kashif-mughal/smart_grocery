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
                            <li class="breadcrumb-item"><a href="https://saudaexpress.com/">Home</a></li>
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
                                        <!-- <tr>
                                            <td data-th="Product">
                                                <div class="row">
                                                    <div class="col-sm-2 hidden-xs"><img src="http://placehold.it/100x100" alt="..." class="img-responsive"/></div>
                                                    <div class="col-sm-10">
                                                        <h4 class="nomargin">Product 1</h4>
                                                        <p>Quis aute iure reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Lorem ipsum dolor sit amet.</p>
                                                    </div>
                                                </div>
                                            </td>
                                            <td data-th="Price">$1.99</td>
                                            <td data-th="Quantity">
                                                <input type="number" class="form-control text-center" value="1">
                                            </td>
                                            <td data-th="Subtotal" class="text-center">1.99</td>
                                            <td class="actions" data-th="">
                                                <button class="btn btn-danger btn-sm" id="cartBtn"><i class="fa fa-trash"></i></button>	
                                            </td>
                                        </tr> -->
                                    </tbody>
                                    <!-- <tfoot>
                                        <tr>
                                            <td><a href="#" class="btn btn-warning"><i class="fa fa-angle-left"></i> Continue Shopping</a></td>
                                            <td colspan="4" class="hidden-xs"></td>
                                            <td><a href="#" class="btn btn-success"><i class="fa fa-angle-right"></i>Checkout</a></td>
                                        </tr>
                                    </tfoot> -->
                                </table>
                            </div>
                        </div>
                        <div class="row2">
                            <div class="content-box2">
                                <a href="https://saudaexpress.com/" style="color:white; background-color:#25bfa9;" class="btn"><i class="fas fa-long-arrow-alt-left"></i> Continue Shopping</a>
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
                                            <h6 class="subtotal-price font-size-15 sub-total"></h6>
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

                            <div class="row3">
                                <div class="col-md-12">
                                    <div class="content-box3">
                                    <h3 class="text-center">Apply Coupon Here</h3>
                                    <div class="input-group">
                                        <form method="POST" action="">
                                            
                                            <input name="coupon" type="text" class="form-control coupon" placeholder="Enter coupon code here...">
                                            <div class="input-group-append">
                                                <button class="btn" style="background-color:#333333; color:white;" type="submit">Apply</button>
                                            </div>
                                        </form>
                                    </div>
                                    </div>
                                </div>
                            </div>
                            <div class="content-box4">
                            <a href="https://saudaexpress.com/corder/checkout_form" style="text-decoration:none;"><button class="btn btn-block" style="color:white; background-color:#25bfa9;" type="button">Proceed To Checkout</button></a>
                            </div>

                            <!-- <div class="col-md-12">
                                <div class="content-box my-box">
                                    <div class="my-box-header d-flex justify-content-between align-items-baseline">
                                        <h4>My Order</h4>
                                        <h6 class="font-weight-700 item-counts"></h6>
                                    </div>
                                    <div class="my-box-content p-3" id="cartProductsArea"></div>
                                </div>
                            </div> -->

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

        // setTimeSlots();

        // $("#proceed").on("click", function(){
        //     proceedToCheckout();
        // });

        // function proceedToCheckout(){
        //     if(!step1Verified || !step2Verified || !step3Verified || !step4Verified){
        //         $.notify("Please verify all the steps", "error");
        //             return false;
        //     }
        //     var baskit = getCookie('baskit');
        //     if(!baskit || JSON.parse(baskit).length == 0){
        //         $.notify("The Cart is empty, please add some item in cart", "error");
        //         return false;
        //     }

        //     openWindowWithPost(
        //         "<?=base_url('Corder/checkout')?>", JSON.parse(baskit)
        //     );
        // }
        
    });

    // function openWindowWithPost(url, dataArr) {
    //         var form = document.createElement("form");
    //         //form.target = "_blank";
    //         form.method = "POST";
    //         form.action = url;
    //         form.style.display = "none";
    //         var input = document.createElement("input");
    //         input.type = "hidden";
    //         input.name = 'order';
    //         input.value = JSON.stringify(dataArr);
    //         form.appendChild(input);

    //         var input = document.createElement("input");
    //         input.type = "hidden";
    //         input.name = 'ad';
    //         input.value = selectedAddress.data("addressid");
    //         form.appendChild(input);

    //         var input = document.createElement("input");
    //         input.type = "hidden";
    //         input.name = 'dt';
    //         input.value = deliveryTime;
    //         form.appendChild(input);

    //         var input = document.createElement("input");
    //         input.type = "hidden";
    //         input.name = 'dtt';
    //         input.value = selectedAddress.text().trim();
    //         form.appendChild(input);


    //         document.body.appendChild(form);
    //         form.submit();
    //         document.body.removeChild(form);
    //     }

    // function setTimeSlots(){
    //     var timeSlotAreaElem = $('#timeSlotArea');
    //     timeSlotAreaElem.empty();
    //     var currentDt = new Date();
    //     var cart = getCookie('baskit');
    //     if(!cart)
    //         cart = "[]";
    //     cart = JSON.parse(cart);
    //     if(cart.length <= 15){
    //     var todayTemplate = `<thead>
    //                             <tr>
    //                                 <th scope="col">Date - Day</th>
    //                                 <th scope="col">Same Day Delivey - Additional Rs <?=$deliveryCharges?> will be
    //                                     charged</th>
    //                             </tr>
    //                         </thead>
    //                         <tbody>
    //                             <tr>
    //                                 <td>${currentDt.toDateString()}</td>
    //                                 <td>
    //                                     <div class="form-check">
    //                                         <label class="form-check-label" for="today1" data-day="today" onclick="setTimeSlotInternal(this);">
    //                                             <input class="form-check-input" type="radio"
    //                                             name="deliveryDate" value="${currentDt.toLocaleDateString() + ' 10:00 AM__' + currentDt.toLocaleDateString() + ' 7:00 PM'}">
    //                                             today
    //                                         </label>
    //                                     </div>
    //                                 </td>
    //                             </tr>
    //                         </tbody>`;
    //                         timeSlotAreaElem.append(todayTemplate);
    //                     }
    //     var otherDTemplateHead =    `<thead>
    //                                     <tr>
    //                                         <th scope="col">Date - Day</th>
    //                                         <th scope="col">Time Slot</th>
    //                                     </tr>
    //                                 </thead>`;
    //     currentDt.setDate(currentDt.getDate() + 1);
    //     var otherDTemplateBody =    `<tbody>
    //                                     <tr>
    //                                         <td>${currentDt.toDateString()}</td>
    //                                         <td>
    //                                             <div class="form-check">
    //                                                 <label class="form-check-label" for="today2" onclick="setTimeSlotInternal(this);">
    //                                                     <input class="form-check-input" type="radio"
    //                                                     name="deliveryDate" value="${currentDt.toLocaleDateString() + ' 10:00 AM__' + currentDt.toLocaleDateString() + ' 7:00 PM'}">
    //                                                     <span>10:00 am - 7:00 pm</span>
    //                                                 </label>
    //                                             </div>
    //                                         </td>
    //                                     </tr>`;
    //     currentDt.setDate(currentDt.getDate() + 1);
    //     otherDTemplateBody +=           `<tr>
    //                                         <td>${currentDt.toDateString()}</td>
    //                                         <td>
    //                                             <div class="form-check">
    //                                                 <label class="form-check-label" for="today2"  onclick="setTimeSlotInternal(this);">
    //                                                     <input class="form-check-input" type="radio"
    //                                                     name="deliveryDate" value="${currentDt.toLocaleDateString() + ' 10:00 AM__' + currentDt.toLocaleDateString() + ' 7:00 PM'}">
    //                                                     <span>10:00 am - 7:00 pm</span>
    //                                                 </label>
    //                                             </div>
    //                                         </td>
    //                                     </tr>`;
    //     currentDt.setDate(currentDt.getDate() + 1);
    //     otherDTemplateBody +=           `<tr>
    //                                         <td>${currentDt.toDateString()}</td>
    //                                         <td>
    //                                             <div class="form-check">
    //                                                 <label class="form-check-label" for="today2" onclick="setTimeSlotInternal(this);">
    //                                                     <input class="form-check-input" type="radio"
    //                                                     name="deliveryDate" value="${currentDt.toLocaleDateString() + ' 10:00 AM__' + currentDt.toLocaleDateString() + ' 7:00 PM'}">
    //                                                     <span>10:00 am - 7:00 pm</span>
    //                                                 </label>
    //                                             </div>
    //                                         </td>
    //                                     </tr>
    //                                     </tbody>`;
    //     timeSlotAreaElem.append(otherDTemplateHead);
    //     timeSlotAreaElem.append(otherDTemplateBody);
    // }

    // var deliveryCharges = parseInt('<?=$deliveryCharges?>');
    // var deliveryAdded = false;

    // function setTimeSlotInternal(currentElem){
    //     deliveryTime = $(currentElem).find('input').first().val();
    //     var deliveryTimeArr = deliveryTime.split('__');
    //     var dt = new Date(deliveryTimeArr[0]);
    //     var dt1 = new Date(deliveryTimeArr[1]);
    //     var deliverText = dt.toDateString() + "<br>" + dt.toLocaleTimeString(navigator.language, {hour: '2-digit', minute:'2-digit'}) + " to " + dt1.toLocaleTimeString(navigator.language, {hour: '2-digit', minute:'2-digit'});
    //     $('#deliveryDateTitle').html("Deliver On");
    //     $('#deliveryDateText').html(deliverText);
    //     $('#time-success').show();
    //     $('#time-process').hide();
    //     $('#collapseThree').collapse('hide');

    //     if(currentElem.dataset.day == "today" && !deliveryAdded){
    //         $("#dCharges").html(formatCurrency(deliveryCharges));
    //         subTotal += deliveryCharges;
    //         $('.sub-total').html(formatCurrency(subTotal));
    //         deliveryAdded = true;
    //     }else if(currentElem.dataset.day != "today" && deliveryAdded){
    //         $("#dCharges").html(formatCurrency(0));
    //         subTotal -= deliveryCharges;
    //         $('.sub-total').html(formatCurrency(subTotal));
    //         deliveryAdded = false;
    //     }

    //     step3Verified = true;
    // }

    // function submitForm(form){
    //     $.ajax({
    //        type: "POST",
    //        url: form.attr('action'),
    //        data: form.serialize(),
    //        dataType: "JSON",
    //        success: function(data)
    //        {
    //         if(data.status == 0){
    //             $.notify("Something went wrong", "error");
    //             console.log(data);
    //             return false;
    //         }
    //         console.log("address submit successfully");
    //         var newlyAddresses = $('input[name="selectedAddress[]"]');
    //         for(counter = 0; counter < newlyAddresses.length; counter++){
    //             newlyAddresses.parent().attr('data-addressId', data.insertedIds[counter]);
    //             newlyAddresses.remove();
    //         }

    //         $('#deliveryAddressTitle').html("Your Delivery Address Is");
    //         $('#deliveryAddressText').html($('#selectedFinalAddress').val());
    //         $('#address-success').show();
    //         $('#address-process').hide();
    //         $('#collapseTwo').collapse('hide');
    //         step2Verified = true;
    //        },
    //        error: function(a,b){
    //             $.notify("Something went wrong!!!", "error");
    //        }
    //     });
    // }

    // function deleteAddress(currentElem){
    //     var addressId = currentElem.parent().find(".singleAddress").data("addressid");
    //     if(!addressId)
    //     {
    //         console.log("address removed inmem successfully");
    //         currentElem.parent().parent().remove();
    //     }
    //     if(!confirm("Confirm to delete address?"))
    //         return;
    //     $.ajax({
    //        type: "POST",
    //        url: "<?=base_url("user/delete_address");?>",
    //        data: {addressId : addressId},
    //        dataType: "JSON",
    //        success: function(data)
    //        {
    //         if(data.status == 0){
    //             $.notify("Something went wrong", "error");
    //             console.log(data);
    //             return false;
    //         }
    //         console.log("address removed successfully");
    //         currentElem.parent().parent().remove();
    //        },
    //        error: function(a,b){
    //             $.notify("Something went wrong!!!", "error");
    //        }
    //     });
    // }

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

    $(document).on("click", "a.singleAddress", function () {
        $(this).prev('.address-panel .selectRadio').prop('checked', true);
        $('.address-panel i.fa-check').hide();
        $(this).prev('i.fa-check').toggle();
        // $('.address-panel i.fa-check').hide();
        // $(this).prev('i.fa-check').toggle();
        $('.selectedAddress').removeClass("selectedAddress");
        $(this).addClass("selectedAddress");
        $('#selectedFinalAddress').val($(this).find('.internalAddressContent')[0].innerText);
        selectedAddress = $(this);
        $('#submitAddress').trigger("click");
    });
    $(document).on("click", "input[name='optradio']", function () {
        $(this).parent().find(".singleAddress").trigger("click");
    });

    $(document).on("click", ".removeAddress", function () {
        deleteAddress($(this));
    });

    $('#addNewAddress').click(function (e) {
        e.preventDefault();
        //$('#newAddressForm').show();
        $('#newAddressForm')[0].reset();
        $('#newAddressForm').show();
        $('#addressForm').hide();


        // $('#newAddressContent').hide();
        // $('#newAddressEdit').show();
        // $('#newAddressEdit').focus();
        // $('#newAddressAddBtn').show();
        // $('#newAddressCancelBtn').show();
    });

    $('#newAddressAddBtn').click(function () {
        addressCounter++;
        var content = $('#newAddressEdit').val();
        // Add Address in DB

        // Add Address in Delivery Address Panel

        //                                 <input type="text" name="userAddress[]" />
        //                                 <input type="hidden" name="selectedAddress[]" />
        if(content)
        $('.address-panel').prepend(`<div class="col-md-6 my-2">
            <div class="card p-5 text-center">
                <a href="#" class="removeAddress">x</a>
                <input type="radio" name="optradio" class="selectRadio">
                <a href="javascript:void(0)" class="singleAddress" id="address${addressCounter}">
                    <span class="internalAddressContent">${content}</span>
                    <input type="hidden" value="${content}" name="selectedAddress[]" />
                </a></div></div>`);

        // reset add address panel
        $('#newAddressEdit').val('');
        $('#newAddressEdit').hide();
        $('#newAddressAddBtn').hide();
        $('#newAddressCancelBtn').hide();
        $('#newAddressContent').show();
    });

    $('#newAddressCancelBtn').click(function () {
        $('#newAddressEdit').val('');
        $('#newAddressEdit').hide();
        $('#newAddressAddBtn').hide();
        $('#newAddressCancelBtn').hide();
        $('#newAddressContent').show();
    });
    $('#newAddressForm').submit(function(e) {
        e.preventDefault();
        if($('#newAddressForm').validate()){
            submitFirstAddress($(this));
        }
    });

    $('#cancel-address').click(function(){
        $('#newAddressForm').hide();
        $('#addressForm').show();
    });

    // function submitFirstAddress(form){
    //     $.ajax({
    //        type: "POST",
    //        url: form.attr('action'),
    //        data: form.serialize(),
    //        dataType: "JSON",
    //        success: function(data)
    //        {
    //         if(data.status == 0){
    //             $.notify("Something went wrong", "error");
    //             console.log(data);
    //             return false;
    //         }
    //         console.log("address submit successfully");
    //         $('.address-panel').prepend(`<div class="col-md-6 my-2">
    //                                         <div class="card p-5 text-center">
    //                                             <a href="#" class="removeAddress">x</a>
    //                                             <input type="radio" name="optradio" class="selectRadio">
    //                                             <a href="javascript:void(0)" data-addressid="${data.id}" class="singleAddress" id="address">
    //                                                 <span class="internalAddressContent">${data.address}</span>
    //                                             </a>
    //                                         </div>
    //                                     </div>`);
    //         $('#newAddressForm').hide();
    //         $('#addressForm').show();
    //        },
    //        error: function(a,b){
    //             $.notify("Something went wrong!!!", "error");
    //        }
    //     });
    // } 

</script>







<!-- <div id="shoppingCartModal" class="modal fade" role="dialog">
   <div class="modal-dialog modal-lg">


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
                     <a href="<?php echo base_url() ?>corder/checkout_form" class="checkout-btn btn btn-sm btn-primary">
                        <i class="fa fa-shopping-cart" aria-hidden="true"></i> Checkout
                     </a>
                     <a href="<?php echo base_url() ?>corder/cart_page" class="checkout-btn btn btn-sm btn-primary">
                        <i class="fa fa-shopping-cart" aria-hidden="true"></i> Proceed to Cart Page
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
</div> -->

<!-- Shopping Cart Modal End -->

<!-- Cart Scripts Start -->


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
//    $(document).on('click', '.remove-item-from-cart', function () {
//       removeItemFromShoppingCart($(this));
//    });
//    $(document).on('click', '#cartBtn', function () {
      loadShoppingCart1();
//    });
//    $(document).on('click', '.remove-cart', function () {
//       var productJson = $(this).data('json');
//       removeAndUpdateFromCart(productJson, $(this));
//    });
   $(document).on('click', '.add-cart', function () {
       var productJson = $(this).data('json');
       var quantity = parseInt($(this).parent().parent().parent().find('.quantity')[0].value);
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

//  function addOrUpdateCart(cart, productJson, quantity, addCartObj){
//    var currentProduct = cart.filter((each)=>{return each.id == productJson.id});
//    var oldQty = 0;
//    if(currentProduct.length > 0){
//       oldQty = currentProduct[0].quantity;
//       currentProduct[0].quantity = quantity;
//    }
//    else{
//       productJson.quantity = quantity;
//       cart.push(productJson);
//    }
//    document.cookie = `baskit=${JSON.stringify(cart)};path=/;`;
//    if(currentProduct.length > 0)
//       $.notify(`${productJson.pName} quantity updated from ${oldQty} to ${currentProduct[0].quantity}`, "success");
//    else
//       $.notify(`${productJson.pName} added into cart`, "success");
//    $('#add_to_cart_items').html(cart.length);
//    $(addCartObj.parent().find('.remove-cart')[0]).show();
//    addCartObj.html('Update to Cart');
//    return true;
// }

// function removeAndUpdateFromCart(productJson, removeCartObj){
//    var cart = getCookie('baskit');
//    if(!cart)
//       return true;
//    cart = JSON.parse(cart);
//    var cartExceptCurrentProduct = cart.filter((each)=>{return each.id != productJson.id});
//    var cookieString = `baskit=${JSON.stringify(cartExceptCurrentProduct)};path=/;`;
//    if(cartExceptCurrentProduct.length == 0){
//       var oldDt = new Date(1);
//       cookieString += `expires=${oldDt}`;
//    }
//    document.cookie = cookieString;
//    $('#add_to_cart_items').html(cartExceptCurrentProduct.length);
//    loadCartData();
//    $.notify(`${productJson.pName} removed from cart`, "warn");
//    return true;
// }

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

// function removeItemFromShoppingCart(currentElem){
//    var productId = parseInt(currentElem.data('id'));
//    var prodName = currentElem.data('name');
//    var cart = getCookie('baskit');
//    if(cart)
//       cart = JSON.parse(cart);
//    var cartExceptCurrentProduct = cart.filter((each)=>{return each.id != productId});
//    var cookieString = `baskit=${JSON.stringify(cartExceptCurrentProduct)};path=/;`;
//    if(cartExceptCurrentProduct.length == 0){
//       var oldDt = new Date(1);
//       cookieString += `expires=${oldDt}`;
//    }
//    document.cookie = cookieString;
//    currentElem.closest('tr').remove();
//    $.notify(`${prodName} removed from cart`, "warn");
//    if(cartExceptCurrentProduct.length == 0){
//       var cartObj = $('#shoppingCartBody1');
//       if(cartObj && cartObj.length > 0)
//          showEmptyResponse(cartObj)
//    }
//    else{
//     var totalP = 0;
//     for (var i = 0; i < cartExceptCurrentProduct.length; i++) {
//       totalP += parseInt(cartExceptCurrentProduct[i].price) * parseInt(cartExceptCurrentProduct[i].quantity);
//     }
//     $('#Grand-Total').html(totalP);
//    }
//    loadCartData();
// }

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
      $(cartBody).show();
      $($('.emptyCart')[0]).hide();
      $(document).off('click', '.checkout-btn', handleCheckout(event));
      var eachProdTemplate1 = `<tr>
      <td class="text-center">
      <img style="width: 110px; height:70px" src="{imgValue}" alt="" class="img-fluid">
      </td>
      <td colspan="3">{prodName}</td>
      <td class="" style="text-align: center;" colspan="2"><b>Rs. {price}</b></td>
      <td style="text-align:center;"><b>{qty}</b></td>
      <td class="" style="text-align: center;"><b>Rs. {totalPrice}</b></td>
      <td class="" style="text-align: center;">
      <a href="javascript:void(0)" data-id="{pId}" data-name="{prodName}" class="remove-item-from-cart">
      <i class="fas fa-times" style="font-size:25px; color:red;"></i>
      </a>
      </td>
      </tr>`;
    //   var cartTotalRow = `<tr>
    //   <td colspan="7" class="text-right">Total</td>
    //   <td class="text-right" id="Grand-Total">{grandTotal}</td>
    //   <td></td>
    //   </tr>`;
      var sum = 0;
      for (var i = 0; i < cart.length; i++) {
         var eachProdTemplateCopy1 = eachProdTemplate1;
         sum += parseInt(cart[i].quantity) * parseInt(cart[i].price);
         eachProdTemplateCopy1 = eachProdTemplateCopy1.replace('{pId}', cart[i].id);
         eachProdTemplateCopy1 = eachProdTemplateCopy1.replace('{imgValue}', cart[i].img);
         eachProdTemplateCopy1 = eachProdTemplateCopy1.replace(/{prodName}/g, cart[i].pName);
         eachProdTemplateCopy1 = eachProdTemplateCopy1.replace('{price}', cart[i].price);
         eachProdTemplateCopy1 = eachProdTemplateCopy1.replace('{qty}', cart[i].quantity);
         eachProdTemplateCopy1 = eachProdTemplateCopy1.replace('{totalPrice}', parseInt(cart[i].quantity) * parseInt(cart[i].price));
         //append newly created row in card body
         $(cartBody.find('tbody')).append(eachProdTemplateCopy1);
         }
        //  cartTotalRow = cartTotalRow.replace('{grandTotal}', sum);
        //  $(cartBody.find('tbody')).append(cartTotalRow);
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