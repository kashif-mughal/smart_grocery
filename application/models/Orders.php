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
}
