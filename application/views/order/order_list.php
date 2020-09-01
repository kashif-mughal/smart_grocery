<!-- Bread Crumb -->

<div class="bread_crumb">
    <div class="container">
        <div class="row d-block">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="javascript:void(0);">Home</a></li>
                    <li class="breadcrumb-item"><a href="javascript:void(0);">Order</a></li>
                    <li class="breadcrumb-item"><a href="javascript:void(0);">Manage Order</a></li>
                </ol>
                <h3 class="mb-0">Orders History</h3>
            </nav>
            <h3 class="mb-0"><?php echo $SelectOrder['SubOrder']; ?></h3>
        </div>
    </div>
</div>
<style type="text/css">
    .remove-cart{
        top: auto;
        left: auto;
        text-align: -webkit-auto;
        z-index: auto;
        position: relative;
        vertical-align: unset;
        background: black !important;
        border-radius: 0px;
    }
</style>
<!-- Bread Crumb -->


<section class="main-content">
    <div class="container">
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
            <div class="col-xl-3 col-lg-3 col-md-12 pr-0 hidden-sm-down">
                <div class="sidenav" style="position: relative;width: 100%;z-index: 0;height: auto;">
                    <div>
                        <?php 
                            if(empty($CatList))
                                $CatList = Array();
                            $data['CatList'] = $CatList;
                            $this->load->view('include/user_left_menu', $data);
                        ?>
                    </div>
                </div>
            </div>
            <div class="col-xl-9 col-lg-9 col-md-12 my-3 pr-0">

                <!-- <table id="orderDataTable" class="table table-striped table-bordered dt-responsive nowrap" style="width:100%;">
                    <thead>
                        <tr>
                            <th>SL#</th>
                            <th class="text-center">Order Id</th>
                            <th class="text-center">Order Amount</th>
                            <th class="text-center">Placement Date</th>
                            <th class="text-center">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        if ($orderData) {
                            ?>
                            {orderData}
                            <tr id="{Id}">
                                <td class="text-center">{sl}</td>
                                <td class="text-center">{OrderId}</td>
                                <td class="text-center">{OrderValue}</td>
                                <td class="text-center">{CreatedOn}</td>
                                <td>
                                    <center>
                                        <?php echo form_open() ?>
                                        <a href="<?php echo base_url() . 'Corder/order_detail_form/{OrderId}'; ?>" class="btn btn-info btn-sm" data-toggle="tooltip" data-placement="left" title="Track your order"><i class="fa fa-eye" aria-hidden="true"></i></a>

                                        <a href="" class="DeleteOrder btn btn-danger btn-sm" name="{OrderId}" data-toggle="tooltip" data-placement="right" title="" data-original-title="Delete"><i class="fa fa-trash" aria-hidden="true"></i></a>
                                        <?php echo form_close() ?>
                                    </center>
                                </td>
                            </tr>
                            {/orderData}
                            <?php
                        }
                        ?>
                    </tbody>
                    <tfoot>
                        <tr>
                            <th>SL#</th>
                            <th class="text-center">Order Id</th>
                            <th class="text-center">Order Amount</th>
                            <th class="text-center">Placement Date</th>
                            <th class="text-center">Action</th>
                        </tr>
                    </tfoot>
                </table> -->

                <?php if($orderData){?>
                    <?php foreach ($orderData as $key => $value) {?>
                        <div class="accordion" id="orderHistoryaccordion">
                           <div class="card order-history-card">
                              <div class="card-header order-header d-flex justify-content-between">
                                 <div class="order-date">
                                    <img src="<?=base_url("assets/img/orderhistory/calendar_icon.png")?>" alt="Calendar">
                                    <button data-toggle="collapse" data-target="#orderHistoryCollapse<?=$value[0]['OrderId']?>" aria-expanded="true" aria-controls="orderHistoryCollapse" class="order-history-button">
                                    <span class="order-header-text" id="orderDeliverDt"><script>document.write((new Date('<?=$value[0]["DeliveryDate"]?>')).toDateString());</script></span>    
                                    </button>                                                
                                 </div>
                                 <div class="order-time">
                                    <img src="<?=base_url("assets/img/orderhistory/clock_icon.png")?>" alt="Clock">
                                    <span class="order-header-text">
                                       <?=date('h:i a', strtotime($value[0]["DeliveryFrom"])). ' - ' .date('h:i a', strtotime($value[0]["DeliveryUpto"]))?>
                                    </span>
                                 </div>
                              </div>
                              <div id="orderHistoryCollapse<?=$value[0]['OrderId']?>" class="collapse show" aria-labelledby="headingOne" data-parent="#orderHistoryaccordion">
                                 <div class="card-body">
                                    <?php
                                       for ($i=0; $i < count($value); $i++) {?>
                                       
                                            <div class="order-history-header mt-3 p-0">
                                                <div class="card order-history-card each-prod">
                                                    
                                                    <div class="featured-products mt-0 border-none d-flex justify-content-between align-items-center">
                                                        <?php 
                                                          $discountPercentage = (($value[$i]['Price'] - $value[$i]['SoldPrice'])/$value[$i]['Price']) * 100;
                                                        ?> 

                                                        <img src="<?=base_url($value[$i]['ProductImg'])?>" style="width: 70px; max-height: 60px;" alt="">
                                                        <div class="order-product-name order-item align-self-center">
                                                            <p class="order-name"><?=$value[$i]['ProductName']?></p>
                                                            <p class="order-weight"><?=$value[$i]['ItemQuantity']?>&nbsp;<?=$value[$i]['UnitName']?></p>
                                                        </div>
                                                        <div class="order-product-price order-item">
                                                            <p class="order-price"><script type="text/javascript">
                                                                document.write(formatCurrency('<?=$value[$i]["SoldPrice"]?>'));
                                                            </script></p>
                                                            <?php if($discountPercentage != 0) { ?> 
                                                                <p class="order-discount"><del><script type="text/javascript">
                                                                document.write(formatCurrency('<?=$value[$i]["Price"]?>'));
                                                            </script></del></p>
                                                            <?php } ?>
                                                        </div>
                                                        <div class="quantity-area order-item">
                                                            <div class="d-flex">
                                                                <span class="d-inline-flex quantity-text mr-1">Qty</span>
                                                                <input type="number" value="<?=$value[$i]['ItemQuantity']?>" min="0" class="d-inline-flex quantity  quantity-input">
                                                                <span class="d-block quantity-button">
                                                                    <a href="javascript:void(0);" class="qty-pls d-block text-center">+</a>
                                                                    <div class="separator"></div>
                                                                    <a href="javascript:void(0);" class="qty-mns d-block text-center">-</a>
                                                                </span>
                                                            </div>
                                                        </div>
                                                        <div class="order-button order-item text-center">
                                                            <a href="javascript:void(0);" class="d-block align-self-center button-primary add-cart"
                                                               data-json="<?= $value[$i]["Jsn"]?>"
                                                               >Add to Cart
                                                            </a>
                                                            <!-- <a href="#" class="d-block align-self-center button-primary">Add to Cart</a> -->
                                                            <a href="javascript:void(0);" style="display: none;" class="align-self-center button-secondary remove-cart" data-json="<?= $value[$i]["Jsn"]?>"
                                                               >Remove From Cart
                                                           </a>
                                                            <!-- <a href="#" class="d-block align-self-center button-secondary">Delete</a> -->
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                    <?php } ?>
                                 </div>
                              </div>
                           </div>
                        </div>
                    <?php } ?>
                <?php } ?>
            </div>

        </div>

    </div>
</section>

<!-- Manage Order End -->

<!-- Delete Order ajax code -->
<script type="text/javascript">
    //Delete Order 
    $(document).ready(function(){

        $(".DeleteOrder").click(function ()
        {
            var OrderId = $(this).attr('name');
            var csrf_test_name = $("[name=csrf_test_name]").val();
            var x = confirm("Are You Sure,Want to Delete ?");
            if (x == true) {
                $.ajax
                ({
                    type: "POST",
                    url: '<?php echo base_url('Corder/order_delete') ?>',
                    data: {OrderId: OrderId, csrf_test_name: csrf_test_name},
                    cache: false,
                    success: function (datas)
                    {
                        alert(datas);
                    }
                });
            }
        });
        $('#orderDataTable').DataTable();
    }); 
</script>



