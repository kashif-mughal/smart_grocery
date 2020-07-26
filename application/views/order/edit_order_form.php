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
            <div class="sidenav" style="position: relative;width: 100%;z-index: 0;">
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
                     <h1>Settings</h1>
                     <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Deleniti beatae error quibusdam excepturi repudiandae eius, vel porro voluptatem temporibus aperiam. Labore aliquid ea quidem, adipisci tenetur tempora dolore ipsa et.</p>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</section>