<!-- Add new customer start -->
<div class="content-wrapper">
    <section class="content-header">
        <div class="header-icon">
            <i class="pe-7s-note2"></i>
        </div>
        <div class="header-title">
            <h1>Add Product</h1>
            <small>Add New Product</small>
            <ol class="breadcrumb">
                <li><a href="#"><i class="pe-7s-home"></i> Home</a></li>
                <li><a href="#">Product</a></li>
                <li class="active">Add Product</li>
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
            <div class="col-sm-12">
                <div class="column">

                    <a href="<?php echo base_url('Cproduct/manage_product') ?>" class="btn btn-info m-b-5 m-r-2"><i class="ti-align-justify"> </i> Manage Product </a>

                </div>
            </div>
        </div>

        <!-- New customer -->
        <div class="row">
            <div class="col-sm-12">
                <div class="panel panel-bd lobidrag">
                    <div class="panel-heading">
                        <div class="panel-title">
                            <h4>Add Product</h4>
                        </div>
                    </div>
                    <?php echo form_open('Cproduct/insert_product', array('class' => 'form-vertical', 'enctype' => 'multipart/form-data', 'id' => 'insert_product')) ?>
                    <div class="panel-body">

                        <div class="form-group row">
                            <label for="ProductName" class="col-sm-3 col-form-label">Product Name <i class="text-danger">*</i></label>
                            <div class="col-sm-6">
                                <input class="form-control" name ="ProductName" id="ProductName" type="text" placeholder="Product Name"  required="">
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="Unit" class="col-sm-3 col-form-label">Unit </label>
                            <div class="col-sm-6">
                                <input class="form-control" name ="Unit" id="Unit" type="text" placeholder="Unit">
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="Price" class="col-sm-3 col-form-label">Price </label>
                            <div class="col-sm-6">
                                <input class="form-control" name ="Price" id="Price" type="text" placeholder="Price">
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="SalePrice" class="col-sm-3 col-form-label">Sale Price </label>
                            <div class="col-sm-6">
                                <input class="form-control" name ="SalePrice" id="SalePrice" type="text" placeholder="Sale Price">
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="IsFeatured" class="col-sm-3 col-form-label">IsFeatured </label>
                            <div class="col-sm-6">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" id="IsFeatured" name="IsFeatured">
                                </div>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="IsHot" class="col-sm-3 col-form-label">IsHot </label>
                            <div class="col-sm-6">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" id="IsHot" name="IsHot">
                                </div>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="CategoryId" class="col-sm-3 col-form-label">Category </label>
                            <div class="col-sm-6">
                                <select class="form-control" name ="CategoryId" id="CategoryId">
                                    <option value="0">None</option>
                                    {categories}
                                        <option value="{CategoryId}">{CatName}</option>
                                    {/categories}
                                </select>
                            </div>
                        </div>


                        <div class="form-group row">
                            <label for="Img" class="col-sm-3 col-form-label">Product Image </label>
                            <div class="col-sm-6">
                                <input type="file" name="image" class="form-control" id="image">
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="example-text-input" class="col-sm-4 col-form-label"></label>
                            <div class="col-sm-6">
                                <input type="submit" id="add-product" class="btn btn-success btn-large" name="add-product" value="Save" />
                            </div>
                        </div>
                    </div>
                    <?php echo form_close() ?>
                </div>
            </div>
        </div>
    </section>
</div>
<!-- Add new customer end -->




