<!-- Manage value Start -->
<div class="content-wrapper">
    <section class="content-header">
        <div class="header-icon">
            <i class="pe-7s-note2"></i>
        </div>
        <div class="header-title">
            <h1>Manage Value Cart</h1>
            <small>Manage Value Cart</small>
            <ol class="breadcrumb">
                <li><a href=""><i class="pe-7s-home"></i> Home</a></li>
                <li><a href="#">Value Cart</a></li>
                <li class="active">Manage Value Cart</li>
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

                    <a href="<?php echo base_url('Cvalue') ?>" class="btn btn-info m-b-5 m-r-2"><i class="ti-plus"> </i> Add Value </a>

                </div>
            </div>
        </div>

        <!-- Manage value -->
        <div class="row">
            <div class="col-sm-12">
                <div class="panel panel-bd lobidrag">
                    <div class="panel-heading">
                        <div class="panel-title">
                            <h4>Recent Value Cart</h4>
                        </div>
                    </div>
                    <div class="panel-body">
                        <div class="table-responsive">
                            <table id="dataTableExample3" class="table table-bordered table-striped table-hover">
                                <thead>
                                    <tr>
                                        <th class="text-center">SL#</th>
                                        <th class="text-center">Logo</th>
                                        <th class="text-center">Product Name</th>
                                        <th class="text-center">Price</th>
                                        <th class="text-center">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php $counter = 0;
                                    foreach ($value_list["Value"] as $key => $value) {?>
                                        <?php for ($i=0; $i < count($value); $i++) {?>
                                            <tr id="<?=$value[$i]["ValueId"]?>">
                                                <td class="text-center"><?=++$counter;?></td>
                                                <td class="text-center"><img width="50px;" src="<?=base_url($value[$i]["ProductImg"])?>"></td>
                                                <td class="text-center"><?=$value[$i]["ProductName"]?></td>
                                                <td class="text-center"><?=$value[$i]["SalePrice"]?></td>
                                                <td>
                                                    <center>
                                                        <?php echo form_open() ?>
                                                        <a href="javascript:void(0);" class="Deletevalue btn btn-danger btn-sm" name="<?=$value[$i]["ValueId"]?>" data-toggle="tooltip" data-placement="right" title="" data-original-title="Delete"><i class="fa fa-trash" aria-hidden="true"></i></a>
                                                            <?php echo form_close() ?>
                                                    </center>
                                                </td>
                                            </tr>
                                        <?php } ?>
                                    <?php } ?>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
<!-- Manage value End -->

<!-- Delete value ajax code -->
<script type="text/javascript">
    //Delete value 
    $(".Deletevalue").click(function ()
    {
        var currentElem = $(this);
        var ValueId = currentElem.attr('name');
        var csrf_test_name = $("[name=csrf_test_name]").val();
        var x = confirm("Are You Sure,Want to Delete ?");
        if (x) {
            $.ajax
            ({
                type: "POST",
                url: '<?php echo base_url('Cvalue/value_delete') ?>',
                data: {ValueId: ValueId, csrf_test_name: csrf_test_name},
                cache: false,
                success: function (datas)
                {
                    currentElem.closest('tr').remove();
                    alert(datas);
                }
            });
        }
    });
</script>



