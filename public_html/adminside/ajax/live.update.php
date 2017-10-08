<?php
$table = $_POST['table'];
$column = $_POST['column'];
$value = $_POST['value'];
$product = $_POST['product'];
$option = $_POST['option'];

$mysql->query("UPDATE `zet_".$table."` SET `".$column."`='".$value."' WHERE `product_id`='".$product."' AND `id`='".$option."'");