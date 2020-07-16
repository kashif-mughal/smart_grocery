<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Categories extends CI_Model {

    public function __construct() {
        parent::__construct('grocery_category');
    }
    private $tableName = 'grocery_category';

    public function category_list() {
        $this->db->select('a.*, b.CatName ParentName');
        $this->db->from($this->tableName.' a');
        $this->db->join($this->tableName.' b', 'a.ParentId = b.CategoryId', 'left');
        $this->db->where('a.Status', 1);
        $query = $this->db->get();
        if ($query->num_rows() > 0) {
            return $query->result_array();
        }
        return false;
    }

    public function category_list_product() {
        $this->db->select('*');
        $this->db->from($this->tableName);
        $this->db->where('Status', 1);
        $query = $this->db->get();
        if ($query->num_rows() > 0) {
            return $query->result_array();
        }
        return false;
    }
    //Category Search Item
    public function category_search_item($CategoryId) {
        $this->db->select('*');
        $this->db->from($this->tableName);
        $this->db->where('CategoryId', $CategoryId);
        $this->db->limit('500');
        $query = $this->db->get();
        if ($query->num_rows() > 0) {
            return $query->result_array();
        }
        return false;
    }

    //Count customer
    public function category_entry($data) {
        $this->db->select('*');
        $this->db->from($this->tableName);
        $this->db->where('Status', 1);
        $this->db->where('CatName', $data['CatName']);
        $query = $this->db->get();
        if ($query->num_rows() > 0) {
            return FALSE;
        } else {
            $this->db->insert('grocery_category', $data);
            return TRUE;
        }
    }

}
