<?php
switch($_POST['table']){
    case "categories": $table = "zet_category"; break;
    case "brands": $table = "zet_brand"; break;
    case "payment": $table = "zet_payment_method"; break;
    case "delivery": $table = "zet_delivery_method"; break;
    case "main_menu": $table = "zet_pages"; break;
    case "slider": $table = "zet_slider"; break;
    case "properties": $table = "zet_product_properties"; break;
    case "cities": $table = "zet_cities"; break;
}
$_POST['ids'] = explode("&", implode("", explode("id[]=", $_POST['ids'])));
for($i = 1; $i <= count($_POST['ids']); $i++) {
    if($_POST['table'] == 'cities'){
        $str = "UPDATE `{$table}` SET `priority`='{$i}' WHERE `city_id`='".$_POST['ids'][$i - 1]."'";
    } else $str = "UPDATE `{$table}` SET `priority`='{$i}' WHERE `id`='".$_POST['ids'][$i - 1]."'";
    $query = $mysql->query($str) or die(mysql_error());
}