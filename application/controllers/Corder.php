<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Corder extends CI_Controller {

    public $menu;

    function __construct() {
        parent::__construct();
        $this->load->library('auth');
        $this->load->library('lorder');
        $this->load->library('session');
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

    //Manage order form
    public function manage_order() {
        $content = $this->lorder->order_list();
        $this->template->full_html_view($content);
        
    }

    //Insert order and upload
    public function insert_order() {

        $data = array(
            'OrderName' => $this->input->post('OrderName'),
            'CreatedOn' => date_format(new DateTime(), 'Y-m-d H:i:s'),
            'Status' => 1
        );

        $result = $this->Orders->order_entry($data);

        if ($result == TRUE) {
            $this->session->set_userdata(array('message' => 'Successfully Added'));
            if (isset($_POST['add-customer'])) {
                redirect(base_url('Corder/manage_order'));
            } elseif (isset($_POST['add-customer-another'])) {
                redirect(base_url('Corder'));
            }
        } else {
            $this->session->set_userdata(array('error_message' => 'Already Inserted'));
            redirect(base_url('Corder'));
        }
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
