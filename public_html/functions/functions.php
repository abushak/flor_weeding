<?php
function NewPrice($price) {
    $_USD = config("usd");
    $_new = $_USD * $price;
    return round($_new);
}

function getUserGroupByUserId($user_id){
    global $mysql;
    
    $query = $mysql->query("SELECT `group_id` FROM `zet_userlist` WHERE `id`='".$user_id."'");
    $res = $mysql->assoc($query);
    $user_group_id = $res['group_id'];
    
    return $user_group_id;
}

/** Тип і значення знижки для товара, для групи корустувачів "Оптовики" **/
function getProductWholesaleTypeAndValueByProductId($product_id, $product_qty){
    global $mysql;
    
    $query = $mysql->query("SELECT `value`,`type` FROM `zet_product_wholesale` WHERE `product_id`='".$product_id."' AND `qty`<='".$product_qty."'");
    $discount = $mysql->assoc($query);
    
    return $discount;
}

/** Тип і значення знижки для товара, в залежності від групи користувача **/
function getProductDiscountTypeAndValueByUserGroupId($user_group_id, $product_id){
    global $mysql;
    
    $query = $mysql->query("SELECT `userlist_group` FROM `zet_product_promo` WHERE `product_id`='".$product_id."'");
    $res = $mysql->assoc($query);
    $discount_group_id = $res['userlist_group'];
    
    $user_group_id = ($discount_group_id == 0) ? $discount_group_id : $user_group_id;
    
    $query = $mysql->query("SELECT `value`,`type` FROM `zet_product_promo` WHERE `product_id`='".$product_id."' AND `userlist_group`='".$user_group_id."' AND `end`>CURDATE() ORDER BY `end` ASC LIMIT 1");
    $discount = $mysql->assoc($query);
    
    return $discount;
}

/** Нова ціна товара з урахування окремої знижки для окремого товара **/
function getDiscountByType($discount_type, $discount_value, $current_price){
    if($discount_type == 1){
        $discount = $discount_value * $current_price / 100;
        $new_price = $current_price - $discount;
    } elseif($discount_type == 2) {
        $new_price = $current_price - $discount_value;
    } elseif(empty($discount_type) || empty($discount_value)) {
        $new_price = $current_price;
    }
    return $new_price;
}

/** Нова ціна товара з урахування всіх знижок для окремого товара **/
function getProductLastPriceByUserGroupId($user_group_id, $product_id, $product_qty, $product_price){
    $price = $product_price;
    if($user_group_id == 2){
        $product_wholesale_discount = getProductWholesaleTypeAndValueByProductId($product_id, $product_qty);
        $product_promo_discount = getProductDiscountTypeAndValueByUserGroupId($user_group_id, $product_id);
        $price = getDiscountByType($product_wholesale_discount['type'], $product_wholesale_discount['value'], $price);
        $price = getDiscountByType($product_promo_discount['type'], $product_promo_discount['value'], $price);
    } else {
        $product_promo_discount = getProductDiscountTypeAndValueByUserGroupId($user_group_id, $product_id);
        $price = getDiscountByType($product_promo_discount['type'], $product_promo_discount['value'], $price);
    }
    
    return $price * $product_qty;
}

/** Нова ціна в замовленні при одноразовій знижці **/
function getOrderOneTimeDiscount($current_price){
    global $mysql;
    
    $query = $mysql->query("SELECT `discount_type`,`discount_value`,`min_order_sum`,`max_order_sum` FROM `zet_discount_orders` WHERE `onetime`='1' AND `status`='1' AND `expire_date`>CURDATE() ORDER BY `expire_date` ASC LIMIT 1");
    $discount = $mysql->assoc($query);
    
    if($discount['max_order_sum'] == 0){
        if($current_price >= $discount['min_order_sum']){
            $price = getDiscountByType($discount['discount_type'], $discount['discount_value'], $current_price);
        }
        else $price = $current_price;
    } else {
        if($current_price >= $discount['min_order_sum'] && $current_price <= $discount['max_order_sum']) {
            $price = getDiscountByType($discount['discount_type'], $discount['discount_value'], $current_price);
        }
        else $price = $current_price;
    }
    return $price;
}

/** Нова ціна в замовленні при постійній знижці **/
function getOrderDiscount($current_price, $all_orders_sum){
    global $mysql;
    
    $query = $mysql->query("SELECT `discount_type`,`discount_value`,`min_order_sum`,`max_order_sum` FROM `zet_discount_orders` WHERE `onetime`='0' AND `status`='1' AND (`expire_date`>CURDATE() OR `expire_date`='0000-00-00') AND {$all_orders_sum} BETWEEN `min_order_sum` AND IF(`max_order_sum`='0', '999999999',`max_order_sum`) ORDER BY `expire_date` ASC LIMIT 1");
    $discount = $mysql->assoc($query);
    
    if($discount['max_order_sum'] == 0){
        if($all_orders_sum >= $discount['min_order_sum']) $price = getDiscountByType($discount['discount_type'], $discount['discount_value'], $current_price);
        else $price = $current_price;
    } else {
        if($all_orders_sum >= $discount['min_order_sum'] && $all_orders_sum <= $discount['max_order_sum']) $price = getDiscountByType($discount['discount_type'], $discount['discount_value'], $current_price);
        else $price = $current_price;
    }
    return $price;
}

