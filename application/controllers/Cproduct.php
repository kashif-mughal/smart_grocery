<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Cproduct extends CI_Controller {

    public $product_id;

    function __construct() {
        parent::__construct();
        $this->load->database();
        
        $this->load->library('auth');
        $this->load->library('lproduct');
        $this->load->library('session');
        $this->load->model('Products');
        $this->auth->check_admin_auth();
    }

    //Index page load
    public function index() {
        $content = $this->lproduct->product_add_form();
        $this->template->full_admin_html_view($content);
        // $CI = & get_instance();
        // $CI->load->model('Purchases');
        // $CI->load->model('Suppliers');
        // $CI->load->model('Products');
        // if ($CI->auth->is_admin()) {
        //     $menu_template = 'include/top_menu';
        //     $logged_data = 'include/admin_loggedin_info';
        //     $log_info = array(
        //         'email' => $CI->session->userdata('user_name'),
        //         'logout' => base_url() . 'Admin_dashboard/logout'
        //     );
        //     $top_menu = $CI->parser->parse($menu_template, true);
        //     $logged_info = $CI->parser->parse($logged_data, $log_info, true);
        // }

        // $company_info = $CI->Products->retrieve_company();
        // $CI->load->model('Categories');
        // $CI->load->model('Units');
        // $supplier = $CI->Suppliers->supplier_list("110", "0");
        // $category_list = $CI->Categories->category_list_product();
        // $unit_list = $CI->Units->unit_list();
        // $tax_list = $CI->db->select('*')
        //         ->from('tax_information')
        //         ->get()
        //         ->result();
        // $data = array(
        //     'logindata' => $logged_info,
        //     'mainmenu' => $top_menu,
        //     'content' => "product/add_item_form",
        //     'msg_content' => $message,
        //     'company_info' => $company_info,
        //     'supplier' => $supplier,
        //     'category_list' => $category_list,
        //     'unit_list' => $unit_list,
        //     'tax_list' => $tax_list,
        //     'title'=> "Add Product"
        // );

        // $CI->load->view("admin_template",$data);
    }

    public function products($categoryId = null) {
        
        $CI = & get_instance();
        if (!$this->auth->is_logged()) {
            $this->output->set_header("Location: " . base_url() . 'Dashboard/login', TRUE, 302);
        }
        $this->auth->check_auth();
        
        $CI->load->model('Categories');
        
        $category_list = $CI->Categories->category_list();
        $catId = $this->input->get('categoryId');
        $whereString = ($catId == null) ? null : 'Category = '.$catId;
        $product_list = $CI->Products->customSelect(
            '*', $whereString, 20, 'ModifiedOn'
        );

        $catArray = Array();
        if($catId == null) {
            $selectedCategory = array(
                'MainCategory' => 'Products',
                'SubCategory' => 'All'
            );
        }

        for ($i=0; $i < count($category_list); $i++) { 
            if($category_list[$i]['ParentId'] != '0' && empty($catArray[$category_list[$i]['ParentName']])){
                $catArray[$category_list[$i]['ParentName']] = Array();
            }
            if(is_array($catArray[$category_list[$i]['ParentName']]))
                array_push($catArray[$category_list[$i]['ParentName']], $category_list[$i]);

            if($catId != null && $category_list[$i]['CategoryId'] == $catId) {
                $selectedCategory = array(
                    'MainCategory' => $category_list[$i]['ParentName'],
                    'SubCategory' => $category_list[$i]['CatName']
                );
            }
        }
        $data = array(
            'title' => 'Sauda Express | Buy each and everything home grocery',
            'CatList' => $catArray,
            'ProdList' => $product_list,
            'SelectCategory' => $selectedCategory
        );
        $content = $CI->parser->parse('product/products', $data, true);
        $this->template->full_html_view($content);
    }

    //Insert Product and uload
    public function insert_product() {
        if ($_FILES['image']['name']) {
            //Chapter chapter add start
            $config['upload_path'] = './assets/img/products/';
            $config['allowed_types'] = 'gif|jpg|png|jpeg|JPEG|GIF|JPG|PNG';
            $config['max_size'] = "*";
            $config['max_width'] = "*";
            $config['max_height'] = "*";
            $config['encrypt_name'] = TRUE;

            $this->load->library('upload', $config);
            if (!$this->upload->do_upload('image')) {
                $error = array('error' => $this->upload->display_errors());
                $this->session->set_userdata(array('error_message' => $this->upload->display_errors()));
                redirect(base_url('Cproduct'));
            } else {
                $image = $this->upload->data();
                $image_url = "assets/img/products/" . $image['file_name'];
            }
        }
        $isFeatured = ($this->input->post('IsFeatured') == 'on') ? 1 : 0;
        $isHot = ($this->input->post('IsHot') == 'on') ? 1 : 0;
        $data = array(
            'ProductName' => $this->input->post('ProductName'),
            'Unit' => $this->input->post('Unit'),
            'Price' => $this->input->post('Price'),
            'SalePrice' => $this->input->post('SalePrice'),
            'IsFeatured' => $isFeatured,
            'IsHot' => $isHot,
            'Category' => $this->input->post('CategoryId'),
            'CreatedOn' => date_format(new DateTime(), 'Y-m-d H:i:s'),
            'status' => 1,
            'ProductImg' =>(!empty($image_url) ? $image_url : 'assets/img/product.png')
        );
        $result = $this->Products->product_entry($data);
        if ($result == TRUE) {
            $this->session->set_userdata(array('message' => 'Successfully Added'));
            if (isset($_POST['add-product'])) {
                redirect(base_url('Cproduct/manage_product'));
            } elseif (isset($_POST['add-customer-another'])) {
                redirect(base_url('Cproduct'));
            }
        } else {
            $this->session->set_userdata(array('error_message' => 'Already Inserted'));
            redirect(base_url('Cproduct'));
        }
    }

    //Product Update Form
    public function product_update_form($product_id) {
        $content = $this->lproduct->product_edit_data($product_id);
        $this->template->full_admin_html_view($content);
    }
    // Product Update [POST]
    public function product_update() {
        $this->load->model('Products');
        $product_id = $this->input->post('product_id');
        $isFeatured = ($this->input->post('isFeatured') == 1) ? 1 : 0;
        $isHot = ($this->input->post('isHot') == 1) ? 1 : 0;
        $status = ($this->input->post('status') == 1) ? 1 : 0;
        $data = array(
            'ProductName' => $this->input->post('product_name'),
            'Unit' => $this->input->post('unit'),
            'Price' => $this->input->post('price'),
            'SalePrice' => $this->input->post('salePrice'),
            'IsFeatured' => $isFeatured,
            'IsHot' => $isHot,
            'Category' => $this->input->post('CategoryId'),
            'Status' => $status
            //'status' => $this->input->post('status')
        );
        
        $this->Products->update($data, 'ProductId', $product_id);

        $this->session->set_userdata(array('message' => display('successfully_updated')));
        redirect(base_url('Cproduct/manage_product'));
    }

    //Manage Product
    // public function manage_category() {
    //     $content = $this->lcategory->category_list();
    //     $this->template->full_admin_html_view($content);
    // }

    public function manage_product() {
        $CI = & get_instance();
        
        $this->auth->check_admin_auth();
        
        $CI->load->library('lproduct');
        
        $CI->load->model('Products');
        
        // $content = $this->lproduct->product_list();
        // $this->template->full_admin_html_view($content);
        $content = $this->lproduct->product_list();
        
        $this->template->full_admin_html_view($content);
    }

    //Add Product CSV
    public function add_product_csv() {
        $CI = & get_instance();
        $data = array(
            'title' => display('add_product_csv')
        );
        $content = $CI->parser->parse('product/add_product_csv', $data, true);
        $this->template->full_admin_html_view($content);
    }

    //CSV Upload File
    function uploadCsv() {
        $product_id = $this->generator(8);
        $count = 0;
        $fp = fopen($_FILES['upload_csv_file']['tmp_name'], 'r') or die("can't open file");

        if (($handle = fopen($_FILES['upload_csv_file']['tmp_name'], 'r')) !== FALSE) {

            while ($csv_line = fgetcsv($fp, 1024)) {
                //keep this if condition if you want to remove the first row
                for ($i = 0, $j = count($csv_line); $i < $j; $i++) {
                    $insert_csv = array();
                    $insert_csv = array();
                    $insert_csv['product_id'] = (!empty($csv_line[0]) ? $csv_line[0] : null);
                    $insert_csv['supplier_id'] = (!empty($csv_line[1]) ? $csv_line[1] : null);
                    $insert_csv['category_id'] = (!empty($csv_line[2]) ? $csv_line[2] : null);
                    $insert_csv['product_name'] = (!empty($csv_line[3]) ? $csv_line[3] : null);
                    $insert_csv['price'] = (!empty($csv_line[4]) ? $csv_line[4] : null);
                    $insert_csv['supplier_price'] = (!empty($csv_line[5]) ? $csv_line[5] : null);
                    $insert_csv['unit'] = (!empty($csv_line[6]) ? $csv_line[6] : null);
                    $insert_csv['tax'] = (!empty($csv_line[7]) ? $csv_line[7] : null);
                    $insert_csv['product_model'] = (!empty($csv_line[8]) ? $csv_line[8] : null);
                    $insert_csv['product_details'] = (!empty($csv_line[9]) ? $csv_line[9] : null);
                    $insert_csv['image'] = (!empty($csv_line[10]) ? $csv_line[10] : null);
                    $insert_csv['status'] = (!empty($csv_line[11]) ? $csv_line[11] : null);
                }


                $data = array(
                    'product_id' => $insert_csv['product_id'],
                    'category_id' => $insert_csv['category_id'],
                    'product_name' => $insert_csv['product_name'],
                    'price' => $insert_csv['price'],
                    'unit' => $insert_csv['unit'],
                    'tax' => $insert_csv['tax'],
                    'product_model' => $insert_csv['product_model'],
                    'product_details' => $insert_csv['product_details'],
                    'image' => $insert_csv['image'],
                    'status' => $insert_csv['status']
                );
                $supp_prd = array(
                    'product_id' => $insert_csv['product_id'],
                    'supplier_id' => $insert_csv['supplier_id'],
                    'supplier_price' => $insert_csv['supplier_price'],
                    'products_model' => $insert_csv['product_model'],
                );

                if ($count > 0) {

                    $splprd = $this->db->select('*')
                    ->from('supplier_product')
                    ->where('supplier_id', $supp_prd['supplier_id'])
                    ->where('products_model', $supp_prd['product_model'])
                    ->get()
                    ->num_rows();

                    if ($splprd == 0) {
                        $this->db->insert('supplier_product', $supp_prd);
                    } else {
                        $supp_prd = array(
                            'supplier_id' => $insert_csv['supplier_id'],
                            'supplier_price' => $insert_csv['supplier_price'],
                            'products_model' => $insert_csv['product_model']
                        );
                        $this->db->where('products_model', $supp_prd['product_model']);
                        $this->db->where('supplier_id', $supp_prd['supplier_id']);
                        $this->db->update('supplier_product', $supp_prd);
                    }
                    $result = $this->db->select('*')
                    ->from('product_information')
                    ->where('product_model', $data['product_model'])
                    ->get()
                    ->num_rows();
                    if ($result == 0 && !empty($data['product_model'])) {

                        $this->db->insert('product_information', $data);


                        $this->db->select('*');
                        $this->db->from('product_information');
                        $this->db->where('status', 1);
                        $query = $this->db->get();
                        foreach ($query->result() as $row) {
                            $json_product[] = array('label' => $row->product_name . "-(" . $row->product_model . ")", 'value' => $row->product_id);
                        }
                        $cache_file = './my-assets/js/admin_js/json/product.json';
                        $productList = json_encode($json_product);
                        file_put_contents($cache_file, $productList);
                    } else {

                        $data = array(
                            'category_id' => $insert_csv['category_id'],
                            'product_name' => $insert_csv['product_name'],
                            'price' => $insert_csv['price'],
                            'unit' => $insert_csv['unit'],
                            'tax' => $insert_csv['tax'],
                            'product_model' => $insert_csv['product_model'],
                            'product_details' => $insert_csv['product_details'],
                            'image' => (!empty($insert_csv['image']) ? $insert_csv['image'] : base_url('my-assets/image/product.png')),
                            'status' => $insert_csv['status']
                        );
                        $this->db->where('product_model', $data['product_model']);
                        $this->db->update('product_information', $data);
                        $this->db->select('*');
                        $this->db->from('product_information');
                        $this->db->where('status', 1);
                        $query = $this->db->get();
                        foreach ($query->result() as $row) {
                            $json_product[] = array('label' => $row->product_name . "-(" . $row->product_model . ")", 'value' => $row->product_id);
                        }
                        $cache_file = './my-assets/js/admin_js/json/product.json';
                        $productList = json_encode($json_product);
                        file_put_contents($cache_file, $productList);
                    }
                }
                $count++;
            }
        }
        fclose($fp) or die("can't close file");
        $this->session->set_userdata(array('message' => display('successfully_added')));
        redirect(base_url('Cproduct/manage_product'));
    }
    public function product_delete() {
        $product_id = $_POST['product_id'];
        $this->Products->soft_delete_by_key("ProductId", $product_id);
        $this->session->set_userdata(array('message' => display('successfully_delete')));
        return true;
    }
    //Retrieve Single Item  By Search
    public function product_details($product_id) {
        $this->product_id = $product_id;
        $CI = & get_instance();
        $this->auth->check_admin_auth();
        $CI->load->library('lproduct');
        $content = $CI->lproduct->product_details($product_id);
        $this->template->full_admin_html_view($content);
    }
    public function exportCSV() {
        // file name 
        $this->load->model('Products');
        $filename = 'product_' . date('Ymd') . '.csv';
        header("Content-Description: File Transfer");
        header("Content-Disposition: attachment; filename=$filename");
        header("Content-Type: application/csv; ");
        $usersData = $this->Products->product_csv_file();
        $file = fopen('php://output', 'w');
        $header = array('product_id', 'supplier_id', 'category_id', 'product_name', 'price', 'supplier_price', 'unit', 'tax', 'product_model', 'product_details', 'image', 'status');
        fputcsv($file, $header);
        foreach ($usersData as $line) {
            fputcsv($file, $line);
        }
        fclose($file);
        exit;
    }
}
