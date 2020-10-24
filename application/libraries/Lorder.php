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
    public function checkout_detail_form() {
        $CI = & get_instance();
        $CI->load->model('Users');
        $CI->load->model('SiteSettings');
        $userAddress = $CI->Users->get_user_address();
        // print_r($userAddress);die;
        $data = array(
            'title' => 'Checkout',
            'userAddress' => $userAddress,
            'deliveryCharges' => $CI->SiteSettings->customSelect("delivery_charges")[0]["delivery_charges"]
        );
        return $CI->parser->parse('order/checkout_form', $data, true);
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
        $CI->load->model('SiteSettings');
        date_default_timezone_set('Asia/Karachi');
        $addressId = $CI->session->userdata("addressId");
        $deliveryTime = $CI->session->userdata("deliveryTime");
        $addressText = $CI->session->userdata("addressText");
        $addressId = $CI->session->userdata("addressId");
        if(!is_numeric($addressId) || empty($deliveryTime) || empty($addressText))
            redirect(base_url("Corder/checkout_form"));

        $parts = explode("__" , $deliveryTime);
        $deliveryDate = date('Y-m-d', strtotime($parts[0]));
        $dtFrom = date('Y-m-d H:i a', strtotime($parts[0]));
        $dtUpto = date('Y-m-d H:i a', strtotime($parts[1]));

        $orderDetail = json_decode($_POST['order']);
        $OV = 0;
        foreach ($orderDetail as $key => $eachProd) {
            $OV += $eachProd->quantity * $eachProd->price;
        }
        $currentDate = date('Y-m-d');
        $deliveryCharges = $deliveryDate == $currentDate ? $CI->SiteSettings->customSelect("delivery_charges")[0]["delivery_charges"] : 0;
        $data = array(
            'CustomerId' => $CI->session->userdata('user_id'),
            'OrderValue' => $OV,
            'Hash' => sha1($_POST['order']),
            'CreatedOn' => date_format(new DateTime(), 'Y-m-d H:i:s'),
            'DeliveryDate' => $deliveryDate,
            'DeliveryFrom' => $dtFrom,
            'DeliveryUpto' => $dtUpto,
            'DeliveryAddress' => $addressId,
            'deliveryCharges' => $deliveryCharges,
            'Status' => 1,
        );
        $orderId = $CI->Orders->place_order($data);
        if(is_numeric($orderId)){
            if($this->place_order_details($orderDetail, $orderId, $CI->Orders)){
                $CI->session->set_userdata("OV", $OV + $deliveryCharges);
                $CI->session->set_userdata("deliveryCharges", $deliveryCharges);
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
        
        foreach ($orderData as $key => $value) {
            $productObject = (object) [
                           'id' => $value['ItemId'],
                           'pName' => $value['ProductName'],
                           'price' => $value['Price'],
                           'img' => base_url().$value['ProductImg']
                       ];
            $orderData[$key]['Jsn'] = htmlentities(json_encode($productObject), ENT_QUOTES, 'UTF-8');
        }
        $orderDetailFormattedArr = Array();
        for ($i=0; $i < count($orderData); $i++) { 
            if(!$orderDetailFormattedArr[$orderData[$i]["OrderId"]])
                $orderDetailFormattedArr[$orderData[$i]["OrderId"]] = Array();
            array_push($orderDetailFormattedArr[$orderData[$i]["OrderId"]], $orderData[$i]);
        }
        $data = array(
            'title' => 'Manage Order',
            'orderData' => $orderDetailFormattedArr
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
        $data = array(
            'title' => 'Order Edit',
            'OrderData' => $order_detail
        );
        //echo "<pre>";print_r($data);die;
        return $CI->parser->parse('order/edit_order_form', $data, true);
    }

    public function admin_order_edit_data($OrderId) {
        $CI = & get_instance();
        $CI->load->model('Orders');
        $order_detail = $CI->Orders->retrieve_order_editdata($OrderId, true);
        foreach ($order_detail['OrderDetail'] as $k => $v) {
                $i++;
                $order_detail['OrderDetail'][$k]['sl'] = $i;
            }
        $data = array(
            'title' => 'Order Edit',
            'OrderData' => $order_detail,
            'OrderId' => $OrderId
        );
        //echo "<pre>";print_r($data);die;
        return $CI->parser->parse('order/admin_order_detail', $data, true);
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