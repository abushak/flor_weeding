<?php
switch ($route[2]) {
    case "settings":
        $settings_payment = new SettingsPayment();
        $settings_currency = new SettingsCurrency();
        $settings_delivery = new SettingsDelivery();
        $settings_city = new SettingsCity();
        $dir = "settings";
        break;
    case "callback": $dir = "callback"; break;
    case "design":
        $_DesignSlide = new DesignSlide();
        $dir = "design";
        break;
    case "statistics": $dir = "statistics"; break;
    case "comments": $dir = "comments"; break;
    case "publications":
        $publications_news = new PublicationsNews();
        $dir = "publications";
        break;
    case "pages":
        $pages_main = new PagesMain();
        $pages_static = new PagesStatic();
        $partners = new Partners();
        $subPage = new SubPage();
        $dir = "pages";
        break;
    case "userlist":
        $dir = "userlist";
        $userlist_groups = new UserlistGroups();
        $userlist_discount = new UserlistDiscount();
        $userlist_users = new UserlistUsers();
        break;
    case "orders":
        $dir = "orders";
        $orders_order = new Orders();
        break;
    case "catalog":
        $catalog_category = new CatalogCategory();
        $catalog_brand = new CatalogBrand();
        $catalog_prop = new CatalogProperty();
        $catalog_product = new CatalogProduct();
        $dir = "catalog";
        break;
    default:
        $dir = 'main';
        break;
}

$data = array();
$query = $mysql->query("SELECT * FROM `zet_language` ORDER BY `store_default`<>'0' DESC");
while ($row = $mysql->assoc($query)) {
    $data[$row['id']] = $row;
}
$langs = $data;