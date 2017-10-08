<?php
$ids = $_POST['ids'];
$table = $_POST["table"];
echo var_dump($_POST);
if($table == "categories"){
    $category = new CatalogCategory();
    foreach($ids as $val) { $category->deleteCategory($val); }
} else if($table == "brands"){
    $brand = new CatalogBrand();
    foreach($ids as $val) { $brand->deleteBrand($val); }
} else if($table == "news"){
    $news = new PublicationsNews();
    foreach($ids as $val) { $news->deleteNewsItem($val); }
} else if($table == "groups"){
    $groups = new UserlistGroups();
    foreach($ids as $val) { $groups->deleteGroup($val); }
} else if($table == "discount"){
    $discount = new UserlistDiscount();
    foreach($ids as $val) { $discount->deleteDiscount($val); }
} else if($table == "payment"){
    $payment = new SettingsPayment();
    foreach($ids as $val) { $payment->deleteMethod($val); }
} else if($table == "delivery"){
    $delivery = new SettingsDelivery();
    foreach($ids as $val) { $delivery->deleteMethod($val); }
} else if($table == "new_callback" || $table == "treated_callback" || $table == "all_callback"){
    $callback = new CallBack();
    foreach($ids as $val) { $callback->deleteCallback($val); }
} else if($table == "c_products"){
    $c_products = new CommentsProducts();
    foreach($ids as $val) { $c_products->deleteComment($val); }
} else if($table == "reviews"){
    $reviews = new Comment();
    foreach($ids as $val) { $reviews->deleteCom($val); }
} else if($table == "main_menu"){
    $main_menu = new PagesMain();
    foreach($ids as $val) { $main_menu->deletePage($val); }
} else if($table == "properties"){
    $properties = new CatalogProperty();
    foreach($ids as $val) { $properties->delProp($val); }
} 