<!--Edit customer start -->
<div class="content-wrapper">
    <section class="content-header">
        <div class="header-icon">
            <i class="pe-7s-note2"></i>
        </div>
        <div class="header-title">
            <h1>Product Edit</h1>
            <small>Product Edit</small>
            <ol class="breadcrumb">
                <li><a href="#"><i class="pe-7s-home"></i> Home</a></li>
                <li><a href="#">Product</a></li>
                <li class="active">Product Edit</li>
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

        <!-- New customer -->
        <div class="row">
            <div class="col-sm-12">
                <div class="panel panel-bd lobidrag">
                    <div class="panel-heading">
                        <div class="panel-title">
                            <h4>Product Edit </h4>
                        </div>
                    </div>
                  <?php echo form_open_multipart('Cproduct/product_update',array('class' => 'form-vertical', 'id' => 'product_update'))?>
                    <div class="panel-body">

                    	<div class="form-group row">
                            <label for="product_name" class="col-sm-3 col-form-label">Product_name <i class="text-danger">*</i></label>
                            <div class="col-sm-6">
                                <input class="form-control" name ="product_name" id="product_name" type="text" placeholder="Products Name"  required="" value="{product_name}">
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="unit" class="col-sm-3 col-form-label">Unit <i class="text-danger">*</i></label>
                            <div class="col-sm-6">
                                <input class="form-control" name ="unit" id="unit" type="text" placeholder="Unit"  required="" value="{unit}">
                            </div>
                        </div>
                        
                        <div class="form-group row">
                            <label for="price" class="col-sm-3 col-form-label">Price <i class="text-danger">*</i></label>
                            <div class="col-sm-6">
                                <input class="form-control" name ="price" id="price" type="text" placeholder="Price"  required="" value="{price}">
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="salePrice" class="col-sm-3 col-form-label">Sale Price</label>
                            <div class="col-sm-6">
                                <input class="form-control" name ="salePrice" id="salePrice" type="text" placeholder="Sale Price"  required="" value="{sale_price}">
                            </div>
                        </div>


                        <div class="form-group row">
                            <label for="isFeatured" class="col-sm-3 col-form-label">Is Featured <i class="text-danger">*</i></label>
                            <div class="col-sm-6">
                                <select class="form-control" name="isFeatured" id="isFeatured">
                                    <option value="1">Active</option>
                                    <option value="0">Inactive</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="isHot" class="col-sm-3 col-form-label">Is Hot <i class="text-danger">*</i></label>
                            <div class="col-sm-6">
                                <select class="form-control" name="isHot" id="isHot">
                                    <option value="1">Active</option>
                                    <option value="0">Inactive</option>
                                </select>
                            </div>
                        </div>


                        <div class="form-group row">
                            <label for="CategoryId" class="col-sm-3 col-form-label">Category <i class="text-danger">*</i></label>
                            <div class="col-sm-6">
                                <select class="form-control" name ="CategoryId" id="CategoryId">
                                    <option value="0">None</option>
                                    {categories}
                                        <option value="{CategoryId}">{CatName}</option>
                                    {/categories}
                                </select>
                            </div>
                        </div>
                        <script type="text/javascript">
                            $('#CategoryId').val('<?=$category?>');
                        </script>

                        <div class="form-group row">
                            <label for="status" class="col-sm-3 col-form-label">Status <i class="text-danger">*</i></label>
                            <div class="col-sm-6">
                                <select class="form-control" name="status" id="status">
                                    <option value="1">Active</option>
                                    <option value="0">Inactive</option>
                                </select>
                            </div>
                        </div>

                        <input type="hidden" value="{product_id}" name="product_id">

                        <div class="form-group row">
                            <label for="example-text-input" class="col-sm-4 col-form-label"></label>
                            <div class="col-sm-6">
                                <input type="submit" id="edit-product" class="btn btn-success btn-large" name="edit-product" value="Save Changes" />
                            </div>
                        </div>
                    </div>
                    <?php echo form_close()?>
                </div>
            </div>
        </div>
    </section>
</div>
<!-- Edit customer end -->


<script>
$(document).ready(function() {
    $('#is_featured').val(<?=$is_featured; ?>);
    $('#is_hot').val(<?=$is_hot; ?>);
});
</script>


