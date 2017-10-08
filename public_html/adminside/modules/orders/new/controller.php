<?php
switch ($_GET["act"]) {
    case "add":
        if ($_POST) {
            $orders_order->add($_POST);
            $orders_order->_redirect(ADM_SRV."{$route[2]}/{$route[3]}/");
        } else include ADM_ROOT."bin/form.php";
        break;
    case "edit":
        if ($_POST) {
            $orders_order->edit($route[4], $_POST);
            $orders_order->_redirect(ADM_SRV."{$route[2]}/{$route[3]}/");
        } else {
            $params = $orders_order->getOrder($route[4]);
            $user = $orders_order->getOrderUser($route[4]);
            $receiver = $orders_order->getOrderUser($route[4], 1);
            include ADM_ROOT."bin/form.php";
        } break;
    case "delete":
        $orders_order->del($route[4]);
        $orders_order->_redirect(ADM_SRV."{$route[2]}/{$route[3]}/");
        break;
}