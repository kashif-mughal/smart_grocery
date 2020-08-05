<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class User extends CI_Controller {

    public $user_id;

    function __construct() {
        parent::__construct();
        $this->load->library('luser');
        $this->load->model('Users');
    }

    #==============User page load============#

    public function index() {
        // $content = $this->lusers->user_add_form();
        // $this->template->full_admin_html_view($content);
    }

    #=============Edit Profile======#

    public function edit_profile() {
        $CI = & get_instance();
        $this->auth->check_auth();
        $content = $CI->luser->edit_user_profile_form();
        $this->template->full_html_view($content);
    }

    #=============Update Profile========#

    public function update_profile() {
        $CI = & get_instance();
        $this->auth->check_auth();
        $this->Users->profile_update('user');
        $this->session->set_userdata(array('message' => display('successfully_updated')));
        redirect(base_url('User/edit_profile'));
    }

    public function value_cart() {
        $CI = & get_instance();
        $this->auth->check_auth();
        $content = $CI->luser->user_value_cart();
        $this->template->full_html_view($content);
    }

}
