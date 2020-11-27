<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Copuns extends CI_Model {

    public function __construct() {
        parent::__construct('grocery_copun');
    }
    private $tableName = 'grocery_copun';
    
    //Count customer
    public function copun_entry($data) {
        $this->db->insert('grocery_copun', $data);
        return TRUE;
    }

}
