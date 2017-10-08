<?php
$result = base64_decode($_POST["data"]);
$data = json_decode($result, true);

$tmp = explode("_", $data["order_id"]);
$order = $tmp[1];

if ($data["status"] == "success" || $data["status"] == "sandbox") {
    $mysql->query("UPDATE `zet_orders` SET `payment_status`='1' WHERE `id`='".(int)$order."'");
}