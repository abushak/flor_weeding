<?php
include $_SERVER["DOCUMENT_ROOT"]."/libs/includer.php";
$mysql = new mysql;
encoding("utf-8");
$site_language = deflang(true);
langDefiner($site_language["code"], true);
$lang_id = $site_language["id"];


/** ------------------------------------------------ **/
$order_id = 29;
$_InMailOrder = new InMailOrder($order_id);

$params = $_InMailOrder->GetOrderInfo();
$user = $_InMailOrder->GetUserInfo();
$receiver = $_InMailOrder->GetUserInfo(1);
$_products_in = $_InMailOrder->GetProducts();

$title = "Заказ №{$order_id}";
$date = "Дата: {$params["date"]}";

$status = $_InMailOrder->ResolveName("status", $params["status"]);
$delivery = $_InMailOrder->ResolveName("delivery", $params["delivery_metnod"]);
$payment = $_InMailOrder->ResolveName("payment", $params["payment_method"]);

if ($params["photos"] == 1) $photo_price = config("photo_price");
if ($params["card"] == 1) $card_price = config("card_price");

$public_key = "i69841769747";
$private_key = "vsnoAl1UPhsX2wKbJaua1iPWmt742QX2TnFl0JSZ";
$liqpay = new LiqPay($public_key, $private_key);
$html = $liqpay->cnb_form(array("version" => "3", "amount" => $params["final_price"], "currency" => "UAH", "description" => $title, "order_id" => "order_id_{$order_id}", "pay_way" => "card,liqpay"));

ob_start();
include(TPL."mail.tpl");
$message = ob_get_contents();
ob_end_clean();

$to = "dmytro.zhurakovsky@gmail.com";
$title = "Заказ №{$params["id"]} {$params["date"]}";
$mess = $message;

$headers .= 'Content-type: text/html; charset=utf-8'."\r\n";
$headers .= 'To: '.$user['name'].' <dmytro.zhurakovsky@gmail.com>'."\r\n";
$headers .= 'From: '.config('sitename_'.$lang_id).' <'.config('notify_email').'>'."\r\n";

mail($to, $title, $mess, $headers); 