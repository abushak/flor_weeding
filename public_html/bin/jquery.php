<?php
error_reporting(E_ALL &~ E_NOTICE);
session_start();

include $_SERVER['DOCUMENT_ROOT']."/libs/includer.php";

encoding('utf-8');
$mysql = new mysql;

$lang_code = $_POST['lang_code'];
$site_currency = defcurrency();

langDefiner($lang_code);
$lang_id = getLanguageIdByCode($lang_code);

$__session = session_id();
define("HREFLANG", $_SESSION['_lang']);

define('SRV_', 'http://'.$_SERVER['SERVER_NAME'].'/'.$_hl);

if($_POST['func']) include ROOT.'ajax/'.$_POST['func'].'.php';
if($_GET['func']) include ROOT.'ajax/'.$_GET['func'].'.php';