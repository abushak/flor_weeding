<?php
class CatalogCategory extends Model {
    public function addCategory($data, $files = null) {
        $_data_status = ($data['status'] == "on") ? 1 : 0;
        $this->db->query("INSERT INTO `zet_category` (`id`, `picture`, `picture_title`, `picture_alt`, `url`, `parent_category`, `priority`, `status`) VALUES  ('', '', '', '', '', '".(int)$data['parent_category']."', '', '".$_data_status."')");
        $category_id = $this->db->getLastId();
        
        $this->_linkTransliteration($category_id, $data['url'], $data['title'][1], 'zet_category');
        
        if (!empty($files['picture']['name'])) {
            $uploaddir = ROOT_FILES.'catalog/category/';
            $extension = end(explode(".", $files['picture']['name']));
            $uploadfile = rand().'_'.time().'.'.$extension;
            $file = $uploaddir.$uploadfile;
            if(move_uploaded_file($files['picture']['tmp_name'], $file)){
                crop($file, $file, 200, 130);
                $this->db->query("UPDATE `zet_category` SET `picture`='".$uploadfile."', `picture_title`='".$this->db->escape($data['picture_title'])."', `picture_alt`='".$this->db->escape($data['picture_alt'])."' WHERE `id`='".(int)$category_id."'");
            }
        }
        
        foreach ($data['title'] as $language_id => $value) {
            $this->db->query("INSERT INTO `zet_category_description` (`category_id`, `language_id`, `title`, `description`, `meta_title`, `meta_h1`, `meta_keywords`, `meta_description`) VALUES ('".(int)$category_id."', '".(int)$language_id."', '".$this->db->escape($data['title'][$language_id])."', '".$this->db->escape($data['description'][$language_id])."', '".$this->db->escape($data['meta_title'][$language_id])."', '".$this->db->escape($data['meta_h1'][$language_id])."', '".$this->db->escape($data['meta_keywords'][$language_id])."', '".$this->db->escape($data['meta_description'][$language_id])."')");
        }
        
        $this->db->query("INSERT INTO `zet_category_path` (`category_id`, `parent_category`) VALUES ('".(int)$category_id."', '".(int)$data['parent_category']."')");
    }
    
    public function editCategory($category_id, $data, $files = null) {
        $_data_status = ($data['status'] == "on") ? 1 : 0;
        $this->db->query("UPDATE `zet_category` SET `parent_category`='".(int)$data['parent_category']."', `status`= '".$_data_status."' WHERE `id`='".(int)$category_id."'");
        
        $this->_linkTransliteration($category_id, $data['url'], $data['title'][1], 'zet_category');
        
        if (!empty($files['picture']['name'])) {
            $file_query = $this->db->query("SELECT `picture` FROM `zet_category` WHERE `id`='".(int)$category_id."'");
            $oldfile = $this->db->assoc($file_query);
            $uploaddir = ROOT_FILES.'catalog/category/';
            $extension = end(explode(".", $files['picture']['name']));
            $uploadfile = rand().'_'.time().'.'.$extension;
            $file = $uploaddir.$uploadfile;
            if(file_exists($uploaddir.$oldfile["picture"]) && !empty($oldfile["picture"])) unlink($uploaddir.$oldfile["picture"]);
            if(move_uploaded_file($files['picture']['tmp_name'], $file)){
                crop($file, $file, 200, 130);
                $this->db->query("UPDATE `zet_category` SET `picture`='".$uploadfile."', `picture_title`='".$this->db->escape($data['picture_title'])."', `picture_alt`='".$this->db->escape($data['picture_alt'])."' WHERE `id`='".(int)$category_id."'");
            }
        }
        
        foreach ($data['title'] as $language_id => $value) {
            $this->db->query("UPDATE `zet_category_description` SET `title`='".$this->db->escape($data['title'][$language_id])."', `description`='".$this->db->escape($data['description'][$language_id])."', `meta_title`='".$this->db->escape($data['meta_title'][$language_id])."', `meta_h1`='".$this->db->escape($data['meta_h1'][$language_id])."', `meta_keywords`='".$this->db->escape($data['meta_keywords'][$language_id])."', `meta_description`='".$this->db->escape($data['meta_description'][$language_id])."' WHERE `category_id`='".(int)$category_id."' AND `language_id`='".(int)$language_id."'");
        }
        
        $this->db->query("UPDATE `zet_category_path` SET `parent_category`='".(int)$data['parent_category']."' WHERE `category_id`='".(int)$category_id."'");
	}
    
