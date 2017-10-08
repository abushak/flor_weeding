<?php 
$_Product = new CatalogProduct();
$images = $_Product->GetProductGallery($_POST['url']);
$description = $_Product->GetProductDescription($_POST['url']);
$variants = $_Product->GetProductVariants($_POST['url']);
$category = $_Product->GetProductCategoryByUrl($_POST['url']);
include TPL."shop/fast.tpl";