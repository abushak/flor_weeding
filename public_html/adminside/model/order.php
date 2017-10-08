<?php
class Orders extends Model {
    private $_cart;
    function __construct() {
        parent::__construct();
        $this->_cart = new Cart();
    }
    
    public function getOrders($filters, $status) {
        $data = array();
        
        $order_by = "ORDER BY `id` DESC";
        
        /** Статус замовлення **/
        if (empty($filters["order_status"])) {
            switch ($status) {
                case "new": $status = "AND `zet_orders`.`status`='1'"; break;
                case "inprogress": $status = "AND `zet_orders`.`status`='2'"; break;
                case "submitted": $status = "AND `zet_orders`.`status`='3'"; break;
                case "completed": $status = "AND `zet_orders`.`status`='4'"; break;
                case "failed": $status = "AND `zet_orders`.`status`='5'"; break;
                case "cancelled": $status = "AND `zet_orders`.`status`='6'"; break;
                case "fast": $status = "AND `zet_orders`.`fast`='1'"; break;
                case "all": $status = ""; break;
            }
        } else $status = ($filters["order_status"] == 0) ? "" : "AND `zet_orders`.`status`='".$filters["order_status"]."'";
        
        /** Спосіб доставки **/
        if (!empty($filters["delivery_metnod"])) {
            $delivery = ($filters["delivery_metnod"] == 0) ? "" : "AND `zet_orders`.`delivery_metnod`='".$filters["delivery_metnod"]."'";
        } else $delivery = "";
        
        /** Спосіб оплати **/
        if (!empty($filters["payment_method"])) {
            $payment = ($filters["payment_method"] == 0) ? "" : "AND `zet_orders`.`payment_method`='".$filters["payment_method"]."'";
        } else $payment = "";
        
        /** Сума замовлення **/
        if (empty($filters["price_min"])) {
            if (empty($filters["price_max"])) {
                $price = "";
            } else {
                $price = "AND `final_price`<=".$filters["price_max"];
            }
        } else {
            if (empty($filters["price_max"])) {
                $price = "AND `final_price`>=".$filters["price_min"];
            } else {
                $price = "AND `final_price` BETWEEN ".$filters["price_min"]." AND ".$filters["price_max"];
            }
        }
        
        /** Дата замовлення **/
        if (empty($filters["date_min"])) {
            if (empty($filters["date_max"])) {
                $date = "";
            } else {
                $date = "AND `date`<='".$filters["date_max"]."'";
            }
        } else {
            if (empty($filters["date_max"])) {
                $date = "AND `date`>='".$filters["date_min"]."'";
            } else {
                $date = "AND `date` BETWEEN '".$filters["date_min"]."' AND '".$filters["date_max"]."'";
            }
        }
        
        /** № Замовлення або Ім'я покупця **/
        if (!empty($filters["q"])) $q = "AND (`id`='".$filters["q"]."' OR `name` LIKE '%".$filters["q"]."%')";
        else $q = "";
        
        $query = $this->db->query("SELECT `id`,`status`,`delivery_metnod`,`payment_method`,`fast`,`date`,`final_price`,`name`,`user_id` FROM `zet_orders`,`zet_orders_user` WHERE `zet_orders_user`.`order_id`=`zet_orders`.`id` {$status} {$delivery} {$payment} {$price} {$date} {$q} GROUP BY `zet_orders_user`.`order_id` {$order_by}");
        while ($row = $this->db->assoc($query)) {
            $data[$row['id']] = $row;
        }
        return $data;
    }
    
    
    
    
    /** ------------------------------------------------------------------------ **/
    public function edit($_id, $data) {
        $_rdate = (empty($data["rdate"])) ? date("Y-m-d") : $data["rdate"];
        $_gift_card = ($data["gift_card"] == "on") ? 1 : 0;
        $_photos = ($data["photos"] == "on") ? 1 : 0;
        $_gift = ($data["is_gift"] == "on") ? 1 : 0;
        $_user = 0;
        
        $this->db->query("UPDATE `zet_orders` SET `status`='".$data['order_status_value']."',`delivery_metnod`='".$data['delivery_metnod']."',`payment_method`='".$data['payment_method']."',`payment_status`='".$data['payment_status']."',`rdate`='".$_rdate."',`ftime`='".$data['from']."',`ttime`='".$data['to']."',`photos`='".$_photos."',`card`='".$_gift_card."',`card_text`='".$data['card_text']."' WHERE `id`='".$_id."'");
        
        $this->db->query("DELETE FROM `zet_orders_user` WHERE `order_id`='".$_id."'");
        $this->db->query("INSERT INTO `zet_orders_user` (`order_id`,`user_id`,`name`,`email`,`phone`,`adress`,`comment`) VALUES ('".$_id."','".$_user."','".$this->db->escape($data['username'])."','".$this->db->escape($data['email'])."','".$this->db->escape($data['phone'])."','".$this->db->escape($data['adress'])."','".$this->db->escape($data['comment'])."')");
        
        if ($_gift == 1) {
            $this->db->query("INSERT INTO `zet_orders_user` (`order_id`,`user_id`,`name`,`phone`,`receiver`) VALUES ('".$_id."','".$_user."','".$this->db->escape($data['rname'])."','".$this->db->escape($data['rphone'])."','1')");
        }
        
        $_products = explode(',', $data['products']);
        $final_price = 0;
        $this->db->query("DELETE FROM `zet_orders_products` WHERE `order_id`='".$_id."'");
        foreach ($_products as $key => $val) {
            $this->db->query("INSERT INTO `zet_orders_products` (`order_id`,`product_id`,`product_option_id`,`qty`) VALUES ('".$_id."','".$val."','".$data['product_variant'][$val]."','".$data['product_qty'][$val]."')");
            $_product_price = getProductPriceByProductIdAndOptionId($val, $data['product_variant'][$val]);
            $final_price += $_product_price * $data['product_qty'][$val];
        }
        
        $real_price = $final_price;
        $final_price = getOrderOneTimeDiscount($final_price);
        $del_price = getDeliveryPrice($final_price, $data['delivery_metnod']);
        $discount = $real_price - $final_price;
        $final_price = $final_price + $del_price;
        
        $discount = (empty($discount) || $discount < 0) ? 0 : $discount;
        $del_price = empty($del_price) ? 0 : $del_price;
        
        $this->db->query("UPDATE `zet_orders` SET `real_price`='".$real_price."', `discount`='".$discount."', `del_price`='".$del_price."', `final_price`='".$final_price."' WHERE `id`='".$_id."'");
    }
    
    
    
