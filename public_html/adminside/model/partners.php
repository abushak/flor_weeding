<?php
class Partners extends Model {
    public function AddPartner($data, $files) {
        $this->db->query("INSERT  `zet_partners` (`link`) VALUES ('".$data["url"]."')");
        $_id = $this->db->getLastId();
        
        foreach ($data["title"] as $language_id => $value) {
            $this->db->query("INSERT INTO `zet_partners_description` (`partner_id`,`language_id`,`title`,`text`) VALUES ('".$_id."','".(int)$language_id."','".$this->db->escape($data["title"][$language_id])."','".$this->db->escape($data["description"][$language_id])."')");
        }
        
        if (!empty($files["picture"]["name"])) {
            $uploaddir = ROOT_FILES."catalog/brand/";
            $extension = end(explode(".", $files["picture"]["name"]));
            $uploadfile = rand()."_".time().".".$extension;
            $file = $uploaddir.$uploadfile;
            if (move_uploaded_file($files["picture"]["tmp_name"], $file)) {
                Pcrop($file, $file);
                $this->db->query("UPDATE `zet_partners` SET `picture`='".$uploadfile."' WHERE `id`='".$_id."'");
            }
        }
    }
    
    public function EditPartner($_id, $data, $files) {
        $this->db->query("UPDATE `zet_partners` SET `link`='".$data["url"]."' WHERE `id`='".$_id."'");
        
        $this->db->query("DELETE FROM `zet_partners_description` WHERE `partner_id`='".$_id."'");
        foreach ($data["title"] as $language_id => $value) {
            $this->db->query("INSERT INTO `zet_partners_description`(`partner_id`,`language_id`,`title`,`text`) VALUES ('".$_id."','".(int)$language_id."','".$this->db->escape($data['title'][$language_id])."','".$this->db->escape($data['description'][$language_id])."')");
        }
        
        if (!empty($files["picture"]["name"])) {
            $uploaddir = ROOT_FILES."catalog/brand/";
            $extension = end(explode(".", $files["picture"]["name"]));
            $uploadfile = rand()."_".time().".".$extension;
            $file = $uploaddir.$uploadfile;
            if (move_uploaded_file($files["picture"]["tmp_name"], $file)) {
                Pcrop($file, $file);
                $this->db->query("UPDATE `zet_partners` SET `picture`='".$uploadfile."' WHERE `id`='".$_id."'");
            }
        }
    }
    
    public function DeletePartner($_id){
        $query = $this->db->query("SELECT `picture` FROM `zet_partners` WHERE `id`='".$_id."'");
        while($row = $this->db->assoc($query)){
            if(!empty($row['picture']) && file_exists(ROOT_FILES.'products/'.$row['picture'])){
                unlink(ROOT_FILES.'products/'.$row['picture']);
            }
        }
        
        $this->db->query("DELETE FROM `zet_partners` WHERE `id`='".$_id."'");
        $this->db->query("DELETE FROM `zet_partners_description` WHERE `partner_id`='".$_id."'");
    }
    
    public function GetPartner($_id){
        $data = array();
        $query = $this->db->query("SELECT `picture`,`link` FROM `zet_partners` WHERE `id`='".$_id."'");
        $data = $this->db->assoc($query);
        return $data;
    }
    
    public function GetPartnerDescription($_id){
        $data = array();
        $query = $this->db->query("SELECT * FROM `zet_partners_description` WHERE `partner_id`='".(int)$_id."'");
        while($row = $this->db->assoc($query)){
            $data[$row['language_id']] = $row;
        }
        return $data;
    }
    
    public function GetPartners(){
        global $lang_id; $data = array();
        $query = $this->db->query("SELECT `id`,`title` FROM `zet_partners`,`zet_partners_description` WHERE `zet_partners`.`id`=`zet_partners_description`.`partner_id` AND  `language_id`='".$lang_id."' ORDER BY `id` DESC");
        while($row = $this->db->assoc($query)){
            $data[$row['id']] = $row;
        }
        return $data;
    }
    
    public function GetPartnersDescription() {
        global $lang_id;
        $data = array();
        $query = $this->db->query("SELECT `picture`,`link`,`title`,`text` FROM `zet_partners`,`zet_partners_description` WHERE `zet_partners`.`id`=`zet_partners_description`.`partner_id` AND  `language_id`='".$lang_id."' ORDER BY `id` DESC");
        while ($row = $this->db->assoc($query)) {
            $data[] = $row;
        }
        return $data;
    }

}