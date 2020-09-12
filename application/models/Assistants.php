<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Assistants extends CI_Model {

    public function __construct() {
        parent::__construct('grocery_assistant');
    }
    private $tableName = 'grocery_assistant';
    
    public function search_last_assistant($key, $value) {
        $this->db->select("gp.ProductId, gp.ProductName, gp.Price, gp.SalePrice, gp.ProductImg, gb.BrandName, concat(gp.SaleUnitQty, gps.UnitName) SaleUnitQuantity, gc.CatName, gc2.CatName parentCategory, CASE WHEN gu.UnitName = NULL THEN 'Piece' ELSE gu.UnitName END AS UnitName ");
        $this->db->from($this->tableName." ga");
        $this->db->join("grocery_products gp", "gp.ProductId = ga.ProductId");
        $this->db->join("grocery_category gc", "gp.Category = gc.CategoryId");
        $this->db->join("grocery_category gc2", "gc2.ParentId = gc.CategoryId", "left");
        $this->db->join("grocery_unit gu", "gu.UnitId = gp.Unit", "left");
        $this->db->join("grocery_unit gps", "gps.UnitId = gp.SaleUnit", "left");
        $this->db->join("grocery_brand gb", "gb.BrandId = gp.Brand", "left");
        $this->db->where('ga.'.$key, $value);
        $this->db->where('ga.Status', 1);
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
