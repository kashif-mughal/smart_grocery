<div id="main-page">
        <!-- Bread Crumb -->

        <div class="bread_crumb">
            <div class="container-fluid">
                <div class="row d-block">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item">Checkout</li>
                        </ol>
                    </nav>
                    <h3 class="mb-0">Checkout</h3>
                </div>
            </div>
        </div>

        <!-- Bread Crumb -->


        <section class="main-content mx-4">
            <div class="container-fluid">
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
                                            <h4 class="feature-text-price mb-0">Tuesday, 23rd June 2020</h4>
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
                                            <h4 class="feature-text-price mb-0">ABC Plaza Near XYZ Market, Khayaban-e-Ittehad Phase V, Karachi</h4>
                                        </div>
                                    </div>
                                </div>

                                <a href="#" class="button-secondary button-full-width mt-5 mb-3 p-3 
                                                text-dec-none text-white font-size-18">View Order history</a>
                                
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
         }
         else{
            //show empty message
            return false;
         }   
    }
</script>
