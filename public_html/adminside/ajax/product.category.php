<?php
$products_list = $_POST['products'];
$category = $_POST['category'];
$products = explode(',', $products_list);
$products = array_diff($products, array('', null));
if(count($products) > 0){
    foreach($products as $key => $product_id){
        if($category != 0) {
            $mysql->query("DELETE FROM `zet_product_to_category` WHERE `product_id`='".$product_id."' AND `is_main_category`='1'");
            $mysql->query("INSERT INTO `zet_product_to_category`(`product_id`,`category_id`,`is_main_category`) VALUES ('".$product_id."','".$category."','1')");
        }
    }
}