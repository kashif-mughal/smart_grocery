<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Corder extends CI_Controller {

    public $menu;

    function __construct() {
        parent::__construct();
        $this->load->library('lorder');
        $this->load->model('Orders');
    }

    //Default loading for order system.
    public function index() {
        //print_r("expression");die;
        $CI = & get_instance();
        if (!$this->auth->is_logged() || !$this->auth->is_admin()) {
            $this->output->set_header("Location: " . base_url("Dashboard/user_authentication"), TRUE, 302);
        }
        //$content = $this->lorder->view_orders();
        //print_r($_SERVER['QUERY_STRING']);
        $paginationConfig = $this->Orders->get_pagination_config('Corder/index');
        $this->pagination->initialize($paginationConfig);
        $page = ($this->uri->segment(3)) ? $this->uri->segment(3) : 0;
        $links = $this->pagination->create_links();
        $content = $this->lorder->view_orders($links, $paginationConfig["per_page"], $page, "order/orders","Manage Orders");


        $this->template->full_admin_html_view($content);
    }

    //Checkout formm
    public function checkout() {
        $content = $this->lorder->checkout_form();
        $this->template->full_html_view($content);
    }

    //Proceed to checkout
    public function proceed_to_checkout(){
        $CI = & get_instance();
        if (!$this->auth->is_logged()) {
            $retString = "?ret_url=".base_url('Corder/checkout');
            $this->output->set_header("Location: " . base_url('Dashboard/user_authentication'.$retString), TRUE, 302);
        }
        if(empty($this->input->post('order'))){
            $this->session->set_userdata(array('error_message' => 'Missing Order Detail'));
            redirect(base_url('Corder/checkout'));
        }
        $result = $this->lorder->place_order();
        
        if (is_numeric($result)) {
            $this->session->set_userdata(array('message' => 'Successfully Added'));
            $content = $this->lorder->proceed_to_checkout($result);
            $this->template->full_html_view($content);
        } else {
            $this->session->set_userdata(array('error_message' => $result));
            redirect(base_url('Corder/checkout'));
        }
    }
    //User order form
    public function my_order() {
        $CI = & get_instance();
        if (!$this->auth->is_logged()) {
            $this->output->set_header("Location: " . base_url() . 'login', TRUE, 302);
        }
        $content = $this->lorder->order_list();
        $this->template->full_html_view($content);
    }
    //order Update Form
    public function order_detail_form($orderId = null) {
        if(empty($orderId))
            $this->output->set_header("Location: " . base_url() . 'dashboard', TRUE, 302);
        $CI = & get_instance();
        if (!$this->auth->is_logged()) {
            $this->output->set_header("Location: " . base_url() . 'login', TRUE, 302);
        }
        $customerId = $this->Orders->get_order_customer($orderId);
        if(!$this->auth->authenticated_user_or_admin()){
            $this->output->set_header("Location: " . base_url() . 'dashboard', TRUE, 302);
        }
        if(!is_array($customerId)){
            $this->output->set_header("Location: " . base_url() . 'dashboard', TRUE, 302);
        }
        $content = $this->lorder->order_edit_data($orderId);
        $this->template->full_html_view($content);
    }
    // order delete
    public function order_delete() {
        $CI = & get_instance();
        if (!$this->auth->is_logged()) {
            $this->output->set_header("Location: " . base_url() . 'login', TRUE, 302);
        }
        $orderId = $_POST['OrderId'];
        $this->Orders->soft_delete_by_key('OrderId', $orderId);
        return true;
    }

}
