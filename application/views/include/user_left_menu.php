<?php
$CI = & get_instance();
$CI->load->model('Users');
$users = $CI->Users->profile_edit_data();
if(is_array($users) && !empty($users[0])){
  $users = $users[0];
}else{
  $users = null;
}
$CI->load->library('lcategory');
$menuCatList = $CI->lcategory->get_category_hierarchy();
?>
<h3 class="sidebar-heading border-b-primary"><?php echo !is_null($users) ? "Welcome, ".$users['first_name'].' '.$users['last_name'] : "<a href='".base_url()."account/login'>Login or Register</a>"?></h3>

<div class="sidebar-menu">
    <div class="accordion border-b-primary" id="accordionExample">
        <div class="card border-none">
            <div class="card-header p-0 sidebar-menu-title p-0" id="headingOne">
                <a href="javascript:void(0)" class="btn-block d-flex align-items-center" type="button" data-toggle="collapse" 
                    data-target="#collapseOne"
                    aria-expanded="true" aria-controls="collapseOne">
                    <img src="<?php echo base_url() ?>assets/img/sidenav-toggle.png" class="d-inline pr-4" alt="">
                    <h4 class="d-inline">Shop Categories</h4>
                    <img src="<?php echo base_url() ?>assets/img/sidenav-chevron.png" class="d-inline ml-auto" alt="">
                </a>
            </div>
    
            <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
                <div class="card-body">
                   <ul class="sidebar-menu-items navbar-nav mb-3 ml-4">
                    <?php foreach($menuCatList as $key => $value) {?>
                       <li><a target="_blank" href="<?=base_url('Cproduct/products?categoryId='.$value->catId) ?>"><?=$key?></a></li>
                    <?php } ?>
                   </ul>
                </div>
            </div>
        </div>
      </div>

        <?php if(!is_null($users)){?>
          <div class="card border-none">
              <div class="card-header p-2" id="headingTwo">
                  <div class="card-header p-0 sidebar-menu-title p-0" id="headingOne">
                      <a href="<?=base_url("User/edit_profile")?>" class="btn-block bg-transparent d-flex align-items-center p-0" type="button">
                          <img src="<?php echo base_url() ?>assets/img/profile.png" class="d-inline pr-4" alt="">
                          <h4 class="d-inline">Profile</h4>
                      </a>
                  </div>
              </div>
          </div>
          <div class="card border-none">
              <div class="card-header p-2" id="headingTwo">
                  <div class="card-header sidebar-menu-title p-0" id="headingOne">
                      <a href="<?=base_url('Corder/my_order')?>" class="btn-block bg-transparent d-flex align-items-center p-0" type="button">
                          <img src="<?php echo base_url() ?>assets/img/my_order_history.png" class="d-inline pr-4" alt="">
                          <h4 class="d-inline">My Order History</h4>
                      </a>
                  </div>
              </div>
          </div>
          <div class="card border-none">
              <div class="card-header p-2" id="headingTwo">
                  <div class="card-header sidebar-menu-title p-0" id="headingOne">
                      <a href="<?=base_url('Corder/track_order_form')?>" class="btn-block bg-transparent d-flex align-items-center p-0" type="button">
                          <img src="<?php echo base_url() ?>assets/img/track_your_order.png" class="d-inline pr-4" alt="">
                          <h4 class="d-inline">Track Your Order</h4>
                      </a>
                  </div>
              </div>
          </div>
        <?php } ?>
        <div class="card border-none">
            <div class="card-header p-2" id="headingTwo">
                <div class="card-header sidebar-menu-title p-0" id="headingOne">
                    <a href="tel:+92 300 123 1234" class="btn-block bg-transparent d-flex align-items-center p-0" type="button">
                        <img src="<?php echo base_url() ?>assets/img/call_us.png" class="d-inline pr-4" alt="">
                        <h4 class="d-inline">Call Us</h4>
                    </a>
                </div>
            </div>
        </div>
        <div class="card border-none">
            <div class="card-header p-2" id="headingTwo">
                <div class="card-header sidebar-menu-title p-0" id="headingOne">
                    <a href="<?= is_null($users) ? base_url('Dashboard/user_authentication') : base_url('Dashboard/logout') ; ?>" class="btn-block bg-transparent d-flex align-items-center p-0" type="button">
                        <img src="<?php echo base_url() ?>assets/img/sign-in.png" class="d-inline pr-4" alt="">
                        <?php if(is_null($users)){?>
                           <h4 class="d-inline">Sign In</h4>
                        <?php } else{?>
                           <h4 class="d-inline">Sign Out</h4>
                        <?php } ?>
                    </a>
                </div>
            </div>
        </div>

</div>