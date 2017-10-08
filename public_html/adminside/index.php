<?php
ini_set('display_errors', 1);
error_reporting(E_ALL & ~E_NOTICE & ~E_DEPRECATED);
session_start();

include $_SERVER['DOCUMENT_ROOT']."/libs/includer.php";
include ROOT_CLASS."admin.signup.php";

encoding('utf-8');
$routes = new route();
$route = $routes->languageRewrite();

$admin = new admin;
$mysql = new mysql();

$site_language = deflang(true);
$site_currency = defcurrency();
langDefiner($site_language["code"], true);

$lang_id = $site_language["id"];

if($admin->check()) {
    if($_GET['act'] == "logout") $admin->logout();
    
    $_SESSION["TABLE_VIEW"] = (!isset($_SESSION["TABLE_VIEW"])) ? config("admin_orders_default_view") : $_SESSION["TABLE_VIEW"];
    
    include ADM_ROOT.'bin/controller.php';
    $callback = new CallBack();
    $comments_products = new CommentsProducts();
    $comments_rew = new Comment();
    $orders = new Orders();
    $users = new UserlistUsers();
    include ADM_TPL."head.tpl";
    include ADM_TPL."main.tpl";
    include ADM_TPL."footer.tpl";
} else $admin->signup();