<?php
if (!defined('BASEPATH'))
    exit('No direct script access allowed');
class Lcategory
  {
    //Retrieve  category List    
    public function category_list()
      {
        $CI =& get_instance();
        $CI->load->model('Categories');
        $category_list = $CI->Categories->category_list(); //It will get only Credit categorys
        $i             = 0;
        $total         = 0;
        if (!empty($category_list))
          {
            foreach ($category_list as $k => $v)
              {
                $i++;
                $category_list[$k]['sl'] = $i + $CI->uri->segment(3);
                if (empty($category_list[$k]['ParentName']))
                  {
                    $category_list[$k]['ParentName'] = 'None';
                  }
              }
          }
        $data         = array(
            'title' => 'Manage Category',
            'category_list' => $category_list
        );
        $categoryList = $CI->parser->parse('category/category', $data, true);
        return $categoryList;
      }
    //Sub Category Add
    public function category_add_form()
      {
        $CI =& get_instance();
        $CI->load->model('Categories');
        $categories   = $CI->Categories->customSelect('CategoryId, CatName');
        $data         = array(
            'title' => 'Add Category',
            'parent_categories' => $categories
        );
        $categoryForm = $CI->parser->parse('category/add_category_form', $data, true);
        return $categoryForm;
      }
    //category Edit Data
    public function category_edit_data($category_id)
      {
        $CI =& get_instance();
        $CI->load->model('Categories');
        $category_detail = $CI->Categories->retrieve_editdata('CategoryId', $category_id);
        $categories   = $CI->Categories->customSelect('CategoryId, CatName');
        $data            = array(
            'title' => 'Category Edit',
            'CategoryId' => $category_detail[0]['CategoryId'],
            'CatName' => $category_detail[0]['CatName'],
            'Alias' => $category_detail[0]['Alias'],
            'Status' => $category_detail[0]['Status'],
            'Img' => $category_detail[0]['Img'],
            'ParentId' => $category_detail[0]['ParentId'],
            'parent_categories' => $categories
        );
        $chapterList     = $CI->parser->parse('category/edit_category_form', $data, true);
        return $chapterList;
      }
    //Getting categories with their child categories
    public function get_category_hierarchy()
      {
        $CI =& get_instance();
        $CI->load->model('Categories');
        $category_list = $CI->Categories->category_list();
        for ($i = 0; $i < count($category_list); $i++)
          {
            if ($category_list[$i]['ParentId'] != '0' && empty($catArray[$category_list[$i]['ParentName']]->childCats))
              {
                $catArray[$category_list[$i]['ParentName']]->childCats = Array();
              }
            if (is_array($catArray[$category_list[$i]['ParentName']]->childCats))
              {
                array_push($catArray[$category_list[$i]['ParentName']]->childCats, $category_list[$i]);
                $catArray[$category_list[$i]['ParentName']]->catId = $category_list[$i]['ParentId'];
              }
          }
          //echo '<pre>';print_r($catArray);die;
        return $catArray;
      }
  }
?>