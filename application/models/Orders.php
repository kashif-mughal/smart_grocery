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

    //Count customer
    public function order_entry($data) {
        $this->db->select('*');
        $this->db->from($this->tableName);
        $this->db->where('Status', 1);
        $this->db->where('OrderName', $data['OrderName']);
        $query = $this->db->get();
        if ($query->num_rows() > 0) {
            return FALSE;
        } else {
            $this->db->insert('grocery_order', $data);
            return TRUE;
        }
    }


}
