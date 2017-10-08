<?php
class CatalogBrand extends Model {
    
    public function addBrand($data, $files = null) {
        $_data_status = 1; //($data['status'] == "on") ? 1 : 0;
        $this->db->query("INSERT INTO `zet_brand` (`id`, `picture`, `picture_title`, `picture_alt`, `url`, `priority`, `status`) VALUES  ('', '', '', '', '', '', '".$_data_status."')");
        $brand_id = $this->db->getLastId();
        
        $url = (empty($data["url"])) ? translite($this->db->escape($data['title'][1])) : translite($data["url"]);
        $url_query = $this->db->query("SELECT `url` FROM `zet_brand` WHERE `url`='".$url."'");
        $new_url = $this->db->assoc($url_query);
        if($new_url == false) {
            $this->db->query("UPDATE `zet_brand` SET `url`='".$url."' WHERE `id`='".(int)$brand_id."'");
        } else {
            $this->db->query("UPDATE `zet_brand` SET `url`='".$brand_id."_".$url."' WHERE `id`='".(int)$brand_id."'");
        }
        
        if (!empty($files['picture']['name'])) {
            $uploaddir = ROOT_FILES.'catalog/brand/';
            $extension = end(explode(".", $files['picture']['name']));
            $uploadfile = rand().'_'.time().'.'.$extension;
            $file = $uploaddir.$uploadfile;
            if(move_uploaded_file($files['picture']['tmp_name'], $file)){
                crop($file, $file, 200, 130);
                $this->db->query("UPDATE `zet_brand` SET `picture`='".$uploadfile."', `picture_title`='".$this->db->escape($data['picture_title'])."', `picture_alt`='".$this->db->escape($data['picture_alt'])."' WHERE `id`='".(int)$brand_id."'");
            }
        }
        
        foreach ($data['title'] as $language_id => $value) {
            $this->db->query("INSERT INTO `zet_brand_description` (`brand_id`, `language_id`, `title`, `description`, `meta_title`, `meta_h1`, `meta_keywords`, `meta_description`) VALUES ('".(int)$brand_id."', '".(int)$language_id."', '".$this->db->escape($data['title'][$language_id])."', '".$this->db->escape($data['description'][$language_id])."', '".$this->db->escape($data['meta_title'][$language_id])."', '".$this->db->escape($data['meta_h1'][$language_id])."', '".$this->db->escape($data['meta_keywords'][$language_id])."', '".$this->db->escape($data['meta_description'][$language_id])."')");
        }
    }
    
    public function editBrand($brand_id, $data, $files = null) {
        $_data_status = 1; //($data['status'] == "on") ? 1 : 0;
        $this->db->query("UPDATE `zet_brand` SET `status`= '".$_data_status."' WHERE `id`='".(int)$brand_id."'");
        
        $url = (empty($data["url"])) ? translite($this->db->escape($data['title'][1])) : translite($data["url"]);
        $url_query = $this->db->query("SELECT `id`,`url` FROM `zet_brand` WHERE `url`='".$url."'");
        $new_url = $this->db->assoc($url_query);
        if($new_url["id"] != $category_id || $new_url == false){
            $this->db->query("UPDATE `zet_brand` SET `url`='".$url."' WHERE `id`='".(int)$brand_id."'");
        } else {
            $this->db->query("UPDATE `zet_brand` SET `url`='".$brand_id."_".$url."' WHERE `id`='".(int)$brand_id."'");
        }
        
        if (!empty($files['picture']['name'])) {
            $file_query = $this->db->query("SELECT `picture` FROM `zet_brand` WHERE `id`='".(int)$brand_id."'");
            $oldfile = $this->db->assoc($file_query);
            $uploaddir = ROOT_FILES.'catalog/brand/';
            $extension = end(explode(".", $files['picture']['name']));
            $uploadfile = rand().'_'.time().'.'.$extension;
            $file = $uploaddir.$uploadfile;
            if(file_exists($uploaddir.$oldfile["picture"]) && !empty($oldfile["picture"])) unlink($uploaddir.$oldfile["picture"]);
            if(move_uploaded_file($files['picture']['tmp_name'], $file)){
                crop($file, $file, 200, 130);
                $this->db->query("UPDATE `zet_brand` SET `picture`='".$uploadfile."', `picture_title`='".$this->db->escape($data['picture_title'])."', `picture_alt`='".$this->db->escape($data['picture_alt'])."' WHERE `id`='".(int)$brand_id."'");
            }
        }
        
        foreach ($data['title'] as $language_id => $value) {
            $this->db->query("UPDATE `zet_brand_description` SET `title`='".$this->db->escape($data['title'][$language_id])."', `description`='".$this->db->escape($data['description'][$language_id])."', `meta_title`='".$this->db->escape($data['meta_title'][$language_id])."', `meta_h1`='".$this->db->escape($data['meta_h1'][$language_id])."', `meta_keywords`='".$this->db->escape($data['meta_keywords'][$language_id])."', `meta_description`='".$this->db->escape($data['meta_description'][$language_id])."' WHERE `brand_id`='".(int)$brand_id."' AND `language_id`='".(int)$language_id."'");
        }
	}
    
