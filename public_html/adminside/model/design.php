<?php
class DesignSlide extends Model {
    public function AddSlide($data, $files) {
        $_data_status = 1;
        $_url = $data["url"];
        $this->db->query("INSERT INTO `zet_slider`(`status`,`url`) VALUES ('".$_data_status."','".$_url."')");
        $_id = $this->db->getLastId();

        foreach ($data['title'] as $language_id => $value) {
            $this->db->query("INSERT INTO `zet_slider_description`(`slide_id`,`language_id`,`title`,`text`,`link_text`) VALUES ('".$_id."','".$language_id."','".$data['title'][$language_id]."','".$data['description'][$language_id]."','".$data['link_text'][$language_id]."')");
        }

        if (!empty($files['picture']['name'])) {
            $this->_uploadImg($files['picture']['name'], $files['picture']['tmp_name'], $_id, 'zet_slider');
        }
    }

    public function EditSlide($_id, $data, $files) {
        $_url = $data["url"];
        $this->db->query("UPDATE `zet_slider` SET `url`= '".$_url."' WHERE `id`='".(int)$_id."'");

        $this->db->query("DELETE FROM `zet_slider_description` WHERE `slide_id`='".$_id."'");
        foreach ($data['title'] as $language_id => $value) {
            $this->db->query("INSERT INTO `zet_slider_description`(`slide_id`,`language_id`,`title`,`text`,`link_text`) VALUES ('".$_id."','".$language_id."','".$data['title'][$language_id]."','".$data['description'][$language_id]."','".$data['link_text'][$language_id]."')");
        }

        if (!empty($files['picture']['name'])) {
            $query = $this->db->query("SELECT `picture` FROM `zet_slider` WHERE `id`='".(int)$_id."'");
            $row = $this->db->assoc($query);
            $file = $row['picture'];
            if (!empty($file)) {
                $path = ROOT_FILES.'design/'.$file;
                unlink($path);
            }
            $this->_uploadImg($files['picture']['name'], $files['picture']['tmp_name'], $_id, 'zet_slider');
        }
    }

    public function DeleteSlide($_id) {
        $query = $this->db->query("SELECT `picture` FROM `zet_slider` WHERE `id`='".(int)$_id."'");
        $row = $this->db->assoc($query);
        $file = $row['picture'];
        if (!empty($file)) {
            $path = ROOT_FILES.'design/'.$file;
            unlink($path);
        }
        $this->db->query("DELETE FROM `zet_slider` WHERE `id`='".(int)$_id."'");
        $this->db->query("DELETE FROM `zet_slider_description` WHERE `slide_id`='".(int)$_id."'");
    }

    public function GetSlide($_id) {
        $query = $this->db->query("SELECT * FROM `zet_slider` WHERE `id`='".(int)$_id."'");
        $result = $this->db->assoc($query);
        return $result;
    }

    public function GetSlideDescriptions($_id) {
        $data = array();
        $query = $this->db->query("SELECT * FROM `zet_slider_description` WHERE `slide_id`='".(int)$_id."'");
        while ($row = $this->db->assoc($query)) {
            $data[$row['language_id']] = $row;
        }
        return $data;
    }

    public function GetSlides($static = 0) {
        global $lang_id;
        $data = array();
        $query = $this->db->query("SELECT `id`,`status`,`priority`,`picture`,`url`,`zet_slider_description`.`title` AS `title`,`text`,`link_text` FROM `zet_slider`,`zet_slider_description` WHERE `zet_slider_description`.`slide_id`=`zet_slider`.`id` AND `zet_slider_description`.`language_id`='".$lang_id."' AND `static`='".$static."' AND `status`='1' ORDER BY `priority` ASC, `id` DESC");
        while ($row = $this->db->assoc($query)) {
            $data[$row['id']] = $row;
        }
        return $data;
    }
    
    private function _uploadImg($name, $tmp_name, $id, $table) {
        $tmp = explode('.', $name);
        $_ext = end($tmp);
        $_file = rand().'_'.time().'.'.$_ext;
        $_path = ROOT_FILES.'design/'.$_file;
        if (move_uploaded_file($tmp_name, $_path)) {
            $this->db->query("UPDATE `".$table."` SET `picture`='".$_file."' WHERE `id`='".$id."'");
            return $_file;
        } else return false;
    }
    
    /* 12.03.2015 */
    public function GetAllSlides($static = 0)
    {
        global $lang_id;
        $data = array();
        
        $query = $this->db->query("SELECT `id`,`status`,`priority`,`picture`,`url`,`zet_slider_description`.`title` AS `title`,`text`,`link_text` FROM `zet_slider`,`zet_slider_description` WHERE `zet_slider_description`.`slide_id`=`zet_slider`.`id` AND `zet_slider_description`.`language_id`='".$lang_id."' AND `static`='".$static."' ORDER BY `priority` ASC, `id` DESC");
        while ($row = $this->db->assoc($query)) {
            $data[$row['id']] = $row;
        }
        return $data;
    }

}