<?php
class CatalogProperty extends Model{
    public function addProp($data){
        $_on_page = ($data['on_page'] == "on") ? 1 : 0;
        $_as_filter = ($data['as_filter'] == "on") ? 1 : 0;
        $this->db->query("INSERT INTO `zet_product_properties` (`id`, `status`, `glob_type`, `type`, `on_page`, `as_filter`) VALUES ('','1','".$data['glob_type']."','".$data['type']."','".$_on_page."','".$_as_filter."')");
        $_id = $this->db->getLastId();
        
        foreach ($data['name'] as $language_id => $value) {
            $this->db->query("INSERT INTO `zet_product_properties_description` (`property_id`, `language_id`, `name`) VALUES ('".$_id."','".$language_id."','".$data['name'][$language_id]."')");
        }
        
        if($_as_filter == 1 && count($data['category_id']) > 0){
            foreach($data['category_id'] as $key => $category){
                $this->db->query("INSERT INTO `zet_category_filter`(`category_id`,`filter_id`) VALUES ('".$category."','".$_id."')");
            }
        }
        
        $_i = 0;
        if($data['type'] == '1'){
            foreach ($data['value_name'] as $language_id => $value) {
                foreach($data['value_name'][$language_id] as $key => $val){
                    $this->db->query("INSERT INTO `zet_product_properties_values`(`property_id`,`language_id`,`name`) VALUES ('".$_id."','".$language_id."','".$this->db->escape($data['value_name'][$language_id][$key])."')");
                }
            }
        } else if($data['type'] == '3'){
            foreach ($data['val_1'] as $key => $value) {
                $this->db->query("INSERT INTO `zet_product_properties_values` (`property_id`, `val_1`) VALUES ('".$_id."','".$this->db->escape($value)."')");
            }
        } else if($data['type'] == '4' || $data['type'] == '5'){
            foreach ($data['val_1'] as $key => $value) {
                $this->db->query("INSERT INTO `zet_product_properties_values` (`property_id`, `val_1`, `val_2`) VALUES ('".$_id."','".$this->db->escape($data['val_1'][$key])."','".$this->db->escape($data['val_2'][$key])."')");
            }
        } else if($data['type'] == '6'){
            foreach ($data['val_1'] as $key => $value) {
                $this->db->query("INSERT INTO `zet_product_properties_values` (`property_id`, `val_1`, `val_2`, `val_3`) VALUES ('".$_id."','".$this->db->escape($data['val_1'][$key])."','".$this->db->escape($data['val_2'][$key])."','".$this->db->escape($data['val_3'][$key])."')");
            }
        }
    }
    
    public function editProp($_id, $data){
        $_on_page = ($data['on_page'] == "on") ? 1 : 0;
        $_as_filter = ($data['as_filter'] == "on") ? 1 : 0;
        $this->db->query("UPDATE `zet_product_properties` SET `on_page`='".$_on_page."', `as_filter`='".$_as_filter."' WHERE `id`='".$_id."'");
        
        $this->db->query("DELETE FROM `zet_product_properties_description` WHERE `property_id`='".$_id."'");
        foreach ($data['name'] as $language_id => $value) {
            $this->db->query("INSERT INTO `zet_product_properties_description` (`property_id`, `language_id`, `name`) VALUES ('".$_id."','".$language_id."','".$data['name'][$language_id]."')");
        }
        
        $this->db->query("DELETE FROM `zet_category_filter` WHERE `filter_id`='".$_id."'");
        if($_as_filter == 1 && count($data['category_id']) > 0){
            foreach($data['category_id'] as $key => $category){
                $this->db->query("INSERT INTO `zet_category_filter`(`category_id`,`filter_id`) VALUES ('".$category."','".$_id."')");
            }
        }
        
        $_i = 0;
        $this->db->query("DELETE FROM `zet_product_properties_values` WHERE `property_id`='".$_id."'");
        if($data['type'] == '1'){
            foreach ($data['value_name'] as $language_id => $value) {
                foreach($data['value_name'][$language_id] as $key => $val){
                    $this->db->query("INSERT INTO `zet_product_properties_values`(`property_id`,`language_id`,`name`) VALUES ('".$_id."','".$language_id."','".$this->db->escape($data['value_name'][$language_id][$key])."')");
                }
            }
        } else if($data['type'] == '3'){
            foreach ($data['val_1'] as $key => $value) {
                $this->db->query("INSERT INTO `zet_product_properties_values` (`property_id`, `val_1`) VALUES ('".$_id."','".$this->db->escape($value)."')");
            }
        } else if($data['type'] == '4' || $data['type'] == '5'){
            foreach ($data['val_1'] as $key => $value) {
                $this->db->query("INSERT INTO `zet_product_properties_values` (`property_id`, `val_1`, `val_2`) VALUES ('".$_id."','".$this->db->escape($data['val_1'][$key])."','".$this->db->escape($data['val_2'][$key])."')");
            }
        } else if($data['type'] == '6'){
            foreach ($data['val_1'] as $key => $value) {
                $this->db->query("INSERT INTO `zet_product_properties_values` (`property_id`, `val_1`, `val_2`, `val_3`) VALUES ('".$_id."','".$this->db->escape($data['val_1'][$key])."','".$this->db->escape($data['val_2'][$key])."','".$this->db->escape($data['val_3'][$key])."')");
            }
        }
    }
    
