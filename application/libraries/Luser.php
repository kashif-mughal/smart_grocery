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
        $CI->load->library('lvalue');
        $value_list = $CI->lvalue->last_value();

        $data = array(
            'title' => 'Sauda Express | Value cart',
            'value_list' => $value_list
        );
        return $CI->parser->parse('user/value_cart', $data, true);
    }

}

?>