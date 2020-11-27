<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Ccopun extends CI_Controller {

    public $menu;

    function __construct() {
        parent::__construct();
        $this->auth->check_admin_auth();
        $this->load->library('auth');
        $this->load->library('lcopun');
        $this->load->model('Copuns');
    }

    //Default loading for copun system.
    public function index() {
        $content = $this->lcopun->copun_add_form();
        $this->template->full_admin_html_view($content);
    }

    //Manage copun form
    public function manage_copun() {
        $content = $this->lcopun->copun_list();
        $this->template->full_admin_html_view($content);
        
    }

    //Insert copun and upload
    public function insert_copun() {
        if(is_null($this->input->post('Infinite'))){
            if(empty($this->input->post('StartFrom')) || empty($this->input->post('EndOn'))){
                $this->session->set_userdata(array('error_message' => 'StartFrom and EndOn are required if not Infinite'));
                redirect(base_url('Ccopun'));
                return;
            }else{
                $startDate = strtotime($this->input->post('StartFrom'));
                $endDate = strtotime($this->input->post('EndOn'));
                if($startDate > $endDate){
                    $this->session->set_userdata(array('error_message' => 'Start date should be less then End date'));
                    redirect(base_url('Ccopun'));
                    return;
                }
            }
        }
        $data = array(
            'CopunName' => $this->input->post('CopunName'),
            'StartFrom' => $this->input->post('StartFrom'),
            'EndOn' => $this->input->post('EndOn'),
            'DiscountType' => $this->input->post('DiscountType'),
            'DiscountValue' => $this->input->post('DiscountValue'),
            'MinPurchase' => $this->input->post('MinPurchase'),
            'Status' => 1
        );
        if(!is_null($this->input->post('Infinite'))){
            $data['Infinite'] = $this->input->post('Infinite');
        }
        $result = $this->Copuns->copun_entry($data);

        if ($result == TRUE) {
            $this->session->set_userdata(array('message' => 'Successfully Added'));
            if (isset($_POST['add-customer'])) {
                redirect(base_url('Ccopun/manage_copun'));
            } elseif (isset($_POST['add-customer-another'])) {
                redirect(base_url('Ccopun'));
            }
        } else {
            $this->session->set_userdata(array('error_message' => 'Something went wrong'));
            redirect(base_url('Ccopun'));
        }
    }

    //copun Update Form
    public function copun_update_form($CopunId) {
        $content = $this->lcopun->copun_edit_data($CopunId);
        $this->template->full_admin_html_view($content);
    }

    // copun Update
    public function copun_update() {
        $CopunId = $this->input->post('CopunId');
        $data = array(
            'CopunName' => $this->input->post('CopunName'),
            'ModifiedOn' => date_format(new DateTime(), 'Y-m-d H:i:s'),
            'StartFrom' => $this->input->post('StartFrom'),
            'EndOn' => $this->input->post('EndOn'),
            'DiscountType' => $this->input->post('DiscountType'),
            'DiscountValue' => $this->input->post('DiscountValue'),
            'MinPurchase' => $this->input->post('MinPurchase'),
        );
        if(!is_null($this->input->post('Infinite'))){
            $data['Infinite'] = $this->input->post('Infinite');
        }
        $this->Copuns->update($data, 'CopunId', $CopunId);
        $this->session->set_userdata(array('message' => display('successfully_updated')));
        redirect(base_url('Ccopun/manage_copun'));
    }

    // copun delete
    public function copun_delete() {
        $CopunId = $_POST['CopunId'];
        $this->Copuns->soft_delete_by_key('CopunId', $CopunId);
        return true;
    }

}
