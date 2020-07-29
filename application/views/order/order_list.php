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
            <div class="col-xl-3 col-lg-3 col-md-12 pr-0">
                <div class="sidenav" style="position: relative;width: 100%;z-index: 0;height: auto;">
                    <div class="sidenav-content">
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
                <table id="orderDataTable" class="table table-striped table-bordered dt-responsive nowrap" style="width:100%;">
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
                </table>
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



