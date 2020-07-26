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
               <!-- Tab panes -->
               <div class="tab-content">
                  <div class="tab-pane active" id="traking" role="tabpanel">
                     <div class="orderprogress">
                        <div class="row">
                           <ul class="timeline" style="margin-left: 60px;">
                              <li>
                                 <div class="item">
                                    <span>
                                    <i class="fas fa-circle"></i>
                                    </span>
                                    <h5>18/7/20</h5>
                                    <h4>Requested</h4>
                                 </div>
                              </li>
                              <li>
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
                              </li>
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
                                    <h5>My Orders History</h5>
                                    <div class="accordion" id="orderHistoryaccordion">
                                       <div class="card order-history-card">
                                          <div class="card-header order-header d-flex justify-content-between">
                                             <div class="order-date">
                                                <img src="img/orderhistory/calendar_icon.png" alt="Calendar">
                                                <button data-toggle="collapse" data-target="#orderHistoryCollapse1" aria-expanded="true" aria-controls="orderHistoryCollapse" class="order-history-button">
                                                <span class="order-header-text">Tuesday, 23rd June 2020</span>    
                                                </button>                                                
                                             </div>
                                             <div class="order-time">
                                                <img src="img/orderhistory/clock_icon.png" alt="Clock">
                                                <span class="order-header-text">9:00 am - 11:30 am</span>
                                             </div>
                                          </div>
                                          <div id="orderHistoryCollapse1" class="collapse show" aria-labelledby="headingOne" data-parent="#orderHistoryaccordion">
                                             <div class="card-body">
                                                <div class="featured-products order-content align-item-center">
                                                   <div class="order-history-checkbox align-self-center">
                                                      <input type="checkbox">
                                                   </div>
                                                   <img src="img/products/cauliflower.png" alt="" class="order-item">
                                                   <div class="order-product-name order-item">
                                                      <p class="order-name">Onion</p>
                                                      <p class="order-weight">1kg</p>
                                                   </div>
                                                   <div class="order-product-price text-center align-self-center order-item">
                                                      <p class="order-price">Rs.45</p>
                                                      <p class="order-discount"><del>Rs. 56</del></p>
                                                   </div>
                                                   <div class="quantity-area order-item align-self-center">
                                                      <div class="d-flex justify-content-center p-4">
                                                         <span class="d-inline-flex quantity-text mr-1">Qty</span>
                                                         <input type="text" value="1" class="d-inline-flex quantity-input">
                                                         <span class="d-block quantity-button text-center">
                                                            <a href="javascript:void(0)" class="d-block">+</a>
                                                            <div class="separator"></div>
                                                            <a href="javascript:void(0)" class="d-block">-</a>
                                                         </span>
                                                      </div>
                                                   </div>
                                                   <div class="order-button order-item text-center">
                                                      <a href="#" class="d-block button-primary">Add to Cart</a>
                                                      <a href="#" class="d-block button-secondary">Delete</a>
                                                   </div>
                                                </div>
                                                <div class="featured-products order-content align-item-center">
                                                   <div class="order-history-checkbox align-self-center">
                                                      <input type="checkbox">
                                                   </div>
                                                   <img src="img/products/cauliflower.png" alt="" class="order-item">
                                                   <div class="order-product-name order-item my-auto">
                                                      <div class="align-self-center my-auto">
                                                         <p class="order-name">Onion</p>
                                                         <p class="order-weight">1kg</p>
                                                      </div>
                                                   </div>
                                                   <div class="order-product-price text-center order-item">
                                                      <p class="order-price">Rs.45</p>
                                                      <p class="order-discount"><del>Rs. 56</del></p>
                                                   </div>
                                                   <div class="quantity-area order-item align-self-center">
                                                      <div class="d-flex justify-content-center">
                                                         <span class="d-inline-flex quantity-text mr-1">Qty</span>
                                                         <input type="text" value="1" class="d-inline-flex quantity-input">
                                                         <span class="d-block quantity-button text-center">
                                                            <a href="javascript:void(0)" class="d-block">+</a>
                                                            <div class="separator"></div>
                                                            <a href="javascript:void(0)" class="d-block">-</a>
                                                         </span>
                                                      </div>
                                                   </div>
                                                   <div class="order-button order-item text-center">
                                                      <a href="javascript:void(0)" class="d-block button-primary">Add to Cart</a>
                                                      <a href="javascript:void(0)" class="d-block button-secondary">Delete</a>
                                                   </div>
                                                </div>
                                             </div>
                                          </div>
                                       </div>
                                    </div>
                                    <div class="accordion" id="orderHistoryaccordion">
                                       <div class="card order-history-card">
                                          <div class="card-header order-header d-flex justify-content-between">
                                             <div class="order-date">
                                                <img src="img/orderhistory/calendar_icon.png" alt="Calendar">
                                                <button data-toggle="collapse" data-target="#orderHistoryCollapse2" aria-expanded="true" aria-controls="orderHistoryCollapse" class="order-history-button">
                                                <span class="order-header-text">Wednes, 24th June 2020</span>    
                                                </button>                                                
                                             </div>
                                             <div class="order-time">
                                                <img src="img/orderhistory/clock_icon.png" alt="Clock">
                                                <span class="order-header-text">9:00 am - 11:30 am</span>
                                             </div>
                                          </div>
                                          <div id="orderHistoryCollapse2" class="collapse show" aria-labelledby="headingOne" data-parent="#orderHistoryaccordion">
                                             <div class="card-body">
                                                <div class="featured-products order-content align-item-center">
                                                   <div class="order-history-checkbox align-self-center">
                                                      <input type="checkbox">
                                                   </div>
                                                   <img src="img/products/cauliflower.png" alt="" class="order-item">
                                                   <div class="order-product-name order-item">
                                                      <p class="order-name">Onion</p>
                                                      <p class="order-weight">1kg</p>
                                                   </div>
                                                   <div class="order-product-price text-center align-self-center order-item">
                                                      <p class="order-price">Rs.45</p>
                                                      <p class="order-discount"><del>Rs. 56</del></p>
                                                   </div>
                                                   <div class="quantity-area order-item align-self-center">
                                                      <div class="d-flex justify-content-center p-4">
                                                         <span class="d-inline-flex quantity-text mr-1">Qty</span>
                                                         <input type="text" value="1" class="d-inline-flex quantity-input">
                                                         <span class="d-block quantity-button text-center">
                                                            <a href="javascript:void(0)" class="d-block">+</a>
                                                            <div class="separator"></div>
                                                            <a href="javascript:void(0)" class="d-block">-</a>
                                                         </span>
                                                      </div>
                                                   </div>
                                                   <div class="order-button order-item text-center">
                                                      <a href="#" class="d-block button-primary">Add to Cart</a>
                                                      <a href="#" class="d-block button-secondary">Delete</a>
                                                   </div>
                                                </div>
                                                <div class="featured-products order-content align-item-center">
                                                   <div class="order-history-checkbox align-self-center">
                                                      <input type="checkbox">
                                                   </div>
                                                   <img src="img/products/cauliflower.png" alt="" class="order-item">
                                                   <div class="order-product-name order-item my-auto">
                                                      <div class="align-self-center my-auto">
                                                         <p class="order-name">Onion</p>
                                                         <p class="order-weight">1kg</p>
                                                      </div>
                                                   </div>
                                                   <div class="order-product-price text-center order-item">
                                                      <p class="order-price">Rs.45</p>
                                                      <p class="order-discount"><del>Rs. 56</del></p>
                                                   </div>
                                                   <div class="quantity-area order-item align-self-center">
                                                      <div class="d-flex justify-content-center">
                                                         <span class="d-inline-flex quantity-text mr-1">Qty</span>
                                                         <input type="text" value="1" class="d-inline-flex quantity-input">
                                                         <span class="d-block quantity-button text-center">
                                                            <a href="javascript:void(0)" class="d-block">+</a>
                                                            <div class="separator"></div>
                                                            <a href="javascript:void(0)" class="d-block">-</a>
                                                         </span>
                                                      </div>
                                                   </div>
                                                   <div class="order-button order-item text-center">
                                                      <a href="javascript:void(0)" class="d-block button-primary">Add to Cart</a>
                                                      <a href="javascript:void(0)" class="d-block button-secondary">Delete</a>
                                                   </div>
                                                </div>
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