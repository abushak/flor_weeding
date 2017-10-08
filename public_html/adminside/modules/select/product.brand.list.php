<?php
$query = $mysql->query("SELECT `id`,(SELECT `title` FROM `zet_brand_description` WHERE `language_id`='".$site_language['id']."' AND `brand_id`=`zet_brand`.`id`) AS `title` FROM `zet_brand` ORDER BY `priority` ASC");
while($res = $mysql->assoc($query)){
    include SELECT.'product.brand.select.item.tpl';
}