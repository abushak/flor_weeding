<?php
class PagesStatic extends Model {
    public function editPage($_id, $data) {
        $this->db->query("DELETE FROM `zet_pages_static_description` WHERE `page_id`='".$_id."'");
        foreach ($data['title'] as $language_id => $value) {
            $this->db->query("INSERT INTO `zet_pages_static_description` (`page_id`, `language_id`, `title`, `description`, `meta_title`, `meta_h1`, `meta_keywords`, `meta_description`) VALUES ('".(int)$_id."', '".(int)$language_id."', '".$this->db->escape($data['title'][$language_id])."', '".$this->db->escape($data['description'][$language_id])."', '".$this->db->escape($data['meta_title'][$language_id])."', '".$this->db->escape($data['meta_h1'][$language_id])."', '".$this->db->escape($data['meta_keywords'][$language_id])."', '".$this->db->escape($data['meta_description'][$language_id])."')");
        }
        
        if (!empty($_FILES['pdf']['name'])) {
            $tmp = explode(".", $_FILES['pdf']['name']);
            $_ext = end($tmp);
            $_file = rand().'_'.time().'.'.$_ext;
            $_path = ROOT_FILES."news/{$_file}";
            if (move_uploaded_file($_FILES['pdf']['tmp_name'], $_path)) {
                $this->db->query("UPDATE `zet_pages_static` SET `file`='".$_file."' WHERE `id`='".$_id."'");
            } else return false;
        }
    }
    
    public function getPage($_id) {
        $query = $this->db->query("SELECT * FROM `zet_pages_static` WHERE `id`='".(int)$_id."'");
        $result = $this->db->assoc($query);
        return $result;
    }
    
    public function getPageDescription($_id) {
        $_description_data = array();
        $query = $this->db->query("SELECT * FROM `zet_pages_static_description` WHERE `page_id`='".(int)$_id."'");
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
    
    public function getPages($lang, $parent = 0){
        $query = $this->db->query("SELECT `id`,`url`,(SELECT `title` FROM `zet_pages_static_description` WHERE `language_id`='".(int)$lang."' AND `page_id`=`zet_pages_static`.`id`) AS `title` FROM `zet_pages_static` WHERE `parent`='".$parent."' ORDER BY `id` ASC");
        return $query;
    }
    public function checkPage($_id){
        $query = $this->db->query("SELECT * FROM `zet_pages_static` WHERE `id`='".(int)$_id."'");
        $result = $this->db->assoc($query);
        return ($result) ? true : false;
    }
    public function redirect(){
        redirectTo(ADM_SRV."pages/other_pages/");
    }

    public function GetPageData($url) {
        global $lang_id;
        $query = $this->db->query("SELECT `title`,IF(`meta_h1`='', `title`, `meta_h1`) AS `meta_h1`,`description` FROM `zet_pages_static`,`zet_pages_static_description` WHERE `zet_pages_static_description`.`page_id`=`zet_pages_static`.`id` AND `zet_pages_static_description`.`language_id`='".$lang_id."' AND `zet_pages_static`.`url`='".$url."'");
        $data = $this->db->assoc($query);
        return $data;
    }
}

class SubPage extends Model {
    public function AddSubPage($data, $files) {
        switch ($data['parent']) {
            case 'company': $parent = 2; break;
            case 'services': $parent = 1; break;
            default: $parent = 0; break;
        }
        
        $this->db->query("INSERT INTO `zet_pages_static`(`status`,`parent`) VALUES ('1','".$parent."')");
        $_id = $this->db->getLastId();
        
        foreach ($data['title'] as $language_id => $value) {
            $this->db->query("INSERT INTO `zet_pages_static_description`(`page_id`,`language_id`,`title`,`description`) VALUES ('".(int)$_id."','".(int)$language_id."','".$this->db->escape($data['title'][$language_id])."','".$this->db->escape($data['description'][$language_id])."')");
        }
        
        if (!empty($files['picture']['name'])) {
            $tmp = explode(".", $files['picture']['name']);
            $_ext = end($tmp);
            $_file = rand().'_'.time().'.'.$_ext;
            $_path = ROOT_FILES."news/{$_file}";
            if (move_uploaded_file($files['picture']['tmp_name'], $_path)) {
                $this->db->query("UPDATE `zet_pages_static` SET `file`='".$_file."' WHERE `id`='".$_id."'");
            } else return false;
        }
    }
    
    public function EditSubPage($_id, $data, $files) {
        $this->db->query("DELETE FROM `zet_pages_static_description` WHERE `page_id`='".$_id."'");
        foreach ($data['title'] as $language_id => $value) {
            $this->db->query("INSERT INTO `zet_pages_static_description`(`page_id`,`language_id`,`title`,`description`) VALUES ('".(int)$_id."','".(int)$language_id."','".$this->db->escape($data['title'][$language_id])."','".$this->db->escape($data['description'][$language_id])."')");
        }
        
        if (!empty($files['picture']['name'])) {
            $tmp = explode(".", $files['picture']['name']);
            $_ext = end($tmp);
            $_file = rand().'_'.time().'.'.$_ext;
            $_path = ROOT_FILES."news/{$_file}";
            if (move_uploaded_file($files['picture']['tmp_name'], $_path)) {
                $this->db->query("UPDATE `zet_pages_static` SET `file`='".$_file."' WHERE `id`='".$_id."'");
            } else return false;
        }
    }
    
    public function DeleteSubPage($_id) {
        $this->db->query("DELETE FROM `zet_pages_static` WHERE `id`='".$_id."'");
        $this->db->query("DELETE FROM `zet_pages_static_description` WHERE `page_id`='".$_id."'");
    }
}