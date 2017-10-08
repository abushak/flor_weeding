<?php
class UserlistDiscount extends Model{
    
    public function addDiscount($data){
        $_data_onetime = ($data['onetime'] == "on") ? 1 : 0;
        $this->db->query("INSERT INTO `zet_discount_orders` (`id`, `status`, `name`, `discount_type`, `discount_value`, `min_order_sum`, `max_order_sum`, `expire_date`, `onetime`) VALUES ('', '1', '".$this->db->escape($data["name"])."', '".$data["discount_type"]."', '".$this->db->escape($data["discount_value"])."', '".$this->db->escape($data["min_order_sum"])."', '".$this->db->escape($data["max_order_sum"])."', '".$this->db->escape($data["expire_date"])."', '".$_data_onetime."')");
    }
    
    public function editDiscount($discount_id, $data){
        $_data_onetime = ($data['onetime'] == "on") ? 1 : 0;
        $this->db->query("UPDATE `zet_discount_orders` SET `name`='".$this->db->escape($data["name"])."', `discount_type`='".$data["discount_type"]."', `discount_value`='".$this->db->escape($data["discount_value"])."', `min_order_sum`='".$this->db->escape($data["min_order_sum"])."', `max_order_sum`='".$this->db->escape($data["max_order_sum"])."', `expire_date`='".$this->db->escape($data["expire_date"])."', `onetime`='".$_data_onetime."' WHERE `id`='".$discount_id."'");
    }
    
    public function deleteDiscount($discount_id){
        $this->db->query("DELETE FROM `zet_discount_onetime_used` WHERE `discount_id`='".(int)$discount_id."'");
        $this->db->query("DELETE FROM `zet_discount_orders` WHERE `id`='".(int)$discount_id."'");
    }
    
    public function getDiscount($discount_id){
        $query = $this->db->query("SELECT * FROM `zet_discount_orders` WHERE `id`='".(int)$discount_id."'");
        $result = $this->db->assoc($query);
        return $result;
    }
    
    public function getDiscounts(){
        $query = $this->db->query("SELECT * FROM `zet_discount_orders` ORDER BY `id` DESC");
        return $query;
    }
    
    public function checkDiscount($discount_id){
        $query = $this->db->query("SELECT * FROM `zet_discount_orders` WHERE `id`='".(int)$discount_id."'");
        $result = $this->db->assoc($query);
        return ($result) ? true : false;
    }
    
    public function redirect(){
        redirectTo(ADM_SRV."userlist/discount/");
    }
    
}