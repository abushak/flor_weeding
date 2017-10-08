<?php
$products = $_POST['products'];
$options = $_POST['variants'];
$prices = $_POST['variants_price'];
$quantity = $_POST['variants_qty'];
$delivry_method = $_POST['delivry_method'];
$user_id = $_POST['user_id'];

$product_ids = explode(',', $products);
$product_option = explode(',', $options);
$product_price = explode(',', $prices);
$product_qty = explode(',', $quantity);
$user_group = getUserGroupByUserId($user_id);

$real_price = 0;
$final_price = 0;

foreach($product_ids as $key => $product_id){
    $_product_price = getProductPriceByProductIdAndOptionId($product_id, $product_option[$key]);
    $_product_price = NewPrice($_product_price);
    $real_price += $_product_price * $product_qty[$key];
    $final_price += getProductLastPriceByUserGroupId($user_group, $product_id, $product_qty[$key], $_product_price);
}

$final_price = getOrderOneTimeDiscount($final_price);
$final_price = getOrderDiscount($final_price, $final_price);
$del_price = getDeliveryPrice($final_price, $delivry_method);

$discount = $real_price - $final_price;
$final_price = $final_price + $del_price;

$result = array();
$result['real_price'] = $real_price;
$result['discount'] = $discount;
$result['del_price'] = $del_price;
$result['final_price'] = $final_price;

$result = json_encode($result);
echo $result;