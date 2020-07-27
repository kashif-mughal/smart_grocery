<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Dashboard extends CI_Controller {

    function __construct() {
        parent::__construct();
        $this->template->current_menu = 'home';
    }

    public function index() {
        $CI = & get_instance();
        $this->load->library('lcategory');
        $CI->load->model('Products');
        $CI->load->model('Units');

        $product_list = $CI->Products->customSelect(
            '*', 'IsFeatured = 1', 20, 'ModifiedOn'
        );
        
        $catArray = $CI->lcategory->get_category_hierarchy();
        foreach($catArray as $key => $value) {
            $value->products = $CI->Categories->getCatPrducts($value->catId, 0, 8);
        }
        $activeCategories = $CI->Categories->get_active_categories();
        $activeCategoriesFlat = array();
        foreach($activeCategories as $value) {
            array_push($activeCategoriesFlat ,$value['CategoryId']);
        }

        $final_product_list = array();
        foreach($product_list as $prod => $value) {
            if (in_array($value['Category'], $activeCategoriesFlat)) {
                $unitId = $prod['Unit'];
                $currentUnit = $CI->Units->unit_search_item($value['Unit']);
                $value['UnitName'] = $currentUnit[0]['UnitName'];
                array_push($final_product_list,$value);
            }
        }
        $data = array(
            'title' => 'Sauda Express | Buy each and everything home grocery',
            'CatList' => $catArray,
            'ProdList' => $final_product_list
        );
        $content = $CI->parser->parse('include/home', $data, true);
        $this->template->full_html_view($content);
    }

    public function login() {
        if ($this->auth->is_logged()) {
            $this->output->set_header("Location: " . base_url() . 'Dashboard', TRUE, 302);
        }
        $data['title'] = 'login_area';
        $content = $this->parser->parse('user/login_form', $data, true);
        $this->template->full_html_view($content);
    }

    #==============Valid user check=======#

    public function do_login() {
        $error = '';
        $this->load->model('Web_settings');
        $setting_detail = $this->Web_settings->retrieve_setting_editdata();
        if ($setting_detail[0]['captcha'] == 0 && $setting_detail[0]['secret_key'] != null && $setting_detail[0]['site_key'] != null) {

            $this->form_validation->set_rules('g-recaptcha-response', 'recaptcha validation', 'required|callback_validate_captcha');
            $this->form_validation->set_message('validate_captcha', 'Please check the the captcha form');

            if ($this->form_validation->run() == FALSE) {
                $this->session->set_userdata(array('error_message' => display('please_enter_valid_captcha')));
                $this->output->set_header("Location: " . base_url() . 'Dashboard/login', TRUE, 302);
            } else {
                $username = $this->input->post('username');
                $password = $this->input->post('password');
                if ($username == '' || $password == '' || $this->auth->login($username, $password) === FALSE) {
                    $error = display('wrong_username_or_password');
                }
                if ($error != '') {
                    $this->session->set_userdata(array('error_message' => $error));
                    $this->output->set_header("Location: " . base_url() . 'Dashboard/login', TRUE, 302);
                } else {
                    $this->output->set_header("Location: " . base_url(), TRUE, 302);
                }
            }
        } else {
            $username = $this->input->post('username');
            $password = $this->input->post('password');
            if ($username == '' || $password == '' || $this->auth->login($username, $password) === FALSE) {
                $error = display('wrong_username_or_password');
            }
            if ($error != '') {
                $this->session->set_userdata(array('error_message' => $error));
                $this->output->set_header("Location: " . base_url() . 'Dashboard/login', TRUE, 302);
            } else {
                $this->output->set_header("Location: " . base_url(), TRUE, 302);
            }
        }
    }

    //Valid captcha check
    function validate_captcha() {
        $setting_detail = $this->Web_settings->retrieve_setting_editdata();
        $captcha = $this->input->post('g-recaptcha-response');
        $response = file_get_contents("https://www.google.com/recaptcha/api/siteverify?secret=" . $setting_detail[0]['secret_key'] . ".&response=" . $captcha . "&remoteip=" . $_SERVER['REMOTE_ADDR']);
        if ($response . 'success' == false) {
            return FALSE;
        } else {
            return TRUE;
        }
    }

    #===============Logout=======#

    public function logout() {
        if ($this->auth->logout())
            $this->output->set_header("Location: " . base_url() . 'Dashboard/login', TRUE, 302);
    }

    #=============Edit Profile======#

    public function edit_profile() {
        $CI = & get_instance();
        $this->auth->check_auth();
        $CI->load->library('luser');
        $content = $CI->luser->edit_profile_form();
        $this->template->full_html_view($content);
    }

    #=============Update Profile========#

    public function update_profile() {
        $CI = & get_instance();
        $this->auth->check_auth();
        $CI->load->model('Users');
        $this->Users->profile_update();
        $this->session->set_userdata(array('message' => display('successfully_updated')));
        redirect(base_url('Dashboard/edit_profile'));
    }

    #=============Change Password=========# 

    public function change_password_form() {
        $CI = & get_instance();
        $this->auth->check_auth();
        $content = $CI->parser->parse('user/change_password', array('title' => display('change_password')), true);
        $this->template->full_html_view($content);
    }

    #============Change Password===========#f

    public function change_password() {
        $CI = & get_instance();
        $this->auth->check_auth();
        $CI->load->model('Users');

        $error = '';
        $email = $this->input->post('email');
        $old_password = $this->input->post('old_password');
        $new_password = $this->input->post('password');
        $repassword = $this->input->post('repassword');

        if ($email == '' || $old_password == '' || $new_password == '') {
            $error = display('blank_field_does_not_accept');
        } else if ($email != $this->session->userdata('user_email')) {
            $error = display('you_put_wrong_email_address');
        } else if (strlen($new_password) < 6) {
            $error = display('new_password_at_least_six_character');
        } else if ($new_password != $repassword) {
            $error = display('password_and_repassword_does_not_match');
        } else if ($CI->Users->change_password($email, $old_password, $new_password) === FALSE) {
            $error = display('you_are_not_authorised_person');
        }

        if ($error != '') {
            $this->session->set_userdata(array('error_message' => $error));
            $this->output->set_header("Location: " . base_url() . 'Dashboard/change_password_form', TRUE, 302);
        } else {
            $this->session->set_userdata(array('message' => display('successfully_changed_password')));
            $this->output->set_header("Location: " . base_url() . 'Dashboard/change_password_form', TRUE, 302);
        }
    }

    #============User Authentication=======#

    public function user_authentication() {
        $CI = & get_instance();
        $CI->load->model('Auths');

        $data['title'] = 'Sauda Express | Buy each and everything home grocery';
        $data['countries'] = $CI->Auths->get_country();
        $data['cities'] = $CI->Auths->get_city();
        $content = $this->parser->parse('users/registration', $data, true);
        $this->template->full_html_view($content);
    }

    

    // Verify Phone Number
    public function phoneVerify() {        
        $CI = & get_instance();
        $CI->load->model('Auths');

        $phone_number = $this->input->Post('phone');

        if(!isset($phone_number)) {
            $result['response'] = 'Phone number is not valid';
            $result['status'] = 'Error';
            echo json_encode($result);
            return;     
        }

        // Check if this phone number is already registered
        $db_phone = $CI->Auths->phone_registered($phone_number);

        if($db_phone->num_rows() > 0) {
            $phoneExist = $db_phone->result_array();
            // Verify Phone
            if($phoneExist[0]['verified'] == 0) { // User Exist but phone not verified
                $fourRandomDigit = mt_rand(1000,9999); // 4 digit OTP Code
                $dateTime = new DateTime();
                $date = $dateTime->format('Y-m-d H:i:s');
                $currentDate = strtotime($date);
                $futureDate = $currentDate+(60*5);
                $formatDate = date("Y-m-d H:i:s", $futureDate); // Current Date + 5 minutes
                
                // Update new otp code and set expiry date
                $CI->Auths->update_otp_code($fourRandomDigit, $formatDate, $phone_number);

                //$messageSend = $this->sendmessage($phone_number, $fourRandomDigit);

                $result['response'] = 'We have send message to your phone number, Please verify your account';
                $result['status'] = 'Success';
                $result['phone_exist'] = true;
                $result['phone_verified'] = false;
                $result['userId'] = $phoneExist[0]['user_id'];
                echo json_encode($result);    
                return;    
                
            }
            else { // User Exist and Verified

                $result['response'] = 'Please register your account';
                $result['status'] = 'Success';
                $result['phone_exist'] = false;
                $result['phone_verified'] = true;
                $result['userId'] = $phoneExist[0]['user_id'];
                echo json_encode($result);
                return;
            }
            
        }
        else {
            // Steps:
            // ------
            // - Create Hash for UserId
            $permitted_chars = '0123456789abcdefghijklmnopqrstuvwxyz';
            $userId = Sha1(substr(str_shuffle($permitted_chars), 0, 10));
            $user_id = substr($userId, 0, 20);
            // - Store User with UserId and phone number in table:(user_login)
            $CI->Auths->insert_user_login($user_id);            

            // insert users table
            $CI->Auths->insert_user($user_id, $phone_number);
            
            // - Add Entry in table:(otp) with randomly generated 4-digit code and 5 min expiry
            $fourRandomDigit = mt_rand(1000,9999);
            $dateTime = new DateTime();
            $date = $dateTime->format('Y-m-d H:i:s');
            $currentDate = strtotime($date);
            $futureDate = $currentDate+(60*5);
            $formatDate = date("Y-m-d H:i:s", $futureDate);
            
            $CI->Auths->insert_otp_data($phone_number, $user_id, $fourRandomDigit, $formatDate);

            //$messageSend = $this->sendmessage($phone_number, $fourRandomDigit);

            //Response
            $result['response'] = 'We have send message to your phone number Please verify your account';
            $result['userId'] = $user_id;
            $result['status'] = 'Success';
            echo json_encode($result);
        }        
    }

    // Checkout
    public function checkout() {
        if ($this->auth->is_logged()) {
            $this->output->set_header("Location: " . base_url() . 'Dashboard', TRUE, 302);
        }
        else {
            $retString = "?ret_url=".$_SERVER['HTTP_REFERER']."";
            redirect(base_url('Dashboard/user_authentication'.$retString));
        }
    }
}
