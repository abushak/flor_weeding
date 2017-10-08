<?php 
error_reporting(E_ALL &~ E_NOTICE);
session_start();

include $_SERVER['DOCUMENT_ROOT']."/libs/includer.php";

encoding('utf-8');
$mysql = new mysql;

$site_language = deflang(true);
$site_currency = defcurrency();
langDefiner($site_language["code"], true);

$lang_id = $site_language["id"];

if($_POST['function']) include ADM_ROOT.'ajax/'.$_POST['function'].'.php';
if($_GET['function']) include ADM_ROOT.'ajax/'.$_GET['function'].'.php';