    public function deleteCategory($category_id) {
        $this->deleteChild($category_id);
        $file_query = $this->db->query("SELECT `picture` FROM `zet_category` WHERE `id`='".(int)$category_id."'");
        $oldfile = $this->db->assoc($file_query);
        $uploaddir = ROOT_FILES.'catalog/category/';
        if(file_exists($uploaddir.$oldfile["picture"]) && !empty($oldfile["picture"])) unlink($uploaddir.$oldfile["picture"]);
        $this->db->query("DELETE FROM `zet_category_path` WHERE `category_id`='".(int)$category_id."'");
        $this->db->query("DELETE FROM `zet_category` WHERE `id`='".(int)$category_id."'");
        $this->db->query("DELETE FROM `zet_category_description` WHERE `category_id`='".(int)$category_id."'");
        $this->db->query("DELETE FROM `zet_category_filter` WHERE `category_id`='".(int)$category_id."'");
        $this->db->query("DELETE FROM `zet_product_to_category` WHERE `category_id`='".(int)$category_id."'");
    }
    
    public function deleteChild($category_id) {
        $find_child = $this->db->query("SELECT `id` FROM `zet_category` WHERE `parent_category`='".(int)$category_id."'");
        while($row = $this->db->assoc($find_child)){
            $this->deleteChild($row["id"]);
            $file_query = $this->db->query("SELECT `picture` FROM `zet_category` WHERE `id`='".$row["id"]."'");
            $oldfile = $this->db->assoc($file_query);
            $uploaddir = ROOT_FILES.'catalog/category/';
            if(file_exists($uploaddir.$oldfile["picture"]) && !empty($oldfile["picture"])) unlink($uploaddir.$oldfile["picture"]);
            $this->db->query("DELETE FROM `zet_category_path` WHERE `category_id`='".$row["id"]."'");
            $this->db->query("DELETE FROM `zet_category` WHERE `id`='".$row["id"]."'");
            $this->db->query("DELETE FROM `zet_category_description` WHERE `category_id`='".$row["id"]."'");
            $this->db->query("DELETE FROM `zet_category_filter` WHERE `category_id`='".$row["id"]."'");
            $this->db->query("DELETE FROM `zet_product_to_category` WHERE `category_id`='".$row["id"]."'");
        }
    }
    
    public function getCategory($category_id) {
        $query = $this->db->query("SELECT * FROM `zet_category` WHERE `id`='".(int)$category_id."'");
        $result = $this->db->assoc($query);
        return $result;
    }
    
    public function getCategoryDescriptions($category_id) {
        $category_description_data = array();
        $query = $this->db->query("SELECT * FROM `zet_category_description` WHERE `category_id`='".(int)$category_id."'");
        while ($row = $this->db->assoc($query)) {
            $category_description_data[$row['language_id']] = array(
                'title'             => $row['title'],
                'description'       => $row['description'],
                'meta_title'        => $row['meta_title'],
                'meta_h1'           => $row['meta_h1'],
                'meta_keywords'     => $row['meta_keywords'],
                'meta_description'  => $row['meta_description']
            );
        }
        return $category_description_data;
    }
    
    public function getCategories($language_id, $parent_category = 0) {
        $query = $this->db->query("SELECT `id`,`status`,`priority`,`url`,(SELECT `title` FROM `zet_category_description` WHERE `language_id`='".(int)$language_id."' AND `category_id`=`zet_category`.`id`) AS `title`, (SELECT COUNT(*) FROM `zet_product_to_category` WHERE `category_id`=`zet_category`.`id`) AS `products` FROM `zet_category` WHERE `parent_category`='".(int)$parent_category."' ORDER BY `priority` ASC");
        return $query;
    }
    
    public function getFilters($language_id, $parent_category = 0) {
        $query = $this->db->query("SELECT `category_id`,`filter_category_id`,`title` FROM `zet_category_description` WHERE `language_id` = '1'");
        return $query;
    }
    
