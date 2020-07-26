<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Auth extends CI_Model {	
	public function __construct() {
        parent::__construct();
    }

    // ======================================================================================
    // =============================== GET FUNCTIONS ========================================
    // ======================================================================================

    // Get user from user_login table by email and password
    public function get_user_from_user_login($email, $password) {
    	$this->db->where('username', $email);
        $this->db->where('password', md5($password));
        $this->db->where('status', 1);
        $query = $this->db->get('user_login');

        return $query;
    }

    // Get user from user_login table by user id
    public function get_user_by_id($user_Id) {
    	$this->db->where('user_id', $user_id);
        $this->db->where('status', 1);
        $query = $this->db->get('user_login');

        reutrn $query;
    }

    // Get OTP Data by User Id
    public function get_otp_by_user_id($user_id) {
    	$this->db->where('user_id', $user_id);
        $query = $this->db->get('otp');

        return $query;
    }

    // ======================================================================================
    // =============================== GET FUNCTIONS ========================================
    // ======================================================================================

    // xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

    // ======================================================================================
    // =============================== UPDATE FUNCTIONS =====================================
    // ======================================================================================

    public function update_user_login($user_id, $email, $password) {
    	$this->db->where('user_id', $user_id);
        $this->db->set('username',$email);
        $this->db->set('password',md5($password));
        $this->db->update('user_login');
        return TRUE;
    }

    public function update_user($user_id, $full_name, $email, $city, $country, $address, $address_details) {
    	$this->db->where('user_id', $user_id);
        $this->db->set('first_name',$full_name);
        $this->db->set('email', $email);
        $this->db->set('city', $city);
        $this->db->set('country', $country);
        $this->db->set('address', $address);
        $this->db->set('address_details', $address_details);
        $this->db->update('users');
        return TRUE;
    }

    public function update_otp_code($fourRandomDigit, $formatDate, $phone_number) {
    	$otp_data = array(
            'code' => $fourRandomDigit,
            'expiry_date' => $formatDate
        );
        $this->db->where('phone_number', $phone_number);
        $this->db->update('otp', $otp_data);
    }

    public function update_otp_verified() {
    	$this->db->where('user_id', $user_id);
        $this->db->set('verified', 1);
        $this->db->update('otp');

        return TRUE;
    }

    public function phone_registered($phone_number) {
    	$this->db->where('phone_number', $phone_number);
        $db_phone = $this->db->get('otp');

        return $db_phone;
    }

    // ======================================================================================
    // =============================== UPDATE FUNCTIONS =====================================
    // ======================================================================================

    // xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

    // ================================================================================
    // ======================= INSERT DATA ============================================
    // ================================================================================

    public function insert_user_login($user_id) {
    	$user_login_data = array(
		    'user_id' => $user_id,
		    'user_type' => 2,
		    'status' => 1
		);
		$this->db->insert('user_login', $user_login_data);
		return TRUE:
    }

    public function insert_user($user_id, $phone_number) {
    	$user_data = array(
            'user_id' => $user_id,
            'phone' => $phone_number,
            'status' => 1
        );
        $this->db->insert('users', $user_data);
    }

    public function insert_otp_data($phone_number, $user_id, $fourRandomDigit, $formatDate) {
    	$otp_data = array(
            'phone_number' => $phone_number,
            'user_id' => $user_id,
            'code' => $fourRandomDigit,
            'expiry_date' => $formatDate,
            'verified' => 0
        );
        $this->db->insert('otp', $otp_data);
        return TRUE;
    }



    // ================================================================================
    // ======================= INSERT DATA ============================================
    // ================================================================================

    // xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

    // ================================================================================
    // ======================= PRIVATE FUNCTIONS ======================================
    // ================================================================================
    // ****** GET COUNTRY *******
    public function get_country() {
    	$country_Query = $this->db->query("SELECT * FROM places WHERE level = 0");
        if($country_Query->num_rows() > 0) {
           return $country_Query->result_array();
        }
        return False;
    }
    // ****** GET CITY ******
    public function get_city() {
    	$city_Query = $this->db->query("SELECT * FROM places WHERE level = 1");
        if($city_Query->num_rows() > 0) {
            return $city_Query->result_array();
        }
        return False;
    }
    // ****** SEND SMS *******
    private function sendmessage($to_phone_number, $otp_code) {
        // JSON response Example ======================================
        // $data['phone'] = $to_phone_number;
        // $data['message'] = $to_message; //need to assign event here
        // $response['responsedata'] = $data;

        // echo json_encode($response);
        // JSON response Example Ends ======================================

        if($to_phone_number && $otp_code) {
            $From = "923132791656"; ///Your Username
            $password = "Master@1"; ///Your Password
            $To = $to_phone_number; ///Recepient Mobile Number
            $sender = "Sauda Express";
            $code = $otp_code;
        
            // sending sms
            $message = "Your OTP Code is ". $code;
            $post = "sender=".urlencode($sender)."&mobile=".urlencode($To)."&message=".urlencode($message)."";
            $url = "https://sendpk.com/api/sms.php?username=$From&password=$password";
            $ch = curl_init();
            $timeout = 30; // set to zero for no timeout
            curl_setopt($ch, CURLOPT_USERAGENT, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)');
            curl_setopt($ch, CURLOPT_URL,$url);
            curl_setopt($ch, CURLOPT_POST, true);
            curl_setopt($ch, CURLOPT_POSTFIELDS,$post);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
            curl_setopt ($ch, CURLOPT_CONNECTTIMEOUT, $timeout);        
        
            $result['response'] = curl_exec($ch);
            $result['status'] = 'Success';
            /*Print Responce*/
            return json_encode($result); 
        }
        else {
            $result['status'] = 'Failed';
            return json_encode($result);
        }
    }

    // ================================================================================
    // ======================= PRIVATE FUNCTIONS ======================================
    // ================================================================================
}
