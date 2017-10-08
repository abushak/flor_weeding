<?php
$products_list = $_POST['products'];
$brand = $_POST['brand'];
$products = explode(',', $products_list);
$products = array_diff($products, array('', null));
if(count($products) > 0){
    foreach($products as $key => $product_id){
        $mysql->query("DELETE FROM `zet_product_to_brand` WHERE `product_id`='".$product_id."'");
        if($brand != 0) {
            $mysql->query("INSERT INTO `zet_product_to_brand`(`product_id`,`brand_id`) VALUES ('".$product_id."','".$brand."')");
        }
    }
}