    public function getTotalCategories() {
        $query = $this->db->query("SELECT COUNT(*) AS `total` FROM `zet_category`");
        $res = $this->db->assoc($query);
        return $res['total'];
    }
    
    public function getTotalFilters() {
        $query = $this->db->query("SELECT COUNT(*) AS `total` FROM `zet_category_filters`");
        $res = $this->db->assoc($query);
        return $res['total'];
    }
    
    public function redirect() {
        redirectTo(ADM_SRV."catalog/categories/");
    }
    
    public function checkCategory($category_id) {
        $query = $this->db->query("SELECT `id` FROM `zet_category` WHERE `id`='".(int)$category_id."'");
        $result = $this->db->assoc($query);
        return ($result) ? true : false;
    }
    
    public function checkCategoryByUrl($url) {
        preg_match('/(.*)&(.*)/', $url, $oa, PREG_OFFSET_CAPTURE); 
        if(count($oa)>0){
            $urls = split('&', $url);
            foreach ($urls as $key => $val) { 
                if($key==0){
                   $select = "'".$val."'";
                }else{
                    $select = $select.", '".$val."'";
                }
            }
            $query = $this->db->query("SELECT `id` FROM `zet_category` WHERE `url` in (".$select.")");
            $results = $this->db->assoc($query);
            return ($results) ? true : false;
        }else{
        $query = $this->db->query("SELECT `id` FROM `zet_category` WHERE `url`='".$url."'");
        $result = $this->db->assoc($query);
        return ($result) ? true : false;
        }
    }
    
    /** UPDATE **/
    
    public function GetCategoriesList($parent_category = 0){
        global $lang_id; $i = 0; $data = array();
        $query = $this->db->query("SELECT `id`,`title` FROM `zet_category`,`zet_category_description` WHERE `zet_category_description`.`category_id`=`zet_category`.`id` AND `zet_category_description`.`language_id`='".$lang_id."' AND `zet_category`.`parent_category`='".$parent_category."' AND `zet_category`.`status`='1' ORDER BY `priority` ASC");
        while($row = $this->db->assoc($query)){
            $data[$i] = $row; $i++;
        }
        return $data;
    }
    
    
    
    /** STORE **/
    public function _getCategoryIdByUrl($_url){
        $query = $this->db->query("SELECT `id` FROM `zet_category` WHERE `url`='".$_url."'");
        $row = $this->db->assoc($query);
        return $row['id'];
    }
    
    public function _countChildCategories($_id){
        $query = $this->db->query("SELECT COUNT(*) AS `total` FROM `zet_category` WHERE `parent_category`='".$_id."'");
        $row = $this->db->assoc($query);
        return $row['total'];
    }
    
    public function _getChildCategories($_id){
        global $lang_id; $i = 0;
        $query = $this->db->query("SELECT `parent_category` FROM `zet_category` WHERE `id`='".$_id."'");
        $row = $this->db->assoc($query);
        $_category = $row['parent_category'];
        
        if($_category == 0){
            $query = $this->db->query("SELECT `url`,`title` FROM `zet_category`,`zet_category_description` WHERE `zet_category_description`.`category_id`=`zet_category`.`id` AND `zet_category_description`.`language_id`='".$lang_id."' AND `zet_category`.`parent_category`='".$_id."' ORDER BY `zet_category`.`priority` ASC");
            while($row = $this->db->assoc($query)){
                $data[$i] = array('url' => $row['url'],'title' => $row['title']);
                $i++;
            }
        } else {
            $query = $this->db->query("SELECT `url`,`title` FROM `zet_category`,`zet_category_description` WHERE `zet_category_description`.`category_id`=`zet_category`.`id` AND `zet_category_description`.`language_id`='".$lang_id."' AND `zet_category`.`parent_category`='".$_category."' ORDER BY `zet_category`.`priority` ASC");
            while($row = $this->db->assoc($query)){
                $data[$i] = array('url' => $row['url'],'title' => $row['title']);
                $i++;
            }
        }
        return $data;
    }
    
