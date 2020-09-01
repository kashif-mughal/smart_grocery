<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Products extends CI_Model {

    public function __construct() {
        parent::__construct('grocery_products');
    }
    private $tableName = 'grocery_products';
    //Count Product
    public function count_product() {
        return $this->db->count_all("product_information");
    }

    //Product List
    public function product_list() {

        $query = "SELECT p.ProductId, p.ProductName, c.CatName, p.Unit, p.Price, p.SalePrice, p.ModifiedOn,
                        CASE WHEN p.IsFeatured = 0 THEN 'No' ELSE 'YES' END AS IsFeatured,
                        CASE WHEN p.IsHot = 0 THEN 'No' ELSE 'YES' END AS IsHot, 
                        -- p.IsFeatured, p.IsHot,
                        p.ProductImg from grocery_products p join grocery_category c on p.Category = c.CategoryId 
                        where c.Status = 1 AND p.Status = 1 order by p.ModifiedOn desc";
        $query = $this->db->query($query);

        if ($query->num_rows() > 0) {
            return $query->result_array();
        }
        return false;
    }

    public function get_featured_products() {
        $query = "SELECT p.ProductId, p.ProductName, p.Unit, u.UnitName, p.Price, p.SalePrice, p.ModifiedOn,
                        CASE WHEN p.IsFeatured = 0 THEN 'No' ELSE 'YES' END AS IsFeatured,
                        CASE WHEN p.IsHot = 0 THEN 'No' ELSE 'YES' END AS IsHot,
                        p.ProductImg from grocery_products p join grocery_category c on p.Category = c.CategoryId
                        join grocery_unit u on p.UnitId = u.Unit
                        where c.Status = 1 AND p.Status = 1 AND p.IsFeatured = 1 order by p.ModifiedOn DESC LIMIT 8";
        $query = $this->db->query($query);

        if ($query->num_rows() > 0) {
            return $query->result_array();
        }
        return false;
    }

    public function getProductFromCatAndAllSubCats($catID) {
                
    }

    public function all_product_list() {

        $this->db->select('p.ProductId, p.ProductName, c.CatName, p.Unit, p.Price, p.SalePrice, p.ModifiedOn,
                         p.IsFeatured, p.IsHot');
        $this->db->from('grocery_products p');
        $this->db->join('grocery_category c', 'p.Category=c.Id');
        $query = $this->db->get();

        if ($query->num_rows() > 0) {
            return $query->result_array();
        }
        return false;
    }

    public function product_list_for_dropdown() {
        $query = $this->db->select('product_model, product_id, product_name')
                ->from('product_information')
                ->where('sub_product', '0')
                ->order_by('product_information.product_id', 'desc')
                ->get();
        if ($query->num_rows() > 0) {
            return $query->result_array();
        }
        return false;
    }


    //Product List
    public function product_list_count() {

         $this->db->select('*');
        $this->db->from($this->tableName);
        $this->db->where('Status', 1);
        $query = $this->db->get();
        if ($query->num_rows() > 0) {
            return $query->num_rows();
        }
        return false;
    }

    //Product tax list
    public function retrieve_product_tax() {
        $result = $this->db->select('*')
                ->from('tax_information')
                ->get()
                ->result();

        return $result;
    }

    //Tax selected item
    public function tax_selected_item($tax_id) {
        $result = $this->db->select('*')
                ->from('tax_information')
                ->where('tax_id', $tax_id)
                ->get()
                ->result();

        return $result;
    }

    //Product generator id check 
    public function product_id_check($product_id) {
        $query = $this->db->select('*')
                ->from('product_information')
                ->where('product_id', $product_id)
                ->get();
        if ($query->num_rows() > 0) {
            return true;
        } else {
            return false;
        }
    }

    //Count Product
    public function product_entry($data) {
        $this->db->select('*');
        $this->db->from($this->tableName);
        $this->db->where('Status', 1);
        $this->db->where('ProductName', $data['ProductName']);
        $query = $this->db->get();
        
        if ($query->num_rows() > 0) {
            return FALSE;
        } else {
            $this->db->insert($this->tableName, $data);
            return TRUE;
        }
    }

    // Supplier product information
    public function supplier_product_editdata($product_id) {
        $this->db->select('a.*,b.*');
        $this->db->from('supplier_product a');
        $this->db->join('supplier_information b', 'a.supplier_id=b.supplier_id');
        $this->db->where('a.product_id', $product_id);
        $query = $this->db->get();
        if ($query->num_rows() > 0) {
            return $query->result_array();
        }
        return false;
    }

//selected supplier product
    public function supplier_selected($product_id) {
        $this->db->select('*');
        $this->db->from('supplier_product');
        $this->db->where('product_id', $product_id);
        $query = $this->db->get();
        if ($query->num_rows() > 0) {
            return $query->result_array();
        }
        return false;
    }

    //Retrieve company Edit Data
    public function retrieve_company() {
        $this->db->select('*');
        $this->db->from('company_information');
        $this->db->limit('1');
        $query = $this->db->get();
        if ($query->num_rows() > 0) {
            return $query->result_array();
        }
        return false;
    }

    //Product By Search 
    public function product_search_item($product_id) {

        $query = $this->db->select('product_information.product_id p_id, supplier_information.*,product_information.*,supplier_product.*')
                ->from('product_information')
                ->join('supplier_product', 'product_information.product_id = supplier_product.product_id', 'left')
                ->join('supplier_information', 'supplier_product.supplier_id = supplier_information.supplier_id', 'left')
                ->order_by('product_information.product_id', 'desc')
                ->where('product_information.product_id', $product_id)
                ->get();

        if ($query->num_rows() > 0) {
            return $query->result_array();
        }
        return false;
    }

    //Duplicate Entry Checking 
    public function product_model_search($product_model) {
        $this->db->select('*');
        $this->db->from('product_information');
        $this->db->where('product_model', $product_model);
        $query = $this->db->get();
        return $this->db->affected_rows();
    }

    //Product Details
    public function product_details_info($product_id) {
        $this->db->select('*');
        $this->db->from('product_information');
        $this->db->where('product_id', $product_id);
        $query = $this->db->get();
        if ($query->num_rows() > 0) {
            return $query->result_array();
        }
        return false;
    }

    // Product Purchase Report
    public function product_purchase_info($product_id) {
        $this->db->select('a.*,b.*,sum(b.quantity) as quantity,sum(b.total_amount) as total_amount,c.supplier_name');
        $this->db->from('product_purchase a');
        $this->db->join('product_purchase_details b', 'b.purchase_id = a.purchase_id');
        $this->db->join('supplier_information c', 'c.supplier_id = a.supplier_id');
        $this->db->where('b.product_id', $product_id);
        $this->db->order_by('a.purchase_id', 'asc');
        $this->db->group_by('a.purchase_id');
        $query = $this->db->get();
        if ($query->num_rows() > 0) {
            return $query->result_array();
        }
        return false;
    }

    // Invoice Data for specific data
    public function invoice_data($product_id) {
        $this->db->select('a.*,b.*,c.customer_name');
        $this->db->from('invoice a');
        $this->db->join('invoice_details b', 'b.invoice_id = a.invoice_id');
        $this->db->join('customer_information c', 'c.customer_id = a.customer_id');
        $this->db->where('b.product_id', $product_id);
        $this->db->order_by('a.invoice_id', 'asc');
        $query = $this->db->get();
        if ($query->num_rows() > 0) {
            return $query->result_array();
        }
        return false;
    }

    public function previous_stock_data($product_id, $startdate) {

        $this->db->select('date,sum(quantity) as quantity');
        $this->db->from('product_report');
        $this->db->where('product_id', $product_id);
        $this->db->where('date <=', $startdate);
        $query = $this->db->get();
        //echo $this->db->last_query();
        if ($query->num_rows() > 0) {
            return $query->result_array();
        }
        return false;
    }

// Invoice Data for specific data
    public function invoice_data_supplier_rate($product_id, $startdate, $enddate) {

        $this->db->select('
					date,
					sum(quantity) as quantity,
					rate,
					-rate*sum(quantity) as total_price,
					account
				');

        $this->db->from('product_report');
        $this->db->where('product_id', $product_id);

        $this->db->where('date >=', $startdate);
        $this->db->where('date <=', $enddate);

        $this->db->group_by('account');
        $this->db->order_by('date', 'asc');
        $query = $this->db->get();
        //echo $this->db->last_query();

        if ($query->num_rows() > 0) {
            return $query->result_array();
        }
        return false;
    }

    // csv export info
    public function product_csv_file() {
        $query = $this->db->select('a.product_id,b.supplier_id,a.category_id,a.product_name,a.price,b.supplier_price,a.unit,a.tax,a.product_model,a.product_details,a.image,a.status')
                ->from('product_information a')
                ->join('supplier_product b', 'a.product_id = b.product_id', 'left')
                ->get();
        if ($query->num_rows() > 0) {
            return $query->result_array();
        }
        return false;
    }
    public function update_cache_file(){
        $query = $this->db->query("SELECT * from product_information where sub_product <> '0' and status <> 0");
        foreach ($query->result() as $row) {
            $json_product[] = array('label' => "(". $row->product_id .")-" . $row->product_name, 'value' => $row->product_id, 'sub_product' => $row->sub_product, 'product_uuid' => $row->product_uuid);
        }
        $cache_file = './my-assets/js/admin_js/json/product.json';
        $productList = json_encode($json_product);
        file_put_contents($cache_file, $productList);
    }
    public function search($q, $limit = 10){
        $currentDate = date_format(new DateTime(), 'Y-m-d');
        $query = "SELECT gp.*, gc.CatName from grocery_products gp join grocery_category gc on gp.category = gc.CategoryId where gp.ProductId NOT IN(SELECT ProductId from grocery_assistant ga WHERE ga.CreatedOn = '$currentDate' AND ga.Status = 1) AND gp.ProductName like('%$q%') limit $limit";
        $query = $this->db->query($query);
        
        if ($query->num_rows() > 0) {
            return $query->result();
        }
        return false;
    }

    public function get_value_cart_products($userId = null){
        if(is_null($userId)){
            $userId = $this->session->userdata('user_id');
        }
        if(empty($userId))
            return false;
        $this->db->select("gp.*, god.ItemQuantity, gu.UnitName");
        $this->db->from($this->tableName." gp");
        $this->db->join("grocery_order_detail god", "god.ItemId = gp.ProductId");
        $this->db->join("grocery_order go", "go.OrderId = god.OrderId");
        $this->db->join("grocery_unit gu", "gu.UnitId = gp.Unit");
        $this->db->where("go.CustomerId", $userId);
        $this->db->where("gp.Status", 1);
        $this->db->where("god.Status", 1);
        $this->db->where("go.Status", 1);
        $this->db->distinct("gp.ProductName");
        $this->db->order_by("go.CreatedOn", "DESC");

        $query = $this->db->get();

        if ($query->num_rows() > 0) {
            return $query->result_array();
        }
        return false;
    }
}
