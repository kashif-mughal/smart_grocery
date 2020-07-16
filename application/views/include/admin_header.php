<?php
$CI = & get_instance();
$CI->load->model('Web_settings');

$CI->load->model('Users');
$Web_settings = $CI->Web_settings->retrieve_setting_editdata();
$users = $CI->Users->profile_edit_data();
?>
<!-- Admin header end -->
<style type="text/css">
    .navbar .btn-success{
        margin: 13px 2px;
    }
</style>
<header class="main-header"> 
    <!-- Logo -->
    <a href="<?php echo base_url() ?>" class="logo"> 
        <span class="logo-mini">
            <img src="<?php
            if (isset($Web_settings[0]['favicon'])) {
                echo $Web_settings[0]['favicon'];
            }
            ?>" alt="">
        </span>

        <span class="logo-lg">

            <img src="<?php
            if (isset($Web_settings[0]['logo'])) {
                echo $Web_settings[0]['logo'];
            }
            ?>" alt="">
        </span>
    </a>
    <!-- Logo End -->
    <!-- Header Navbar -->


    <nav class="navbar navbar-static-top text-center">

        <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button"> <!-- Sidebar toggle button-->
            <span class="sr-only">Toggle navigation</span>

            <span class="pe-7s-keypad"></span>
        </a>

        <a href="<?php echo base_url('Cinvoice') ?>" class="btn btn-success btn-outline" style=""><i class="ti-layout-accordion-list"></i> <?php echo display('invoice') ?></a>

        <a href="<?php echo base_url('Cpayment/receipt_transaction') ?>" class="btn btn-success btn-outline" style=""><i class="fa fa-money"></i> <?php echo display('receipt') ?></a>

        <a href="<?php echo base_url('Cpayment/multi_payment') ?>" class="btn btn-success btn-outline" style=""><i class="fa fa-paypal" aria-hidden="true"></i> <?php echo display('payment') ?></a>

        <a href="<?php echo base_url('Cpurchase') ?>" class="btn btn-success btn-outline" style=""><i class="ti-shopping-cart"></i> <?php echo display('purchase') ?></a>

        <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
                <li class="dropdown notifications-menu">
                    <a href="<?php echo base_url('Creport/out_of_stock') ?>" >
                        <i class="pe-7s-attention" title="<?php echo display('out_of_stock') ?>"></i>
                        <span class="label label-danger"><?php echo $out_of_stock ?></span>
                    </a>
                </li>
                <!-- settings -->
                <li class="dropdown dropdown-user">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"> <i class="pe-7s-settings"></i></a>
                    <ul class="dropdown-menu">
                        <li><a href="<?php echo base_url('Admin_dashboard/edit_profile') ?>"><i class="pe-7s-users"></i><?php echo display('user_profile') ?></a></li>
                        <li><a href="<?php echo base_url('Admin_dashboard/change_password_form') ?>"><i class="pe-7s-settings"></i><?php echo display('change_password') ?></a></li>
                        <li><a href="<?php echo base_url('Admin_dashboard/logout') ?>"><i class="pe-7s-key"></i><?php echo display('logout') ?></a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>
</header>

<aside class="main-sidebar">
    <!-- sidebar -->
    <div class="sidebar">
        <!-- Sidebar user panel -->
        <!-- <div class="user-panel text-center">
            <div class="image">
                <img src="<?php echo $users[0]['logo'] ?>" class="img-circle" alt="User Image">
            </div>
            <div class="info">
                <p><?php echo $this->session->userdata('user_name') ?></p>
                <a href="#"><i class="fa fa-circle text-success"></i> <?php echo display('online') ?></a>
            </div>
        </div> -->
        <!-- sidebar menu -->
        <ul class="sidebar-menu">

            <li class="<?php
            if ($this->uri->segment('1') == ("")) {
                echo "active";
                } else {
                    echo " ";
                }
                ?>">
                <a href="<?php echo base_url() ?>"><i class="ti-dashboard"></i> <span><?php echo display('dashboard') ?></span>
                    <span class="pull-right-container">
                        <span class="label label-success pull-right"></span>
                    </span>
                </a>
            </li>

            <!-- Category menu start -->
            <li class="treeview <?php
            if ($this->uri->segment('1') == ("Ccategory")) {
                echo "active";
                } else {
                    echo " ";
                }
                ?>">
                <a href="#">
                    <i class="ti-tag"></i><span><?php echo display('category') ?></span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="<?php echo base_url('Ccategory') ?>"><?php echo display('add_category') ?></a></li>
                    <li><a href="<?php echo base_url('Ccategory/manage_category') ?>"><?php echo display('manage_category') ?></a></li>
                </ul>
            </li>
            <!-- Category menu end -->
            
            <!-- Product menu start -->
            <li class="treeview <?php
            if ($this->uri->segment('1') == ("Cproduct")) {
                echo "active";
                } else {
                    echo " ";
                }
                ?>">
                <a href="#">
                    <i class="ti-bag"></i><span><?php echo display('product') ?></span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="<?php echo base_url('Cproduct') ?>"><?php echo display('add_product') ?></a></li>
                    <li><a href="<?php echo base_url('Cproduct/manage_product') ?>"><?php echo display('manage_product') ?></a></li>

                </ul>
            </li>
            <!-- Product menu end -->

            <!-- Brand menu start -->
            <li class="treeview <?php
            if ($this->uri->segment('1') == ("Cbrand")) {
                echo "active";
                } else {
                    echo " ";
                }
                ?>">
                <a href="#">
                    <i class="ti-bag"></i><span>Brand</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="<?php echo base_url('Cbrand') ?>">Add brand</a></li>
                    <li><a href="<?php echo base_url('Cbrand/manage_brand') ?>">Manage brand</a></li>

                </ul>
            </li>
            <!-- Brand menu end -->

            <!-- Unit menu start -->
            <li class="treeview <?php
            if ($this->uri->segment('1') == ("Cunit")) {
                echo "active";
                } else {
                    echo " ";
                }
                ?>">
                <a href="#">
                    <i class="fa fa-balance-scale "></i><span>Unit</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="<?php echo base_url('Cunit') ?>">Add unit</a></li>
                    <li><a href="<?php echo base_url('Cunit/manage_unit') ?>">Manage unit</a></li>

                </ul>
            </li>
            <!-- Unit menu end -->

    </ul>
</div> <!-- /.sidebar -->
</aside>