    public function _getCatalogFilters(){
        global $lang_id; $i = 0; $data = array();
        $query = $this->db->query("SELECT `id`,`type`,`name` FROM `zet_product_properties`,`zet_product_properties_description` WHERE `zet_product_properties_description`.`property_id`=`zet_product_properties`.`id` AND `zet_product_properties_description`.`language_id`='".$lang_id."' AND `zet_product_properties`.`status`='1' AND `zet_product_properties`.`as_filter`='1' ORDER BY `zet_product_properties`.`priority` ASC");
        while($row = $this->db->assoc($query)){
            $data[$i] = array('id' => $row['id'],'title' => $row['name'],'type' => $row['type']);
            $i++;
        }
        return $data;
    }
    
    public function _getFilterValues($_id, $_type){
        global $lang_id; $i = 0;
        if($_type == '1' || $_type == '2') $language = "`language_id`='".$lang_id."' AND";
        $query = $this->db->query("SELECT `id`, `name`, `val_1`, `val_2`, `val_3` FROM `zet_product_properties_values` WHERE ".$language." `property_id`='".$_id."'");
        while($row = $this->db->assoc($query)){
            if($_type == '1' || $_type == '2') $res = $row['name'];
            if($_type == '3') $res = $row['val_1'];
            if($_type == '4') $res = $row['val_1'].' - '.$row['val_2'];
            if($_type == '5') $res = $row['val_1'].' × '.$row['val_2'];
            if($_type == '6') $res = $row['val_1'].' × '.$row['val_2'].' × '.$row['val_3'];
            $data[$i] = array('id' => $row['id'], 'value' => $res);
            $i++;
        }
        return $data;
    }
    
    public function _getBreadcrumbs($_id){
        $data = array();
        $_category = $_id;
        while($_category > 0){
            array_push($data, $_category);
            $_category = $this->_getCategoryPath($_category);
        }
        return array_reverse($data);
    }
    
    public function _getCategoryPath($_id){
        $query = $this->db->query("SELECT `parent_category` FROM `zet_category_path` WHERE `category_id`='".$_id."'");
        $row = $this->db->assoc($query);
        return $row['parent_category'];
    }
    
    /** Всього товарів в категорії **/
    public function _getProductsInCategory($_id) {
        $_id = (empty($_id)) ? 0 : $_id;
        $res = 0;
        $_category = $this->__getParentCategory($_id);
        
        if ($_category == 0) {
            $res += $this->__countProductsInCategory($_id);
            
            $query = $this->db->query("SELECT `id` FROM `zet_category` WHERE `parent_category`='".$_id."'");
            while ($row = $this->db->assoc($query)) {
                $res += $this->__countProductsInCategory($row['id']);
            }
        } else $res += $this->__countProductsInCategory($_id);
        
        return $res;
    }
    
    /** Батьківська категорія **/
    private function __getParentCategory($_category){
        $query = $this->db->query("SELECT `parent_category` FROM `zet_category` WHERE `id`='".$_category."'");
        $row = $this->db->assoc($query);
        return $row['parent_category'];
    }
    
    /** Кількість активних товарів в категорії **/
    private function __countProductsInCategory($_category) {
        $data = 0;
        $query = $this->db->query("SELECT `product_id` FROM `zet_product_to_category`,`zet_product` WHERE `zet_product`.`id`=`zet_product_to_category`.`product_id` AND `zet_product_to_category`.`category_id`='".$_category."' AND `zet_product`.`status`='1' AND `zet_product`.`additional`='0' GROUP BY `product_id`");
        while ($row = $this->db->assoc($query)) {
            $data++;
        }
        return $data;
    }
    
