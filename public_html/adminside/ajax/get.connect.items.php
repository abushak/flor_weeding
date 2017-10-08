<?php
if($_POST['product_id']){
    $product_id = $_POST['product_id'];
    $query = $mysql->query("SELECT `zet_product`.`id`,`url`,`title`,`price`,`zet_product_option`.`picture` FROM `zet_product`,`zet_product_description`,`zet_product_option` WHERE `zet_product_description`.`product_id`=`zet_product`.`id` AND `zet_product_description`.`language_id`='".$site_language['id']."' AND `zet_product_option`.`product_id`=`zet_product`.`id` AND `zet_product`.`id`='".$product_id."' LIMIT 1");
    $row = $mysql->assoc($query);
    include FORM.'catalog/products/connect.item.tpl';
}