    public function delProp($_id){
        $this->db->query("DELETE FROM `zet_product_properties_values` WHERE `property_id`='".$_id."'");
        $this->db->query("DELETE FROM `zet_product_properties_description` WHERE `property_id`='".$_id."'");
        $this->db->query("DELETE FROM `zet_product_properties` WHERE `id`='".$_id."'");
    }
    public function getProp($_id){
        $query = $this->db->query("SELECT * FROM `zet_product_properties` WHERE `id`='".(int)$_id."'");
        $result = $this->db->assoc($query);
        return $result;
    }
    public function getPropDesc($_id){
        $description = array();
        $query = $this->db->query("SELECT * FROM `zet_product_properties_description` WHERE `property_id`='".(int)$_id."'");
        while ($row = $this->db->assoc($query)) {
            $description[$row['language_id']] = array('name' => $row['name']);
        }
        return $description;
    }
    public function getPropVal($_id){
        $_i = 0;
        $description = array();
        $query = $this->db->query("SELECT `id`,`val_1`,`val_2`,`val_3` FROM `zet_product_properties_values` WHERE `property_id`='".(int)$_id."'");
        while ($row = $this->db->assoc($query)) {
            $description[$_i] = array(
                'id' => $row['id'],
                'val_1' => $row['val_1'],
                'val_2' => $row['val_2'],
                'val_3' => $row['val_3']
            );
            $_i++;
        }
        return $description;
    }
    public function getPropValDesc($_id){
        $description = array();
        $query = $this->db->query("SELECT * FROM `zet_product_properties_values` WHERE `property_id`='".(int)$_id."'");
        while ($row = $this->db->assoc($query)) {
            $description[$row['language_id']]['name'][] = $row['name'];
        }
        return $description;
    }
    public function countProp($_id, $type){
        if($type == '1' || $type == '2' || $type == '7' || $type == '8'){
            $query = $this->db->query("SELECT COUNT(*) AS `total` FROM `zet_product_properties_values` WHERE `property_id`='".(int)$_id."' AND `language_id`='1'");
        } else if($type == '3' || $type == '4' || $type == '5' || $type == '6'){
            $query = $this->db->query("SELECT COUNT(*) AS `total` FROM `zet_product_properties_values` WHERE `property_id`='".(int)$_id."'");
        }
        $res = $this->db->assoc($query);
        return $res['total'];
    }
    
    public function getProps($language_id){
        $query = $this->db->query("SELECT `id`,`status`,`priority`,(SELECT `name` FROM `zet_product_properties_description` WHERE `language_id`='".(int)$language_id."' AND `property_id`=`zet_product_properties`.`id`) AS `title` FROM `zet_product_properties` ORDER BY `id`<>'8', `priority` ASC");
        return $query;
    }
    
