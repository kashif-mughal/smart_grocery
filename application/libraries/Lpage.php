<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Lpage {

    public function t_and_c() {
        $CI = & get_instance();
        $data = array(
            'title' => 'Terms & Conditions'
        );
        $brandList = $CI->parser->parse('pages/tc', $data, true);
        return $brandList;
    }

    public function vision() {
        $CI = & get_instance();
        $data = array(
            'title' => 'Mission & Vision'
        );
        $brandList = $CI->parser->parse('pages/vision', $data, true);
        return $brandList;
    }

    public function brandstore() {
        $CI = & get_instance();
        $data = array(
            'title' => 'Mission & Vision'
        );
        $brandList = $CI->parser->parse('pages/brandstore', $data, true);
        return $brandList;
    }

    public function privacy() {
        $CI = & get_instance();
        $data = array(
            'title' => 'Privacy Policy'
        );
        $brandList = $CI->parser->parse('pages/privacy', $data, true);
        return $brandList;
    }

    public function faq() {
        $CI = & get_instance();
        $data = array(
            'title' => 'FAQs'
        );
        $brandList = $CI->parser->parse('pages/faq', $data, true);
        return $brandList;
    }

    public function returnandrefund() {
        $CI = & get_instance();
        $data = array(
            'title' => 'Return & Refund'
        );
        $brandList = $CI->parser->parse('pages/returnandrefund', $data, true);
        return $brandList;
    }

    public function categories() {
        $CI = & get_instance();
        $data = array(
            'title' => 'Categories'
        );
        $brandList = $CI->parser->parse('pages/categories', $data, true);
        return $brandList;
    }
}
?>