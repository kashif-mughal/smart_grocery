<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Categories extends CI_Model {

    public function __construct() {
        parent::__construct();
    }
    private $tableName = 'grocery_category';
    //customer List
    public function category_list() {
        $this->db->select('a.*, b.CatName ParentName');
        $this->db->from($this->tableName.' a');
        $this->db->join($this->tableName.' b', 'a.ParentId = b.Id', 'left');
        $this->db->where('a.Status', 1);
        $query = $this->db->get();
        if ($query->num_rows() > 0) {
            return $query->result_array();
        }
        return false;
    }

    public function category_list_dropdown() {
        $this->db->select('Id, CatName');
        $this->db->from($this->tableName);
        $this->db->where('Status', 1);
        $query = $this->db->get();
        if ($query->num_rows() > 0) {
            return $query->result_array();
        }
        return Array();
    }
    
    //customer List
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

    //customer List
    public function category_list_count() {
        $this->db->select('*');
        $this->db->from($this->tableName);
        $this->db->where('Status', 1);
        $query = $this->db->get();
        if ($query->num_rows() > 0) {
            return $query->num_rows();
        }
        return false;
    }

    //Category Search Item
    public function category_search_item($category_id) {
        $this->db->select('*');
        $this->db->from($this->tableName);
        $this->db->where('category_id', $category_id);
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

    //Retrieve customer Edit Data
    public function retrieve_category_editdata($category_id) {
        $this->db->select('*');
        $this->db->from($this->tableName);
        $this->db->where('category_id', $category_id);
        $query = $this->db->get();
        if ($query->num_rows() > 0) {
            return $query->result_array();
        }
        return false;
    }

    //Update Categories
    public function update_category($data, $category_id) {
        $this->db->where('category_id', $category_id);
        $this->db->update($this->tableName, $data);
        return true;
    }

    // Delete customer Item
    public function delete_category($category_id) {
        $this->db->where('category_id', $category_id);
        $this->db->delete($this->tableName);
        return true;
    }

}
