<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Lorder {

    //Sub order Add
    public function checkout_form() {
        $CI = & get_instance();
        $data = array(
            'title' => 'Checkout'
        );
        $orderForm = $CI->parser->parse('order/checkout', $data, true);
        return $orderForm;
    }

    //order Edit Data
    public function order_edit_data($OrderId) {
        $CI = & get_instance();
        $CI->load->model('Orders');
        $order_detail = $CI->Orders->retrieve_editdata('OrderId', $OrderId);

        $data = array(
            'title' => 'Order Edit',
            'OrderData' => $order_detail[0]
        );
        $chapterList = $CI->parser->parse('order/edit_order_form', $data, true);
        return $chapterList;
    }

}

?>