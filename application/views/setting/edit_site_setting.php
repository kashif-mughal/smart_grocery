<!-- Add new customer start -->
<div class="content-wrapper">
    <section class="content-header">
        <div class="header-icon">
            <i class="pe-7s-note2"></i>
        </div>
        <div class="header-title">
            <h1>Update Setting</h1>
            <small>Update New Setting</small>
            <ol class="breadcrumb">
                <li><a href="#"><i class="pe-7s-home"></i> Home</a></li>
                <li><a href="#">Setting</a></li>
                <li class="active">Update Setting</li>
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
                <div class="panel panel-bd lobidrag">
                    <div class="panel-heading">
                        <div class="panel-title">
                            <h4>Update Settings Here</h4>
                        </div>
                    </div>
                    <?php echo form_open('Csettings/update_site_settings', array('class' => 'form-vertical', 'enctype' => 'multipart/form-data', 'id' => 'insert_setting')) ?>
                    <input type="hidden" name="setting_id" value="<?=$SettingData['setting_id']?>">
                    <div class="panel-body">

                        <div class="form-group row">
                            <label for="delivery_charges" class="col-sm-3 col-form-label">Delivery Charges <i class="text-danger">*</i></label>
                            <div class="col-sm-9">
                                <input class="form-control" name ="delivery_charges" id="delivery_charges" type="number" value="<?=$SettingData['delivery_charges']?>" placeholder="Delivery Charges"  required="">
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="footer_text" class="col-sm-3 col-form-label">Footer Text </label>
                            <div class="col-sm-9">
                                <textarea rows="10" class="form-control" name ="footer_text" id="footer_text" placeholder="Footer Text">
                                    <?=$SettingData['footer_text']?>
                                </textarea>
                            </div>
                        </div>
                        
                        <div class="form-group row">
                            <label for="homecat" class="col-sm-3 col-form-label">Home Categories</label>
                            <div class="col-sm-9">
                                    <ul id="sortable-sss">
                                        <?php 
                                        if($SettingData['home_page_cat'] === 'null'){
                                            foreach($categories as $category){
                                                ?>
                                                    <li class="ui-state-default uisort" id="item-<?php echo ($category['CategoryId']); ?>" data-name="<?php echo ($category['CatName']); ?>" data-id="<?php echo ($category['CategoryId']); ?>"><?php echo ($category['CatName']); ?></li>
                                                    <?php 
                                                
                                            }
                                        }else{
                                            foreach(json_decode($SettingData['home_page_cat'], true) as $setcat){ 
                                                foreach($categories as $category){
                                                    if($setcat===$category['CategoryId']){ ?>
                                                        <li class="ui-state-default uisort" id="item-<?php echo ($category['CategoryId']); ?>" data-name="<?php echo ($category['CatName']); ?>" data-id="<?php echo ($category['CategoryId']); ?>"><?php echo ($category['CatName']); ?></li>
                                                        <?php 
                                                    }
                                                }
                                            }
                                        }?>
                                    </ul>
                                    
                                    <!--<select multiple name="home_page_cat[]" class="llhome_page_cat_sss" id="" style="width: 100%;"></select>-->
                                        
                             
                            <?php /*<select multiple name="home_page_cat[]" class="" id="home_page_cat" style="
    width: 100%;
">
                                    <?php foreach($categories as $category){ ?>
                                    <?php foreach(json_decode($SettingData['home_page_cat'], true) as $setcat){ 
                                    if($setcat==$category['CategoryId']){?>
                                    <option selected="selected" value="<?php echo ($category['CategoryId']); ?>"><?php echo ($category['CatName']); ?></option>
                                    <?php
                                    }else{?>
                                    <option value="<?php echo ($category['CategoryId']); ?>"><?php echo ($category['CatName']); ?></option>
                                    <?php
                                    }
                                    }?>
                                    <option value="<?php echo ($category['CategoryId']); ?>"><?php echo ($category['CatName']); ?></option>
                                    <?php
                                    } ?>
                                    
                                </select> */?>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="example-text-input" class="col-sm-4 col-form-label"></label>
                            <div class="col-sm-12">
                                <input type="submit" style="float: right;width: 10%;" class="btn btn-success btn-large" value="Save" />
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




