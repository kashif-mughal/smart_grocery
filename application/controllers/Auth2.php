<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Auth2 extends CI_Controller {

    function __construct() {
        parent::__construct();
        $this->load->model('auths');
    }    

    

    // Goto Login Page [POST CALL]
    public function login() {

        $email = $this->input->Post('inputLoginEmail');
        $password = $this->input->Post('inputLoginPassword');

        $this->form_validation->set_rules('inputLoginEmail', 'Email', 'required');
        $this->form_validation->set_rules('inputLoginPassword', 'Password', 'required');

        if($this->form_validation->run()) {
            // get user from table:(user_login) by user_id
            $user_login = $this->auths->user_login($email, $password);
            
            if($user_login) {

                $url = $_SERVER['HTTP_REFERER'];
                if(strpos($url,"?ret_url=")) {
                    $returnURL = substr($url,(strpos($url,"?ret_url=")+9));    
                }
                else {
                    $returnURL = FALSE;
                }

                $result['response'] = "User logged in successfully";
                $result['redirectUrl'] = $returnURL;
                $result['status'] = 'Success';
                echo json_encode($result);
            }
            else {
                $result['response'] = "Username or Password is wrong";
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


    // Register User in db : Handles User Registration [POST CALL]
    public function updateUserRegistration() {
        $this->load->helper(array('form', 'url'));
        
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
            $user = $this->auths->get_user_by_id($user_id);
            $user_by_email = $this->auths->get_user_by_email($email);

            $url = $_SERVER['HTTP_REFERER'];
            if(strpos($url,"?ret_url=")) {
                $returnURL = substr($url,(strpos($url,"?ret_url=") + 9));    
            }
            else {
                $returnURL = false;
            }


            if($user->num_rows() > 0) {
                // Update user_login [username, password]
                //--------------------------------------- 
                $this->auths->update_user_login($user_id, $email, $password);

                // Update users [firstname, email, city, country, address, address_details]
                $this->auths->update_user($user_id, $full_name, $email, $city, $country, $address, $address_details);
            }
            else if($user_by_email->num_rows() > 0) {
                $userDetails = $user_by_email->result_array();

                //Check user details is available
                if($userDetails[0]['username'] != '' && $userDetails[0]['password'] != '' && $userDetails[0]['address'] != '') {
                    // logged in user
                    $this->auths->user_login($userDetails['username'], $userDetails['password']);

                    // Response
                    $result['response'] = 'User by Email is Available, Logging in';
                    $result['user_details_available'] = true;
                    $result['redirectUrl'] = $returnURL;
                    $result['status'] = 'Success';
                    echo json_encode($result);
                    return;
                }
                // Update user_login [username, password]
                //--------------------------------------- 
                $this->auths->update_user_login($email_user['user_id'], $email, $password);

                // Update users [firstname, email, city, country, address, address_details]
                $this->auths->update_user($email_user['user_id'], $full_name, $email, $city, $country, $address, $address_details);  

                $result['response'] = 'User by Email is Available, Logging in';
                $result['user_details_available'] = false;
                $result['redirectUrl'] = $returnURL;
                $result['status'] = 'Success';
                echo json_encode($result);
                return; 
            }
            else {
                $result['response'] = "User not found, Please verify your phone number first";
                $result['user_details_available'] = false;
                $result['redirectUrl'] = false; 
                $result['status'] = 'Error';
                echo json_encode($result); 
                return;
            }

            // Success Response
            // $url = $_SERVER['HTTP_REFERER'];
            // if(strpos($url,"?ret_url=")) {
            //     $returnURL = substr($url,(strpos($url,"?ret_url=") + 9));    
            // }
            // else {
            //     $returnURL = FALSE;
            // }

            
            $result['response'] = 'Form Validated';
            $result['user_details_available'] = false;
            $result['redirectUrl'] = $returnURL;
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
        //echo '<pre>';print_r($_SERVER['HTTP_REFERER']);die;
        if($this->auth->is_logged()) {
            echo "Welcome your are Logged In".`<a href='javascript:void(0)' id='userLoggedOut'>Logout</a>`;
        }
        else {
            echo "You are not Logged In";
        }
    }

    public function logout() {
        if ($this->auth->logout())
            $this->output->set_header("Location: " . base_url() . 'Admin_dashboard/login', TRUE, 302);
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
            $otpData = $this->auths->get_otp_by_user_id($user_id);

            if($otpData->num_rows() > 0) {
                $userData = $otpData->result_array();
                $code = $userData[0]['code'];
                $expiryDate = new DateTime($userData[0]['expiry_date']);
                $expiryDateFinal = $expiryDate->format('Y-m-d H:i:s');

                if($userData[0]['verified'] == 1) {

                    // check user details is available
                    $userDetails = $this->auths->get_user_detail($user_id);
                    if(!$userDetails) {
                        // Response: Send to User Registration Form
                        $result['response'] = 'Verification Completed, But User details is not available';
                        $result['user_found_in_otp'] = true;
                        $result['user_verified'] = true;
                        $result['user_details_available'] = false;
                        $result['redirectUrl'] = false;
                        $result['status'] = 'Success';
                        echo json_encode($result);
                        return;       
                    }

                    if($userDetails[0]['username'] != '' && $userDetails[0]['password'] != '' && $userDetails[0]['address'] != '') {
                        // logged in user
                        $this->auths->user_login($userDetails['username'], $userDetails['password']);

                        $url = $_SERVER['HTTP_REFERER'];
                        if(strpos($url,"?ret_url=")) {
                            $returnURL = substr($url,(strpos($url,"?ret_url=") + 9));    
                        }
                        else {
                            $returnURL = false;
                        }

                        // Response
                        $result['response'] = 'Verification Completed, User Already Exist';
                        $result['user_found_in_otp'] = true;
                        $result['user_verified'] = true;
                        $result['user_details_available'] = true;
                        $result['redirectUrl'] = $returnURL;
                        $result['status'] = 'Success';
                        echo json_encode($result);
                    }
                    else {
                        $result['response'] = 'Verification Completed, User detail not available';
                        $result['user_found_in_otp'] = true;
                        $result['user_verified'] = true;
                        $result['user_details_available'] = false;
                        $result['redirectUrl'] = false;
                        $result['status'] = 'Success';
                        echo json_encode($result);
                    }
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
                            $this->auths->update_otp_verified($user_id);

                            // Check if user details available
                            $userDetails = $this->auths->get_user_detail($user_id);

                            if(!$userDetails) {
                                // Response: Send to User Registration Form
                                $result['response'] = 'Verification Completed, But User details is not available';
                                $result['user_found_in_otp'] = true;
                                $result['user_verified'] = true;
                                $result['user_details_available'] = false;
                                $result['redirectUrl'] = false;
                                $result['status'] = 'Success';
                                echo json_encode($result);
                                return;       
                            }

                            if($userDetails[0]['username'] != '' && $userDetails[0]['password'] != '' && $userDetails[0]['address'] != '') {
                                // logged in user
                                $this->auths->user_login($userDetails['username'], $userDetails['password']);

                                $url = $_SERVER['HTTP_REFERER'];
                                if(strpos($url,"?ret_url=")) {
                                    $returnURL = substr($url,(strpos($url,"?ret_url=") + 9));    
                                }
                                else {
                                    $returnURL = false;
                                }

                                // Response
                                $result['response'] = 'Verification Completed, User Already Exist';
                                $result['user_found_in_otp'] = true;
                                $result['user_verified'] = true;
                                $result['user_details_available'] = true;
                                $result['redirectUrl'] = $returnURL;
                                $result['status'] = 'Success';
                                echo json_encode($result);
                            }
                            else {
                                $result['response'] = 'Verification Completed, User detail not available';
                                $result['user_found_in_otp'] = true;
                                $result['user_verified'] = true;
                                $result['user_details_available'] = false;
                                $result['redirectUrl'] = false;
                                $result['status'] = 'Success';
                                echo json_encode($result);
                            }

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