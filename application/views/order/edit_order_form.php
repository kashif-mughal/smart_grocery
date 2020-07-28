<!-- Bread Crumb -->
<div class="bread_crumb">
   <div class="container">
      <div class="row d-block">
         <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
               <li class="breadcrumb-item"><a href="javascript:void(0);">Home</a></li>
               <li class="breadcrumb-item"><a href="javascript:void(0);">Order</a></li>
               <li class="breadcrumb-item"><a href="javascript:void(0);">Order Detail Form</a></li>
            </ol>
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
            <div class="container bg-transparent pr-0">
               <!-- Nav tabs -->
               <ul class="nav nav-tabs" role="tablist">
                  <li class="nav-item">
                     <a class="nav-link active" data-toggle="tab" href="#traking" role="tab">Order Traking</a>
                  </li>
                  <li class="nav-item">
                     <a class="nav-link" data-toggle="tab" href="#detail" role="tab">Order Detail</a>
                  </li>
               </ul>
               <?php //echo '<pre>'; print_r($OrderData);die;?>
               <!-- Tab panes -->
               <div class="tab-content">
                  <div class="tab-pane active" id="traking" role="tabpanel">
                     <div class="orderprogress">
                        <div class="row">
                           <ul class="timeline" style="margin-left: 60px;">
                              <?php $elem = null; for ($i=0; $i < count($OrderData['TrakingSteps']); $i++) {?>
                                 <li>
                                    <?php 
                                    $cls = 'notDone';
                                    if(!empty($OrderData['OrderTrakingDetail'])){
                                       $key = array_search($OrderData['TrakingSteps'][$i]['StepId'], array_column($OrderData['OrderTrakingDetail'], 'StepId'));
                                       
                                       if(!is_numeric($key)){
                                          $cls = 'notDone';
                                          $elem = null;
                                       }
                                       else{
                                          $elem = $OrderData['OrderTrakingDetail'][$key];
                                       }
                                    }
                                    ?>
                                    <div class="item <?=$cls?>">
                                       <span>
                                       <i class="fas fa-circle"></i>
                                       </span>
                                       <h5><?php if(!is_null($elem)) {
                                          $date = date_create($elem['ModifiedOn']);
                                          echo date_format($date,"d /m /Y");
                                       }?></h5>
                                       <h4><?=$OrderData['TrakingSteps'][$i]['StepName']?></h4>
                                    </div>
                                 </li>
                              <?php } ?>
                              <!-- <li>
                                 <div class="item">
                                    <span>
                                    <i class="fas fa-circle"></i>
                                    </span>
                                    <h5>18/7/20</h5>
                                    <h4>Mailed to you</h4>
                                 </div>
                              </li>
                              <li>
                                 <div class="item">
                                    <span>
                                    <i class="fas fa-circle"></i>
                                    </span>
                                    <h5>18/7/20</h5>
                                    <h4>In transit</h4>
                                 </div>
                              </li>
                              <li>
                                 <div class="item">
                                    <span>
                                    <i class="fas fa-circle"></i>
                                    </span>
                                    <h5>18/7/20</h5>
                                    <h4>Items received</h4>
                                    <p>
                                       The estimated processing date for this bag is
                                       9/27 (46 days)
                                    </p>
                                 </div>
                              </li>
                              <li>
                                 <div class="item">
                                    <span>
                                    <i class="fas fa-circle"></i>
                                    </span>
                                    <h5>18/7/20</h5>
                                    <h4>Processing</h4>
                                 </div>
                              </li>
                              <li>
                                 <div class="item notDone">
                                    <span>
                                    <i class="fas fa-circle"></i>
                                    </span>
                                    <h5>18/7/20</h5>
                                    <h4>Processed</h4>
                                 </div>
                              </li> -->
                           </ul>
                        </div>
                     </div>
                  </div>
                  <div class="tab-pane" id="detail" role="tabpanel">
                     <!-- Order History -->
                     <section class="main-content mx-4">
                        <div class="container">
                           <div class="row">
                              <div class="col-xl-12 col-lg-12 col-md-12 px-0">
                                 <div class="featured-products order-history-header">
                                    <h5>My Orders Details</h5>
                                    <div class="accordion" id="orderHistoryaccordion">
                                       <div class="card order-history-card">
                                          <div class="card-header order-header d-flex justify-content-between">
                                             <div class="order-date">
                                                <img src="<?=base_url("assets/img/orderhistory/calendar_icon.png")?>" alt="Calendar">
                                                <button data-toggle="collapse" data-target="#orderHistoryCollapse1" aria-expanded="true" aria-controls="orderHistoryCollapse" class="order-history-button">
                                                <span class="order-header-text">Tuesday, 23rd June 2020</span>    
                                                </button>                                                
                                             </div>
                                             <div class="order-time">
                                                <img src="<?=base_url("assets/img/orderhistory/clock_icon.png")?>" alt="Clock">
                                                <span class="order-header-text">9:00 am - 11:30 am</span>
                                             </div>
                                          </div>
                                          <div id="orderHistoryCollapse1" class="collapse show" aria-labelledby="headingOne" data-parent="#orderHistoryaccordion">
                                             <div class="card-body">
                                                <?php if($OrderData['OrderDetail']){
                                                   $products = $OrderData['OrderDetail'];
                                                   for ($i=0; $i < count($products); $i++) {?>
                                                   <div class="featured-products order-content align-item-center">
                                                      <div class="order-history-checkbox align-self-center">
                                                      </div>
                                                      <img src="<?= base_url($products[$i]['ProductImg'])?>" alt="" class="card-img-bottom text-center">
                                                      <div class="order-product-name order-item">
                                                         <p class="order-name"><?=$products[$i]['ProductName']?></p>
                                                      </div>
                                                      <div class="order-product-price text-center align-self-center order-item">
                                                         <p class="order-price">Rs.<?=$products[$i]['SoldPrice']?></p>
                                                      </div>
                                                      <div class="quantity-area order-item align-self-center">
                                                         <div class="d-flex justify-content-center p-4">
                                                            <span class="d-inline-flex quantity-text mr-1">Qty</span>
                                                            <span class="d-inline-flex quantity-text mr-3"><?=$products[$i]['ItemQuantity']?>&nbsp;<?=$products[$i]['UnitName']?></span>
                                                            
                                                         </div>
                                                      </div>
                                                   </div>
                                                <?php }} ?>
                                             </div>
                                          </div>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                           </div>
                           <!-- Order History Content Ends -->
                        </div>
                     </section>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</section>