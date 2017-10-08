<?php
class StoreSettings extends Model {
    public function GetDeliveryMethods() {
        global $lang_id;
        $data = array();
        $query = $this->db->query("SELECT `id`,`price`,`title`,`short_description`,`description`,`free_from` FROM `zet_delivery_method`,`zet_delivery_method_description` WHERE `zet_delivery_method_description`.`delivery_id`=`zet_delivery_method`.`id` AND `zet_delivery_method_description`.`language_id`=".$lang_id." AND `zet_delivery_method`.`status`='1' ORDER BY `id` ASC");
        while ($row = $this->db->assoc($query)) {
            $data[$row['id']] = $row;
        }
        return $data;
    }
    
    public function GetPaymentMethods() {
        global $lang_id;
        $data = array();
        $query = $this->db->query("SELECT `id`,`title`,`short_description`,`description` FROM `zet_payment_method`,`zet_payment_method_description` WHERE `zet_payment_method_description`.`payment_id`=`zet_payment_method`.`id` AND `zet_payment_method_description`.`language_id`=".$lang_id." AND `zet_payment_method`.`status`='1' ORDER BY `id` ASC");
        while ($row = $this->db->assoc($query)) {
            $data[$row['id']] = $row;
        }
        return $data;
    }
    
    public function GetCities() {
        global $lang_id;
        $data = array();
        $query = $this->db->query("SELECT `city_id` AS `id`,`name` FROM `zet_cities` WHERE `language_id`='".$lang_id."' ORDER BY `name` ASC");
        while($row = $this->db->assoc($query)){
            $data[$row['id']] = array('name' => $row['name']);
        }
        return $data;
    }
    
    /** Назва методу доставки по ID **/
    public function deliveryNameByID($_id){
        global $lang_id; $data = array();
        $query = $this->db->query("SELECT `price`,`title` FROM `zet_delivery_method`,`zet_delivery_method_description` WHERE `zet_delivery_method_description`.`delivery_id`=`zet_delivery_method`.`id` AND `zet_delivery_method_description`.`language_id`='".$lang_id."' AND `zet_delivery_method`.`id`='".$_id."'");
        while($row = $this->db->assoc($query)){
            $data = $row;
        }
        return $data;
    }
    
    public function paymentNameByID($_id){
        global $lang_id; $data = array();
        $query = $this->db->query("SELECT `title`,`description` FROM `zet_payment_method_description` WHERE `payment_id`='".$_id."' AND `language_id`='".$lang_id."'");
        while($row = $this->db->assoc($query)){
            $data = $row;
        }
        return $data;
    }

}