<?php
error_reporting(E_ERROR | E_WARNING | E_PARSE);
session_start();

include $_SERVER['DOCUMENT_ROOT']."/libs/includer.php";

encoding('utf-8');
$mysql = new mysql;

$language = deflang();
$deflang = $language['code'];

$lang_code = $_POST['lang_code'];
$site_currency = defcurrency();

langDefiner($lang_code);
$lang_id = getLanguageIdByCode($lang_code);

$__session = session_id();
define("HREFLANG", $_SESSION['_lang']);

$_hl = ($lang_code == $deflang) ? "" : "{$lang_code}/";
define('SRV_', 'http://'.$_SERVER['SERVER_NAME'].'/'.$_hl);

if($_POST['function']) include ROOT.'ajax/'.$_POST['function'].'.php';
//if($_GET['func']) include ROOT.'ajax/'.$_GET['func'].'.php';