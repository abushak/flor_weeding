<?php
$data = array();

$query = $mysql->query("SELECT `id` FROM `zet_category` WHERE `url`='".$_POST["url"]."'");
$row = $mysql->assoc($query);
$id = $row["id"];

$_products_per_page = config("products_per_page");
$_initial_product = $_POST["last"];
$_limit = "LIMIT {$_initial_product},{$_products_per_page}";
        
switch ($_POST["sort_by"]) {
    case "promo": $_order_by = " `zet_product`.`hit`='0' ASC"; break;
    case "new": $_order_by = " `zet_product`.`new`='0' ASC"; break;
    case "expensive": $_order_by = " `zet_product_option`.`price` DESC"; break;
    case "cheap": $_order_by = " `zet_product_option`.`price` ASC"; break;
    case "name": $_order_by = " `zet_product_description`.`title` ASC"; break;
    case "popular": $_order_by = " `creation_date` DESC"; break;
    default: $_order_by = " `article` ASC"; break;
}

$between = (!empty($_POST["min_price"]) && !empty($_POST["max_price"])) ? "AND `price` BETWEEN '".$_POST["min_price"] / config('usd')."' AND '".$_POST["max_price"] / config('usd')."'" : "";
$category = (empty($id)) ? false : "AND `zet_product_to_category`.`category_id`='".$id."'";

//$query = $mysql->query("SELECT `zet_product`.`id` AS `id`,`new`,`recommended`,`hit`,`url`,`title`,`zet_product`.`picture`,`price`,`quantity`,`cross_price` FROM `zet_product`,`zet_product_description`,`zet_product_option`,`zet_product_to_category` WHERE `zet_product_option`.`product_id`=`zet_product`.`id` AND `zet_product_description`.`product_id`=`zet_product`.`id` AND `zet_product_description`.`language_id`='".$lang_id."' AND `zet_product`.`id`=`zet_product_to_category`.`product_id` AND `zet_product`.`status`='1' AND `zet_product`.`additional`='0' {$between} {$category} GROUP BY `zet_product`.`id` ORDER BY {$_order_by} {$_limit}");
$query = $mysql->query("SELECT `zet_product`.`id` AS `id`,`new`,`recommended`,`hit`,`url`,`title`,`zet_product`.`picture`,`price`,`quantity`,`cross_price` FROM `zet_product`,`zet_product_description`,`zet_product_option`,`zet_product_to_category` WHERE `zet_product_option`.`product_id`=`zet_product`.`id` AND `zet_product_description`.`product_id`=`zet_product`.`id` AND `zet_product_description`.`language_id`='".$lang_id."' AND `zet_product`.`id`=`zet_product_to_category`.`product_id` AND `zet_product`.`status`='1' AND `zet_product`.`additional`='0' {$between} {$category} GROUP BY `zet_product`.`id` ORDER BY `article` LIKE '000%' DESC, {$_order_by} {$_limit}");
while ($row = $mysql->assoc($query)) {
    $query_category = $mysql->query("SELECT `url` FROM `zet_category`,`zet_product_to_category` WHERE `zet_product_to_category`.`product_id`='".$row['id']."' AND `zet_product_to_category`.`is_main_category`='1' AND `zet_product_to_category`.`category_id`=`zet_category`.`id`");
    $row_category = $mysql->assoc($query_category);
    $data[$row["id"]] = $row;
    $data[$row["id"]]["category"] = $row_category["url"];
    $data[$row["id"]]["price"] = NewPrice($row["price"]);
}

foreach ($data as $key => $val) {
    $new = ($val["new"] == 1) ? " new" : false;
    $hit = ($val["hit"] == 1) ? " hit" : false;
    $sale = ($val["cross_price"] > $val["price"]) ? " sale" : false;
    include TPL."common/catalog.item.tpl";
}