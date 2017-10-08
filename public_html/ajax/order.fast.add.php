<?php
$product_id = $_POST['product_id'];
$option_id = $_POST['option_id'];
$quantity = (empty($_POST['quantity'])) ? 1 : $_POST['quantity'];

$user = $_SESSION['USER_ID'];
$name = $_POST['user_name'];
$phone = $_POST['user_phone'];
$comment = $_POST['user_comment'];

$mysql->query("INSERT INTO `zet_orders`(`status`,`fast`,`date`) VALUES ('1','1','".date("Y-m-d")."')");
$_id = $mysql->getLastId();
$mysql->query("INSERT INTO `zet_orders_products`(`order_id`,`product_id`,`product_option_id`,`qty`) VALUES ('".$_id."','".$product_id."','".$option_id."','".$quantity."')");
$mysql->query("INSERT INTO `zet_orders_user`(`order_id`,`user_id`,`name`,`phone`,`comment`) VALUES ('".$_id."','".$user."','".$name."','".$phone."','".$comment."')");

$item_price = ItemPrice($product_id, $option_id);
$real_price = NewPrice($item_price) * $quantity;
$final_price = Discount($real_price);
$discount = $real_price - $final_price;
$discount = empty($discount) ? 0 : $discount;

$mysql->query("UPDATE `zet_orders` SET `real_price`='".$real_price."',`discount`='".$discount."',`del_price`='0',`final_price`='".$final_price."' WHERE `id`='".$_id."'");
