<?php
class SettingsCurrency extends Model{
    
    public function addCurrency($data){
        $this->db->query("UPDATE `zet_currency` SET `name`='".$this->db->escape($data["main_name"])."',`abbr`='".$this->db->escape($data["main_abbr"])."',`code`='".$this->db->escape($data["main_code"])."' WHERE `default`='1'");
        $this->db->query("DELETE FROM `zet_currency` WHERE `default`='0'");
        foreach($data["name"] as $key => $val){
            $_rate = str_replace(",",".",$data["rate"][$key]);
            $this->db->query("INSERT INTO `zet_currency` (`id`, `status`, `name`, `abbr`, `code`, `rate`, `default`) VALUES ('','1','".$this->db->escape($data["name"][$key])."','".$this->db->escape($data["abbr"][$key])."','".$this->db->escape($data["code"][$key])."','".$this->db->escape($_rate)."','0')");
        }
    }
    
    public function deleteCurrency($currency_id){
        $this->db->query("DELETE FROM `zet_currency` WHERE `id`='".$currency_id."'");
    }
        
    public function redirect(){
        redirectTo(ADM_SRV."settings/currency/");
    }
}