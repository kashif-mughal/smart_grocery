<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Lorder {

    public function index(){}

    //Sub order Add
    public function checkout_form() {
        $CI = & get_instance();
        $data = array(
            'title' => 'Checkout'
        );
        return $CI->parser->parse('order/checkout', $data, true);
    }

    public function proceed_to_checkout($orderId) {
        $CI = & get_instance();
        $orderData = json_decode($_POST['order']);
        $OV = 0;
        foreach ($orderData as $key => $eachProd) {
            $OV += $eachProd->quantity * $eachProd->price;
            $eachProd->price = number_format($eachProd->price, 2);
            $eachProd->total = number_format($eachProd->price * $eachProd->quantity, 2);
        }
        $data = array(
            'title' => 'Proceed to checkout',
            'orderDetail' => $orderData,
            'userData' => $CI->session->userdata(),
            'orderId' => $orderId,
            'OV' => $OV
        );
        return $CI->parser->parse('order/proceed_to_checkout', $data, true);
    }
    
    public function place_order(){
        $CI = & get_instance();
        $CI->load->model('Orders');
        $orderDetail = json_decode($_POST['order']);
        $OV = 0;
        foreach ($orderDetail as $key => $eachProd) {
            $OV += $eachProd->quantity * $eachProd->price;
        }
        $data = array(
            'CustomerId' => $CI->session->userdata('user_id'),
            'OrderValue' => $OV,
            'Hash' => sha1($_POST['order']),
            'CreatedOn' => date_format(new DateTime(), 'Y-m-d H:i:s'),
            'Status' => 1,
        );
        $orderId = $CI->Orders->place_order($data);
        if(is_numeric($orderId)){
            if($this->place_order_details($orderDetail, $orderId, $CI->Orders)){
                return $orderId;
            }else{
                return 'Something went wrong!!';
            }
        }
        else{
            return 'Already Inserted';
        }
    }

    private function place_order_details($orderDetail, $orderId, $ordersObj){
        foreach ($orderDetail as $key => $eachProd) {
            $OV += $eachProd->quantity * $eachProd->price;
            $data = array(
                'OrderId' => $orderId,
                'ItemId' => $eachProd->id,
                'ItemQuantity' => $eachProd->quantity,
                'SoldPrice' => $eachProd->price,
                'CreatedOn' => date_format(new DateTime(), 'Y-m-d H:i:s'),
                'Status' => 1,
            );
            $ordersObj->place_order_details($data);
        }
        return true;
    }

    public function order_list(){
        $CI = & get_instance();
        $CI->load->model('Orders');
        $orderData = $CI->Orders->retrieve_user_orders();
        if (!empty($orderData)) {
            foreach ($orderData as $k => $v) {
                $i++;
                $orderData[$k]['sl'] = $i + $CI->uri->segment(3);
            }
        }
        $data = array(
            'title' => 'Manage Order',
            'orderData' => $orderData
        );
        return $CI->parser->parse('order/order_list', $data, true);
    }

    public function view_orders($links, $perpage, $page, $pageText, $pageTitle){
        $CI = & get_instance();
        $CI->load->model('Orders');
        $orderData = $CI->Orders->retrieve_orders($perpage, $page);
        if (!empty($orderData)) {
            foreach ($orderData as $k => $v) {
                $i++;
                $orderData[$k]['sl'] = $i + $CI->uri->segment(3);
            }
        }
        $data = array(
            'title' => $pageTitle,
            'orderData' => $orderData,
            'links' => $links
        );
        return $CI->parser->parse($pageText, $data, true);
    }

    //order Edit Data
    public function order_edit_data($OrderId) {
        $CI = & get_instance();
        $CI->load->model('Orders');
        $order_detail = $CI->Orders->retrieve_order_editdata($OrderId);
//echo '<pre>';print_r($order_detail);die;
        $data = array(
            'title' => 'Order Edit',
            'OrderData' => $order_detail
        );
        return $CI->parser->parse('order/edit_order_form', $data, true);
    }
    //order Traking Form
    public function track_order_form() {
        $CI = & get_instance();
        $data = array(
            'title' => 'Track your order'
        );
        return $CI->parser->parse('order/order_traking_form', $data, true);
    }

}

?>