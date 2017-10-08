<?php
class PublicationsNews extends Model {
    public function addNewsItem($data, $files = null, $isPromo = 0) {
        $_date = date("Y-m-d H:i:s");
        $_data_status = ($data['status'] == "on") ? 1 : 0;
        $this->db->query("INSERT INTO `zet_news` (`id`, `isPromo`, `picture`, `picture_title`, `picture_alt`, `date`, `url`, `status`) VALUES ('', '".$isPromo."', '', '', '', '".$_date."', '', '".$_data_status."')");
        $news_id = $this->db->getLastId();
        
        $url = (empty($data["url"])) ? translite($this->db->escape($data['title'][1])) : translite($data["url"]);
        $url_query = $this->db->query("SELECT `url` FROM `zet_news` WHERE `url`='".$url."'");
        $new_url = $this->db->assoc($url_query);
        if($new_url == false) {
            $this->db->query("UPDATE `zet_news` SET `url`='".$url."' WHERE `id`='".(int)$news_id."'");
        } else {
            $this->db->query("UPDATE `zet_news` SET `url`='".$news_id."_".$url."' WHERE `id`='".(int)$news_id."'");
        }
        
        //Return !!!
        if (!empty($files['picture']['name'])) {
            $uploaddir = ROOT_FILES.'news/';
            $extension = end(explode(".", $files['picture']['name']));
            $uploadfile = rand().'_'.time().'.'.$extension;
            $file = $uploaddir.$uploadfile;
            if(move_uploaded_file($files['picture']['tmp_name'], $file)){
                crop($file, $file, 1010, 485);
                $this->db->query("UPDATE `zet_news` SET `picture`='".$uploadfile."', `picture_title`='".$this->db->escape($data['picture_title'])."', `picture_alt`='".$this->db->escape($data['picture_alt'])."' WHERE `id`='".(int)$news_id."'");
            }
        }
        
        foreach ($data['title'] as $language_id => $value) {
            $this->db->query("INSERT INTO `zet_news_description` (`news_id`, `language_id`, `title`, `description`, `meta_title`, `meta_h1`, `meta_keywords`, `meta_description`) VALUES ('".(int)$news_id."', '".(int)$language_id."', '".$this->db->escape($data['title'][$language_id])."', '".$this->db->escape($data['description'][$language_id])."', '".$this->db->escape($data['meta_title'][$language_id])."', '".$this->db->escape($data['meta_h1'][$language_id])."', '".$this->db->escape($data['meta_keywords'][$language_id])."', '".$this->db->escape($data['meta_description'][$language_id])."')");
        }
        
        //To Product
        //To User Group
    }
    
    public function editNewsItem($news_id, $data, $files = null) {
        //$_date = date("Y-m-d H:i:s");
        $_data_status = ($data['status'] == "on") ? 1 : 0;
        $this->db->query("UPDATE `zet_news` SET `isPromo`='".$isPromo."', `status`='".$_data_status."' WHERE `id`='".(int)$news_id."'");
        
        $url = (empty($data["url"])) ? translite($this->db->escape($data['title'][1])) : translite($data["url"]);
        $url_query = $this->db->query("SELECT `id`,`url` FROM `zet_news` WHERE `url`='".$url."'");
        $new_url = $this->db->assoc($url_query);
        if($new_url["id"] == $news_id || $new_url == false) {
            $this->db->query("UPDATE `zet_news` SET `url`='".$url."' WHERE `id`='".(int)$news_id."'");
        } else {
            $this->db->query("UPDATE `zet_news` SET `url`='".$news_id."_".$url."' WHERE `id`='".(int)$news_id."'");
        }
        
        //Return !!!
        if (!empty($files['picture']['name'])) {
            $file_query = $this->db->query("SELECT `picture` FROM `zet_news` WHERE `id`='".(int)$news_id."'");
            $oldfile = $this->db->assoc($file_query);
            $uploaddir = ROOT_FILES.'news/';
            $extension = end(explode(".", $files['picture']['name']));
            $uploadfile = rand().'_'.time().'.'.$extension;
            $file = $uploaddir.$uploadfile;
            if(file_exists($uploaddir.$oldfile["picture"]) && !empty($oldfile["picture"])) unlink($uploaddir.$oldfile["picture"]);
            if(move_uploaded_file($files['picture']['tmp_name'], $file)){
                crop($file, $file, 1010, 485);
                $this->db->query("UPDATE `zet_news` SET `picture`='".$uploadfile."', `picture_title`='".$this->db->escape($data['picture_title'])."', `picture_alt`='".$this->db->escape($data['picture_alt'])."' WHERE `id`='".(int)$news_id."'");
            }
        }
        
        foreach ($data['title'] as $language_id => $value) {
            $this->db->query("UPDATE `zet_news_description` SET `news_id`='".(int)$news_id."', `language_id`='".(int)$language_id."', `title`='".$this->db->escape($data['title'][$language_id])."', `description`='".$this->db->escape($data['description'][$language_id])."', `meta_title`='".$this->db->escape($data['meta_title'][$language_id])."', `meta_h1`='".$this->db->escape($data['meta_h1'][$language_id])."', `meta_keywords`='".$this->db->escape($data['meta_keywords'][$language_id])."', `meta_description`='".$this->db->escape($data['meta_description'][$language_id])."' WHERE `news_id`='".(int)$news_id."' AND `language_id`='".(int)$language_id."'");
        }
    }
    
