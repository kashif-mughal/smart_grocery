<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Csettings extends CI_Controller {

    function __construct() {
        parent::__construct();
        $this->auth->check_admin_auth();
        $this->load->library('lsetting');
        $this->load->model('SiteSettings');
    }

    //Default loading for brand system.
    public function index() {
        $content = $this->lsetting->setting_form();
        $this->template->full_admin_html_view($content);
    }
    public function update_site_settings(){
        $data = Array();
        $delivery_charges = $this->input->post('delivery_charges');
        $footer_text = $this->input->post('footer_text');

        if(!empty($delivery_charges))
            $data["delivery_charges"] = $delivery_charges;
        if(!empty($footer_text))
            $data["footer_text"] = trim($footer_text);

        $result = $this->SiteSettings->update($data, "setting_id", 1);

        if($result == true)
            $this->session->set_userdata(array('message' => 'Successfully Updated'));
        else
            $this->session->set_userdata(array('error_message' => "Something went wrong"));

        redirect(base_url('Csettings'));
    }
}