    public function checkProp($_id){
        $query = $this->db->query("SELECT * FROM `zet_product_properties` WHERE `id`='".(int)$_id."'");
        $result = $this->db->assoc($query);
        return ($result) ? true : false;
    }
    public function redirect(){
        redirectTo(ADM_SRV."catalog/properties/");
    }
    
    
    
    /** UPDATE **/
    public function GetFiltersToCategory($_id){
        $data = array();
        $query = $this->db->query("SELECT `category_id`,`filter_id` FROM `zet_category_filter` WHERE `filter_id`='".$_id."'");
        while($row = $this->db->assoc($query)){
            $data[$row['category_id']] = $row;
        }
        return $data;
    }
    
    public function updateColor($_id, $data){
        $_on_page = ($data['on_page'] == "on") ? 1 : 0;
        $_as_filter = ($data['as_filter'] == "on") ? 1 : 0;
        $this->db->query("UPDATE `zet_product_properties` SET `on_page`='".$_on_page."', `as_filter`='".$_as_filter."' WHERE `id`='".$_id."'");
        
        $query = $this->db->query("SELECT `id` FROM `zet_property_color`");
        while($row = $this->db->assoc($query)){
            if(array_key_exists($row['id'], $data['value']) == false){
                $this->db->query("DELETE FROM `zet_property_color` WHERE `id`='".$row['id']."'");
                $this->db->query("DELETE FROM `zet_property_color_description` WHERE `color_id`='".$row['id']."'");
            }
        }
        
        foreach($data['value'] as $key => $value) {
            $query = $this->db->query("SELECT `id` FROM `zet_property_color` WHERE `id`='".$key."'");
            $row = $this->db->assoc($query);
            if($row){
                $this->db->query("UPDATE `zet_property_color` SET `value`='".$data['value'][$key]."'WHERE `id`='".$key."'");
                $color_id = $key;
            } else {
                $this->db->query("INSERT INTO `zet_property_color`(`id`,`property_id`,`value`) VALUES ('','".$_id."','".$data['value'][$key]."')");
                $color_id = $this->db->getLastId();
            }
            
            $this->db->query("DELETE FROM `zet_property_color_description` WHERE `color_id`='".$key."'");
            foreach($data["value_name"] as $language_id => $value){
                $this->db->query("INSERT INTO `zet_property_color_description` (`color_id`,`language_id`,`title`) VALUES ('".$color_id."','".$language_id."','".$data["value_name"][$language_id][$key]."')");
            }
        }
        
        $this->db->query("DELETE FROM `zet_category_filter` WHERE `filter_id`='".$_id."'");
        if($_as_filter == 1 && count($data['category_id']) > 0){
            foreach($data['category_id'] as $key => $category){
                $this->db->query("INSERT INTO `zet_category_filter`(`category_id`,`filter_id`) VALUES ('".$category."','".$_id."')");
            }
        }
    }
    
    public function GetColorProperty($_id){
        $query = $this->db->query("SELECT `id`,`status`,`priority`,`glob_type`,`type`,`on_page`,`as_filter` FROM `zet_product_properties` WHERE `id`='".$_id."'");
        $row = $this->db->assoc($query);
        return $row;
    }
    
    public function GetColorPropertyDescription($_id){
        $data = array();
        $query = $this->db->query("SELECT `property_id`,`language_id`,`name` FROM `zet_product_properties_description` WHERE `property_id`='".$_id."'");
        while ($row = $this->db->assoc($query)) {
            $data[$row['language_id']] = $row;
        }
        return $data;
    }
    
    public function GetColors($_id){
        $data = array();
        $query = $this->db->query("SELECT `id`,`property_id`,`value` FROM `zet_property_color` WHERE `property_id`='".$_id."'");
        while ($row = $this->db->assoc($query)) {
            $data[$row['id']] = $row;
        }
        return $data;
    }
    
    public function GetColorDescription($_id){
        $data = array();
        $query = $this->db->query("SELECT `color_id`,`language_id`,`title` FROM `zet_property_color_description` WHERE `color_id`='".$_id."'");
        while ($row = $this->db->assoc($query)) {
            $data[$row['language_id']] = $row;
        }
        return $data;
    }
    
    
    
    
    
    
    
    
    
    
    
}