<?php
$_product = new CatalogProduct();
$products_list = $_POST['products'];
$products = explode(',', $products_list);
$products = array_diff($products, array('', null));
if(count($products) > 0){
    foreach($products as $key => $product_id){
        $_product->copyProduct($product_id);
    }
}