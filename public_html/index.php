<?php
error_reporting(E_ERROR | E_WARNING | E_PARSE);
session_set_cookie_params(86400);
session_start();


include $_SERVER["DOCUMENT_ROOT"]."/libs/includer.php";
$mysql = new mysql;

encoding("utf-8");
$routes = new route();
$route = $routes->languageRewrite();

$language = deflang();
$deflang = $language["code"];
$elselang = $route[0];
$default_currency = defcurrency();
include ROOT_LIB."vars.php";
$_SESSION["CURRENCY"] = (isset($_SESSION["CURRENCY"])) ? $_SESSION["CURRENCY"] : $default_currency["code"];
$site_currency = loadcurrency($_SESSION["CURRENCY"]);

language();
$lang_id = getLanguageIdByCode(LANG);
$_lang_code = (empty($route[0])) ? $deflang : $elselang;

$_hl = (empty($route[0])) ? "" : $route[0]."/";
define("SRV_", "http://".$_SERVER["SERVER_NAME"]."/".$_hl);

$__session = session_id();

switch ($route[1]) {
    case "": $dir = "main"; break;
    case "main": $dir = "main"; break;

    case "news":
        $dir = "news";
        $page = (empty($route[2]) || $_GET) ? "content.list.tpl" : "content.detail.tpl";
        break;
    case "pay_del": $dir = "pay_del"; break;
    case "about": $dir = "about"; break;
    case "reviews": $dir = "reviews"; break;
    case "partners": $dir = "partners"; break;
    case "gifts": $dir = "gifts"; break;
    case "contacts": $dir = "contacts"; break;

    case "services": $dir = "services"; break;
    case "weddings": $dir = "weddings"; break;
    case "for_companies": $dir = "for_companies"; break;
    case "shop":
        $dir = "shop";
        $page = (empty($route[3]) || $_GET) ? "content.catalog.tpl" : "content.product.tpl";
        break;
    case "vip": $dir = "vip"; break;

    case "cart": $dir = "cart"; break;
	case "userorder": $dir = "userorder";
        if (empty($route[2])) {
            $page = "content.order.tpl";
        } else {
            switch ($route[2]) {
                case "success": $page = "content.success.tpl"; break;
                case "": $page = ""; break;
                default: $page = "content.confirm.tpl"; break;
            }
        }
        break;
    case "order":
        $dir = "order";
        if (empty($route[2])) {
            $page = "content.order.tpl";
        } else {
            switch ($route[2]) {
                case "success": $page = "content.success.tpl"; break;
                case "": $page = ""; break;
                default: $page = "content.confirm.tpl"; break;
            }
        }
        break;

    case "search": $dir = "search"; break;

    case "404": $dir = "404"; break;
	case "auth": $dir = "auth"; break;
    case "reg": $dir = "reg"; break;
	case "profile": $dir = "profile"; break;
	case "forgot": $dir = "forgot"; break;
	case "accept": $dir = "accept"; break;
    case "mydates": $dir = "mydates"; break;
    case "myorder": $dir = "myorder"; break;
    case "myhistory": $dir = "myhistory"; break;
	case "calendar": $dir = "calendar"; break;
	case "calendar?m=01&y=2015": $dir = "calendar"; break;
    case "calendar?m=02&y=2015": $dir = "calendar"; break;
    case "calendar?m=03&y=2015": $dir = "calendar"; break;
    case "calendar?m=04&y=2015": $dir = "calendar"; break;
    case "calendar?m=05&y=2015": $dir = "calendar"; break;
    case "calendar?m=06&y=2015": $dir = "calendar"; break;
    case "calendar?m=07&y=2015": $dir = "calendar"; break;
    case "calendar?m=08&y=2015": $dir = "calendar"; break;
    case "calendar?m=09&y=2015": $dir = "calendar"; break;
    case "calendar?m=10&y=2015": $dir = "calendar"; break;
    case "calendar?m=11&y=2015": $dir = "calendar"; break;
    case "calendar?m=12&y=2015": $dir = "calendar"; break;
    case "calendar?m=01&y=2016": $dir = "calendar"; break;
    case "calendar?m=02&y=2016": $dir = "calendar"; break;
    case "calendar?m=03&y=2016": $dir = "calendar"; break;
    case "calendar?m=04&y=2016": $dir = "calendar"; break;
    case "calendar?m=05&y=2016": $dir = "calendar"; break;
    case "calendar?m=06&y=2016": $dir = "calendar"; break;
    case "calendar?m=07&y=2016": $dir = "calendar"; break;
    case "calendar?m=08&y=2016": $dir = "calendar"; break;
    case "calendar?m=09&y=2016": $dir = "calendar"; break;
    case "calendar?m=10&y=2016": $dir = "calendar"; break;
    case "calendar?m=11&y=2016": $dir = "calendar"; break;
    case "calendar?m=12&y=2016": $dir = "calendar"; break;
    case "calendar?m=01&y=2017": $dir = "calendar"; break;
    case "calendar?m=02&y=2017": $dir = "calendar"; break;
    case "calendar?m=03&y=2017": $dir = "calendar"; break;
    case "calendar?m=04&y=2017": $dir = "calendar"; break;
    case "calendar?m=05&y=2017": $dir = "calendar"; break;
    case "calendar?m=06&y=2017": $dir = "calendar"; break;
    case "calendar?m=07&y=2017": $dir = "calendar"; break;
    case "calendar?m=08&y=2017": $dir = "calendar"; break;
    case "calendar?m=09&y=2017": $dir = "calendar"; break;
    case "calendar?m=10&y=2017": $dir = "calendar"; break;
    case "calendar?m=11&y=2017": $dir = "calendar"; break;
    case "calendar?m=12&y=2017": $dir = "calendar"; break;
    case "calendar?m=01&y=2018": $dir = "calendar"; break;
    case "calendar?m=02&y=2018": $dir = "calendar"; break;
    case "calendar?m=03&y=2018": $dir = "calendar"; break;
    case "calendar?m=04&y=2018": $dir = "calendar"; break;
    case "calendar?m=05&y=2018": $dir = "calendar"; break;
    case "calendar?m=06&y=2018": $dir = "calendar"; break;
    case "calendar?m=07&y=2018": $dir = "calendar"; break;
    case "calendar?m=08&y=2018": $dir = "calendar"; break;
    case "calendar?m=09&y=2018": $dir = "calendar"; break;
    case "calendar?m=10&y=2018": $dir = "calendar"; break;
    case "calendar?m=11&y=2018": $dir = "calendar"; break;
    case "calendar?m=12&y=2018": $dir = "calendar"; break;
    case "calendar?m=01&y=2019": $dir = "calendar"; break;
    case "calendar?m=02&y=2019": $dir = "calendar"; break;
    case "calendar?m=03&y=2019": $dir = "calendar"; break;
    case "calendar?m=04&y=2019": $dir = "calendar"; break;
    case "calendar?m=05&y=2019": $dir = "calendar"; break;
    case "calendar?m=06&y=2019": $dir = "calendar"; break;
    case "calendar?m=07&y=2019": $dir = "calendar"; break;
    case "calendar?m=08&y=2019": $dir = "calendar"; break;
    case "calendar?m=09&y=2019": $dir = "calendar"; break;
    case "calendar?m=10&y=2019": $dir = "calendar"; break;
    case "calendar?m=11&y=2019": $dir = "calendar"; break;
    case "calendar?m=12&y=2019": $dir = "calendar"; break;
    default: $dir = "404"; break;
}

include ROOT."head.php";
include TPL."main.tpl";
include TPL."footer.tpl";
