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
                        <div id="checkout-panel">
                            <div id="accordion">
                                <div class="card">
                                    <div class="card-header" id="headingOne">
                                        <h5 class="mb-0">
                                            <button class="btn btn-link d-flex justify-content-between"
                                                data-toggle="collapse" data-target="#collapseOne" aria-expanded="true"
                                                aria-controls="collapseOne">
                                                <i class="fas fa-check mr-4"></i>
                                                <div class="text-left">
                                                    <span class="verification-steps-heading d-block">Verified Mobile
                                                        Number</span>
                                                    <span class="completed-content">0300 123 45678</span>
                                                </div>
                                            </button>
                                        </h5>
                                    </div>

                                    <div id="collapseOne" class="collapse show" aria-labelledby="headingOne"
                                        data-parent="#accordion">
                                        <div class="card-body">
                                            Verification Completed
                                        </div>
                                    </div>
                                </div>
                                <div class="card">
                                    <div class="card-header" id="headingTwo">
                                        <h5 class="mb-0">
                                            <button class="btn btn-link d-flex w-100" data-toggle="collapse"
                                                data-target="#collapseTwo" aria-expanded="false"
                                                aria-controls="collapseTwo">
                                                <span class="mr-4 process-number">2</span>
                                                <div class="text-left">
                                                    <span
                                                        class="verification-steps-heading d-block align-self-start">Enter
                                                        your Delivery Address</span>
                                                    <span class="completed-content">0300 123 45678</span>
                                                </div>
                                                <div class="change-button ml-auto">Change</div>
                                            </button>
                                        </h5>
                                    </div>
                                    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
                                        data-parent="#accordion">
                                        <div class="card-body p-5">
                                            <div class="container-fluid">
                                                <div class="row address-panel my-2">
                                                    <div id="address-area">
                                                        <?php if($userAddress){?>
                                                            {userAddress}
                                                            <div class="col-md-6 my-2" data-addressId="{AddressId}">
                                                                <div class="card p-5 text-center">
                                                                    <i class="fas fa-check" style="display: none;"></i>
                                                                    <a href="javascript:void(0)" class="singleAddress">
                                                                        <span>
                                                                            {Address}
                                                                        </span>
                                                                    </a>
                                                                </div>
                                                            </div>
                                                            {/userAddress}
                                                        <?php } ?>
                                                    </div>
                                                    <div class="col-md-6 my-2">
                                                        <div class="card">
                                                            <a href="javascript:void(0)" class="text-center p-5"
                                                                id="addNewAddress">
                                                                <textarea name="newAddressEdit" id="newAddressEdit"
                                                                    cols="20" rows="5"
                                                                    style="display: none;"></textarea>
                                                                <!-- <div id="addAddressBtn"> -->
                                                                <div id="newAddressContent">
                                                                    <span class="mb-2 d-block">
                                                                        <i class="fas fa-plus fa-2x p-3 bg-gray"></i>
                                                                    </span>
                                                                    <span id="addAddressBtn">
                                                                        Add new Delivery Address
                                                                    </span>
                                                                </div>
                                                                <!-- <div class="d-flex justify-content-center"> -->
                                                                <a href="javascript:void(0)" id="newAddressAddBtn"
                                                                    style="display: none;">Add</a>
                                                                <a href="javascript:void(0)" id="newAddressCancelBtn"
                                                                    style="display: none;">Cancel</a>
                                                                <!-- </div> -->

                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <a href="javascript:void(0)"
                                                            class="btn btn-link button-secondary px-4 py-2">Next</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card">
                                    <div class="card-header" id="headingThree">
                                        <h5 class="mb-0">
                                            <button class="btn btn-link d-flex w-100 collapsed" data-toggle="collapse"
                                                data-target="#collapseThree" aria-expanded="false"
                                                aria-controls="collapseThree">
                                                <span class="mr-4 process-number">3</span>
                                                <div class="text-left">
                                                    <span class="verification-steps-heading d-block">Enter Delivery Date
                                                        and Time</span>
                                                    <span class="completed-content">0300 123 45678</span>
                                                </div>
                                                <div class="change-button ml-auto">Change</div>
                                            </button>
                                        </h5>
                                    </div>
                                    <div id="collapseThree" class="collapse" aria-labelledby="headingThree"
                                        data-parent="#accordion">
                                        <div class="card-body">
                                            <table class="table table-bordered">
                                                <thead>
                                                    <tr>
                                                        <th scope="col">Date - Day</th>
                                                        <th scope="col">Same Day Delivey - Additional Rs 150 will be
                                                            charged</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td>Thursday, 17 June</td>
                                                        <td>
                                                            <div class="form-check">
                                                                <input class="form-check-input" type="radio"
                                                                    name="deliveryDate" id="today1" value="option1"
                                                                    checked>
                                                                <label class="form-check-label" for="today1">
                                                                    Today
                                                                </label>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                                <thead>
                                                    <tr>
                                                        <th scope="col">Date - Day</th>
                                                        <th scope="col">Time Slot</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td>Thursday, 18 June</td>
                                                        <td>
                                                            <div class="form-check">
                                                                <input class="form-check-input" type="radio"
                                                                    name="deliveryDate" id="today2" value="option2">
                                                                <label class="form-check-label" for="today2">
                                                                    10:00 am - 7:00 pm
                                                                </label>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Thursday, 19 June</td>
                                                        <td>
                                                            <div class="form-check">
                                                                <input class="form-check-input" type="radio"
                                                                    name="deliveryDate" id="today3" value="option3">
                                                                <label class="form-check-label" for="today3">
                                                                    10:00 am - 7:00 pm
                                                                </label>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Thursday, 20 June</td>
                                                        <td>
                                                            <div class="form-check">
                                                                <input class="form-check-input" type="radio"
                                                                    name="deliveryDate" id="today4" value="option4">
                                                                <label class="form-check-label" for="today4">
                                                                    10:00 am - 7:00 pm
                                                                </label>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                            <a href="javascript:void(0)"
                                                class="btn btn-link button-secondary px-4 py-2">Next</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="card">
                                    <div class="card-header" id="headingThree">
                                        <h5 class="mb-0">
                                            <button class="btn btn-link d-flex w-100 collapsed" data-toggle="collapse"
                                                data-target="#collapseFour" aria-expanded="false"
                                                aria-controls="headingFour">
                                                <span class="mr-4 process-number">4</span>
                                                <div class="text-left">
                                                    <span class="verification-steps-heading d-block">Select Payment
                                                        System</span>
                                                    <span class="completed-content">0300 123 45678</span>
                                                </div>
                                                <div class="change-button ml-auto">Change</div>
                                            </button>
                                        </h5>
                                    </div>
                                    <div id="collapseFour" class="collapse p-4" aria-labelledby="headingFour"
                                        data-parent="#accordion">
                                        <div class="card">
                                            <div class="card-header">
                                                <span>Payment Methods</span>
                                            </div>
                                            <div class="card-body">
                                                <span class="mb-4">Information for selected billing method</span>
                                                <div class="bill-payment-methods mt-4 p-3 mb-4">
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="radio" name="bill-method1"
                                                            id="bill-method1" value="option1" checked>
                                                        <label class="form-check-label" for="bill-method1">
                                                            Cash on Delivery
                                                        </label>
                                                    </div>
                                                </div>
                                                <a href="#" class="btn btn-link px-4 py-2 button-primary">Place Order
                                                    Here</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
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
        $('#addAddressBtn').on("click", function(){
            var addressElem = $("#address-area");
            // `<div class="col-md-6 my-2"">
            //     <div class="card p-5 text-center">
            //         <i class="fas fa-check" style="display: none;"></i>
            //         <a href="javascript:void(0)" class="singleAddress">
            //             <span>
            //                 {Address}
            //             </span>
            //         </a>
            //     </div>
            // </div>`;
            var addressTemplate = `<div class="card">
                                        <span>HOME</span>
                                        <span>
                                            <input type="text" name="userAddress[]" />
                                            <input type="hidden" name="selectedAddress[]" />
                                        </span>
                                    </div>`;
            addressElem.append(addressTemplate);
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
</script>
