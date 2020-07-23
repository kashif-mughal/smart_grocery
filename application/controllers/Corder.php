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
        $content = $this->lorder->order_add_form();
        $this->template->full_html_view($content);
    }

    //Checkout formm
    public function checkout() {
        $content = $this->lorder->checkout_form();
        $this->template->full_html_view($content);
    }

    //Proceed to checkout
    public function proceed_to_checkout(){
        if(empty($this->input->post('order'))){
            $this->session->set_userdata(array('error_message' => 'Missing Order Detail'));
            redirect(base_url('Corder/checkout'));
        }
        $result = $this->lorder->place_order();
        
        if ($result == TRUE) {
            $this->session->set_userdata(array('message' => 'Successfully Added'));
            $content = $this->lorder->proceed_to_checkout();
            $this->template->full_html_view($content);
        } else {
            $this->session->set_userdata(array('error_message' => $result));
            redirect(base_url('Corder/checkout'));
        }
    }











    //Manage order form
    public function manage_order() {
        $content = $this->lorder->order_list();
        $this->template->full_html_view($content);
        
    }

    //order Update Form
    public function order_update_form($orderId) {
        $content = $this->lorder->order_edit_data($orderId);
        $this->template->full_html_view($content);
    }

    // order Update
    public function order_update() {
        $orderId = $this->input->post('OrderId');
        $data = array(
            'OrderName' => $this->input->post('OrderName')
        );
        $this->Orders->update($data, 'OrderId', $orderId);
        $this->session->set_userdata(array('message' => display('successfully_updated')));
        redirect(base_url('Corder/manage_order'));
    }

    // order delete
    public function order_delete() {
        $orderId = $_POST['OrderId'];
        $this->Orders->soft_delete_by_key('OrderId', $orderId);
        return true;
    }

}
