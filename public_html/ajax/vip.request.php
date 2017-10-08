<?php
$sitename = config('sitename_1');
$to = config('notify_email');

$from = $_POST['email'];
$name = $_POST['name'];
$title = 'VIP Клуб';
$mess = 'Хочу стать участником VIP Клуба на сайте '.$sitename.'<br /><br />'.
        'Имя: '.$_POST['name'].'<br />'.
        'Email: '.$_POST['email'].'<br />'.
        'Телефон: '.$_POST['phone'];

$headers .= "Content-type: text/html; charset=utf-8"."\r\n";
$headers .= "To: {$sitename} {$to}"."\r\n";
$headers .= "From: {$name} <{$from}>"."\r\n";

mail($to, $title, $mess, $headers);