/** Вартість доставки в залежності від суми замовлення **/
function getDeliveryPrice($current_price, $delivery_method){
    global $mysql;
    
    $query = $mysql->query("SELECT `price`,`free_from` FROM `zet_delivery_method` WHERE `id`='".$delivery_method."'");
    $discount = $mysql->assoc($query);
    
    if(empty($discount['free_from']) || $discount['free_from'] <= 0) $price = $discount['price'];
    elseif($current_price >= $discount['free_from']) $price = 0;
    else $price = $discount['price'];
    
    return $price;
}

/** Сума всіх засовлень користувача **/
function allOrdersSumByUserId($user_id){
    global $mysql;
    
    if(!empty($user_id) || $user_id != 0){
        $query = $mysql->query("SELECT SUM(`final_price`) AS `total` FROM `zet_orders`,`zet_orders_user` WHERE `zet_orders_user`.`order_id`=`zet_orders`.`id` AND `zet_orders_user`.`user_id`='".$user_id."'");
        $res = $mysql->assoc($query);
        $sum = $res['total'];
    } else $sum = 0;
    
    return $sum;
}

function getDeliveryMethodNameById($_id, $lang_id){
    global $mysql;
    
    $query = $mysql->query("SELECT `title` FROM `zet_delivery_method_description` WHERE `delivery_id`='".$_id."' AND `language_id`='".$lang_id."'");
    $res = $mysql->assoc($query);
    
    return $res['title'];
}



function getPaymentMethodNameById($_id, $lang_id){
    global $mysql;
    
    $query = $mysql->query("SELECT `title` FROM `zet_payment_method_description` WHERE `payment_id`='".$_id."' AND `language_id`='".$lang_id."'");
    $res = $mysql->assoc($query);
    
    return $res['title'];
}

function getProductPriceByProductIdAndOptionId($product_id, $option_id){
    global $mysql;
    
    $query = $mysql->query("SELECT `price` FROM `zet_product_option` WHERE `product_id`='".$product_id."' AND `id`='".$option_id."'");
    $res = $mysql->assoc($query);
    
    return $res['price'];
}

function ProductInWishlist($product_id){
    global $mysql;
    $_user = $_SESSION['USER_ID'];
    $query = $mysql->query("SELECT `id` FROM `zet_wishlist` WHERE `product_id`='".$product_id."' AND `user_id`='".$_user."'");
    $result = $mysql->assoc($query);
    return ($result) ? true : false;
}

function GetMetaTags($table, $field, $url){
    global $mysql, $lang_id;
    $query = $mysql->query("SELECT IF(`meta_title`='', `title`, `meta_title`) AS `title`, IF(`meta_description`='', `description`, `meta_description`) AS `description`, `meta_keywords` FROM `zet_".$table."_description`,`zet_".$table."` WHERE `zet_".$table."`.`id`=`zet_".$table."_description`.`".$field."_id` AND `zet_".$table."_description`.`language_id`='".$lang_id."' AND `zet_".$table."`.`url`='".$url."'");
    $result = $mysql->assoc($query);
    return $result;
}

function GetOrderStatusByID($id){
    switch($id){
        case "1": $word = WORD_206; break;
        case "2": $word = WORD_207; break;
        case "3": $word = WORD_208; break;
        case "4": $word = WORD_209; break;
        case "5": $word = WORD_210; break;
        case "6": $word = WORD_211; break;
    }
    return $word;
}

function MaxStorePrice(){
    global $mysql;
    $query = $mysql->query("SELECT MAX(`price`) AS `max` FROM `zet_product_option`");
    $result = $mysql->assoc($query);
    return $result['max'];
}

/* Disabled Functions
function getUserGroupDiscountTypeAndValueByUserId($user_id){
    global $mysql;
    
    $query = $mysql->query("SELECT `group_id` FROM `zet_userlist` WHERE `id`='".$user_id."'");
    $res = $mysql->assoc($query);
    $user_group_id =  $res['group_id'];
    
    $query = $mysql->query("SELECT `discount_value`,`discount_type` FROM `zet_userlist_group` WHERE `id`='".$user_group_id."'");
    $discount = $mysql->assoc($query);
    
    return $discount;
}
*/


