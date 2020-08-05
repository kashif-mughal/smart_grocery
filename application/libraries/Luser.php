<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Luser {

    //Login....
    public function edit_profile_form() {
        $CI = & get_instance();
        $CI->load->model('Users');
        $edit_data = $CI->Users->profile_edit_data();
        $data = array(
            'title' => display('update_profile'),
            'first_name' => $edit_data[0]['first_name'],
            'last_name' => $edit_data[0]['last_name'],
            'user_name' => $edit_data[0]['username'],
            'logo' => $edit_data[0]['logo']
        );
        $profile_data = $CI->parser->parse('user/edit_profile', $data, true);
        return $profile_data;
    }

    //Login....
    public function edit_user_profile_form() {
        $CI = & get_instance();
        $CI->load->model('Users');
        $edit_data = $CI->Users->profile_edit_data();
        $data = array(
            'title' => display('update_profile'),
            'first_name' => $edit_data[0]['first_name'],
            'last_name' => $edit_data[0]['last_name'],
            'user_name' => $edit_data[0]['username'],
            'logo' => $edit_data[0]['logo']
        );
        return $CI->parser->parse('user/user_edit_profile', $data, true);
    }

    public function user_value_cart(){
        $CI = & get_instance();
        $CI->load->model('Products');
        $products = $CI->Products->get_value_cart_products();
        $finalProducts = Array();
        for ($i=0; $i < count($products); $i++) {
            $pid = $products[$i]['ProductId'];
            $filteredArray = array_filter($finalProducts, function($toCheck) use ($pid) { 
                return $toCheck['ProductId'] == $pid; 
            });
            if(count($filteredArray) > 0)
                continue;
            $productObject = (object) [
                           'id' => $products[$i]['ProductId'],
                           'pName' => $products[$i]['ProductName'],
                           'price' => $products[$i]['SalePrice'],
                           'img' => base_url().$products[$i]['ProductImg']
                       ];
                       $products[$i]['Jsn'] = htmlentities(json_encode($productObject), ENT_QUOTES, 'UTF-8');
            array_push($finalProducts, $products[$i]);
        }
        $data = array(
            'title' => 'Sauda Express | Value cart',
            'products' => $finalProducts
        );
        return $CI->parser->parse('user/value_cart', $data, true);
    }

}

?>