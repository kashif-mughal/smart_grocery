<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Auth extends CI_Controller {

    function __construct() {
        parent::__construct();
        $this->load->model->('Auth');
    }    

    // Goto Login Page [POST CALL]
    public function login() {
        $this->load->library('form_validation');
        
        $email = $this->input->Post('inputLoginEmail');
        $password = $this->input->Post('inputLoginPassword');

        $this->form_validation->set_rules('inputLoginEmail', 'Email', 'required');
        $this->form_validation->set_rules('inputLoginPassword', 'Password', 'required');

        if($this->form_validation->run()) {
            // get user from table:(user_login) by user_id
            $user_login = $this->Auth->get_user_from_user_login($email, $password);

            if($user_login->num_rows() > 0) {
                $currentUser = $user_login->result_array();
                $this->load->library('session');
                $userData = array(
                    'username'  => $currentUser[0]['username'],
                    'logged_in' => TRUE
                );

                $this->session->set_userdata($userData);

                $result['response'] = "User logged in successfully";
                $result['status'] = 'Success';
                echo json_encode($result); 
            }
            else {
                $result['response'] = "User not found in our database";
                $result['status'] = 'Error';
                echo json_encode($result); 
            }    
        }
        else {
            $result['response'] = validation_errors();
            $result['status'] = 'Error';
            echo json_encode($result);
        }        
    }

    // Goto Register View Page
    public function register() {
        
        $data['country'] = $this->Auth->get_country();
        $data['city'] = $this->Auth->get_city();

        $this->load->view('registration',$data);
    }

    // Register User in db : Handles User Registration [POST CALL]
    public function updateUserRegistration() {
        $this->load->helper(array('form', 'url'));
        $this->load->library('form_validation');
        
        // Get Post Data
        $full_name = $this->input->Post('inputName');
        $email = $this->input->Post('inputEmail');
        $address = $this->input->Post('inputAddress');
        $country = $this->input->Post('selectCountry');
        $city = $this->input->Post('selectCity');
        $address_details = $this->input->Post('addressDetails');
        $password = $this->input->Post('inputPassword');
        $confirm_password = $this->input->Post('inputConfirmPassword');
        $user_id = $this->input->Post('userId');

        $this->form_validation->set_rules('inputName', 'Full Name', 'required');
        $this->form_validation->set_rules('inputEmail', 'Email Address', 'required');
        $this->form_validation->set_rules('inputAddress', 'Address', 'required');
        $this->form_validation->set_rules('selectCountry', 'Country', 'required');
        $this->form_validation->set_rules('selectCity', 'City', 'required');
        $this->form_validation->set_rules('inputPassword', 'Password', 'required');
        $this->form_validation->set_rules('inputConfirmPassword', 'Confirm Password', 'required|matches[inputPassword]');

        if($this->form_validation->run()) {
            // Update user
            //------------------
            // Get User by Id
            $user = $this->Auth->get_user_by_id($user_id);

            if($user->num_rows() > 0) {
                // Update user_login [username, password]
                //--------------------------------------- 
                $this->Auth->update_user_login($user_id, $email, $password);

                // Update users [firstname, email, city, country, address, address_details]
                $this->Auth->update_user($user_id, $full_name, $email, $city, $country, $address, $address_details);
            }
            else {
                $result['response'] = "User not found, Please verify your phone number first";
                $result['status'] = 'Error';
                echo json_encode($result); 
                return;
            }

            // Success Response
            $result['response'] = 'Form Validated';
            $result['status'] = 'Success';
            echo json_encode($result); 
            return;
        }
        else {
            $result['response'] = validation_errors();
            $result['status'] = 'Error';
            echo json_encode($result); 
        }
    }

    // Goto Welcome Page
    public function welcome() {
        if($this->session->userdata('logged_in') == TRUE) {
            echo "Welcome your are Logged In".`<a href='javascript:void(0)' id='userLoggedOut'>Logout</a>`;
        }
        else {
            echo "You are not Logged In";
        }
    }

    public function logout() {
        if($this->session->userdata('logged_in') == TRUE) {
            $this->session->sess_destroy();
        }
    }

    

    // Verify One Time Password
    public function otpVerify() {
        $otp_code = $this->input->Post('code');
        $user_id = $this->input->Post('userId');
        if(!isset($otp_code) && !isset($user_id)) {
            $result['response'] = 'OTP code is not valid';
            $result['status'] = 'Error';
            echo json_encode($result); 
        }
        else {
            $user_id = substr($user_id, 0, 20);
            // Get otp data from otp table
            $otpData = $this->Auth->get_otp_by_user_id($user_id);

            if($otpData->num_rows() > 0) {
                $userData = $otpData->result_array();
                $code = $userData[0]['code'];
                $expiryDate = new DateTime($userData[0]['expiry_date']);
                $expiryDateFinal = $expiryDate->format('Y-m-d H:i:s');

                if($userData[0]['verified'] == 1) {
                    $result['response'] = 'User '.'('. $user_id .') not found';
                    $result['user_found_in_otp'] = true;
                    $result['user_verified'] = true;
                    $result['status'] = 'Success';
                    echo json_encode($result); 
                }
                else {
                    // Current Date
                    $dateTime = new DateTime();
                    $currDate = $dateTime->format('Y-m-d H:i:s');

                    if($currDate >= $expiryDateFinal) {

                        $result['response'] = 'Code is expired, Please verify phone again, Expiry: '.$expiryDateFinal.', CurrentDate:'.$currDate;
                        $result['status'] = 'Error';
                        echo json_encode($result);    
                    }
                    else {
                        if($code == $otp_code) {// User Phone Verified
                            // Set Verified
                            $this->Auth->update_otp_verified($user_id);

                            // Response
                            $result['response'] = 'Verification Completed';
                            $result['user_found_in_otp'] = true;
                            $result['user_verified'] = true;
                            $result['status'] = 'Success';
                            echo json_encode($result);  
                        }
                        else {
                            $result['response'] = 'Please enter correct code';
                            $result['status'] = 'Error';
                            echo json_encode($result);   
                        }
                    }
                }               

            }
            else {
                $result['response'] = 'User '.'('. $user_id .') not found';
                $result['user_found_in_otp'] = false;
                $result['user_verified'] = false;
                $result['status'] = 'Error';
                echo json_encode($result); 
            }

        }
    }    

}