    /** SEARCH **/
    public function Search($filter){
        global $lang_id; $data = array();
        
        $search = urldecode($filter['q']);
        
        $_bool = (empty($_filters['pg'])) ? false : true;
        $_products_per_page = config('products_per_page');
        $_initial_product = ($_bool) ? $_filters['pg'] * $_products_per_page : 0;
        $_limit = "LIMIT {$_initial_product},{$_products_per_page}";
        
        $query = $this->db->query("SELECT `zet_product`.`id` AS `id`,`new`,`recommended`,`hit`,`url`,`title`,`zet_product`.`picture`,`zet_product_option`.`id` AS `option_id`,`price`,`quantity`,`cross_price` FROM `zet_product` LEFT JOIN `zet_product_description` ON `zet_product`.`id`=`zet_product_description`.`product_id` AND `zet_product_description`.`language_id`='".$lang_id."' LEFT JOIN `zet_product_option` ON `zet_product`.`id`=`zet_product_option`.`product_id` WHERE `zet_product`.`status`='1' AND `zet_product`.`additional`='0' AND (`zet_product_description`.`title` LIKE '%".$search."%' OR `zet_product_description`.`description` LIKE '%".$search."%' OR `zet_product_description`.`product_tags` LIKE '%".$search."%') GROUP BY `zet_product`.`id` ORDER BY `creation_date` DESC");
        while($row = $this->db->assoc($query)){
            $row["price"] = NewPrice($row["price"]);
            $data[$row['id']] = $row;
        }
        return $data;
    }
    
    public function SearchTotal($filter){
        global $lang_id;
        
        $search = urldecode($filter['q']);
        $query = $this->db->query("SELECT COUNT(*) AS `total` FROM `zet_product` LEFT JOIN `zet_product_description` ON `zet_product`.`id`=`zet_product_description`.`product_id` AND `zet_product_description`.`language_id`='".$lang_id."' WHERE `zet_product`.`status`='1' AND (`zet_product_description`.`title` LIKE '%".$search."%' OR `zet_product_description`.`description` LIKE '%".$search."%' OR `zet_product_description`.`product_tags` LIKE '%".$search."%')");
        $row = $this->db->assoc($query);
        return $row['total'];
    }
    
    public function PaginateSearch($total, $filter){
        global $route; $html = ""; $links = 2;
        
        $_page = (empty($filter['pg'])) ? 1: $filter['pg'];
        $_products_per_page = config('products_per_page');
        $_pages = ceil($total/$_products_per_page);
        
        $start = (($_page - $links) > 0) ? $_page - $links : 1;
        $end = (($_page + $links) < $_pages) ? $_page + $links : $_pages;
        
        if ($start > 1) {
            $html .= '<li><a href="'.SRV.$route[1].'/'.lRequest($filter, 'pg', '').'">1</a></li>';
            $html .= '<li><span>...</span></li>';
        }
        
        for ($i = $start ; $i <= $end; $i++) {
            $class = ($_page == $i) ? 'class="current_page"' : false;
            $html .= '<li><a href="'.SRV.$route[1].'/'.lRequest($filter, 'pg', $i).'" '.$class.'>'.$i.'</a></li>';
        }
        
        if ($end < $_pages) {
            $html .= '<li><span>...</span></li>';
            $html .= '<li><a href="'.SRV.$route[1].'/'.lRequest($filter, 'pg', $_pages).'">'.$_pages.'</a></li>';
        }
        
        return $html;
    }
    
    /** SEARCH END **/
    
    
    
    
    
    
    /** FLOR PEOPLE **/
    public function BackendGetCategoriesByStatus($parent = 0, $static = 0){
        global $lang_id; $data = array();
        $query = $this->db->query("SELECT `id`,`status`,`priority`,`url`,`title`,(SELECT COUNT(*) FROM `zet_product_to_category` WHERE `category_id`=`zet_category`.`id`) AS `products` FROM `zet_category`,`zet_category_description` WHERE `zet_category_description`.`category_id`=`zet_category`.`id` AND `zet_category_description`.`language_id`='".$lang_id."' AND `zet_category`.`static`='".$static."' AND `zet_category`.`parent_category`='".$parent."' ORDER BY `priority` ASC");
        while($row = $this->db->assoc($query)){
            $data[$row['id']] = $row;
        }
        return $data;
    }
    
