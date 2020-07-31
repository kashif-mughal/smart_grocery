<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Lassistant {

    //Retrieve  assistant List  
    public function assistant_list() {
        $CI = & get_instance();
        $CI->load->model('Assistants');
        $assistant_list = $CI->Assistants->_list();  //It will get only Credit assistants
        $i = 0;
        $total = 0;
        if (!empty($assistant_list)) {
            foreach ($assistant_list as $k => $v) {
                $i++;
                $assistant_list[$k]['sl'] = $i + $CI->uri->segment(3);
            }
        }
        $data = array(
            'title' => 'Manage Assistant',
            'assistant_list' => $assistant_list,
        );
        $assistantList = $CI->parser->parse('assistant/assistant', $data, true);
        return $assistantList;
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