    public function add($data){
        $_date = date('Y-m-d');
        $this->db->query("INSERT INTO `zet_orders` (`id`, `status`, `delivery_metnod`, `payment_method`, `date`) VALUES ('','".$data['order_status_value']."','".$data['delivery_metnod']."','".$data['payment_method']."','".$_date ."')");
        $_id = $this->db->getLastId();
        
        $this->db->query("INSERT INTO `zet_orders_user` (`order_id`, `user_id`, `name`, `email`, `phone`, `city_id`, `comment`) VALUES ('".$_id."','".$data['user_id']."','".$this->db->escape($data['username'])."','".$this->db->escape($data['email'])."','".$this->db->escape($data['phone'])."','".$data['city']."','".$this->db->escape($data['comment'])."')");
        
        $_products = explode(',', $data['products']);
        $real_price = 0;
        $final_price = 0;
        $_user_group = getUserGroupByUserId($data['user_id']);
        
        foreach($_products as $key => $_product){
            $this->db->query("INSERT INTO `zet_orders_products` (`order_id`, `product_id`, `product_option_id`, `qty`) VALUES ('".$_id."','".$_product."','".$data['product_variant'][$_product]."','".$data['product_qty'][$_product]."')");
            
            $_product_price = getProductPriceByProductIdAndOptionId($_product, $data['product_variant'][$_product]);
            $real_price += $_product_price * $data['product_qty'][$_product];
            $final_price += getProductLastPriceByUserGroupId($_user_group, $_product, $data['product_qty'][$_product], $data['item_price'][$_product]);
        }
        
        $final_price = getOrderOneTimeDiscount($final_price);
        $final_price = getOrderDiscount($final_price, SumUserOrders($data['email']));
        $del_price = getDeliveryPrice($final_price, $data['delivery_metnod']);
        
        $discount = $real_price - $final_price;
        $final_price = $final_price + $del_price;
        
        $discount = empty($discount) ? 0 : $discount;
        $del_price = empty($del_price) ? 0 : $del_price;
        
        $this->db->query("UPDATE `zet_orders` SET `real_price`='".$real_price."', `discount`='".$discount."', `del_price`='".$del_price."', `final_price`='".$final_price."' WHERE `id`='".$_id."'");

    }
    public function del($_id){
        $this->db->query("DELETE FROM `zet_orders` WHERE `id`='".$_id."'");
        $this->db->query("DELETE FROM `zet_orders_products` WHERE `order_id`='".$_id."'");
        $this->db->query("DELETE FROM `zet_orders_user` WHERE `order_id`='".$_id."'");
    }
    public function autocompleteUser($data){
        $json = array();
        $query = $this->db->query("SELECT * FROM `zet_userlist` WHERE CONCAT_WS(' ', `lastname`, `name`) LIKE '%".$data['name']."%' ORDER BY `register_date` DESC");
        while($row = $this->db->assoc($query)){
            $json[] = array(
                'id'        => $row['id'],
                'name'      => $row['lastname'].' '.$row['name'],
                'email'     => $row['email'],
                'phone'     => $row['phone'],
                'city'      => $row['city_id']
            );
        }
        return json_encode($json);
    }
    public function getOrder($_id){
        $query = $this->db->query("SELECT * FROM `zet_orders` WHERE `id`='".(int)$_id."'");
        $result = $this->db->assoc($query);
        return $result;
    }
    public function getProducts($_id){
        $query = $this->db->query("SELECT * FROM `zet_orders_products` WHERE `order_id`='".(int)$_id."'");
        return $query;
    }
    
