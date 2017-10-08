<?php
class SettingsCity extends Model{
    public function add($data){
        $query = $this->db->query("SELECT `city_id` FROM `zet_cities` ORDER BY `city_id` DESC");
        $last_city_id = $this->db->assoc($query);
        $last_city_id = ($last_city_id == false) ? 1 : $last_city_id['city_id'] + 1;
        
        foreach($data['name'] as $language_id => $city_name){
            $this->db->query("INSERT INTO `zet_cities` (`id`, `priority`, `city_id`, `language_id`, `name`) VALUES ('','','".$last_city_id."','".$language_id."','".$city_name."')");
        }
    }
    
    public function edit($_id, $data){
        foreach($data['name'] as $language_id => $city_name){
            $this->db->query("UPDATE `zet_cities` SET `name`='".$city_name."' WHERE `city_id`='".$_id."' AND `language_id`='".$language_id."'");
        }
    }
    
    public function del($_id){
        $this->db->query("DELETE FROM `zet_cities` WHERE `city_id`='".$_id."'");
    }
    
    public function getCity($_id){
        $data = array();
        $query = $this->db->query("SELECT * FROM `zet_cities` WHERE `city_id`='".(int)$_id."'");
        while($row = $this->db->assoc($query)) {
            $data[$row['language_id']] = array('name' => $row['name']);
        }
        return $data;
    }
    
    public function getCities($language_id){
        $query = $this->db->query("SELECT * FROM `zet_cities` WHERE `language_id`='".$language_id."' ORDER BY `name` ASC");
        return $query;
    }
    
    public function redirect(){
        redirectTo(ADM_SRV."settings/cities/");
    }
}