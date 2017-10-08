<?php
define('ROOT', $_SERVER['DOCUMENT_ROOT'].'/');
define('ROOT_CLASS', $_SERVER['DOCUMENT_ROOT'].'/class/');
define('ROOT_LIB', $_SERVER['DOCUMENT_ROOT'].'/libs/');
define('ADM_ROOT', $_SERVER['DOCUMENT_ROOT'].'/adminside/');
define('ADM_TPL', $_SERVER['DOCUMENT_ROOT'].'/adminside/skins/tpl/');
define('ADM_MDL', $_SERVER['DOCUMENT_ROOT'].'/adminside/model/');
define('TPL', $_SERVER['DOCUMENT_ROOT'].'/skins/tpl/');
define('ROOT_FILES', $_SERVER['DOCUMENT_ROOT'].'/files/');
define('ROOT_FILES_FIND', $_SERVER['DOCUMENT_ROOT'].'/files');

define('SRV', 'http://'.$_SERVER['SERVER_NAME'].'/');
define('ADM_SRV', 'http://'.$_SERVER['SERVER_NAME'].'/adminside/');
define('ADM_SKIN', 'http://'.$_SERVER['SERVER_NAME'].'/adminside/skins/');
define('SKIN', 'http://'.$_SERVER['SERVER_NAME'].'/skins/');
define('FILES', 'http://'.$_SERVER['SERVER_NAME'].'/files/');

define('TIPS', $_SERVER['DOCUMENT_ROOT'].'/adminside/skins/tpl/tips/');
define('SELECT', $_SERVER['DOCUMENT_ROOT'].'/adminside/skins/tpl/select/');
define('INPUT', $_SERVER['DOCUMENT_ROOT'].'/adminside/skins/tpl/input/');
define('CHECKBOX', $_SERVER['DOCUMENT_ROOT'].'/adminside/skins/tpl/checkbox/');
define('FORM', $_SERVER['DOCUMENT_ROOT'].'/adminside/skins/tpl/form/');
define('PAGE', $_SERVER['DOCUMENT_ROOT'].'/adminside/skins/tpl/page/');
define('ROW', $_SERVER['DOCUMENT_ROOT'].'/adminside/skins/tpl/row/');

define('M_SELECT', $_SERVER['DOCUMENT_ROOT'].'/adminside/modules/select/');

define('DS', '/');

include_once ROOT_CLASS."mysql.php";
include_once ROOT_CLASS."route.php";
include_once ROOT_CLASS."model.php";

include_once ADM_MDL."cart.php";
include_once ADM_MDL."catalog.product.php";
include_once ADM_MDL."catalog.category.php";
include_once ADM_MDL."catalog.brand.php";
include_once ADM_MDL."catalog.property.php";
include_once ADM_MDL."publications.news.php";
include_once ADM_MDL."userlist.groups.php";
include_once ADM_MDL."userlist.discount.php";
include_once ADM_MDL."userlist.users.php";
include_once ADM_MDL."settings.currency.php";
include_once ADM_MDL."settings.delivery.php";
include_once ADM_MDL."settings.payment.php";
include_once ADM_MDL."settings.cities.php";
include_once ADM_MDL."callback.php";
include_once ADM_MDL."comments.products.php";
include_once ADM_MDL."comments.php";
include_once ADM_MDL."pages.main.php";
include_once ADM_MDL."pages.static.php";
include_once ADM_MDL."order.php";
include_once ADM_MDL."global.settings.php";
include_once ADM_MDL."partners.php";
include_once ADM_MDL."design.php";

include_once ADM_MDL."liqpay.php";

/** FUNCTIONS **/
define('FUNCTIONS', $_SERVER['DOCUMENT_ROOT'].'/functions/');
include_once FUNCTIONS.'system.functions.php';
include_once FUNCTIONS.'static.functions.php';
include_once FUNCTIONS.'functions.php';
include_once FUNCTIONS.'functions.global.php';
include_once FUNCTIONS.'functions.mysql.php';
include_once FUNCTIONS.'functions.admin.php';

$__settings = new StoreSettings();
$__order = new Orders();

$_Cart = new Cart();