    public function BackendGetFiltersByStatus($parent = 0, $static = 0){
        global $lang_id; $data = array(); 
        $query = $this->db->query("SELECT `filter_id`, `title`, `priority`, `status` FROM `zet_category_filters` WHERE `language_id` = '1' ORDER BY `priority` ASC");
        while ($row = $this->db->assoc($query)) {
            $data[$row['filter_id']] = $row;
            $query2 = $this->db->query("SELECT  `category_id`, `title`, `filter_category_id`, `url`FROM `zet_category_description`, `zet_category` WHERE `zet_category_description`.`category_id`= `zet_category`.`id` AND `filter_category_id`='".$row['filter_id']."' AND `language_id` = '1'");
            $data[$row['filter_id']]['items'] = array();
            while($subrow = $this->db->assoc($query2)){
                array_push($data[$row['filter_id']]['items'], $subrow);
                //$data[$row['filter_id']]['items'] = $subdata;
            }
        }
        /*while($row = mysql_fetch_assoc($query)){
            $data[$row['filter_category_id']] = $row;
            $query = $this->db->query("SELECT `zet_category_description`.`category_id`, `title`, `filter_id`, `status` FROM `zet_category_filter`,`zet_category_description` WHERE `zet_category_description`.`filter_category_id`='".$row['filter_category_id']."' AND `language_id` = '".$lang_id."'");
            while($subrow = $this->db->assoc($query)){
                $subdata[$subrow['category_id']] = $subrow;
                $data[$row['filter_category_id']]['items'] = $subdata;
               // print_r ($data[$row['filter_category_id']]);
                //array_push($data['category_id']['items'], $subdata);
            }
        }*/
        //print_r($data);
        return $data;
    }
    
    public function GetProductsInCategory($url, $filters) {
        //print_r($url);
        $data = array();
        preg_match('/(.*)&(.*)/', $url, $oa, PREG_OFFSET_CAPTURE); 
        if(count($oa)>0){
            $urls = split('&', $url);
            foreach ($urls as $key => $val) { 
                if($key==0){
                   $select = "'".$val."'";
                }else{
                    $select = $select.", '".$val."'";
                }
            }
            $query = $this->db->query("SELECT `id` FROM `zet_category` WHERE `url` in (".$select.")");
            while($row = $this->db->assoc($query)){
                $_id = $row['id'];
                $data = array_merge($data, $this->GetProductsDescriptionInCategory($_id, $filters));
            }
        }else{
            $query = $this->db->query("SELECT `id` FROM `zet_category` WHERE `url`='".$url."'");
            $row = $this->db->assoc($query);
            $_id = $row['id'];
            $data = $this->GetProductsDescriptionInCategory($_id, $filters);
        }  
        
        return $data;
    }
    
