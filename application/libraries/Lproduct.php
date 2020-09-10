<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Lproduct {

    public function product_list() {
        $CI = & get_instance();
        $CI->load->model('Products');

        $product_list = $CI->Products->product_list();  //It will get all the products with status = 1
        $i = 0;
        if(!empty($product_list)) {
            foreach($product_list as $k => $v) {
                $i++;
                $product_list[$k]['sl'] = $i;
            }
        }

        $data = array(
            'title' => 'Manage Product',
            'product_list' => $product_list
        );

        $productList = $CI->parser->parse('product/product', $data, true);

        return $productList;
    }

    //Sub Category Add
    public function product_add_form() {
        $CI = & get_instance();

        $CI->load->model('Categories');
        $CI->load->model('Brands');
        $CI->load->model('Units');
        $categories = $CI->Categories->customSelect('CategoryId, CatName');
        $brands = $CI->Brands->customSelect('BrandId, BrandName');
        $units = $CI->Units->customSelect('UnitId, UnitName');
        $data = array(
            'title' => 'Add Product',
            'categories' => $categories,
            'brands' => $brands,
            'units' => $units
        );
        $productForm = $CI->parser->parse('product/add_product_form', $data, true);

        return $productForm;
    }

    public function insert_product($data) {
        $CI = & get_instance();
        $CI->load->model('Products');
        $result = $CI->Products->product_entry($data);
        if ($result == 1) {
            return TRUE;
        } else {
            return FALSE;
        }
    }

    //Product Edit Data
    public function product_edit_data($product_id) {
        $CI = & get_instance();
        $CI->load->model('Products');
        $CI->load->model('Categories');
        $CI->load->model('Brands');
        $CI->load->model('Units');

        $product_detail = $CI->Products->retrieve_editdata('ProductId', $product_id);
        $categories = $CI->Categories->customSelect('CategoryId, CatName');
        $brands = $CI->Brands->customSelect('BrandId, BrandName');
        $units = $CI->Units->customSelect('UnitId, UnitName');
        $data = array(
            'title' => 'Product Edit',
            'product_id' => $product_detail[0]['ProductId'],
            'product_name' => $product_detail[0]['ProductName'],
            'unit' => $product_detail[0]['Unit'],
            'OriginalPrice' => $product_detail[0]['OriginalPrice'],
            'price' => $product_detail[0]['Price'],
            'sale_price' => $product_detail[0]['SalePrice'],
            'is_featured' => $product_detail[0]['IsFeatured'],
            'is_hot' => $product_detail[0]['IsHot'],
            'category' => $product_detail[0]['Category'],
            'categories' => $categories,
            'brand' => $product_detail[0]['Brand'],
            'brands' => $brands,
            'status' => $product_detail[0]['status'],
            'units' => $units,
            'unit' => $product_detail[0]['UnitId'],
            'sale_unit_qty' => $product_detail[0]['SaleUnitQty'],
            'sale_unit' => $product_detail[0]['SaleUnit'],
            'ProductImg' => $product_detail[0]['ProductImg'],
            'tags' => $product_detail[0]['tags']
        );

        $chapterList = $CI->parser->parse('product/edit_product_form', $data, true);

        return $chapterList;
    }

    //Product Details
    public function product_details($product_id) {
        $CI = & get_instance();
        $CI->load->model('Products');
        $CI->load->library('occational');
        $CI->load->model('Web_settings');
        $details_info = $CI->Products->product_details_info($product_id);
        $purchaseData = $CI->Products->product_purchase_info($product_id);

        $totalPurchase = 0;
        $totalPrcsAmnt = 0;

        if (!empty($purchaseData)) {
            foreach ($purchaseData as $k => $v) {
                $purchaseData[$k]['final_date'] = $CI->occational->dateConvert($purchaseData[$k]['purchase_date']);
                $totalPrcsAmnt = ($totalPrcsAmnt + $purchaseData[$k]['total_amount']);
                $totalPurchase = ($totalPurchase + $purchaseData[$k]['quantity']);
            }
        }

        $salesData = $CI->Products->invoice_data($product_id);

        $totalSales = 0;
        $totaSalesAmt = 0;
        if (!empty($salesData)) {
            foreach ($salesData as $k => $v) {
                $salesData[$k]['final_date'] = $CI->occational->dateConvert($salesData[$k]['date']);
                $totalSales = ($totalSales + $salesData[$k]['quantity']);
                $totaSalesAmt = ($totaSalesAmt + $salesData[$k]['total_amount']);
            }
        }

        $stock = ($totalPurchase - $totalSales);
        $currency_details = $CI->Web_settings->retrieve_setting_editdata();
        $data = array(
            'title' => 'Product Report',
            'product_name' => $details_info[0]['product_name'],
            'product_model' => $details_info[0]['product_model'],
            'price' => $details_info[0]['price'],
            'purchaseTotalAmount' => number_format($totalPrcsAmnt, 2, '.', ','),
            'salesTotalAmount' => number_format($totaSalesAmt, 2, '.', ','),
            'total_purchase' => $totalPurchase,
            'total_sales' => $totalSales,
            'purchaseData' => $purchaseData,
            'salesData' => $salesData,
            'stock' => $stock,
            'product_statement' => 'Cproduct/product_sales_supplier_rate/' . $product_id,
            'currency' => $currency_details[0]['currency'],
            'position' => $currency_details[0]['currency_position'],
        );

        $productList = $CI->parser->parse('product/product_details', $data, true);
        return $productList;
    }

    //Product Details
    public function product_sales_supplier_rate($product_id, $startdate, $enddate) {
        $CI = & get_instance();
        $CI->load->model('Products');
        $CI->load->model('Web_settings');
        $CI->load->library('occational');

        //Product Summary
        $details_info = $CI->Products->product_details_info($product_id);
        $opening_balance = $CI->Products->previous_stock_data($product_id, $startdate);
        //Stock details.
        $salesData = $CI->Products->invoice_data_supplier_rate($product_id, $startdate, $enddate);

        $stock = $opening_balance[0]['quantity'];
        $totalIn = 0;
        $totalOut = 0;
        $totalstock = 0;
        $gtotal_sell = 0;
        $gtotal_purchase = 0;

        if (!empty($salesData)) {
            foreach ($salesData as $k => $v) {
                $salesData[$k]['fdate'] = $CI->occational->dateConvert($salesData[$k]['date']);

                if ($salesData[$k]['account'] == "a") {
                    $salesData[$k]['in'] = round($salesData[$k]['quantity'], 0);
                    $salesData[$k]['total_purchase'] = $salesData[$k]['total_price'];
                    $salesData[$k]['total_sell'] = 0;
                    $salesData[$k]['out'] = 0;
                    $stock = $stock + $salesData[$k]['out'] + $salesData[$k]['in'];
                    $totalIn += $salesData[$k]['in'];

                    $gtotal_purchase += $salesData[$k]['total_purchase'];
                } else {
                    $salesData[$k]['out'] = round($salesData[$k]['quantity'], 0);
                    $salesData[$k]['in'] = 0;
                    $stock = $stock + $salesData[$k]['out'] + $salesData[$k]['in'];
                    $totalOut += $salesData[$k]['out'];

                    $salesData[$k]['total_purchase'] = 0;
                    $salesData[$k]['total_sell'] = $salesData[$k]['total_price'];
                    $gtotal_sell += $salesData[$k]['total_sell'];
                }
                $salesData[$k]['stock'] = $stock;

                $totalstock = $salesData[$k]['stock'];
            }
        }
        $currency_details = $CI->Web_settings->retrieve_setting_editdata();
        $company_info = $CI->Products->retrieve_company();

        $data = array(
            'title' => 'Product Statement',
            'product_id' => $details_info[0]['product_id'],
            'product_name' => $details_info[0]['product_name'],
            'product_model' => $details_info[0]['product_model'],
            'startdate' => $startdate,
            'enddate' => $enddate,
            'price' => $details_info[0]['price'],
            'totalIn' => $totalIn,
            'totalOut' => $totalOut,
            'totalstock' => $totalstock,
            'gtotal_sell' => number_format($gtotal_sell, 2, '.', ','),
            'gtotal_purchase' => number_format($gtotal_purchase, 2, '.', ','),
            'opening_balance' => round($opening_balance[0]['quantity'], 0),
            'salesData' => $salesData,
            'company_info' => $company_info,
            'currency' => $currency_details[0]['currency'],
            'position' => $currency_details[0]['currency_position'],
        );
        $productList = $CI->parser->parse('product/product_sales_supplier_rate', $data, true);
        return $productList;
    }

    public function products_by_category($catId, $productName = null, $page = 0, $perpage = 8){
        $CI = & get_instance();
        $CI->load->library('lcategory');
        $product_list = $this->internal_products_by_category($catId, $productName, $page, $perpage);
        $catArray = $CI->lcategory->get_category_hierarchy();
        foreach($catArray as $key => $value) {
            for ($i=0; $i < count($value->childCats); $i++) { 
                if($catId != null && $value->childCats[$i]['CategoryId'] == $catId) {
                    $selectedCategory = array(
                        'MainCategory' => $value->childCats[$i]['ParentName'],
                        'SubCategory' => $value->childCats[$i]['CatName']
                    );
                }
            }
        }

        if($catId == null) {
            $selectedCategory = array(
                'MainCategory' => 'Products',
                'SubCategory' => 'All'
            );
        }
        $data = array(
            'title' => 'Sauda Express | Buy each and everything home grocery',
            'CatList' => $catArray,
            'ProdList' => $product_list["products"],
            'TotalProducts' => $product_list["total"],
            'SelectCategory' => $selectedCategory,
            'PerPage' => $perpage
        );
        return $CI->parser->parse('product/products', $data, true);
    }
    public function internal_products_by_category($catId, $productName = null, $page = 0, $perpage = 8){
        $CI = & get_instance();
        $CI->load->model('Categories');
        $result =  $CI->Categories->getCatPrducts($catId, $productName, $page * $perpage, $perpage);
        return $result;
    }
}

?>