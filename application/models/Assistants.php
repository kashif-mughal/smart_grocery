<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Assistants extends CI_Model {

    public function __construct() {
        parent::__construct('grocery_assistant');
    }
    private $tableName = 'grocery_assistant';
    
    //assistant Search Item
    public function assistant_search_item($AssistantId) {
        $this->db->select('*');
        $this->db->from($this->tableName);
        $this->db->where('AssistantId', $AssistantId);
        $this->db->limit('500');
        $query = $this->db->get();
        if ($query->num_rows() > 0) {
            return $query->result_array();
        }
        return false;
    }

    //Count customer
    public function assistant_entry($data) {
        $this->db->insert($this->tableName, $data);
        return TRUE;
    }


}
