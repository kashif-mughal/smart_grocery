<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Ccategory extends CI_Controller {

    public $menu;

    function __construct() {
        parent::__construct();
        $this->load->library('auth');
        $this->load->library('lcategory');
        $this->load->library('session');
        $this->load->model('Categories');
        $this->auth->check_admin_auth();
    }

    //Default loading for Category system.
    public function index() {
        $content = $this->lcategory->category_add_form();
        $this->template->full_admin_html_view($content);
    }

    //Manage category form
    public function manage_category() {
        $content = $this->lcategory->category_list();
        $this->template->full_admin_html_view($content);
        
    }

    //Insert category and upload
    public function insert_category() {

        if ($_FILES['image']['name']) {

            //Chapter chapter add start

            $config['upload_path'] = './assets/img/category/';
            $config['allowed_types'] = 'gif|jpg|png|jpeg|JPEG|GIF|JPG|PNG';
            $config['max_size'] = "*";
            $config['max_width'] = "*";
            $config['max_height'] = "*";
            $config['encrypt_name'] = TRUE;


            $this->load->library('upload', $config);
            if (!$this->upload->do_upload('image')) {
                $error = array('error' => $this->upload->display_errors());
                $this->session->set_userdata(array('error_message' => $this->upload->display_errors()));
                redirect(base_url('Ccategory'));
            } else {
                $image = $this->upload->data();
                $image_url = "assets/img/category/" . $image['file_name'];

            }

        }

        $data = array(
            'CatName' => $this->input->post('CatName'),
            'Alias' => $this->input->post('Alias'),
            'ParentId' => $this->input->post('ParentId'),
            'CreatedOn' => date_format(new DateTime(), 'Y-m-d H:i:s'),
            'status' => 1,
            'Img' =>(!empty($image_url) ? $image_url : 'assets/img/product.png')
        );

        $result = $this->Categories->category_entry($data);

        if ($result == TRUE) {
            $this->session->set_userdata(array('message' => 'Successfully Added'));
            if (isset($_POST['add-customer'])) {
                redirect(base_url('Ccategory/manage_category'));
            } elseif (isset($_POST['add-customer-another'])) {
                redirect(base_url('Ccategory'));
            }
        } else {
            $this->session->set_userdata(array('error_message' => 'Already Inserted'));
            redirect(base_url('Ccategory'));
        }
    }

    //Category Update Form
    public function category_update_form($category_id) {
        $content = $this->lcategory->category_edit_data($category_id);
        $this->template->full_admin_html_view($content);
    }

    // Category Update
    public function category_update() {
        $this->load->model('Categories');
        $category_id = $this->input->post('category_id');
        $data = array(
            'category_name' => $this->input->post('category_name'),
            'status' => $this->input->post('status'),
        );

        $this->Categories->update_category($data, $category_id);
        $this->session->set_userdata(array('message' => display('successfully_updated')));
        redirect(base_url('Ccategory/manage_category'));
    }

    // Category delete
    public function category_delete() {
        $this->load->model('Categories');
        $category_id = $_POST['category_id'];
        $this->Categories->delete_category($category_id);
        $this->session->set_userdata(array('message' => display('successfully_delete')));
        return true;
    }

}
