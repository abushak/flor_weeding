<?php
class PagesMain extends Model {
    public function GetPageData($url) {
        global $lang_id;
        $query = $this->db->query("SELECT `title`,IF(`meta_h1`='', `title`, `meta_h1`) AS `meta_h1`,`description` FROM `zet_pages`,`zet_pages_description` WHERE `zet_pages_description`.`page_id`=`zet_pages`.`id` AND `zet_pages_description`.`language_id`='".$lang_id."' AND `zet_pages`.`url`='".$url."'");
        $data = $this->db->assoc($query);
        return $data;
    }
    
    public function addPage($data){
        $_data_status = ($data['status'] == "on") ? 1 : 0;
        $this->db->query("INSERT INTO `zet_pages` (`id`, `url`, `parent`, `priority`, `status`, `type`) VALUES ('','','".$this->db->escape($data["parent_category"])."','','".$_data_status."','0')");
        $_id = $this->db->getLastId();
        
        $url = (empty($data["url"])) ? translite($this->db->escape($data['title'][1])) : translite($data["url"]);
        $url_query = $this->db->query("SELECT `url` FROM `zet_pages` WHERE `url`='".$url."'");
        $new_url = $this->db->assoc($url_query);
        if($new_url == false) {
            $this->db->query("UPDATE `zet_pages` SET `url`='".$url."' WHERE `id`='".(int)$_id."'");
        } else {
            $this->db->query("UPDATE `zet_pages` SET `url`='".$_id."_".$url."' WHERE `id`='".(int)$_id."'");
        }
        
        foreach ($data['title'] as $language_id => $value) {
            $this->db->query("INSERT INTO `zet_pages_description` (`page_id`, `language_id`, `title`, `description`, `meta_title`, `meta_h1`, `meta_keywords`, `meta_description`) VALUES ('".(int)$_id."', '".(int)$language_id."', '".$this->db->escape($data['title'][$language_id])."', '".$this->db->escape($data['description'][$language_id])."', '".$this->db->escape($data['meta_title'][$language_id])."', '".$this->db->escape($data['meta_h1'][$language_id])."', '".$this->db->escape($data['meta_keywords'][$language_id])."', '".$this->db->escape($data['meta_description'][$language_id])."')");
        }
        
        if(count($data["ugroup"]) > 0){
            foreach($data["ugroup"] as $key => $group_id){
                $this->db->query("INSERT INTO `zet_pages_to_ugroup` (`page_id`, `ugroup_id`) VALUES ('".$_id."','".$group_id."')");
            }
        }
    }
    public function editPage($_id, $data){
        $_data_status = ($data['status'] == "on") ? 1 : 0;
        $this->db->query("UPDATE `zet_pages` SET `parent`='".$this->db->escape($data["parent_category"])."', `status`='".$_data_status."' WHERE `id`='".(int)$_id."'");
        
        if(isset($data["url"])){
            $url = (empty($data["url"])) ? translite($this->db->escape($data['title'][1])) : translite($data["url"]);
            $url_query = $this->db->query("SELECT `id`,`url` FROM `zet_pages` WHERE `url`='".$url."'");
            $new_url = $this->db->assoc($url_query);
            if($new_url["id"] == $_id || $new_url == false) {
                $this->db->query("UPDATE `zet_pages` SET `url`='".$url."' WHERE `id`='".(int)$_id."'");
            } else {
                $this->db->query("UPDATE `zet_pages` SET `url`='".$_id."_".$url."' WHERE `id`='".(int)$_id."'");
            }
        }
        
        $this->db->query("DELETE FROM `zet_pages_description` WHERE `page_id`='".$_id."'");
        foreach ($data['title'] as $language_id => $value) {
            $this->db->query("INSERT INTO `zet_pages_description` (`page_id`, `language_id`, `title`, `description`, `meta_title`, `meta_h1`, `meta_keywords`, `meta_description`) VALUES ('".(int)$_id."', '".(int)$language_id."', '".$this->db->escape($data['title'][$language_id])."', '".$this->db->escape($data['description'][$language_id])."', '".$this->db->escape($data['meta_title'][$language_id])."', '".$this->db->escape($data['meta_h1'][$language_id])."', '".$this->db->escape($data['meta_keywords'][$language_id])."', '".$this->db->escape($data['meta_description'][$language_id])."')");
        }
        
        $this->db->query("DELETE FROM `zet_pages_to_ugroup` WHERE `page_id`='".$_id."'");
        if(count($data["ugroup"]) > 0){
            foreach($data["ugroup"] as $key => $group_id){
                $this->db->query("INSERT INTO `zet_pages_to_ugroup` (`page_id`, `ugroup_id`) VALUES ('".$_id."','".$group_id."')");
            }
        }
    }
    public function deletePage($_id){
        $query = $this->db->query("SELECT `type` FROM `zet_pages` WHERE `id`='".(int)$_id."'");
        $result = $this->db->assoc($query);
        if($result["type"] == 0){
            $query_2 = $this->db->query("SELECT * FROM `zet_pages` WHERE `parent`='".(int)$_id."'");
            while($result_2 = $this->db->assoc($query_2)){
                $this->deletePage($result_2["id"]);
            }
            $this->db->query("DELETE FROM `zet_pages_to_ugroup` WHERE `page_id`='".$_id."'");
            $this->db->query("DELETE FROM `zet_pages_description` WHERE `page_id`='".$_id."'");
            $this->db->query("DELETE FROM `zet_pages` WHERE `id`='".$_id."'");
        }
    }
    public function getPage($_id){
        $query = $this->db->query("SELECT * FROM `zet_pages` WHERE `id`='".(int)$_id."'");
        $result = $this->db->assoc($query);
        return $result;
    }
    public function getPageDescription($_id){
        $_description_data = array();
        $query = $this->db->query("SELECT * FROM `zet_pages_description` WHERE `page_id`='".(int)$_id."'");
        while ($row = $this->db->assoc($query)) {
            $_description_data[$row['language_id']] = array(
                'title'             => $row['title'],
                'description'       => $row['description'],
                'meta_title'        => $row['meta_title'],
                'meta_h1'           => $row['meta_h1'],
                'meta_keywords'     => $row['meta_keywords'],
                'meta_description'  => $row['meta_description']
            );
        }
        return $_description_data;
    }
    public function getPageToGroups($_id){
        $_groups_data = array();
        $query = $this->db->query("SELECT * FROM `zet_pages_to_ugroup` WHERE `page_id`='".(int)$_id."'");
        while ($row = $this->db->assoc($query)) {
            array_push($_groups_data, $row['ugroup_id']);
        }
        return $_groups_data;
    }
    public function getPages($lang, $parent = 0, $type = false){
        $_type = ($type !== false) ? "AND `type`='".(int)$type."'" : "";
        $query = $this->db->query("SELECT `id`, `url`, `parent`, `priority`, `status`, `type`, (SELECT `title` FROM `zet_pages_description` WHERE `language_id`='".(int)$lang."' AND `page_id`=`zet_pages`.`id`) AS `title` FROM `zet_pages` WHERE `parent`='".$parent."' ".$_type." ORDER BY `priority` ASC");
        return $query;
    }
    public function checkPage($_id){
        $query = $this->db->query("SELECT * FROM `zet_pages` WHERE `id`='".(int)$_id."'");
        $result = $this->db->assoc($query);
        return ($result) ? true : false;
    }
    public function redirect(){
        redirectTo(ADM_SRV."pages/main_menu/");
    }
}