<!-- Bread Crumb -->

<div class="bread_crumb">
    <div class="container">
        <div class="row d-block">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                    <li class="breadcrumb-item"><a href="#"><?php echo $SelectCategory['MainCategory']; ?></a></li>
                    <li class="breadcrumb-item"><?php echo $SelectCategory['SubCategory']; ?></li>
                </ol>
            </nav>
            <h3 class="mb-0"><?php echo $SelectCategory['SubCategory']; ?></h3>
        </div>
    </div>
</div>

<!-- Bread Crumb -->


<section class="main-content">
    <div class="container">
        <div class="row">
            <div class="col-xl-3 col-lg-3 col-md-12 pr-0">
                <div class="categories sidebar-inner-page">
                    <h4>Shop By Department</h4>
                    <?php foreach($CatList as $key => $value) {?>
                        <div class="sidebar-inner-category-content">
                            <div class="sub-category">
                                <div class="sub-category-content">

                                    <h6><?=$key?></h6>

                                    <?php for ($i=0; $i < count($value->childCats); $i++) {?>
                                        <a href="<?php echo base_url(); ?>Cproduct/products?categoryId=<?=$value->childCats[$i]['CategoryId']?>">
                                            <span class="hyphen">&#8212;</span> <span class="category-text"><?=$value->childCats[$i]['Alias']?></span>
                                        </a>
                                    <?php } ?>
                                    
                                </div>
                            </div>

                        </div>
                    <?php } ?>
                </div>
            </div>
            <div class="col-xl-9 col-lg-9 col-md-12 my-3 pr-0">

                <div class="container bg-transparent pr-0">
                    <div class="row">
                        <?php foreach($ProdList as $value) { 
                            $discountPercentage = (($value['Price'] - $value['SalePrice'])/$value['Price']) * 100;
                            ?>
                            <div class="col-xl-3 col-lg-3 col-md-4 col-sm-6 px-0">
                                <div class="featured-products-content mb-2 d-flex justify-content-between">
                                    <div class="card mr-2 each-prod product-card-inner">
                                        <div class="card-body p-0">
                                            <div class="header">
                                                <?php if($discountPercentage != 0) { ?> 
                                                    <h5 class="card-title float-left"><?php echo round($discountPercentage)."% OFF"; ?></h5>
                                                <?php } ?>
                                                <a href="#" class="add_to_favorite">
                                                    <i class="fas fa-heart float-right"></i>
                                                </a>
                                            </div>
                                        </div>
                                        <img class="card-img-bottom text-center" src="<?php echo base_url().$value['ProductImg']; ?>" alt="Card image cap">
                                        <div class="product-info text-center">
                                            <p class="card-text product-card-inner-name"><?php echo $value['ProductName']; ?></p>
                                            <p class="card-text product-card-inner-weight"><?php echo $value['UnitName']; ?></p>
                                            <p class="card-text product-card-inner-price d-inline">Rs. <?php echo $value['SalePrice']; ?></p>
                                            <?php if($discountPercentage != 0) { ?> 
                                                <span class="product-discount"><del>Rs. <?php echo $value['Price']; ?></del></span>
                                            <?php } 
                                            $productObject = (object) [
                                               'id' => $value['ProductId'],
                                               'pName' => $value['ProductName'],
                                               'price' => $value['SalePrice'],
                                               'img' => base_url().$value['ProductImg']
                                           ];
                                           ?>
                                            <div class="quantity-area d-flex justify-content-center align-items-center mt-2">
                                                <span class="d-inline-flex quantity-text mr-1">Qty</span>
                                                <input type="text" class="d-inline-flex quantity-input quantity">
                                                <span class="d-block quantity-button">
                                                    <a href="javascript:void(0);" class="qty-pls d-block">+</a>
                                                    <div class="separator"></div>
                                                    <a href="javascript:void(0);" class="qty-mns d-block">-</a>
                                                </span>
                                            </div>
                                        </div>
                                        <a href="javascript:void(0);" class="product-card-btn mx-auto add-cart"
                                        data-json="<?php echo htmlentities(json_encode($productObject), ENT_QUOTES, 'UTF-8'); ?>"
                                        >Add to Cart</a>
                                        <a href="javascript:void(0);" style="display: none;" class="product-card-btn mx-auto remove-cart"
                                        data-json="<?php echo htmlentities(json_encode($productObject), ENT_QUOTES, 'UTF-8'); ?>"
                                        >Remove From Cart</a>
                                    </div>
                                </div>
                            </div>
                        <?php } ?>

                    </div>
                </div>


            </div>

        </div>

        <!-- HOUSEHOLD ESSENTIALS -->

    </div>
</section>


    <!-- Content -->