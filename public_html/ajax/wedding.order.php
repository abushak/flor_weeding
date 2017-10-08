<?php

$name  = $_POST['name'];
$from  = $_POST['email'];
$phone = $_POST['phone'];
$msg   = $_POST['message'];

$site  = 'FLOR People';
// $to    = 'info@florpeople.com';
$to    = 'mbee@i.ua';
$title = 'Оформление Свадьбы';
$mess  = 'Хочу заказать оформление свадьбы<br><br>Имя: '.$name.'<br>Email: '.$from.'<br>Телефон: '.$phone.'<br><br>'.$msg;

$headers .= "Content-type: text/html; charset=utf-8"."\r\n";
$headers .= "To: {$site} {$to}"."\r\n";
$headers .= "From: {$name} <{$from}>"."\r\n";

mail($to, $title, $mess, $headers);