    private function GetProductsDescriptionInCategory($id, $filters) {
        global $lang_id;
        $data = array();
        
        $_bool = (empty($filters['pg'])) ? false : true;
        $_products_per_page = (empty($filters['on_page'])) ? config('products_per_page') : $filters['on_page'];
        $_initial_product = ($_bool) ? ($filters['pg'] - 1) * $_products_per_page : 0;
        $_limit = ($filters['on_page'] == 'all') ? "" : "LIMIT {$_initial_product},{$_products_per_page}";
        
        switch($filters['sort_by']){
            case 'promo': $_order_by = " `zet_product`.`hit`='0' ASC"; break;
            case 'new': $_order_by = " `zet_product`.`new`='0' ASC"; break;
            case 'expensive': $_order_by = " `zet_product_option`.`price` DESC"; break;
            case 'cheap': $_order_by = " `zet_product_option`.`price` ASC"; break;
            case 'name': $_order_by = " `zet_product_description`.`title` ASC"; break;
            case 'popular': $_order_by = " `creation_date` DESC"; break;
            default: $_order_by = " `article` ASC"; break;
        }
        
        $between = (isset($filters['min_price']) && isset($filters['max_price'])) ? "AND `price` BETWEEN '".$filters['min_price'] / config('usd')."' AND '".$filters['max_price'] / config('usd')."'" : "";
        $category = (empty($id)) ? false : "AND `zet_product_to_category`.`category_id`='".$id."'";
        
        $query = $this->db->query("SELECT `zet_product`.`id` AS `id`,`new`,`recommended`,`hit`,`url`,`title`,`zet_product`.`picture`,`price`,`quantity`,`cross_price` FROM `zet_product`,`zet_product_description`,`zet_product_option`,`zet_product_to_category` WHERE `zet_product_option`.`product_id`=`zet_product`.`id` AND `zet_product_description`.`product_id`=`zet_product`.`id` AND `zet_product_description`.`language_id`='".$lang_id."' AND `zet_product`.`id`=`zet_product_to_category`.`product_id` AND `zet_product`.`status`='1' AND `zet_product`.`additional`='0' {$between} {$category} GROUP BY `zet_product`.`id` 
        ORDER BY `article` LIKE '000%' DESC, {$_order_by} {$_limit}");
        
        while($row = $this->db->assoc($query)){
            $query_category = $this->db->query("SELECT `url` FROM `zet_category`,`zet_product_to_category` WHERE `zet_product_to_category`.`product_id`='".$row['id']."' AND `zet_product_to_category`.`is_main_category`='1' AND `zet_product_to_category`.`category_id`=`zet_category`.`id`");
            $row_category = $this->db->assoc($query_category);
            $data[$row["id"]] = $row;
            $data[$row["id"]]["category"] = $row_category["url"];
            $data[$row["id"]]["price"] = NewPrice($row["price"]);
        }
        
        $i = 0;
        $query = $this->db->query("SELECT `zet_product`.`id` AS `id`,`new`,`recommended`,`hit`,`url`,`title`,`zet_product`.`picture`,`price`,`quantity`,`cross_price` FROM `zet_product`,`zet_product_description`,`zet_product_option`,`zet_product_to_category` WHERE `zet_product_option`.`product_id`=`zet_product`.`id` AND `zet_product_description`.`product_id`=`zet_product`.`id` AND `zet_product_description`.`language_id`='".$lang_id."' AND `zet_product`.`id`=`zet_product_to_category`.`product_id` AND `zet_product`.`status`='1' AND `zet_product`.`additional`='0' {$between} {$category} GROUP BY `zet_product`.`id` ORDER BY {$_order_by}");
        while ($row = $this->db->assoc($query)) {
            $i++;
        }
        $this->_TotalProducts = $i;
        return $data;
    }
    
    private function CountAllActiveProducts() {
        $query = $this->db->query("SELECT COUNT(*) AS `total` FROM `zet_product` WHERE `zet_product`.`status`='1' AND `zet_product`.`additional`='0'");
        $row = $this->db->assoc($query);
        return $row["total"];
    }
    
    private $_TotalProducts;
    public function Paginate($_category, $data, $total = 0) {
        if ($data["on_page"] == "all") $html = "";
        else {
            global $route; $html = ""; $links = 1;
            
            $query = $this->db->query("SELECT `id` FROM `zet_category` WHERE `url`='".$_category."'");
            $row = $this->db->assoc($query);
            $_category = $row['id'];
            
            $total_ = (empty($_category)) ? $this->CountAllActiveProducts() : $this->_getProductsInCategory($_category);
            $total = $this->_TotalProducts; // $total_;
            
            $_page = (empty($data["pg"]) || $data["pg"] < 1) ? 1: $data["pg"];
            $_products_per_page = (empty($data["on_page"])) ? config("products_per_page") : $data["on_page"];
            $_pages = ceil($total/$_products_per_page);
            
            $start = (($_page - $links) > 0) ? $_page - $links : 1;
            $end = (($_page + $links) < $_pages) ? $_page + $links : $_pages;
            
            $route[2] = (empty($_category)) ? "" : "{$route[2]}/";
            
            if ($start > 1) {
                $html .= '<a href="'.SRV_.$route[1].'/'.$route[2].lRequest("pg", "").'">1</a>';
                if ($start > 2) {
                    $html .= '<span>...</span>';
                }
            }
            
            for ($i = $start ; $i <= $end; $i++) {
                $page = ($i == 1) ? false : $i;
                $class = ($_page == $i) ? 'class="current"' : false;
                $html .= '<a href="'.SRV_.$route[1].'/'.$route[2].lRequest("pg", $page).'" '.$class.'>'.$i.'</a>';
            }
            
            if ($end < $_pages) {
                if ($end < ($_pages - 1)) {
                    $html .= '<span>...</span>';
                }
                $html .= '<a href="'.SRV_.$route[1].'/'.$route[2].lRequest("pg", $_pages).'">'.$_pages.'</a>';
            }
        }
        return $html;
    }
    
    public function __get($name) {
        return $this->$name;
    }
}