<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Orders extends CI_Model {

    public function __construct() {
        parent::__construct('grocery_order');
    }
    private $tableName = 'grocery_order';

    //order Search Item
    public function order_search_item($OrderId) {
        $this->db->select('*');
        $this->db->from($this->tableName);
        $this->db->where('OrderId', $OrderId);
        $this->db->limit('500');
        $query = $this->db->get();
        if ($query->num_rows() > 0) {
            return $query->result_array();
        }
        return false;
    }

    public function place_order($data){
        $this->db->select('*');
        $this->db->from($this->tableName);
        $this->db->where('Status', 1);
        $this->db->where('Hash', $data['Hash']);
        $this->db->where('CustomerId', $data['CustomerId']);
        $query = $this->db->get();
        if ($query->num_rows() > 0) {
            return false;
        } else {
            $this->db->insert($this->tableName, $data);
            return $this->db->insert_id();
        }
    }
    public function place_order_details($data){
        $this->db->insert('grocery_order_detail', $data);
        return true;
    }

    public function retrieve_user_orders($userId = null){
        if(is_null($userId)){
            $CI = & get_instance();
            $userId = $CI->session->userdata('user_id');
        }
        $this->db->select('*');
        $this->db->from($this->tableName);
        $this->db->where('CustomerId', $userId);
        $this->db->order_by('ModifiedOn', 'DESC');
        $query = $this->db->get();
        if ($query->num_rows() > 0) {
            return $query->result_array();
        }
        return false;
    }

    public function retrieve_orders($perpage, $page, $orderId = null, $userEmail = null){
        if(isset($_GET['ue']) && !empty($_GET['ue']))
            $userEmail = $_GET['ue'];
        if(isset($_GET['on']) && is_numeric($_GET['on']))
            $orderId = $_GET['on'];

        $wherePart = '';
        if(!is_null($orderId) && !is_null($userEmail))
            $wherePart = "WHERE a.OrderId = $orderId AND u.email = '$userEmail'";
        else if(!is_null($orderId))
            $wherePart = "WHERE a.OrderId = $orderId";
        else if(!is_null($userEmail))
            $wherePart = "WHERE u.email = '$userEmail'";
        $queryText = "SELECT a.*, u.first_name, u.last_name, u.email from $this->tableName a join users u on u.user_id = a.CustomerId $wherePart ORDER BY a.ModifiedOn DESC LIMIT $page,$perpage";

        //$query = $this->db->get();
        //print_r($queryText);die;
        $query = $this->db->query($queryText);
        if ($query->num_rows() > 0) {
            return $query->result_array();
        }
        return false;
    }

    public function get_order_customer($orderId){
        if(is_null($orderId) || !is_numeric($orderId))
            return false;
        $this->db->select('CustomerId');
        $this->db->from($this->tableName);
        $this->db->where('OrderId', $orderId);
        $this->db->where('Status', 1);
        $query = $this->db->get();
        if ($query->num_rows() > 0) {
            $result = $query->result_array();
            return $result[0]['CustomerId'];
        }
        return false;
    }

    public function retrieve_order_editdata($orderId){
        if(is_null($orderId))
            return false;
        $this->db->select('b.*, c.ProductName, c.ProductImg, d.UnitName');
        $this->db->from($this->tableName.' a');
        $this->db->join('grocery_order_detail b', 'a.OrderId = b.OrderId');
        $this->db->join('grocery_products c', 'b.ItemId = c.ProductId');
        $this->db->join('grocery_unit d', 'c.UnitId = d.UnitId');
        $this->db->where('a.Status', 1);
        $this->db->where('b.Status', 1);
        $this->db->where('a.OrderId', $orderId);
        $query = $this->db->get();
        $orderDetailObj = Array();
        if ($query->num_rows() > 0) {
            $orderDetailObj['OrderDetail'] = $query->result_array();

            //getting order traking
            $this->db->select('b.*');
            $this->db->from($this->tableName.' a');
            $this->db->join('grocery_order_traking b', 'a.OrderId = b.OrderId');
            $this->db->join('grocery_traking_steps c', 'b.StepId = c.StepId');
            $this->db->where('a.Status', 1);
            $this->db->where('b.Status', 1);
            $this->db->where('c.Status', 1);
            $this->db->where('a.OrderId', $orderId);
            $query2 = $this->db->get();
            if ($query2->num_rows() > 0) {
                $orderDetailObj['OrderTrakingDetail'] = $query2->result_array();
            }

            //getting traking steps
            $this->db->select('*');
            $this->db->from('grocery_traking_steps');
            $this->db->where('Status', 1);
            $query3 = $this->db->get();
            if ($query3->num_rows() > 0) {
                $orderDetailObj['TrakingSteps'] = $query3->result_array();
            }

            return $orderDetailObj;
        }
        return false;
    }
}