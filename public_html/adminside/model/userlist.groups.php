<?php
class UserlistGroups extends Model{
    
    public function addGroup($data){
        $_discount_value = (empty($data["discount_value"])) ? 0 : $this->db->escape($data["discount_value"]);
        $this->db->query("INSERT INTO `zet_userlist_group` (`id`, `status`, `name`, `discount_type`, `discount_value`) VALUES ('', '1', '".$this->db->escape($data["name"])."','".$data["discount_type"]."','".$_discount_value."')");
    }
    
    public function editGroup($group_id, $data){
        $_discount_value = (empty($data["discount_value"])) ? 0 : $this->db->escape($data["discount_value"]);
        $this->db->query("UPDATE `zet_userlist_group` SET `name`='".$this->db->escape($data["name"])."', `discount_type`='".$data["discount_type"]."', `discount_value`='".$_discount_value."' WHERE `id`='".(int)$group_id."'");
    }
    
    public function deleteGroup($group_id){
        $this->db->query("DELETE FROM `zet_userlist_group` WHERE `id`='".(int)$group_id."'");
    }
    
    public function getGroup($group_id){
        $query = $this->db->query("SELECT * FROM `zet_userlist_group` WHERE `id`='".(int)$group_id."'");
        $result = $this->db->assoc($query);
        return $result;
    }
    
    public function getGroups($_static = 0){
        $query = $this->db->query("SELECT * FROM `zet_userlist_group` WHERE `static`='".$_static."' ORDER BY `id` ASC");
        return $query;
    }
    
    public function redirect(){
        redirectTo(ADM_SRV."userlist/groups/");
    }
    
    public function checkGroup($group_id){
        $query = $this->db->query("SELECT * FROM `zet_userlist_group` WHERE `id`='".(int)$group_id."'");
        $result = $this->db->assoc($query);
        return ($result) ? true : false;
    }
    
}