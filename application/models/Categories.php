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
    
    public function category_listin() {
        
        $CI = & get_instance();
        $CI->load->model('SiteSettings');
        $setting_detail = $CI->SiteSettings->retrieve_editdata('setting_id', '1');
        $SettingData = $setting_detail[0];
        //echo ($SettingData['home_page_cat']);
        $idarr = trim($SettingData['home_page_cat'], '[]');
        $myq = 'SELECT a.*, b.CatName ParentName FROM `grocery_category`a LEFT JOIN `grocery_category` b ON a.ParentId = b.CategoryId WHERE a.Status="1" AND a.ParentId IN ('.$idarr.')';
        //echo $myq;
        $query = $this->db->query($myq);
        if ($query->num_rows() > 0) {
            //return $query->result_array();
            return json_decode($SettingData['home_page_cat']);
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
    public function parent_category() {
        $this->db->select('*');
        $this->db->from($this->tableName);
        $this->db->where('ParentId', 0);
        $query = $this->db->get();
        if ($query->num_rows() > 0) {
            return $query->result_array();
        }
        return false;
    }
    //Count customer
    public function parent_category_seeting() {
        $this->db->select('*');
        $this->db->from($this->tableName);
        $this->db->where('ParentId', 0);
        $this->db->where('Status', 1);
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
    public function getCatPrducts($catId, $productName = null, $startFrom = 0, $limit = 10){
        $inCats = Array();
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
        // echo '<pre>';print_r($firstQueryResult->result_array());die;
        if ($firstQueryResult->num_rows() > 0) {
            $inCats = array_map($func, $firstQueryResult->result_array());
            //$inCats = join(",", $inCats);
        }
        array_push($inCats, $catId);
        $inCats = join(",", $inCats);
        
        $whereString = is_null($productName) ? " " : " AND gp.ProductName Like('%$productName%') ";
        $query = "SELECT 
                        gp.*, gu2.UnitName SaleUnitName, 
                        CASE WHEN gu.UnitName = NULL THEN 'Piece' ELSE gu.UnitName END AS UnitName 
                    FROM grocery_products gp
                    LEFT JOIN grocery_unit gu ON gu.UnitId = gp.Unit
                    left join grocery_unit gu2 on gp.SaleUnit = gu2.UnitId
                    WHERE gp.Status = 1 $whereString AND 
                    gp.Category IN(
                        $inCats
                    )
                    ORDER BY gp.sort DESC
                    LIMIT $startFrom, $limit";
        $countQuery = "SELECT 
                        count(1) total
                    FROM grocery_products gp
                    LEFT JOIN grocery_unit gu ON gu.UnitId = gp.Unit
                    left join grocery_unit gu2 on gp.SaleUnit = gu2.UnitId
                    WHERE gp.Status = 1 $whereString AND 
                    gp.Category IN(
                        $inCats
                    )";
        $returnData["total"] = 0;
        $countResult = $this->db->query($countQuery);
        if ($countResult->num_rows() > 0) {
            $returnData["total"] = $countResult->result()[0]->total;
        }
        else{
            return false;
        }
        $query = $this->db->query($query);
        if ($query->num_rows() > 0) {
            $returnData["products"] = $query->result_array();
            return $returnData;
        }
        else{
            return false;
        }
    }
}