/** STATISTICS **/
function CountOrdersByDate($date, $status = false) {
    global $mysql;
    switch ($date) {
        case "today": $_date = "`date`=CURDATE()"; break;
        case "yesterday": $_date = "`date`=SUBDATE(CURDATE(),1)"; break;
        case "month": $_date = "MONTH(`date`) = MONTH(NOW())"; break;
        case "quarter": $_date = "`date` BETWEEN MAKEDATE(YEAR(CURDATE()), 1) + INTERVAL QUARTER(CURDATE()) QUARTER - INTERVAL 1 QUARTER AND MAKEDATE(YEAR(CURDATE()), 1) + INTERVAL QUARTER(CURDATE()) QUARTER - INTERVAL 1 DAY"; break;
        case "all": $_date = "`date`>='00-00-00'"; break;
    }
    switch($status){
        case 'failed': $_status = "AND `status`='5'"; break;
        case 'cancelled': $_status = "AND `status`='6'"; break;
    }
    
    $query = $mysql->query("SELECT COUNT(*) AS `total` FROM `zet_orders` WHERE {$_date} {$_status}");
    $row = $mysql->assoc($query);
    return $row['total'];
}

function OrdersSumByStatus($date, $bool = false){
    global $mysql;
    switch($date){
        case 'today': $_date = "`date`=CURDATE()"; break;
        case 'yesterday': $_date = "`date`=SUBDATE(CURDATE(),1)"; break;
        case 'month': $_date = "MONTH(`date`) = MONTH(NOW())"; break;
        case 'quarter': $_date = "`date` BETWEEN MAKEDATE(YEAR(CURDATE()), 1) + INTERVAL QUARTER(CURDATE()) QUARTER - INTERVAL 1 QUARTER AND MAKEDATE(YEAR(CURDATE()), 1) + INTERVAL QUARTER(CURDATE()) QUARTER - INTERVAL 1 DAY"; break;
        case 'all': $_date = "`date`>='00-00-00'"; break;
    }
    if($bool) $_status = "";
    else $_status = "AND `status`<>'5' AND `status`<>'6'";
    $query = $mysql->query("SELECT SUM(`final_price`) AS `total` FROM `zet_orders` WHERE {$_date} {$_status}");
    $row = $mysql->assoc($query);
    return (empty($row['total'])) ? 0 : $row['total'];
}

function CountCategories(){
    global $mysql;
    $query = $mysql->query("SELECT COUNT(*) AS `total` FROM `zet_category`");
    $row = $mysql->assoc($query);
    return $row['total'];
}

function CountProductsByStatus($status){
    global $mysql;
    switch($status){
        case 'all': $_status = ""; break;
        case 'sale': $_status = "WHERE `status`='1'"; break;
        case 'hidden': $_status = "WHERE `status`='0'"; break;
    }
    $query = $mysql->query("SELECT COUNT(*) AS `total` FROM `zet_product` {$_status}");
    $row = $mysql->assoc($query);
    return $row['total'];
}

function SumProductsByStatus($status){
    global $mysql;
    switch($status){
        case 'all': $_status = ""; break;
        case 'sale': $_status = "AND `zet_product`.`status`='1'"; break;
        case 'hidden': $_status = "AND `zet_product`.`status`='0'"; break;
    }
    $query = $mysql->query("SELECT SUM(`price`) AS `total` FROM `zet_product`,`zet_product_option` WHERE `zet_product`.`id`=`zet_product_option`.`product_id` {$_status}");
    $row = $mysql->assoc($query);
    return $row['total'];
}

function GetOrdersByStatus($status){
    global $mysql; $data = array();
    switch($status){
        case 'all': $_status = ""; break;
        case 'new': $_status = "AND `zet_orders`.`status`='1'"; break;
        case 'inprogress': $_status = "AND `zet_orders`.`status`='2'"; break;
        case 'completed': $_status = "AND `zet_orders`.`status`='4'"; break;
    }
    $query = $mysql->query("SELECT `id`,`status`,`fast`,`date`,`final_price`,`user_id`,`name` FROM `zet_orders`,`zet_orders_user` WHERE `zet_orders_user`.`order_id`=`zet_orders`.`id` {$_status} ORDER BY `date` DESC, `id` DESC LIMIT 0, 5");
    while($row = $mysql->assoc($query)){
        $data[$row['id']] = $row;
    }
    return $data;
}

/** STATISTICS END **/

function GetDiscounts(){
    global $mysql; $data = array();
    
    $query = $mysql->query("SELECT `id`,`discount_value`,`min_order_sum`,`max_order_sum` FROM `zet_discount_orders` WHERE `discount_type`='1' AND `onetime`='0' AND `status`='1' AND (`expire_date`>CURDATE() OR `expire_date`='0000-00-00') ORDER BY `min_order_sum` ASC");
    while($row = $mysql->assoc($query)){
        $data[$row['id']] = $row;
        $data[$row['id']]['max_order_sum'] = ($data[$row['id']]['max_order_sum'] == 0) ? WORD_235 : $data[$row['id']]['max_order_sum'];
    }
    
    return $data;
}

