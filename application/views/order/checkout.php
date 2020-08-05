<div id="main-page">
        <!-- Bread Crumb -->

        <div class="bread_crumb">
            <div class="container">
                <div class="row d-block">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="#">Order</a></li>
                            <li class="breadcrumb-item">Checkout</li>
                        </ol>
                    </nav>
                    <h3 class="mb-0">Checkout</h3>
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
                <div class="row">
                    <div class="col-md-8">
                        <div class="content-box pd-50">
                            <div class="checkout-header">
                                <h3>Thank you for your order</h3>
                                <h6>Read your details below</h6>
                            </div>
                            <div class="checkout-content mrgt-30">
                                
                                <div class="check-in-feature">
                                    <div class="grid-container">
                                        <div class="feature-img">
                                            <h4 class="feature-img-text m-0">Rs.</h4>
                                        </div>
                                        <div class="feature-content d-flex flex-column justify-content-center">
                                            <h4 class="feature-text mb-0">Total</h4>
                                            <h4 class="feature-text-price mb-0 sub-total"></h4>
                                        </div>
                                    </div>
                                </div>

                                <div class="check-in-feature">
                                    <div class="grid-container">
                                        <div class="feature-img">
                                            <h4 class="feature-img-text m-0">Rs.</h4>
                                        </div>
                                        <div class="feature-content d-flex flex-column justify-content-center">
                                            <h4 class="feature-text mb-0">Estimated Delivery Time</h4>
                                            <h4 class="feature-text-price mb-0">9:00 am - 11:30 am</h4>
                                        </div>
                                    </div>
                                </div>

                                <div class="check-in-feature">
                                    <div class="grid-container">
                                        <div class="feature-img">
                                            <h4 class="feature-img-text m-0">Rs.</h4>
                                        </div>
                                        <div class="feature-content d-flex flex-column justify-content-center">
                                            <h4 class="feature-text mb-0">Delivery Date</h4>
                                            <h4 class="feature-text-price mb-0" id="delivery-date"></h4>
                                        </div>
                                    </div>
                                </div>

                                <div class="check-in-feature">
                                    <div class="grid-container">
                                        <div class="feature-img">
                                            <h4 class="feature-img-text m-0">Rs.</h4>
                                        </div>
                                        <div class="feature-content d-flex flex-column justify-content-center">
                                            <h4 class="feature-text mb-0">Delivery Address</h4>
                                            <h4 class="feature-text-price mb-0"><?php echo empty($_SESSION['address']) ? 'Not Specified' : $_SESSION['address'];?></h4>
                                        </div>
                                    </div>
                                </div>
                                <a href="javascript:void(0);" id="checkout" class="button-secondary button-full-width mt-5 mb-3 p-3 text-dec-none text-white font-size-18">Proceed To Checkout</a>
                                <a href="<?=base_url('Corder/my_order');?>" class="button-secondary button-full-width mt-5 mb-3 p-3 text-dec-none text-white font-size-18">View Order history</a>
                                
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
                                            <div class="orderbox-content-title mb-3">
                                                <h6>Shipping</h6>
                                            </div>
                                            <div class="orderbox-content-charges d-flex justify-content-between mb-3">
                                                <h6>Delivery Charges</h6>
                                                <h6></h6>
                                            </div>
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

                            <div class="col-md-12">
                                <div class="content-box my-box">
                                    <div class="my-box-header d-flex justify-content-between align-items-baseline">
                                        <h4>My Order</h4>
                                        <h6 class="font-weight-700 item-counts"></h6>
                                    </div>
                                    <div class="my-box-content p-3" id="cartProductsArea"></div>
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
    if(!baskit || JSON.parse(baskit).length == 0)
        window.location.href = '<?=base_url();?>';
    $(document).ready(() => {
        loadCheckoutCartArea();
        $(document).on('click', '#checkout', function () {
          proceedToCheckout();
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
               eachProdTemplateCopy = eachProdTemplateCopy.replace('{totalPrice}', parseInt(cart[i].quantity) * parseInt(cart[i].price));
               //append newly created row in card body
               cartBody.append(eachProdTemplateCopy);
            }
            $('.item-counts').html(`${cart.length} ${cart.length > 1 ? 'Items' : 'Item'}`);
            $('.sub-total').html(formatCurrency(sum));
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

    function proceedToCheckout(){
        var baskit = getCookie('baskit');
        if(!baskit || JSON.parse(baskit).length == 0){
            $.notify("The Cart is empty, please add some item in cart", "error");
            return false;
        }

        openWindowWithPost(
            "proceed_to_checkout", JSON.parse(baskit)
        );
    }

    function openWindowWithPost(url, dataArr) {
        var form = document.createElement("form");
        form.target = "_blank";
        form.method = "POST";
        form.action = url;
        form.style.display = "none";
        var input = document.createElement("input");
        input.type = "hidden";
        input.name = 'order';
        input.value = JSON.stringify(dataArr);
        form.appendChild(input);

        document.body.appendChild(form);
        form.submit();
        document.body.removeChild(form);
    }
</script>