    public function getProductToOrderById($_id, $language_id){
        $query = $this->db->query("SELECT 
        `zet_product`.`id` AS `id`,
        `zet_product`.`picture` AS `picture`,
        `zet_product`.`num_of_variants` AS `num_of_variants`,
        `zet_product_description`.`title` AS `title`
        FROM `zet_product`,`zet_product_description` 
        WHERE `zet_product_description`.`product_id`=`zet_product`.`id` 
        AND `zet_product_description`.`language_id`='".$language_id."' 
        AND `zet_product`.`id`='".$_id."'");
        return $query;
    }
    public function getProductOptions($_id, $language_id, $count = 1){
        $data = array();
        if($count > 1) $query = $this->db->query("SELECT * FROM `zet_product_option`, `zet_product_option_description` WHERE `zet_product_option`.`product_id`='".$_id."' AND `zet_product_option_description`.`option_id`=`zet_product_option`.`id` AND `zet_product_option_description`.`language_id`='".$language_id."' ORDER BY `zet_product_option`.`product_id` DESC");
        else $query = $this->db->query("SELECT * FROM `zet_product_option` WHERE `zet_product_option`.`product_id`='".$_id."' ORDER BY `zet_product_option`.`product_id` DESC");
        while($row = $this->db->assoc($query)){
            $data [$row['id']] = array(
                'id'            => $row['id'],
                'name'          => $row['name'],
                'article'       => $row['article'],
                'price'         => $row['price'],
                'cross_price'   => $row['cross_price'],
                'quantity'      => $row['quantity']
            );
        }
        return $data;
    }
    
    public function redirect(){
        redirectTo(ADM_SRV.'orders/'.$route[3]);
    }
    
    
    /** UPDATE **/
    public function getOrderUser($_id, $receiver = 0) {
        $query = $this->db->query("SELECT * FROM `zet_orders_user` WHERE `order_id`='".(int)$_id."' AND `receiver`='".$receiver."'");
        $result = $this->db->assoc($query);
        return $result;
    }
    
    public function CountOrders($type) {
        switch ($type) {
            case "submitted": $status = 3; break;
            case "inprogress": $status = 2; break;
            default: $status = 1; break;
        }
        
        $where = "WHERE `status`='{$status}'";
        $query = $this->db->query("SELECT COUNT(*) AS `total` FROM `zet_orders` {$where}");
        $res = $this->db->assoc($query);
        return $res['total'];
    }
    
    public function GetOrderProducts($_id) {
        global $lang_id;
        $data = array();
        $i = 1;
        $query = $this->db->query("SELECT `zet_product`.`id` AS `id`,`url`,`title`,`article`,`price`,`zet_product`.`picture` AS `picture`,`qty`,`product_option_id` FROM `zet_orders_products`,`zet_product`,`zet_product_description`,`zet_product_option` WHERE `zet_product`.`id`=`zet_orders_products`.`product_id` AND `zet_product_description`.`product_id`=`zet_orders_products`.`product_id` AND `zet_product_option`.`product_id`=`zet_orders_products`.`product_id` AND `zet_product_option`.`id`=`zet_orders_products`.`product_option_id` AND `zet_product_description`.`language_id`='".$lang_id."' AND `zet_orders_products`.`order_id`='".(int)$_id."'");
        while ($row = $this->db->assoc($query)) {
            $row["price"] = NewPrice($row["price"]);
            $data[$i] = $row;
            $i++;
        }
        return $data;
    }
    
    public function GetProductOptions_($_id) {
        global $lang_id;
        $data = array();
        $query = $this->db->query("SELECT * FROM `zet_product_option` JOIN `zet_product_option_description` ON 
        `zet_product_option_description`.`option_id`=`zet_product_option`.`id` 
        AND `zet_product_option_description`.`language_id`='".$lang_id."' 
        AND `zet_product_option`.`product_id`='".$_id."' ORDER BY `zet_product_option`.`product_id` DESC");
        while ($row = $this->db->assoc($query)) {
            $data[$row['id']] = $row;
        }
        return $data;
    }
    
    
    
    /** STORE **/
    public function AddOrder($data) {
        $_session = session_id();
        $_date = date("Y-m-d");
        $_rdate = (empty($data["date"])) ? date("Y-m-d") : $data["date"];
        
        $this->db->query("INSERT INTO `zet_orders` (`status`,`delivery_metnod`,`payment_method`,`date`,`rdate`,`ftime`,`ttime`,`photos`,`card`,`card_text`) VALUES ('1','".$data["delivery_method"]."','".$data["payment_method"]."','".$_date."','".$_rdate."','".$data["from"]."','".$data["to"]."','".$data["photo"]."','".$data["card"]."','".$data["card_text"]."')");
        $_id = $this->db->getLastId();
        
        $this->db->query("INSERT INTO `zet_orders_user` (`order_id`,`user_id`,`name`,`email`,`phone`,`adress`,`comment`) VALUES ('".$_id."','".$_user."','".$this->db->escape($data["user_name"])."','".$this->db->escape($data["user_email"])."','".$this->db->escape($data["user_phone"])."','".$this->db->escape($data["door_address"]." кв. ".$data["floor"])."','".$this->db->escape($data["comment"])."')");
        
        if ($data["recipient"] == 1) {
            $this->db->query("INSERT INTO `zet_orders_user` (`order_id`,`user_id`,`name`,`phone`,`receiver`) VALUES ('".$_id."','".$_user."','".$this->db->escape($data["recipient_name"])."','".$this->db->escape($data["recipient_phone"])."','1')");
        }
        
        $products = $this->_cart->GetItems($_session);
        
        $final_price = 0;
        foreach ($products as $key => $val) {
            $this->db->query("INSERT INTO `zet_orders_products` (`order_id`,`product_id`,`product_option_id`,`qty`) VALUES ('".$_id."','".$products[$key]["product_id"]."','".$products[$key]["option_id"]."','".$products[$key]["quantity"]."')");
            $final_price += $products[$key]["price"] * $products[$key]["quantity"];
        }
        
        $real_price = $final_price;
        
        $final_price = getOrderOneTimeDiscount($final_price);
        $del_price = getDeliveryPrice($final_price, $data["delivery_method"]);
        $discount = $real_price - $final_price;
        $final_price = $final_price + $del_price;
        
        if ($data["photo"] == 1) {
            $photo_price = config("photo_price");
            $final_price += $photo_price;
        }
        
        if ($data["card"] == 1) {
            $card_price = config("card_price");
            $final_price += $card_price;
        }
        
        $discount = (empty($discount) || $discount < 0) ? 0 : $discount;
        $del_price = empty($del_price) ? 0 : $del_price;
        
        $this->db->query("UPDATE `zet_orders` SET `real_price`='".$real_price."', `discount`='".$discount."', `del_price`='".$del_price."', `final_price`='".$final_price."' WHERE `id`='".$_id."'");
        $this->_cart->RemoveCart($_session);
        
        SendOrderNotification($_id, config("admin_email"));
        if (!empty($data["user_email"])) {
            SendOrderNotification($_id, $data["user_email"]);
        }
        
        return $_id;
    }
    
    public function GetFinalPrice($_id) {
        $query = $this->db->query("SELECT `final_price` FROM `zet_orders` WHERE `id`='".$_id."'");
        $row = $this->db->assoc($query);
        return $row['final_price'];
    }
    
    public function storeGetOrderUser($_id){
        global $lang_id;
        $query = $this->db->query("SELECT *, (SELECT `name` FROM `zet_cities` WHERE `language_id`='".$lang_id."' AND `city_id`=`zet_orders_user`.`city_id`) AS `city` FROM `zet_orders_user` WHERE `order_id`='".$_id."'");
        $row = $this->db->assoc($query);
        return $row;
    }
    
    public function storeGetOrderProducts($_id){
        global $lang_id; $i = 1; $data = array();
        $query = $this->db->query("SELECT `url`,`title`,`article`,`price`,`qty` FROM `zet_orders_products`,`zet_product`,`zet_product_description`,`zet_product_option` WHERE `zet_product`.`id`=`zet_orders_products`.`product_id` AND `zet_product_description`.`product_id`=`zet_orders_products`.`product_id` AND `zet_product_option`.`product_id`=`zet_orders_products`.`product_id` AND `zet_product_option`.`id`=`zet_orders_products`.`product_option_id` AND `zet_product_description`.`language_id`='".$lang_id."' AND `zet_orders_products`.`order_id`='".(int)$_id."'");
        while($row = $this->db->assoc($query)){
            $row["price"] = NewPrice($row["price"]);
            $data[$i] = $row; $i++;
        }
        return $data;
    }
    
    public function storeGetOrderInfo($_id){
        $query = $this->db->query("SELECT `delivery_metnod`,`payment_method`,`real_price`,`del_price`,`final_price` FROM `zet_orders` WHERE `id`='".$_id."'");
        $row = $this->db->assoc($query);
        return $row;
    }

}

/** ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- **/
class InMailOrder extends Model {
    private $_ID;
    
    function __construct($id) {
        $this->_ID = (int)$id;
        parent::__construct();
    }
    
    public function GetOrderInfo() {
        $query = $this->db->query("SELECT `status`,`delivery_metnod`,`payment_method`,`date`,`real_price`,`discount`,`del_price`,`final_price`,`rdate`,`ftime`,`ttime`,`photos`,`card`,`card_text` FROM `zet_orders` WHERE `id`='".$this->_ID."'");
        $data = $this->db->assoc($query);
        return $data;
    }
    
    public function GetUserInfo($receiver = 0) {
        $query = $this->db->query("SELECT `name`,`email`,`phone`,`adress` FROM `zet_orders_user` WHERE `order_id`='".$this->_ID."' AND `receiver`='".$receiver."'");
        $data = $this->db->assoc($query);
        return $data;
    }
    
    public function GetProducts() {
        global $lang_id;
        $data = array();
        $key = 1;
        
        $query_1 = $this->db->query("SELECT `product_id`,`product_option_id`,`qty` FROM `zet_orders_products` WHERE `zet_orders_products`.`order_id`='".$this->_ID."'");
        while ($row_1 = $this->db->assoc($query_1)) {
            $query_2 = $this->db->query("SELECT `url`,`title`,`article`,`price`,`zet_product`.`picture` 
            FROM `zet_product`,`zet_product_description`,`zet_product_option` 
            WHERE `zet_product`.`id`='".$row_1["product_id"]."' 
            AND `zet_product_description`.`product_id`='".$row_1["product_id"]."' 
            AND `zet_product_option`.`id`='".$row_1["product_option_id"]."' 
            AND `zet_product_description`.`language_id`='".$lang_id."'");
            
            while ($row_2 = $this->db->assoc($query_2)) {
                $row_2["qty"] = $row_1["qty"];
                $row_2["category"] = $this->GetProductCategory($row_1["product_id"]);
                $row_2["option_name"] = $this->GetOptionName($row_1["product_option_id"]);
                $row_2["price"] = NewPrice($row_2["price"]);
                
                $data[$key] = $row_2;
                $key++;
            }
        }
        
        return $data;
    }
    
    public function ResolveName($type, $id) {
        switch ($type) {
            case "status": $name = $this->ResolveStatus($id); break;
            case "delivery": $name = $this->ResolveDelivery($id); break;
            case "payment": $name = $this->ResolvePayment($id); break;
        }
        return $name;
    }
    
    public function GetDescription($type, $id) {
        switch ($type) {
            case "payment": $name = $this->ResolvePayment($id); break;
        }
        return $name;
    }
    
    private function PaymentDescription($id) {
        $query = $this->db->query("SELECT `description` FROM `zet_payment_method_description` WHERE `payment_id`='".$id."' AND `language_id`='1'");
        $data = $this->db->assoc($query);
        return $data['description'];
    }
    
    private function ResolveStatus($id) {
        switch ($id) {
            case "1": $name = "Новый"; break;
            case "2": $name = "В обработке"; break;
            case "3": $name = "Отправленный"; break;
            case "4": $name = "Выполненный"; break;
            case "5": $name = "Несостоявшийся"; break;
            case "6": $name = "Отменен"; break;
        }
        return $name;
    }
    
    private function ResolveDelivery($id) {
        switch ($id) {
            case "1": $name = "Курьером по Киеву"; break;
            case "2": $name = "Самовывоз"; break;
        }
        return $name;
    }
    
    private function ResolvePayment($id) {
        switch ($id) {
            case "1": $name = "Банковской картой (Visa/MasterCard)"; break;
            case "2": $name = "Оплата на карту ПриватБанка"; break;
            case "3": $name = "Денежный перевод Western Union"; break;
        }
        return $name;
    }
    
    private function GetProductCategory($id) {
        $query = $this->db->query("SELECT `url` FROM `zet_category`,`zet_product_to_category` WHERE `zet_product_to_category`.`product_id`='".$id."' AND `zet_product_to_category`.`is_main_category`='1' AND `zet_product_to_category`.`category_id`=`zet_category`.`id`");
        $data = $this->db->assoc($query);
        return $data["url"];
    }
    
    private function GetOptionName($id) {
        global $lang_id;
        $query = $this->db->query("SELECT `name` FROM `zet_product_option_description` WHERE `zet_product_option_description`.`option_id`='".$id."' AND `zet_product_option_description`.`language_id`='".$lang_id."'");
        $data = $this->db->assoc($query);
        return $data["name"];
    }
}