function SumUserOrders($email){
    global $mysql;
    $query = $mysql->query("SELECT SUM(`final_price`) AS `total` FROM `zet_orders`,`zet_orders_user` WHERE `zet_orders_user`.`order_id`=`zet_orders`.`id` AND (`zet_orders_user`.`user_id`='".$_SESSION['USER_ID']."' OR `zet_orders_user`.`email`='".$email."')");
    $row = $mysql->assoc($query);
    return $row['total'];
}

function DiscountValueByTotalPrice($all_orders_sum){
    global $mysql;
    $query = $mysql->query("
    SELECT `discount_value` 
    FROM `zet_discount_orders` 
    WHERE `discount_type`='1' AND `onetime`='0' 
    AND `status`='1' 
    AND (`expire_date`>CURDATE() OR `expire_date`='0000-00-00') 
    AND {$all_orders_sum} BETWEEN `min_order_sum` AND IF(`max_order_sum`='0', '999999999',`max_order_sum`) ORDER BY `expire_date` ASC LIMIT 1");
    $row = $mysql->assoc($query);
    
    return (empty($row['discount_value'])) ? 0 : $row['discount_value'];
}




/** FLOR People **/
function ItemPrice($product_id, $option_id) {
    global $mysql;
    
    $query = $mysql->query("SELECT `price` FROM `zet_product_option` WHERE `product_id`='".$product_id."' AND `id`='".$option_id."'");
    $res = $mysql->assoc($query);
    
    return $res['price'];
}

function Discount($current_price) {
    global $mysql;
    
    $query = $mysql->query("SELECT `discount_type`,`discount_value`,`min_order_sum`,`max_order_sum` FROM `zet_discount_orders` WHERE `onetime`='1' AND `status`='1' AND `expire_date`>CURDATE() ORDER BY `expire_date` ASC LIMIT 1");
    $discount = $mysql->assoc($query);
    
    if ($discount['max_order_sum'] == 0) {
        if ($current_price >= $discount['min_order_sum']) {
            $price = getDiscountByType($discount['discount_type'], $discount['discount_value'], $current_price);
        } else $price = $current_price;
    } else {
        if ($current_price >= $discount['min_order_sum'] && $current_price <= $discount['max_order_sum']) {
            $price = getDiscountByType($discount['discount_type'], $discount['discount_value'], $current_price);
        }
        else $price = $current_price;
    }
    return $price;
}

function GetPaymentMethodDescription($_id) {
    global $mysql, $lang_id;
    
    $query = $mysql->query("SELECT `description` FROM `zet_payment_method_description` WHERE `payment_id`='".$_id."' AND `language_id`='".$lang_id."'");
    $res = $mysql->assoc($query);
    
    return $res['description'];
}

function GetCategoryTitle($url) {
    global $mysql, $lang_id;
    
    $query = $mysql->query("SELECT `title` FROM `zet_category`,`zet_category_description` WHERE `zet_category_description`.`category_id`=`zet_category`.`id` AND `zet_category_description`.`language_id`='".$lang_id."' AND `zet_category`.`url`='".$url."'");
    $res = $mysql->assoc($query);
    
    return $res["title"];
}

function SendOrderNotification($order_id, $email, $user = 1) {
    global $lang_id;
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
    $payment_description = $_InMailOrder->GetDescription("payment", $params["payment_method"]);
    
    if ($params["photos"] == 1) $photo_price = config("photo_price");
    if ($params["card"] == 1) $card_price = config("card_price");
    
    $public_key = "i69841769747";
    $private_key = "vsnoAl1UPhsX2wKbJaua1iPWmt742QX2TnFl0JSZ";
    $liqpay = new LiqPay($public_key, $private_key);
    $html = $liqpay->cnb_form(array("version" => "3", "amount" => $params["final_price"], "currency" => "UAH", "description" => $title, "order_id" => "order_{$order_id}", "pay_way" => "card,liqpay"));
    
    ob_start();
    include(TPL."mail.tpl");
    $message = ob_get_contents();
    ob_end_clean();
    
    $to = $email;
    $title = "Заказ №{$order_id} {$params["date"]}";
    $mess = $message;
    
    $headers .= 'Content-type: text/html; charset=utf-8'."\r\n";
    $headers .= 'To: '.$user["name"].' <'.$email.'>'."\r\n";
    $headers .= 'From: '.config("sitename_".$lang_id).' <'.config("notify_email").'>'."\r\n";
    
    mail($to, $title, $mess, $headers); 
}