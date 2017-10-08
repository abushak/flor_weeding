<?php
$product = new CatalogProduct();
$orders_order = new Orders();

if(!empty($_POST['products'])){
    $product_id = $_POST['products'];
    $_products_in = $product->getProductToOrderById($product_id);
    $key = 1;
    include ADM_TPL.'orders/form/order.items.row.tpl';
}