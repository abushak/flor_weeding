<?php
class Cart extends Model {
    /** Додати товар до кошика **/
    public function InsertItem($_session, $_product, $_option, $_quantity, $additional = 0) {
        if ($this->__Exists($_session)) {
            $_id = $this->__GetIdBySession($_session);
        } else {
            $this->db->query("INSERT INTO `zet_cart`(`session`) VALUES ('".$_session."')");
            $_id = $this->db->getLastId();
        }
        
        if ($this->ItemInCart($_session, $_product, $_option)) {
            $this->db->query("UPDATE `zet_cart_products` SET `quantity`=`quantity` + ".$_quantity." WHERE `cart_id`='".$_id."' AND `product_id`='".$_product."' AND `option_id`='".$_option."'");
        } else {
            $this->db->query("INSERT INTO `zet_cart_products`(`cart_id`,`product_id`,`option_id`,`quantity`,`additional`) VALUES ('".$_id."','".$_product."','".$_option."','".$_quantity."','".$additional."')");
        }
    }
    
    /** Видалити товар з кошика **/
    public function RemoveItem($_session, $_product, $_option) {
        $_id = $this->__GetIdBySession($_session);
        $query = $this->db->query("DELETE FROM `zet_cart_products` WHERE `zet_cart_products`.`cart_id`='".$_id."' AND `zet_cart_products`.`product_id`='".$_product."' AND `zet_cart_products`.`option_id`='".$_option."'");
    }
    
    /** Перевірка товару в кошику **/
    public function ItemInCart($_id, $_product, $_option) {
        $query = $this->db->query("SELECT `id` FROM `zet_cart`,`zet_cart_products` WHERE `zet_cart`.`id`=`zet_cart_products`.`cart_id` AND `zet_cart_products`.`product_id`='".$_product."' AND `zet_cart_products`.`option_id`='".$_option."' AND `zet_cart`.`session`='".$_id."'");
        $row = $this->db->assoc($query);
        return ($row) ? true : false;
    }
    
    /** Очистити кошик **/
    public function RemoveCart($_session) {
        $_id = $this->__GetIdBySession($_session);
        $this->db->query("DELETE FROM `zet_cart` WHERE `id`='".$_id."'");
        $this->db->query("DELETE FROM `zet_cart_products` WHERE `cart_id`='".$_id."'");
    }
    
    /** Кількість товарів у кошику **/
    public function ItemsInCart($_session) {
        $_id = $this->__GetIdBySession($_session);
        $query = $this->db->query("SELECT COUNT(*) AS `total` FROM `zet_cart_products` WHERE `cart_id`='".$_id."'");
        $row = $this->db->assoc($query);
        return $row["total"];
    }
    
    /** Всі товари в кошику **/
    public function GetItems($_session) {
        $data = array(); $i = 0;
        $_id = $this->__GetIdBySession($_session);
        $query = $this->db->query("SELECT `product_id`,`option_id`,`quantity`,`additional` FROM `zet_cart_products` WHERE `cart_id`='".$_id."'");
        while ($row = $this->db->assoc($query)) {
            if ($row['additional'] == 1) {
                $data[$i] = $this->__GetShortItemDescription($row['product_id'], $row['option_id']);
            } 
            else $data[$i] = $this->__GetItemDescription($row['product_id'], $row['option_id']);
            $data[$i]['product_id'] = $row['product_id'];
            $data[$i]['option_id'] = $row['option_id'];
            $data[$i]['quantity'] = $row['quantity'];
            $data[$i]['additional'] = $row['additional'];
            $i++;
        }
        return $data;
    }
    
