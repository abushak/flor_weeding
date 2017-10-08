<?php include $_SERVER["DOCUMENT_ROOT"]."/libs/includer.php"; ?>
<?php $mysql = new mysql; ?>
<?php encoding("utf-8"); ?>
<?php $site_language = deflang(true); ?>
<?php langDefiner($site_language["code"], true); ?>
<?php $lang_id = $site_language["id"]; ?>

<link rel="stylesheet" href="<?php echo ADM_SKIN; ?>css/style.css" />
<link rel="stylesheet" href="<?php echo ADM_SKIN; ?>css/admin_style.css" />
<link rel="stylesheet" href="<?php echo ADM_SKIN; ?>css/icon-font.css" />
<link rel="stylesheet" href="<?php echo ADM_SKIN; ?>css/font-awesome.css" />
<link rel="stylesheet" href="<?php echo ADM_SKIN; ?>css/jquery.bxslider.css" />
<link rel="stylesheet" href="<?php echo ADM_SKIN; ?>css/jquery-ui-1.10.3.custom.css" />
<link rel="stylesheet" href="<?php echo ADM_SKIN; ?>css/colpick.css" />
<link rel="stylesheet" href="<?php echo ADM_SKIN; ?>css/select2.css" />

<?php if ($_GET["type"] == md5("|confirm|confirm|".date("Y-m-d H")) && $_GET["order"]) {
    /*
    $_id = $_GET["order"]; $data = array();
    
    $query = $mysql->query("SELECT * FROM `zet_orders` WHERE `id`='".(int)$_id."'");
    $params = $mysql->assoc($query);
    
    $query = $mysql->query("SELECT * FROM `zet_orders_user` WHERE `order_id`='".(int)$_id."' AND `receiver`='0'");
    $user = $mysql->assoc($query);
    
    $query = $mysql->query("SELECT * FROM `zet_orders_user` WHERE `order_id`='".(int)$_id."' AND `receiver`='1'");
    $receiver = $mysql->assoc($query);
    
    $query = $mysql->query("SELECT `zet_product`.`id` AS `id`,`url`,`title`,`article`,`price`,`qty`,`product_option_id` FROM `zet_orders_products`,`zet_product`,`zet_product_description`,`zet_product_option` WHERE `zet_product`.`id`=`zet_orders_products`.`product_id` AND `zet_product_description`.`product_id`=`zet_orders_products`.`product_id` AND `zet_product_option`.`product_id`=`zet_orders_products`.`product_id` AND `zet_product_option`.`id`=`zet_orders_products`.`product_option_id` AND `zet_product_description`.`language_id`='".$lang_id."' AND `zet_orders_products`.`order_id`='".(int)$_id."'");
    while($row = $mysql->assoc($query)) {
        $data[$row['id']] = $row;
    }
    $_products_in = $data;
    
    include ADM_TPL."orders/print.tpl"; */
    
    $order_id = $_GET["order"];
    $_InMailOrder = new InMailOrder($order_id);
    
    $params = $_InMailOrder->GetOrderInfo();
    $user = $_InMailOrder->GetUserInfo();
    $receiver = $_InMailOrder->GetUserInfo(1);
    $_products_in = $_InMailOrder->GetProducts();
    
    $title = "Заказ №{$order_id}";
    $date = "Дата: {$params["date"]}";
    
    $status = $_InMailOrder->ResolveName("status", $params["status"]);
    $delivery = $_InMailOrder->ResolveName("delivery", $params["delivery_metnod"]);
    $payment = $_InMailOrder->ResolveName("payment", $params["payment_method"]);
    
    if ($params["photos"] == 1) $photo_price = config("photo_price");
    if ($params["card"] == 1) $card_price = config("card_price");
    
    include ADM_TPL."orders/print.tpl";
    
} else if ($_GET["type"] == md5("|user|user|".date("Y-m-d H")) && $_GET["order"]) {
    /*
    $_id = $_GET["order"]; $data = array();
    
    $query = $mysql->query("SELECT * FROM `zet_orders` WHERE `id`='".(int)$_id."'");
    $params = $mysql->assoc($query);
    
    $query = $mysql->query("SELECT * FROM `zet_orders_user` WHERE `order_id`='".(int)$_id."'");
    $user = $mysql->assoc($query);
    
    $query = $mysql->query("SELECT `zet_product`.`id` AS `id`,`url`,`title`,`article`,`price`,`qty`,`product_option_id` FROM `zet_orders_products`,`zet_product`,`zet_product_description`,`zet_product_option` WHERE `zet_product`.`id`=`zet_orders_products`.`product_id` AND `zet_product_description`.`product_id`=`zet_orders_products`.`product_id` AND `zet_product_option`.`product_id`=`zet_orders_products`.`product_id` AND `zet_product_option`.`id`=`zet_orders_products`.`product_option_id` AND `zet_product_description`.`language_id`='".$lang_id."' AND `zet_orders_products`.`order_id`='".(int)$_id."'");
    while($row = $mysql->assoc($query)) {
        $data[$row['id']] = $row;
    }
    $_products_in = $data;
    
    include ADM_TPL."orders/print.tpl"; */
} else if ($_GET["type"] == md5("|admin|admin|".date("Y-m-d H")) && $_GET["order"]) {
    /*
    $_id = $_GET["order"]; $data = array();
    
    $query = $mysql->query("SELECT * FROM `zet_orders` WHERE `id`='".(int)$_id."'");
    $params = $mysql->assoc($query);
    
    $query = $mysql->query("SELECT * FROM `zet_orders_user` WHERE `order_id`='".(int)$_id."'");
    $user = $mysql->assoc($query);
    
    $query = $mysql->query("SELECT `zet_product`.`id` AS `id`,`url`,`title`,`article`,`price`,`qty`,`product_option_id` FROM `zet_orders_products`,`zet_product`,`zet_product_description`,`zet_product_option` WHERE `zet_product`.`id`=`zet_orders_products`.`product_id` AND `zet_product_description`.`product_id`=`zet_orders_products`.`product_id` AND `zet_product_option`.`product_id`=`zet_orders_products`.`product_id` AND `zet_product_option`.`id`=`zet_orders_products`.`product_option_id` AND `zet_product_description`.`language_id`='".$lang_id."' AND `zet_orders_products`.`order_id`='".(int)$_id."'");
    while($row = $mysql->assoc($query)) {
        $data[$row['id']] = $row;
    }
    $_products_in = $data;
    
    include ADM_TPL."orders/print.tpl"; */
    $order_id = $_GET["order"];
    $_InMailOrder = new InMailOrder($order_id);
    
    $params = $_InMailOrder->GetOrderInfo();
    $user = $_InMailOrder->GetUserInfo();
    $receiver = $_InMailOrder->GetUserInfo(1);
    $_products_in = $_InMailOrder->GetProducts();
    
    $title = "Заказ №{$order_id}";
    $date = "Дата: {$params["date"]}";
    
    $status = $_InMailOrder->ResolveName("status", $params["status"]);
    $delivery = $_InMailOrder->ResolveName("delivery", $params["delivery_metnod"]);
    $payment = $_InMailOrder->ResolveName("payment", $params["payment_method"]);
    
    if ($params["photos"] == 1) $photo_price = config("photo_price");
    if ($params["card"] == 1) $card_price = config("card_price");
    
    include ADM_TPL."orders/print.tpl";
    
} else echo '<section class="wrap_box" style="border: none; width: 900px; position: static; margin: auto; box-shadow: none; -webkit-box-shadow: none;"><section class="caption_box"><section class="row"><section class="span6"><p class="admin_order_title">Forbidden</p></section></section></section></section>'; ?>
<title><?php echo WORD_397.$params['id']; ?> <?php echo $params['date']; ?></title>