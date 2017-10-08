<?php
class UserlistUsers extends Model{
    public function add($data){
        $this->db->query("INSERT INTO `zet_userlist` (`id`, `name`,  `email`, `password`, `phone`,`group_id`) VALUES ('','".$data['user_name']."','".$data['user_lastname']."','".$data['user_email']."','".$data['user_password']."','".$data['user_phone']."','".$data['user_reg_date']."','".$data['user_city']."','".$data['user_group']."')");
        $_id = $this->db->getLastId();
        
        foreach($data['user_address'] as $key => $address){
            $this->db->query("INSERT INTO `zet_userlist_address`(`user_id`, `address`) VALUES ('".$_id."','".$address."')");
        }
        
        foreach($data['subscribe'] as $key => $subscribe){
            $this->db->query("INSERT INTO `zet_userlist_subscribe`(`user_id`, `subscribe_id`) VALUES ('".$_id."','".$subscribe."')");
        }
    }
    public function edit($_id, $data){
        $this->db->query("UPDATE `zet_userlist` SET `name`='".$data['user_name']."',`lastname`='".$data['user_lastname']."',`email`='".$data['user_email']."',`password`='".$data['user_password']."',`phone`='".$data['user_phone']."',`register_date`='".$data['user_reg_date']."',`group_id`='".$data['user_group']."' WHERE `id`='".$_id."'");
        
        $this->db->query("DELETE FROM `zet_userlist_address` WHERE `user_id`='".$_id."'");
        foreach($data['user_address'] as $key => $address){
            $this->db->query("INSERT INTO `zet_userlist_address`(`user_id`, `address`) VALUES ('".$_id."','".$address."')");
        }
        
        $this->db->query("DELETE FROM `zet_userlist_subscribe` WHERE `user_id`='".$_id."'");
        foreach($data['subscribe'] as $key => $subscribe){
            $this->db->query("INSERT INTO `zet_userlist_subscribe`(`user_id`, `subscribe_id`) VALUES ('".$_id."','".$subscribe."')");
        }
    }
    public function del($_id){
        $this->db->query("DELETE FROM `zet_userlist` WHERE `id`='".$_id."'");
        $this->db->query("DELETE FROM `zet_userlist_address` WHERE `user_id`='".$_id."'");
        $this->db->query("DELETE FROM `zet_userlist_subscribe` WHERE `user_id`='".$_id."'");
    }
    public function getUser($_id){
        $query = $this->db->query("SELECT * FROM `zet_userlist` WHERE `id`='".(int)$_id."'");
        $result = $this->db->assoc($query);
        return $result;
    }
    public function getAddress($_id){
        $data = array(); $i = 0;
        $query = $this->db->query("SELECT * FROM `zet_userlist_address` WHERE `user_id`='".(int)$_id."'");
        while($row = $this->db->assoc($query)) {
            $data[$i] = array('address' => $row['address']);
            $i++;
        }
        return $data;
    }
    public function getSubscribe($_id){
        $data = array();
        $query = $this->db->query("SELECT * FROM `zet_userlist_subscribe` WHERE `user_id`='".(int)$_id."'");
        while($row = $this->db->assoc($query)) {
            array_push($data, $row['subscribe_id']);
        }
        return $data;
    }
    public function getUsers($language, $data){
        $query = $this->db->query("SELECT *, 
        (SELECT COUNT(*) FROM `zet_orders`,`zet_orders_user` WHERE `zet_orders_user`.`order_id`=`zet_orders`.`id` AND (`zet_orders_user`.`user_id`=`zet_userlist`.`id` OR `zet_orders_user`.`email`=`zet_userlist`.`email`)) AS `orders_total`, 
        (SELECT `id` FROM `zet_orders`,`zet_orders_user` WHERE `zet_orders_user`.`order_id`=`zet_orders`.`id` AND (`zet_orders_user`.`user_id`=`zet_userlist`.`id` OR `zet_orders_user`.`email`=`zet_userlist`.`email`) ORDER BY `date` DESC LIMIT 1) AS `last_order`, 
        (SELECT `date` FROM `zet_orders`,`zet_orders_user` WHERE `zet_orders_user`.`order_id`=`zet_orders`.`id` AND (`zet_orders_user`.`user_id`=`zet_userlist`.`id` OR `zet_orders_user`.`email`=`zet_userlist`.`email`) ORDER BY `date` DESC LIMIT 1) AS `last_order_date`
        
        FROM `zet_userlist` ORDER BY `id` DESC");
        return $query;
    }
    public function countUsers($type = false){
        if($type) $where = "WHERE `register_date` LIKE CURDATE()";
        $query = $this->db->query("SELECT COUNT(*) AS `total` FROM `zet_userlist` {$where}");
        $res = $this->db->assoc($query);
        return $res['total'];
    }
    public function redirect(){
        redirectTo(ADM_SRV."userlist/users/");
    }
    
    /** STORE **/
    public function isRegistered($_email){
        $query = $this->db->query("SELECT `id` FROM `zet_userlist` WHERE `email`='".$_email."'");
        $row = $this->db->assoc($query);
        return ($row) ? true : false;
    }
    
    public function isUser($_email, $_pass){
        $query = $this->db->query("SELECT `id` FROM `zet_userlist` WHERE `email`='".$_email."' AND `password`='".$_pass."'");
        $row = $this->db->assoc($query);
        return ($row) ? true : false;
    }
    
    public function getUserID($_email, $_pass){
        $query = $this->db->query("SELECT `id` FROM `zet_userlist` WHERE `email`='".$_email."' AND `password`='".$_pass."'");
        $row = $this->db->assoc($query);
        return $row['id'];
    }
    
    public function Register($data){
        $_date = date('Y-m-d');
        $this->db->query("INSERT INTO `zet_userlist` (`id`,`name`,`email`,`password`,`phone`,`register_date`,`group_id`) VALUES ('','".$data['user_name']."','".$data['user_email']."','".$data['user_pass']."','".$data['user_phone']."','".$_date."','1')");
        $_id = $this->db->getLastId();
        return $_id;
    }
    
    /** Дані користувача **/
    public function GetUserData($_id){
        $data = array();
        $query = $this->db->query("SELECT `id`,`name`,`lastname`,`phone`,`email`,`group_id` FROM `zet_userlist` WHERE `id`='".$_id."'");
        $row = $this->db->assoc($query);
        $data = $row;
        return $data;
    }
    
    /** Список бажань**/
    public function GetWishlist(){
        global $lang_id; $data = array();
        $_user = $_SESSION['USER_ID'];
        $query = $this->db->query("SELECT `id`,`user_id`,`product_id` FROM `zet_wishlist` WHERE `user_id`='".$_user."'");
        while($row = $this->db->assoc($query)){
            $query_ = $this->db->query("SELECT `zet_product`.`id` AS `id`,`new`,`recommended`,`hit`,`url`,`title`,`zet_product_option`.`id` AS `option_id`,`price`,`quantity`,`picture`,`cross_price` FROM `zet_product` LEFT JOIN `zet_product_description` ON `zet_product`.`id`=`zet_product_description`.`product_id` AND `zet_product_description`.`language_id`='".$lang_id."' LEFT JOIN `zet_product_option` ON `zet_product`.`id`=`zet_product_option`.`product_id` WHERE `zet_product`.`status`='1' AND `zet_product`.`id`='".$row['product_id']."' GROUP BY `zet_product`.`id` ORDER BY `picture`='' ASC");
            $row_ = $this->db->assoc($query_);
            $data[$row['id']] = $row_;
        }
        return $data;
    }

}