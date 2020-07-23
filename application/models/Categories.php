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

    public function get_active_categories() {
        $this->db->select('CategoryId');
        $this->db->from($this->tableName);
        $this->db->where('Status', 1);
        $query = $this->db->get();
        if($query->num_rows() > 0) {
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
    //Get limited products inside all sub cat hierarchy
    public function getCatPrducts($catId, $startFrom = 0, $limit = 10){
        $inCats = NULL;
        $func = function($value) {
            return $value["CategoryId"];
        };
        if(empty($catId))
            $catId = 0;
        $queryFirst = "SELECT  CategoryId
                            from    (select * from grocery_category
                                     order by ParentId, CategoryId) products_sorted,
                                    (select @pv := $catId) initialisation
                            where   find_in_set(ParentId, @pv) and Status = 1
                            and     length(@pv := concat(@pv, ',', CategoryId))";
        $firstQueryResult = $this->db->query($queryFirst);
        if ($firstQueryResult->num_rows() > 0) {
            $inCats = array_map($func, $firstQueryResult->result_array());
            $inCats = join(",", $inCats);
        }
        else{
            $inCats = $catId;
        }
        $query = "SELECT 
                        gp.*, 
                        CASE WHEN gu.UnitName = NULL THEN 'Piece' ELSE gu.UnitName END AS UnitName 
                    FROM grocery_products gp
                    LEFT JOIN grocery_unit gu ON
                    gu.UnitId = gp.Unit
                    WHERE gp.Status = 1 AND
                    gp.Category IN(
                        $inCats
                    )
                    ORDER BY gp.ModifiedOn DESC
                    LIMIT $startFrom, $limit";
        $query = $this->db->query($query);

        if ($query->num_rows() > 0) {
            return $query->result_array();
        }
        return false;
    }
}
