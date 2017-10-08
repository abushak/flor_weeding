<?php
class SettingsPayment extends Model {
    public function addMethod($data) {
        $_data_status = ($data['status'] == "on") ? 1 : 0;
        $this->db->query("INSERT INTO `zet_payment_method`(`status`) VALUES ('".$_data_status."')");
        $_id = $this->db->getLastId();
        
        foreach ($data['title'] as $language_id => $value) {
            $this->db->query("INSERT INTO `zet_payment_method_description`(`payment_id`,`language_id`,`title`,`short_description`,`description`) VALUES ('".$_id."','".$language_id."','".$this->db->escape($data['title'][$language_id])."','".$this->db->escape($data['short_description'][$language_id])."','".$this->db->escape($data['description'][$language_id])."')");
        }
        
        if (count($data["ugroup"]) > 0) {
            foreach ($data["ugroup"] as $key => $group_id) {
                $this->db->query("INSERT INTO `zet_payment_method_to_ugroup`(`payment_id`,`ugroup_id`) VALUES ('".$_id."','".$group_id."')");
            }
        }
    }
    
    public function editMethod($_id, $data) {
        $_data_status = ($data['status'] == "on") ? 1 : 0;
        $this->db->query("UPDATE `zet_payment_method` SET `status`='".$_data_status."' WHERE `id`='".$_id."'");
        
        $this->db->query("DELETE FROM `zet_payment_method_description` WHERE `payment_id`='".$_id."'");
        foreach ($data['title'] as $language_id => $value) {
            $this->db->query("INSERT INTO `zet_payment_method_description`(`payment_id`,`language_id`,`title`,`short_description`,`description`) VALUES ('".$_id."','".$language_id."','".$this->db->escape($data['title'][$language_id])."','".$this->db->escape($data['short_description'][$language_id])."','".$this->db->escape($data['description'][$language_id])."')");
        }
        
        $this->db->query("DELETE FROM `zet_payment_method_to_ugroup` WHERE `payment_id`='".$_id."'");
        if (count($data["ugroup"]) > 0) {
            foreach ($data["ugroup"] as $key => $group_id) {
                $this->db->query("INSERT INTO `zet_payment_method_to_ugroup` (`payment_id`, `ugroup_id`) VALUES ('".$_id."','".$group_id."')");
            }
        }
    }
    
    public function deleteMethod($_id) {
        $this->db->query("DELETE FROM `zet_payment_method_to_ugroup` WHERE `payment_id`='".$_id."'");
        $this->db->query("DELETE FROM `zet_payment_method_description` WHERE `payment_id`='".$_id."'");
        $this->db->query("DELETE FROM `zet_delivery_method_to_payment_method` WHERE `payment_id`='".$_id."'");
        $this->db->query("DELETE FROM `zet_payment_method` WHERE `id`='".$_id."'");
    }
    
    public function getMethod($_id) {
        $query = $this->db->query("SELECT * FROM `zet_payment_method` WHERE `id`='".(int)$_id."'");
        $result = $this->db->assoc($query);
        return $result;
    }
    
    public function getMethodOptions($_id) {
        $data = array();
        $query = $this->db->query("SELECT * FROM `zet_payment_method_to_ugroup` WHERE `payment_id`='".(int)$_id."'");
        while ($row = $this->db->assoc($query)) {
            array_push($data, $row['ugroup_id']);
        }
        return $data;
    }
    
    public function getMethodDescriptions($_id) {
        $data = array();
        $query = $this->db->query("SELECT * FROM `zet_payment_method_description` WHERE `payment_id`='".(int)$_id."'");
        while ($row = $this->db->assoc($query)) {
            $data[$row['language_id']] = $row;
        }
        return $data;
    }
    
    public function getMethods($language_id) {
        $query = $this->db->query("SELECT `id`,`status`,`priority`,`title` FROM `zet_payment_method`,`zet_payment_method_description` WHERE `zet_payment_method_description`.`payment_id`=`zet_payment_method`.`id` AND `zet_payment_method_description`.`language_id`='".(int)$language_id."' ORDER BY `priority` ASC");
        return $query;
    }
    
    public function checkMethod($_id) {
        $query = $this->db->query("SELECT * FROM `zet_payment_method` WHERE `id`='".(int)$_id."'");
        $result = $this->db->assoc($query);
        return ($result) ? true : false;
    }
    
    public function redirect() {
        redirectTo(ADM_SRV."settings/payment/");
    }
}