    public function GetItemOptions($_id) {
        global $lang_id; $i = 1;
        $data = array();
        $query = $this->db->query("SELECT `id`,`article`,`price`,`name` FROM `zet_product_option`,`zet_product_option_description` 
        WHERE `zet_product_option`.`id`=`zet_product_option_description`.`option_id` 
        AND `zet_product_option`.`product_id`='".$_id."' AND `zet_product_option_description`.`product_id`='".$_id."' AND `language_id`='".$lang_id."'");
        while ($row = $this->db->assoc($query)) {
            $row["price"] = NewPrice($row["price"]);
            $data[$i] = $row;
            $i++;
        }
        return $data;
    }
    
    public function UpdateCart($data, $_session) {
        $_id = $this->__GetIdBySession($_session);
        $this->db->query("DELETE FROM `zet_cart_products` WHERE `cart_id`='".$_id."'");
        foreach ($data['product_id'] as $key => $val) {
            if ($this->ItemInCart($_session, $data['product_id'][$key], $data['option_id'][$key])) {
                $this->db->query("UPDATE `zet_cart_products` SET `quantity`=`quantity` + ".$data['quantity'][$key]." WHERE `cart_id`='".$_id."' AND `product_id`='".$data['product_id'][$key]."' AND `option_id`='".$data['option_id'][$key]."'");
            } else {
                $query = $this->db->query("SELECT `additional` FROM `zet_product` WHERE `id`='".$data['product_id'][$key]."'");
                $row = $this->db->assoc($query);
                $additional = $row["additional"];
                $this->db->query("INSERT INTO `zet_cart_products`(`cart_id`,`product_id`,`option_id`,`quantity`,`additional`) VALUES ('".$_id."','".$data['product_id'][$key]."','".$data['option_id'][$key]."','".$data['quantity'][$key]."','".$additional."')");
            }
        }
    }
    
    /** Ціна товарів у кошику **/
    public function CartPrice($data) {
        $res = 0;
        foreach ($data as $key => $val) {
            $res += $val['price'] * $val['quantity'];
        }
        return $res;
    }
    
    /** ---------- PRIVATE ---------- **/
    /** Перевірка наявності кошика **/
    private function __Exists($_session) {
        $query = $this->db->query("SELECT `id` FROM `zet_cart` WHERE `session`='".$_session."'");
        $row = $this->db->assoc($query);
        return ($row) ? true : false;
    }
    
    /** ID Кошика за значенням сесії **/
    private function __GetIdBySession($_session) {
        $query = $this->db->query("SELECT `id` FROM `zet_cart` WHERE `session`='".$_session."'");
        $row = $this->db->assoc($query);
        return $row['id'];
    }
    
    /** Опис товару **/
    private function __GetItemDescription($_product, $_option) {
        global $lang_id;
        $data = array();
        $query = $this->db->query("SELECT `url`,`title`,`article`,`price`,`zet_product`.`picture` AS `picture`,`name` FROM `zet_product`,`zet_product_description`,`zet_product_option`,`zet_product_option_description` WHERE `zet_product`.`id`='".$_product."' AND `zet_product_description`.`product_id`='".$_product."' AND `zet_product_description`.`language_id`='".$lang_id."' AND `zet_product_option`.`id`='".$_option."' AND `zet_product_option`.`product_id`='".$_product."' AND `zet_product_option_description`.`option_id`=`zet_product_option`.`id` AND `zet_product_option_description`.`language_id`='".$lang_id."'");
        $row = $this->db->assoc($query);
        $row["price"] = NewPrice($row["price"]);
        $data = $row;
        return $data;
    }
    
    private function __GetShortItemDescription($_product, $_option) {
        global $lang_id;
        $data = array();
        $query = $this->db->query("SELECT `url`,`title`,`article`,`price`,`zet_product`.`picture` AS `picture` FROM `zet_product`,`zet_product_description`,`zet_product_option` WHERE `zet_product`.`id`='".$_product."' AND `zet_product_description`.`product_id`='".$_product."' AND `zet_product_description`.`language_id`='".$lang_id."' AND `zet_product_option`.`product_id`='".$_product."'");
        $row = $this->db->assoc($query);
        $row["price"] = NewPrice($row["price"]);
        $data = $row;
        return $data;
    }

}