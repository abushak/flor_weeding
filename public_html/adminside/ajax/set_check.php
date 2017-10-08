<?php
$id = $mysql->escape($_POST['id']);
$value = $mysql->escape($_POST['val']);
switch($_POST['table']){
    case "categories": $table = "zet_category"; break;
    case "brands": $table = "zet_brand"; break;
    case "news": $table = "zet_news"; break;
    case "promo": $table = "zet_news"; break;
    case "groups": $table = "zet_userlist_group"; break;
    case "discount": $table = "zet_discount_orders"; break;
    case "payment": $table = "zet_payment_method"; break;
    case "currency": $table = "zet_currency"; break;
    case "delivery": $table = "zet_delivery_method"; break;
    case "callback": $table = "zet_callback"; break;
    case "c_products": $table = "zet_comments_to_products"; break;
    case "reviews": $table = "zet_comments_reviews"; break;
    case "main_menu": $table = "zet_pages"; break;
    case "properties": $table = "zet_product_properties"; break;
    case "slider": $table = "zet_slider"; break;
}
$str = "UPDATE `{$table}` SET `status`='{$value}' WHERE `id`='{$id}'";
$query = $mysql->query($str) or die(mysql_error());
