<?php
$id = $_POST['product_id'];
$column = $_POST['column'];
$value = $_POST['value'];

$query = $mysql->query("UPDATE `zet_product` SET `".$column."`='".$value."' WHERE `id`='".$id."'");