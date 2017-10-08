<?php
$orders_order = new Orders();
$_order_id = $_POST['order_id'];

$params = $orders_order->getOrder($_order_id);
$user = $orders_order->getOrderUser($_order_id);

include ADM_TPL."orders/order.box.tpl";