    public function deleteNewsItem($news_id) {
        $file_query = $this->db->query("SELECT `picture` FROM `zet_news` WHERE `id`='".(int)$news_id."'");
        $oldfile = $this->db->assoc($file_query);
        $uploaddir = ROOT_FILES.'news/';
        if(file_exists($uploaddir.$oldfile["picture"]) && !empty($oldfile["picture"])) unlink($uploaddir.$oldfile["picture"]);
        $this->db->query("DELETE FROM `zet_news` WHERE `id`='".(int)$news_id."'");
        $this->db->query("DELETE FROM `zet_news_description` WHERE `news_id`='".(int)$news_id."'");
        $this->db->query("DELETE FROM `zet_product_to_news` WHERE `news_id`='".(int)$news_id."'");
        $this->db->query("DELETE FROM `zet_news_to_ugroup` WHERE `news_id`='".(int)$news_id."'");
    }
    
    public function getNewsItem($news_id) {
        $query = $this->db->query("SELECT * FROM `zet_news` WHERE `id`='".(int)$news_id."'");
        $result = $this->db->assoc($query);
        return $result;
    }
    
    public function getNewsDescriptions($news_id) {
        $news_description_data = array();
        $query = $this->db->query("SELECT * FROM `zet_news_description` WHERE `news_id`='".(int)$news_id."'");
        while ($row = $this->db->assoc($query)) {
            $news_description_data[$row['language_id']] = array(
                'title'             => $row['title'],
                'description'       => $row['description'],
                'meta_title'        => $row['meta_title'],
                'meta_h1'           => $row['meta_h1'],
                'meta_keywords'     => $row['meta_keywords'],
                'meta_description'  => $row['meta_description']
            );
        }
        return $news_description_data;
    }
    
    public function getNews($language_id, $isPromo = 0, $sort_type = null) {
        if(!empty($sort_type)){
            $sort = explode('_', $sort_type);
            $sort[1] = ($sort[1] == "old") ? "ASC" : "DESC";
            $query = $this->db->query("SELECT `id`, `status`, `picture`, `url`, `date`, (SELECT `title` FROM `zet_news_description` WHERE `language_id`='".(int)$language_id."' AND `news_id`=`zet_news`.`id`) AS `title` FROM `zet_news` WHERE `isPromo`='".$isPromo."' ORDER BY `".$sort[0]."` ".$sort[1]);
        } else $query = $this->db->query("SELECT `id`, `status`, `picture`, `url`, `date`, (SELECT `title` FROM `zet_news_description` WHERE `language_id`='".(int)$language_id."' AND `news_id`=`zet_news`.`id`) AS `title` FROM `zet_news` WHERE `isPromo`='".$isPromo."' ORDER BY `date` DESC");
        return $query;
    }
    
    public function redirect($isPromo = false) {
        $link = ($isPromo) ? "promo/" : "news/";
        redirectTo(ADM_SRV."publications/".$link);
    }
    
    public function checkNewsItem($news_id) {
        $query = $this->db->query("SELECT * FROM `zet_news` WHERE `id`='".(int)$news_id."'");
        $result = $this->db->assoc($query);
        return ($result) ? true : false;
    }
    
    /** ------------------------------------------------ **/
    public function GetNewsList($filters = null) {
        global $lang_id;
        
        $query = $this->db->query("SELECT `id`,`picture`,`date`,`url`,`title`,`description` FROM `zet_news`,`zet_news_description` WHERE `zet_news_description`.`news_id`=`zet_news`.`id` AND `zet_news_description`.`language_id`='".$lang_id."' AND `zet_news`.`status`='1' ORDER BY `date` DESC");
        while ($row = $this->db->assoc($query)) {
            $row['url'] = SRV_.'news/'.$row['url'];
            $row['picture'] = FILES.'news/'.$row['picture'];
            $row['height'] = '125';
            $row['description'] = substr_function(strip_tags($row['description']), 125);
            $data[] = $row;
        }
        return $data;
    }
    
    public function GetDescription($url) {
        global $lang_id;
        
        $query = $this->db->query("SELECT `id`,`picture`,`date`,`title`,`description` FROM `zet_news`,`zet_news_description` WHERE `zet_news_description`.`news_id`=`zet_news`.`id` AND `zet_news_description`.`language_id`='".$lang_id."' AND `zet_news`.`url`='".$url."'");
        while ($row = $this->db->assoc($query)) {
            $row["picture"] = FILES."news/{$row["picture"]}";
            $data = $row;
        }
        return $data;
    }
}