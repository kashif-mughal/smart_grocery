<?php
/**
 * CodeIgniter
 *
 * An open source application development framework for PHP
 *
 * This content is released under the MIT License (MIT)
 *
 * Copyright (c) 2014 - 2017, British Columbia Institute of Technology
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 *
 * @package	CodeIgniter
 * @author	EllisLab Dev Team
 * @copyright	Copyright (c) 2008 - 2014, EllisLab, Inc. (https://ellislab.com/)
 * @copyright	Copyright (c) 2014 - 2017, British Columbia Institute of Technology (http://bcit.ca/)
 * @license	http://opensource.org/licenses/MIT	MIT License
 * @link	https://codeigniter.com
 * @since	Version 1.0.0
 * @filesource
 */
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Model Class
 *
 * @package		CodeIgniter
 * @subpackage	Libraries
 * @category	Libraries
 * @author		EllisLab Dev Team
 * @link		https://codeigniter.com/user_guide/libraries/config.html
 */
class CI_Model extends Lic {

	/**
	 * Class constructor
	 *
	 * @return	void
	 */
	private $tableName = '';
	public function __construct($tblName)
	{
		log_message('info', 'Model Class Initialized');
		$this->tableName = $tblName;
	}

	// --------------------------------------------------------------------

	/**
	 * __get magic
	 *
	 * Allows models to access CI's loaded classes using the same
	 * syntax as controllers.
	 *
	 * @param	string	$key
	 */
	public function __get($key)
	{
		// Debugging note:
		//	If you're here because you're getting an error message
		//	saying 'Undefined Property: system/core/Model.php', it's
		//	most likely a typo in your model code.
		return get_instance()->$key;
	}

    public function soft_delete_by_key($key, $value) {
        $data = array(
            'Status' => 0,
        );
        $this->db->where($key, $value);
        $this->db->update($this->tableName, $data);
        print_r("Successfully deleted");
        return true;
    }

    public function hard_delete_by_key($key, $value) {
        $this->db->where($key, $value);
        $this->db->delete($this->tableName);
        return true;
    }

    public function update($data, $key, $value) {
        $this->db->where($key, $value);
        $this->db->update($this->tableName, $data);
        return true;
    }

    public function customSelect($selectString, $where = null, $limit = null, $orderByCol = null, $orderByOrder = 'DESC') {
        $this->db->select($selectString);
        $this->db->from($this->tableName);
        $this->db->where('Status', 1);
        if(!is_null($where))
        	$this->db->where($where);
        if(!is_null($orderByCol))
            $this->db->order_by($orderByCol, $orderByOrder);
        if(!is_null($limit))
            $this->db->limit($limit);
        $query = $this->db->get();
        if ($query->num_rows() > 0) {
            return $query->result_array();
        }
        return Array();
    }

    public function count(){
    	$this->db->select('count(*)');
		$this->db->from($this->tableName);
    	$this->db->where('Status', 1);
		echo $this->db->count_all_results();
    }

    public function _list() {
        $this->db->select('*');
        $this->db->from($this->tableName);
        $this->db->where('Status', 1);
        $query = $this->db->get();
        if ($query->num_rows() > 0) {
            return $query->result_array();
        }
        return false;
    }

    public function retrieve_editdata($key, $value) {
        $this->db->select('*');
        $this->db->from($this->tableName);
        $this->db->where($key, $value);
        $query = $this->db->get();
        if ($query->num_rows() > 0) {
            return $query->result_array();
        }
        return false;
    }
}
