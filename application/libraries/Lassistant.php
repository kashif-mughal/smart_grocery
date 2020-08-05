<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Lassistant {

    //Retrieve  assistant List  
    public function assistant_list() {
        $CI = & get_instance();
        $assistant_list = $this->last_assistant();
        $i = 0;
        $total = 0;
        if (!empty($assistant_list)) {
            foreach ($assistant_list as $k => $v) {
                $i++;
                $assistant_list[$k]['sl'] = $i;
            }
        }
        $data = array(
            'title' => 'Manage Assistant',
            'assistant_list' => $assistant_list,
        );
        $assistantList = $CI->parser->parse('assistant/assistant', $data, true);
        return $assistantList;
    }

    public function last_assistant(){
        $CI = & get_instance();
        $CI->load->model('Assistants');
        $day = 1;
        $assistant_list = null;
        while (empty($assistant_list)) {
            if(--$day == -30)
                break;
            $Date = date_format(new DateTime(), 'Y-m-d');
            $dt = date ( 'Y-m-d' , strtotime ( $Date . " $day days" ));
            $assistant_list = $CI->Assistants->search_last_assistant("CreatedOn", $dt);
        }
        return $assistant_list;
    }

    //Sub assistant Add
    public function assistant_add_form() {
        $CI = & get_instance();
        $data = array(
            'title' => 'Add Assistant'
        );
        $assistantForm = $CI->parser->parse('assistant/add_assistant_form', $data, true);
        return $assistantForm;
    }

    // public function get_assistant_paginate(){
    //     $paginationConfig = $this->get_pagination_config('Cassistant/fetch_paginate');
    //     $this->pagination->initialize($paginationConfig);
    //     if(empty($this->input->get('page')))
    //         $page = 0;
    //     else
    //         $page = $this->input->get('page');
    //     $links = $this->pagination->create_links();
    //     $content = $this->lorder->view_orders($links, $paginationConfig["per_page"], $page, "order/orders","Manage Orders");
    // }

    //assistant Edit Data
    public function assistant_edit_data($AssistantId) {
        $CI = & get_instance();
        $CI->load->model('Assistants');
        $assistant_detail = $CI->Assistants->retrieve_editdata('AssistantId', $AssistantId);

        $data = array(
            'title' => 'Assistant Edit',
            'AssistantData' => $assistant_detail[0]
        );
        $chapterList = $CI->parser->parse('assistant/edit_assistant_form', $data, true);
        return $chapterList;
    }

}

?>