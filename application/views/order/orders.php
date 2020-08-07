<!-- Manage Category Start -->
<div class="content-wrapper">
    <section class="content-header">
        <div class="header-icon">
            <i class="pe-7s-note2"></i>
        </div>
        <div class="header-title">
            <h1>Manage Orders</h1>
            <small>Manage Orders</small>
            <ol class="breadcrumb">
                <li><a href=""><i class="pe-7s-home"></i> Home</a></li>
                <li><a href="#">Order</a></li>
                <li class="active">Manage Order</li>
            </ol>
        </div>
    </section>

    <section class="content">

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
            <div class="col-sm-12 col-md-12 col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <form action="<?php echo base_url('Corder/index')?>" class="form-inline" method="get" ccept-charset="utf-8">
                            <label for="order_no">Order No</label>
                            <input type="text" class="form-control" name="on" placeholder="Order No">
                            <label for="email">Email</label>
                            <input type="text" class="form-control" name="ue" placeholder="Email">
                            <button type="submit" class="btn btn-primary btn-sm">Search</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- Manage Category -->
        <div class="row">
            <div class="col-sm-12">
                <div class="panel panel-bd lobidrag">
                    <div class="panel-heading">
                        <div class="panel-title">
                            <h4>Manage Order</h4>
                        </div>
                    </div>
                    <div class="panel-body">

                        <div class="table-responsive">

                            <table id="ordersdt" class="table table-bordered table-striped table-hover">
                                <thead>
                                    <tr>
                                        <th>SL</th>
                                        <th>Order No</th>
                                        <th>Total Amount</th>
                                        <th>Customer Name</th>
                                        <th>Email</th>
                                        <th>Date</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <?php
                                    if ($orderData) {
                                ?>
                                {orderData}
                                    <tr>
                                        <td>{sl}</td>
                                        <td>{OrderId}</td>
                                        <td>{OrderValue}</td>
                                        <td>{first_name} {last_name}</td>
                                        <td>{email}</td>
                                        <td>{ModifiedOn}</td>
                                        <td>
                                            <center>
                                                <?php echo form_open()?>
                                                    <a href="<?php echo base_url().'Corder/admin_order_detail_form/{OrderId}'; ?>" class="btn btn-info btn-sm" data-title="Order Detail" data-toggle="tooltip" data-placement="left" title="Order Detail"><i class="fa fa-eye" aria-hidden="true"></i></a>

                                                <?php echo form_close()?>
                                            </center>
                                        </td>
                                    </tr>
                                {/orderData}
                                <?php
                                    }
                                ?>
                                </tbody>
                            </table>
                                <div class="text-right"><?php echo $links?></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>