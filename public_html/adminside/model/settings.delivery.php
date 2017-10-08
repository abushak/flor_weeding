<?php
class SettingsDelivery extends Model{
    
    public function addMethod($data){
        $_data_status = ($data['status'] == "on") ? 1 : 0;
        $this->db->query("INSERT INTO `zet_delivery_method` (`id`, `priority`, `status`, `price`, `free_from`) VALUES ('','','".$_data_status."','".$this->db->escape($data["price"])."','".$this->db->escape($data["free_from"])."')");
        $delivery_id = $this->db->getLastId();
        
        foreach($data['title'] as $language_id => $value){
            $this->db->query("INSERT INTO `zet_delivery_method_description` (`delivery_id`, `language_id`, `title`, `description`) VALUES ('".$delivery_id."','".$language_id."','".$this->db->escape($data['title'][$language_id])."','".$this->db->escape($data['description'][$language_id])."')");
        }
        
        if(count($data["ugroup"]) > 0){
            foreach($data["ugroup"] as $key => $group_id){
                $this->db->query("INSERT INTO `zet_delivery_method_to_ugroup` (`delivery_id`, `ugroup_id`) VALUES ('".$delivery_id."','".$group_id."')");
            }
        }
        
        if(count($data["payment"]) > 0){
            foreach($data["payment"] as $key => $payment_id){
                $this->db->query("INSERT INTO `zet_delivery_method_to_payment_method` (`delivery_id`, `payment_id`) VALUES ('".$delivery_id."','".$payment_id."')");
            }
        }
    }
    
    public function editMethod($delivery_id, $data){
        $_data_status = ($data['status'] == "on") ? 1 : 0;
        $this->db->query("UPDATE `zet_delivery_method` SET `status`='".$_data_status."', `price`='".$this->db->escape($data["price"])."', `free_from`='".$this->db->escape($data["free_from"])."' WHERE `id`='".$delivery_id."'");
        
        foreach($data['title'] as $language_id => $value){
            $this->db->query("UPDATE `zet_delivery_method_description` SET `title`='".$this->db->escape($data['title'][$language_id])."', `description`='".$this->db->escape($data['description'][$language_id])."' WHERE `delivery_id`='".$delivery_id."' AND `language_id`='".$language_id."'");
        }
        
        $this->db->query("DELETE FROM `zet_delivery_method_to_ugroup` WHERE `delivery_id`='".$delivery_id."'");
        if(count($data["ugroup"]) > 0){
            foreach($data["ugroup"] as $key => $group_id){
                $this->db->query("INSERT INTO `zet_delivery_method_to_ugroup` (`delivery_id`, `ugroup_id`) VALUES ('".$delivery_id."','".$group_id."')");
            }
        }
        
        $this->db->query("DELETE FROM `zet_delivery_method_to_payment_method` WHERE `delivery_id`='".$delivery_id."'");
        if(count($data["payment"]) > 0){
            foreach($data["payment"] as $key => $payment_id){
                $this->db->query("INSERT INTO `zet_delivery_method_to_payment_method` (`delivery_id`, `payment_id`) VALUES ('".$delivery_id."','".$payment_id."')");
            }
        }
    }
    
    public function deleteMethod($delivery_id){
        $this->db->query("DELETE FROM `zet_delivery_method` WHERE `id`='".$delivery_id."'");
        $this->db->query("DELETE FROM `zet_delivery_method_description` WHERE `delivery_id`='".$delivery_id."'");
        $this->db->query("DELETE FROM `zet_delivery_method_to_ugroup` WHERE `delivery_id`='".$delivery_id."'");
        $this->db->query("DELETE FROM `zet_delivery_method_to_payment_method` WHERE `delivery_id`='".$delivery_id."'");
    }
    
    public function getMethod($delivery_id){
        $query = $this->db->query("SELECT * FROM `zet_delivery_method` WHERE `id`='".(int)$delivery_id."'");
        $result = $this->db->assoc($query);
        return $result;
    }
    
    public function getMethodOptions($delivery_id){
        $delivery_groups_data = array();
        $query = $this->db->query("SELECT * FROM `zet_delivery_method_to_ugroup` WHERE `delivery_id`='".(int)$delivery_id."'");
        while ($row = $this->db->assoc($query)) {
            array_push($delivery_groups_data, $row['ugroup_id']);
        }
        return $delivery_groups_data;
    }
    
    public function getMethodOptions_2($delivery_id){
        $delivery_groups_data = array();
        $query = $this->db->query("SELECT * FROM `zet_delivery_method_to_payment_method` WHERE `delivery_id`='".(int)$delivery_id."'");
        while ($row = $this->db->assoc($query)) {
            array_push($delivery_groups_data, $row['payment_id']);
        }
        return $delivery_groups_data;
    }
    
    public function getMethodDescriptions($delivery_id){
        $delivery_description_data = array();
        $query = $this->db->query("SELECT * FROM `zet_delivery_method_description` WHERE `delivery_id`='".(int)$delivery_id."'");
        while ($row = $this->db->assoc($query)) {
            $delivery_description_data[$row['language_id']] = array(
                'title'         => $row['title'],
                'description'   => $row['description']
            );
        }
        return $delivery_description_data;
    }
    
    public function getMethods($language_id){
        $query = $this->db->query("SELECT `id`, `status`, `priority`, (SELECT `title` FROM `zet_delivery_method_description` WHERE `language_id`='".(int)$language_id."' AND `delivery_id`=`zet_delivery_method`.`id`) AS `title` FROM `zet_delivery_method` ORDER BY `priority` ASC");
        return $query;
    }
    
    public function checkMethod($delivery_id){
        $query = $this->db->query("SELECT * FROM `zet_delivery_method` WHERE `id`='".(int)$delivery_id."'");
        $result = $this->db->assoc($query);
        return ($result) ? true : false;
    }
    
    public function redirect(){
        redirectTo(ADM_SRV."settings/delivery/");
    }
}