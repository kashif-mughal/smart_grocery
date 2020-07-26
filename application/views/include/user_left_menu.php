<?php
$CI = & get_instance();
$CI->load->model('Users');
$users = $CI->Users->profile_edit_data();
if(is_array($users) && !empty($users[0])){
  $users = $users[0];
}else{
  $users = null;
}
?>
<h3 class="sidebar-heading"><?php echo !is_null($users) ? "Welcome, ".$users['first_name'].' '.$users['last_name'] : "<a href='".base_url()."account/login'>Login or Register</a>"?></h3>

<div class="sidebar-menu">
    <div class="accordion" id="accordionExample">
        <div class="card border-none">
            <div class="card-header sidebar-menu-title p-0" id="headingOne">
                <button class="btn-block d-flex justify-content-around align-items-center" type="button" data-toggle="collapse" 
                    data-target="#collapseOne"
                    aria-expanded="true" aria-controls="collapseOne">
                    <img src="<?php echo base_url() ?>assets/img/sidenav-toggle.png" class="d-inline" alt="">
                    <h4 class="d-inline">Shop Categories</h4>
                    <img src="<?php echo base_url() ?>assets/img/sidenav-chevron.png" class="d-inline" alt="">
                </button>
            </div>
    
            <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
                <div class="card-body">
                   <ul class="sidebar-menu-items navbar-nav">
                    <?php foreach($CatList as $key => $value) {?>
                       <li><a target="_blank" href="<?=base_url('Cproduct/products?categoryId='.$value->catId) ?>"><?=$key?></a></li>
                    <?php } ?>
                   </ul>
                </div>
            </div>
        </div>
        <?php if(!is_null($users)){?>
          <div class="card border-none">
              <div class="card-header" id="headingTwo">
                  <div class="card-header sidebar-menu-title p-0" id="headingOne">
                      <button class="btn-block bg-transparent d-flex justify-content-start align-items-center" type="button" data-toggle="collapse"
                          data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                          <img src="<?php echo base_url() ?>assets/img/profile.png" class="d-inline" alt="">
                          <h4 class="d-inline ml-4">Profile</h4>
                      </button>
                  </div>
              </div>
          </div>
          <div class="card border-none">
              <div class="card-header" id="headingTwo">
                  <div class="card-header sidebar-menu-title p-0" id="headingOne">
                      <button class="btn-block bg-transparent d-flex justify-content-start align-items-center" type="button"
                          data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                          <img src="<?php echo base_url() ?>assets/img/my_order_history.png" class="d-inline" alt="">
                          <h4 class="d-inline ml-4">My Order History</h4>
                      </button>
                  </div>
              </div>
          </div>
          <div class="card border-none">
              <div class="card-header" id="headingTwo">
                  <div class="card-header sidebar-menu-title p-0" id="headingOne">
                      <button class="btn-block bg-transparent d-flex justify-content-start align-items-center" type="button"
                          data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                          <img src="<?php echo base_url() ?>assets/img/track_your_order.png" class="d-inline" alt="">
                          <h4 class="d-inline ml-4">Track Your Order</h4>
                      </button>
                  </div>
              </div>
          </div>
        <?php } ?>
        <div class="card border-none">
            <div class="card-header" id="headingTwo">
                <div class="card-header sidebar-menu-title p-0" id="headingOne">
                    <button class="btn-block bg-transparent d-flex justify-content-start align-items-center" type="button"
                        data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                        <img src="<?php echo base_url() ?>assets/img/call_us.png" class="d-inline" alt="">
                        <h4 class="d-inline ml-4">Call Us</h4>
                    </button>
                </div>
            </div>
        </div>
        <div class="card border-none">
            <div class="card-header" id="headingTwo">
                <div class="card-header sidebar-menu-title p-0" id="headingOne">
                    <button class="btn-block bg-transparent d-flex justify-content-start align-items-center" type="button"
                        data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                        <img src="<?php echo base_url() ?>assets/img/sign-in.png" class="d-inline" alt="">
                        <?php if(is_null($users)){?>
                           <h4 class="d-inline ml-4">Sign In</h4>
                        <?php } else{?>
                           <h4 class="d-inline ml-4">Sign Out</h4>
                        <?php } ?>
                    </button>
                </div>
            </div>
        </div>

    </div>
</div>