    public function deleteBrand($brand_id) {
        $file_query = $this->db->query("SELECT `picture` FROM `zet_brand` WHERE `id`='".(int)$brand_id."'");
        $oldfile = $this->db->assoc($file_query);
        $uploaddir = ROOT_FILES.'catalog/brand/';
        if(file_exists($uploaddir.$oldfile["picture"]) && !empty($oldfile["picture"])) unlink($uploaddir.$oldfile["picture"]);
        $this->db->query("DELETE FROM `zet_brand` WHERE `id`='".(int)$brand_id."'");
        $this->db->query("DELETE FROM `zet_brand_description` WHERE `brand_id`='".(int)$brand_id."'");
        $this->db->query("DELETE FROM `zet_product_to_brand` WHERE `brand_id`='".(int)$brand_id."'");
    }
    
    public function getBrand($brand_id) {
        $query = $this->db->query("SELECT * FROM `zet_brand` WHERE `id`='".(int)$brand_id."'");
        $result = $this->db->assoc($query);
        return $result;
    }
    
    public function getBrandDescriptions($brand_id) {
        $brand_description_data = array();
        $query = $this->db->query("SELECT * FROM `zet_brand_description` WHERE `brand_id`='".(int)$brand_id."'");
        while ($row = $this->db->assoc($query)) {
            $brand_description_data[$row['language_id']] = array(
                'title'             => $row['title'],
                'description'       => $row['description'],
                'meta_title'        => $row['meta_title'],
                'meta_h1'           => $row['meta_h1'],
                'meta_keywords'     => $row['meta_keywords'],
                'meta_description'  => $row['meta_description']
            );
        }
        return $brand_description_data;
    }
    
    public function getBrands($language_id) {
        $query = $this->db->query("SELECT `id`, `status`, `priority`, `url`, (SELECT `title` FROM `zet_brand_description` WHERE `language_id`='".(int)$language_id."' AND `brand_id`=`zet_brand`.`id`) AS `title`, (SELECT COUNT(*) FROM `zet_product_to_brand` WHERE `brand_id`=`zet_brand`.`id`) AS `products` FROM `zet_brand` ORDER BY `priority` ASC");
        return $query;
    }
    
    public function getTotalBrands() {
        $query = $this->db->query("SELECT COUNT(*) AS `total` FROM `zet_brand`");
        $res = $this->db->assoc($query);
        return $res['total'];
    }

    public function redirect() {
        redirectTo(ADM_SRV."catalog/brands/");
    }
    
    public function checkBrand($brand_id) {
        $query = $this->db->query("SELECT * FROM `zet_brand` WHERE `id`='".(int)$brand_id."'");
        $result = $this->db->assoc($query);
        return ($result) ? true : false;
    }

}