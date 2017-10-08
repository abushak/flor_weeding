<?php
class CatalogProduct extends Model {
    private $_ProductsTotal;
    
    public function GetProducts($data) {
        global $lang_id;
        $_data = array();
        
        $page = ($data["pg"] > 0) ? $data["pg"] - 1 : $data["pg"];
        $products_per_page = (empty($data["on_page"])) ? config("products_per_admin_page") : $data["on_page"];
        $initial_product = (empty($data["pg"])) ? 0 : $page * $products_per_page;
        $limit = ($data["on_page"] == "all") ? "" : "LIMIT {$initial_product},{$products_per_page}";
        
        $order = "ORDER BY `article` ASC";
        if (!empty($data["sort"])) {
            $sort = explode("_", $data["sort"]);
            $sort[1] = ($sort[1] == "old") ? "ASC" : "DESC";
            $sort[0] = ($sort[0] == "cross") ? "cross_price" : $sort[0];
            $order = " ORDER BY `{$sort[0]}` {$sort[1]}";
        }
        
        if (!empty($data["name"])) {
            $name = "AND `title` LIKE '%{$data["name"]}%'";
        }
        
        if (empty($data["price_min"])) {
            if (empty($data["price_max"])) {
                $price = "";
            } else {
                $price = "AND `price`<'{$data["price_max"]}'";
            }
        } else {
            if (empty($data["price_max"])) {
                $price = "AND `price`>'{$data["price_min"]}'";
            } else {
                $price = "AND `price` BETWEEN {$data["price_min"]} AND {$data["price_max"]}";
            }
        }
        
        if (empty($data["cross_min"])) {
            if (empty($data["cross_max"])) {
                $cross_price = "";
            } else {
                $cross_price = "AND `cross_price`<'{$data["cross_max"]}'";
            }
        } else {
            if (empty($data["cross_max"])) {
                $cross_price = "AND `cross_price`>'{$data["cross_min"]}'";
            } else {
                $cross_price = "AND `cross_price` BETWEEN {$data["cross_min"]} AND {$data["cross_max"]}";
            }
        }
        
        if (empty($data["count_min"])) {
            if (empty($data["count_max"])) {
                $quantity = "";
            } else {
                $quantity = "AND `quantity`<'{$data["count_max"]}'";
            }
        } else {
            if (empty($data["count_max"])) {
                $quantity = "AND `quantity`>'{$data["count_min"]}'";
            } else {
                $quantity = "AND `quantity` BETWEEN {$data["count_min"]} AND {$data["count_max"]}";
            }
        }
        
        if (!empty($data["article"])) {
            $article = "AND `article` LIKE '%{$data["article"]}%'";
        }
        
        switch ($data["category_id"]) {
            case "": $category = ""; break;
            case "0": $category = ""; break;
            default: $category = "AND `category_id`='{$data["category_id"]}'"; break;
        }
        
        switch ($data["status_type"]) {
            case "0": $type = ""; break;
            case "1": $type = "AND `new`='1'"; break;
            case "2": $type = "AND `recommended`='1'"; break;
            case "3": $type = "AND `hit`='1'"; break;
        }
        
        $where = "{$name} {$price} {$cross_price} {$article} {$category} {$type}";
        
        $query = $this->db->query("SELECT `zet_product`.`id`,`status`,`new`,`recommended`,`hit`,`url`,`title`,`zet_product`.`picture` FROM `zet_product`,`zet_product_description`,`zet_product_option`,`zet_product_to_category` WHERE `zet_product_option`.`product_id`=`zet_product`.`id` AND `zet_product_description`.`product_id`=`zet_product`.`id` AND `zet_product_to_category`.`product_id`=`zet_product`.`id` AND `zet_product_description`.`language_id`='".$lang_id."' AND `zet_product`.`additional`='0' {$where} GROUP BY `zet_product`.`id` {$order} {$limit}");
        while ($row = $this->db->assoc($query)) {
            $_data[] = $row;
        }
        
        $i = 0;
        $query = $this->db->query("SELECT `zet_product`.`id`,`status`,`new`,`recommended`,`hit`,`url`,`title`,`zet_product`.`picture` FROM `zet_product`,`zet_product_description`,`zet_product_option`,`zet_product_to_category` WHERE `zet_product_option`.`product_id`=`zet_product`.`id` AND `zet_product_description`.`product_id`=`zet_product`.`id` AND `zet_product_to_category`.`product_id`=`zet_product`.`id` AND `zet_product_description`.`language_id`='".$lang_id."' AND `zet_product`.`additional`='0' {$where} GROUP BY `zet_product`.`id`");
        while ($row = $this->db->assoc($query)) {
            $i++;
        }
        $this->_ProductsTotal = $i;
        
        return $_data;
    }
    
    public function Paginate($data) {
        global $route;
        $html = "";
        $links = 2;
        
        $total = $this->_ProductsTotal;
        
        $_page = (empty($data['pg'])) ? 1: $data['pg'];
        $_products_per_page = (empty($data['on_page'])) ? config('products_per_admin_page') : $data['on_page'];
        $_pages = ceil($total/$_products_per_page);
        
        $start = (($_page - $links) > 0) ? $_page - $links : 1;
        $end = (($_page + $links) < $_pages) ? $_page + $links : $_pages;
        
        if ($start > 1) {
            $html .= '<li><a href="'.ADM_SRV.$route[2].'/'.$route[3].'/'.lRequest("pg", "").'">1</a></li>';
            $html .= '<li><span>...</span></li>';
        }
        
        for ($i = $start ; $i <= $end; $i++) {
            $page = ($i == 1) ? "" : $i;
            $class = ($_page == $i) ? 'class="current_page"' : false;
            $html .= '<li><a href="'.ADM_SRV.$route[2].'/'.$route[3].'/'.lRequest("pg", $page).'" '.$class.'>'.$i.'</a></li>';
        }
        
        if ($end < $_pages) {
            $html .= "<li><span>...</span></li>";
            $html .= '<li><a href="'.ADM_SRV.$route[2].'/'.$route[3].'/'.lRequest("pg", $_pages).'">'.$_pages.'</a></li>';
        }
    
        return $html;
    }
    
    
    
    
    
    
    public function add($data, $files) {
        $_status = ($data['status'] == "on") ? 1 : 0;
        $_new = ($data['new'] == "on") ? 1 : 0;
        $_recommended = ($data['recommended'] == "on") ? 1 : 0;
        $_hit = ($data['hit'] == "on") ? 1 : 0;
        $_date = (empty($data['create_date'])) ? date('Y-m-d') : $data['create_date'];
        
        $this->db->query("INSERT INTO `zet_product` (`id`,`status`,`new`,`recommended`,`hit`,`creation_date`,`no_instock_action`) VALUES ('','".$_status."','".$_new."','".$_recommended."','".$_hit."','".$_date."','".$data['no_instock_action']."')");
        $_id = $this->db->getLastId();
        
        $this->_linkTransliteration($_id, $data['url'], $data['title'][1], 'zet_product');
        
        foreach($data['title'] as $language_id => $value) {
            $this->db->query("INSERT INTO `zet_product_description` (`product_id`,`language_id`,`title`,`description`,`meta_title`,`meta_h1`,`meta_keywords`,`meta_description`,`product_tags`) VALUES ('".$_id."','".$language_id."','".$data['title'][$language_id]."','".$data['description'][$language_id]."','".$data['meta_title'][$language_id]."','".$data['meta_h1'][$language_id]."','".$data['meta_keywords'][$language_id]."','".$data['meta_description'][$language_id]."','".$data['product_tags'][$language_id]."')");
        }
        
        $stamp_name = config('water_mark_img');
        $stamp_path = ROOT_FILES.$stamp_name;
        $bool = (empty($stamp_name)) ? false: true;
        
        foreach($data['variant_price'] as $key => $value) {
            $this->db->query("INSERT INTO `zet_product_option` (`id`,`product_id`,`article`,`price`,`real_price`,`cross_price`,`quantity`) VALUES ('','".$_id."','".$data['variant_article'][$key]."','".$data['variant_price'][$key]."','".$data['variant_real_price'][$key]."','".$data['variant_cross_price'][$key]."','".$data['variant_quantity'][$key]."')");
            $_opt_id = $this->db->getLastId();
            
            foreach($data["variant_name"] as $language_id => $value){
                $this->db->query("INSERT INTO `zet_product_option_description` (`product_id`, `option_id`, `language_id`, `name`) VALUES ('".$_id."','".$_opt_id."','".$language_id."','".$data["variant_name"][$language_id][$key]."')");
            }
            
            if(!empty($files['variant_picture']['name'][$key])) {
                $_pic = $this->_uploadImg($files['variant_picture']['name'][$key], $files['variant_picture']['tmp_name'][$key], $_opt_id, 'zet_product_option');
                $_picture = ROOT_FILES.'products/original_'.$_pic;
                $_big = ROOT_FILES.'products/'.$_pic;
                $_thumb = ROOT_FILES.'products/small_'.$_pic;
                crop($_picture, $_big, 690, 515, false);
                crop($_picture, $_thumb, 206, 154);
                if($bool) watermark($_big, $stamp_path);
            }
            
            /** SUB OPTION **/
            if($data['has-sub-ceck'][$key] == "on"){
                $this->db->query("UPDATE `zet_product_option` SET `has_sub`='1' WHERE `id`='".$_opt_id."'");
                foreach($data['sub-var']['check'][$key] as $k => $v){
                    $this->db->query("INSERT INTO `zet_product_option_sub`(`product_id`,`option_id`,`color_id`,`qty`) VALUES ('".$_id."','".$_opt_id."','".$data['sub-var']['check'][$key][$k]."','".$data['sub-var']['qty'][$key][$k]."')");
                    $_sub_id = $this->db->getLastId();
                    
                    if(!empty($files['sub-var-picture']['name'][$key][$k])){
                        $_pic_ = $this->_uploadImg($files['sub-var-picture']['name'][$key][$k], $files['sub-var-picture']['tmp_name'][$key][$k], $_sub_id, 'zet_product_option_sub');
                        $_picture = ROOT_FILES.'products/original_'.$_pic_;
                        $_big = ROOT_FILES.'products/'.$_pic_;
                        crop($_picture, $_big, 690, 515);
                        if($bool) watermark($_big, $stamp_path);
                    }
                }
            }
            /** **/
        }
        
        //product_to_category
        $this->db->query("INSERT INTO `zet_product_to_category` (`product_id`, `category_id`, `is_main_category`) VALUES ('".$_id."','".$data['main_category']."','1')");
        
        if($data['brand_id'] != 0) $this->db->query("INSERT INTO `zet_product_to_brand` (`product_id`, `brand_id`) VALUES ('".$_id."','".$data['brand_id']."')");
        
        if(count($data['property_id']) > 0) {
            foreach($data['property_id'] as $key => $prop_id){
                if($data['property_value'][$prop_id] != 0){
                    $this->db->query("INSERT INTO `zet_product_to_property` (`product_id`, `property_id`) VALUES ('".$_id."','".$prop_id."')");
                    $this->db->query("INSERT INTO `zet_product_to_property_values` (`product_id`, `property_id`, `property_value`) VALUES ('".$_id."','".$prop_id."','".$data['property_value'][$prop_id]."')");
                }
            }
        }
        
        foreach($data['check_property_id'] as $key => $prop_id){
            $this->db->query("INSERT INTO `zet_product_to_property` (`product_id`, `property_id`) VALUES ('".$_id."','".$prop_id."')");
            if(isset($data['check_property_values'][$prop_id])){
                foreach($data['check_property_values'][$prop_id] as $key => $prop_val){
                    $this->db->query("INSERT INTO `zet_product_to_property_values` (`product_id`, `property_id`, `property_value`) VALUES ('".$_id."','".$prop_id."','".$prop_val."')");
                }
            }
        }
        
        if(!empty($data['gallery_picture_name'])){
            foreach($data['gallery_picture_name'] as $key => $val){
                $this->db->query("INSERT INTO `zet_product_gallery` (`product_id`, `picture_name`, `picture_title`, `picture_alt`) VALUES ('".$_id."','".$data['gallery_picture_name'][$key]."','".$data['gallery_picture_title'][$key]."','".$data['gallery_picture_alt'][$key]."')");
            }
        }
        
        if(!empty($data['product_promo_group'])){
            foreach($data['product_promo_group'] as $key => $val){
                $this->db->query("INSERT INTO `zet_product_promo`(`product_id`, `userlist_group`, `type`, `value`, `start`, `end`) VALUES ('".$_id."','".$data['product_promo_group'][$key]."','".$data['product_promo_type'][$key]."','".$data['product_promo_value'][$key]."','".$data['product_promo_start'][$key]."','".$data['product_promo_end'][$key]."')");
            }
        }
        
        if(!empty($data['product_wholesale_group'])){
            foreach($data['product_wholesale_group'] as $key => $val){
                $this->db->query("INSERT INTO `zet_product_wholesale` (`product_id`, `userlist_group`, `type`, `value`, `qty`) VALUES ('".$_id."','".$data['product_wholesale_group'][$key]."','".$data['product_wholesale_type'][$key]."','".$data['product_wholesale_value'][$key]."','".$data['product_wholesale_qty'][$key]."')");
            }
        }
        //product_to_product
    }
    
    public function edit($_id, $data, $files){
        $_status = ($data['status'] == "on") ? 1 : 0;
        $_new = ($data['new'] == "on") ? 1 : 0;
        $_recommended = ($data['recommended'] == "on") ? 1 : 0;
        $_hit = ($data['hit'] == "on") ? 1 : 0;
        $_date = (empty($data['create_date'])) ? date('Y-m-d') : $data['create_date'];
        $this->db->query("UPDATE `zet_product` SET `status`='".$_status."',`new`='".$_new."',`recommended`='".$_recommended."',`hit`='".$_hit."',`creation_date`='".$_date."',`no_instock_action`='".$data['no_instock_action']."' WHERE `id`='".$_id."'");
        
        $this->_linkTransliteration($_id, $data['url'], $data['title'][1], 'zet_product');
        
        $this->db->query("DELETE FROM `zet_product_description` WHERE `product_id`='".$_id."'");
        foreach($data['title'] as $language_id => $value) {
            $this->db->query("INSERT INTO `zet_product_description` (`product_id`,`language_id`,`title`,`description`,`meta_title`,`meta_h1`,`meta_keywords`,`meta_description`,`product_tags`) VALUES ('".$_id."','".$language_id."','".$data['title'][$language_id]."','".$data['description'][$language_id]."','".$data['meta_title'][$language_id]."','".$data['meta_h1'][$language_id]."','".$data['meta_keywords'][$language_id]."','".$data['meta_description'][$language_id]."','".$data['product_tags'][$language_id]."')");
        }
        
        $stamp_name = config('water_mark_img');
        $stamp_path = ROOT_FILES.$stamp_name;
        $bool = (empty($stamp_name)) ? false: true;
        
        //$this->db->query("DELETE FROM `zet_product_option` WHERE `product_id`='".$_id."'");
        $this->db->query("DELETE FROM `zet_product_option_description` WHERE `product_id`='".$_id."'");
        
        foreach($data['variant_price'] as $key => $value) {
            $query = $this->db->query("SELECT `id` FROM `zet_product_option` WHERE `product_id`='".$_id."'");
            while($row = $this->db->assoc($query)){
                if(array_key_exists($row['id'], $data['variant_price']) == false){
                    $this->db->query("DELETE FROM `zet_product_option` WHERE `id`='".$row['id']."'");
                }
            }
            
            $query = $this->db->query("SELECT `id` FROM `zet_product_option` WHERE `id`='".$key."'");
            $row = $this->db->assoc($query);
            if($row){
                $this->db->query("UPDATE `zet_product_option` SET `product_id`='".$_id."',`article`='".$data['variant_article'][$key]."',`price`='".$data['variant_price'][$key]."',`real_price`='".$data['variant_real_price'][$key]."',`cross_price`='".$data['variant_cross_price'][$key]."',`quantity`='".$data['variant_quantity'][$key]."' WHERE `id`='".$key."'");
                $_opt_id = $key;
            } else {
                $this->db->query("INSERT INTO `zet_product_option` (`id`,`product_id`,`article`,`price`,`real_price`,`cross_price`,`quantity`) VALUES ('','".$_id."','".$data['variant_article'][$key]."','".$data['variant_price'][$key]."','".$data['variant_real_price'][$key]."','".$data['variant_cross_price'][$key]."','".$data['variant_quantity'][$key]."')");
                $_opt_id = $this->db->getLastId();
            }
            
            foreach($data["variant_name"] as $language_id => $value){
                $this->db->query("INSERT INTO `zet_product_option_description` (`product_id`, `option_id`, `language_id`, `name`) VALUES ('".$_id."','".$_opt_id."','".$language_id."','".$data["variant_name"][$language_id][$key]."')");
            }
            
            if(!empty($files['variant_picture']['name'][$key])){
                $_pic = $this->_uploadImg($files['variant_picture']['name'][$key], $files['variant_picture']['tmp_name'][$key], $_opt_id, 'zet_product_option');
                $_picture = ROOT_FILES.'products/original_'.$_pic;
                $_big = ROOT_FILES.'products/'.$_pic;
                $_thumb = ROOT_FILES.'products/small_'.$_pic;
                crop($_picture, $_big, 690, 515, false);
                crop($_picture, $_thumb, 206, 154);
                if($bool) watermark($_big, $stamp_path);
            } else $this->db->query("UPDATE `zet_product_option` SET `picture`='".$data['variant_old_picture'][$key]."' WHERE `id`='".$_opt_id."'");
            
            /** SUB OPTION **/
            if($data['has-sub-ceck'][$key] == "on"){
                $this->db->query("UPDATE `zet_product_option` SET `has_sub`='1' WHERE `id`='".$_opt_id."'");
                foreach($data['sub-var']['check'][$key] as $k => $v){
                    $query = $this->db->query("SELECT `color_id` FROM `zet_product_option_sub` WHERE `product_id`='".$_id."' AND `option_id`='".$_opt_id."'");
                    while($row = $this->db->assoc($query)){
                        if(array_key_exists($row['color_id'], $data['sub-var']['check'][$key]) == false){
                            $this->db->query("DELETE FROM `zet_product_option` WHERE `id`='".$row['id']."'");
                        }
                    }
            
                    $query = $this->db->query("SELECT `id` FROM `zet_product_option_sub` WHERE `product_id`='".$_id."' AND `option_id`='".$_opt_id."' AND `color_id`='".$data['sub-var']['check'][$key][$k]."'");
                    $row = $this->db->assoc($query);
                    if($row){
                        $this->db->query("UPDATE `zet_product_option_sub` SET `qty`='".$data['sub-var']['qty'][$key][$k]."' WHERE `product_id`='".$_id."' AND `option_id`='".$_opt_id."' AND `color_id`='".$data['sub-var']['check'][$key][$k]."'");
                        $_sub_id = $row['id']; //$this->db->getLastId();
                    } else {
                        $this->db->query("INSERT INTO `zet_product_option_sub`(`product_id`,`option_id`,`color_id`,`qty`) VALUES ('".$_id."','".$_opt_id."','".$data['sub-var']['check'][$key][$k]."','".$data['sub-var']['qty'][$key][$k]."')");
                        $_sub_id = $this->db->getLastId();
                    }
                    
                    if(!empty($files['sub-var-picture']['name'][$key][$k])){
                        $_pic_ = $this->_uploadImg($files['sub-var-picture']['name'][$key][$k], $files['sub-var-picture']['tmp_name'][$key][$k], $_sub_id, 'zet_product_option_sub');
                        $_picture = ROOT_FILES.'products/original_'.$_pic_;
                        $_big = ROOT_FILES.'products/'.$_pic_;
                        crop($_picture, $_big, 690, 515);
                        if($bool) watermark($_big, $stamp_path);
                    }
                }
            } else {
                $this->db->query("DELETE FROM `zet_product_option_sub` WHERE `product_id`='".$_id."' AND `option_id`='".$_opt_id."'");
                $this->db->query("UPDATE `zet_product_option` SET `has_sub`='0' WHERE `id`='".$_opt_id."'");
            }
            /** **/
        }
        
        
        //product_to_category
        $this->db->query("DELETE FROM `zet_product_to_category` WHERE `product_id`='".$_id."'");
        $this->db->query("INSERT INTO `zet_product_to_category` (`product_id`, `category_id`, `is_main_category`) VALUES ('".$_id."','".$data['main_category']."','1')");
        
        $this->db->query("DELETE FROM `zet_product_to_brand` WHERE `product_id`='".$_id."'");
        if($data['brand_id'] != 0) $this->db->query("INSERT INTO `zet_product_to_brand` (`product_id`, `brand_id`) VALUES ('".$_id."','".$data['brand_id']."')");
        
        $this->db->query("DELETE FROM `zet_product_to_property` WHERE `product_id`='".$_id."'");
        $this->db->query("DELETE FROM `zet_product_to_property_values` WHERE `product_id`='".$_id."'");
        if(count($data['property_id']) > 0) {
            foreach($data['property_id'] as $key => $prop_id){
                if($data['property_value'][$prop_id] != 0){
                    $this->db->query("INSERT INTO `zet_product_to_property` (`product_id`, `property_id`) VALUES ('".$_id."','".$prop_id."')");
                    $this->db->query("INSERT INTO `zet_product_to_property_values` (`product_id`, `property_id`, `property_value`) VALUES ('".$_id."','".$prop_id."','".$data['property_value'][$prop_id]."')");
                }
            }
        }
        
        foreach($data['check_property_id'] as $key => $prop_id){
            $this->db->query("INSERT INTO `zet_product_to_property` (`product_id`, `property_id`) VALUES ('".$_id."','".$prop_id."')");
            if(isset($data['check_property_values'][$prop_id])){
                foreach($data['check_property_values'][$prop_id] as $key => $prop_val){
                    $this->db->query("INSERT INTO `zet_product_to_property_values` (`product_id`, `property_id`, `property_value`) VALUES ('".$_id."','".$prop_id."','".$prop_val."')");
                }
            }
        }
        
        $this->db->query("DELETE FROM `zet_product_gallery` WHERE `product_id`='".$_id."'");
        if(!empty($data['gallery_picture_name'])){
            foreach($data['gallery_picture_name'] as $key => $val){
                $this->db->query("INSERT INTO `zet_product_gallery` (`product_id`, `picture_name`, `picture_title`, `picture_alt`) VALUES ('".$_id."','".$data['gallery_picture_name'][$key]."','".$data['gallery_picture_title'][$key]."','".$data['gallery_picture_alt'][$key]."')");
            }
        }
        
        $this->db->query("DELETE FROM `zet_product_promo` WHERE `product_id`='".$_id."'");
        if(!empty($data['product_promo_group'])){
            foreach($data['product_promo_group'] as $key => $val){
                $this->db->query("INSERT INTO `zet_product_promo`(`product_id`, `userlist_group`, `type`, `value`, `start`, `end`) VALUES ('".$_id."','".$data['product_promo_group'][$key]."','".$data['product_promo_type'][$key]."','".$data['product_promo_value'][$key]."','".$data['product_promo_start'][$key]."','".$data['product_promo_end'][$key]."')");
            }
        }
        
        $this->db->query("DELETE FROM `zet_product_wholesale` WHERE `product_id`='".$_id."'");
        if(!empty($data['product_wholesale_group'])){
            foreach($data['product_wholesale_group'] as $key => $val){
                $this->db->query("INSERT INTO `zet_product_wholesale` (`product_id`, `userlist_group`, `type`, `value`, `qty`) VALUES ('".$_id."','".$data['product_wholesale_group'][$key]."','".$data['product_wholesale_type'][$key]."','".$data['product_wholesale_value'][$key]."','".$data['product_wholesale_qty'][$key]."')");
            }
        }
        //product_to_product
    }
    
    public function del($_id){
        $query = $this->db->query("SELECT `picture` FROM `zet_product_option` WHERE `product_id`='".$_id."' AND `picture`<>''");
        while($row = $this->db->assoc($query)){
            if(!empty($row['picture']) && file_exists(ROOT_FILES.'products/'.$row['picture'])){
                unlink(ROOT_FILES.'products/'.$row['picture']);
                unlink(ROOT_FILES.'products/small_'.$row['picture']);
            }
        }
        
        $query = $this->db->query("SELECT `picture` FROM `zet_product_option_sub` WHERE `product_id`='".$_id."' AND `picture`<>''");
        while($row = $this->db->assoc($query)){
            if(!empty($row['picture']) && file_exists(ROOT_FILES.'products/'.$row['picture'])){
                unlink(ROOT_FILES.'products/'.$row['picture']);
                unlink(ROOT_FILES.'products/small_'.$row['picture']);
            }
        }
        
        $this->db->query("DELETE FROM `zet_product` WHERE `id`='".$_id."'");
        $this->db->query("DELETE FROM `zet_product_description` WHERE `product_id`='".$_id."'");
        $this->db->query("DELETE FROM `zet_product_option` WHERE `product_id`='".$_id."'");
        $this->db->query("DELETE FROM `zet_product_option_description` WHERE `product_id`='".$_id."'");
        $this->db->query("DELETE FROM `zet_product_to_category` WHERE `product_id`='".$_id."'");
        $this->db->query("DELETE FROM `zet_product_to_brand` WHERE `product_id`='".$_id."'");
        $this->db->query("DELETE FROM `zet_product_to_property` WHERE `product_id`='".$_id."'");
        $this->db->query("DELETE FROM `zet_product_to_property_values` WHERE `product_id`='".$_id."'");
        $this->db->query("DELETE FROM `zet_product_gallery` WHERE `product_id`='".$_id."'");
        $this->db->query("DELETE FROM `zet_product_promo` WHERE `product_id`='".$_id."'");
        $this->db->query("DELETE FROM `zet_product_wholesale` WHERE `product_id`='".$_id."'");
        $this->db->query("DELETE FROM `zet_product_option_sub` WHERE `product_id`='".$_id."'");
    }
    
    public function getProduct($_id){
        $query = $this->db->query("SELECT * FROM `zet_product` WHERE `id`='".(int)$_id."'");
        $result = $this->db->assoc($query);
        return $result;
    }
    public function getPDescriptions($_id){
        $description_data = array();
        $query = $this->db->query("SELECT * FROM `zet_product_description` WHERE `product_id`='".(int)$_id."'");
        while($row = $this->db->assoc($query)){
            $description_data [$row['language_id']] = $row;
        }
        return $description_data ;
    }
    public function check($_id){
        $query = $this->db->query("SELECT * FROM `zet_product` WHERE `id`='".(int)$_id."'");
        $result = $this->db->assoc($query);
        return ($result) ? true : false;
    }
    
    public function checkProductByUrl($url)
    {
        $query = $this->db->query("SELECT `id` FROM `zet_product` WHERE `url`='".$url."'");
        $result = $this->db->assoc($query);
        return ($result) ? true : false;
    }
    
    public function count(){
        $query = $this->db->query("SELECT COUNT(*) AS `total` FROM `zet_product`");
        $res = $this->db->assoc($query);
        return $res['total'];
    }
    public function productToBrand($_id = false){
        $where = ($_id) ? "WHERE `brand_id`='".$_id."'" : false;
        $query = $this->db->query("SELECT COUNT(*) AS `total` FROM `zet_product_to_brand` ".$where);
        $res = $this->db->assoc($query);
        return $res['total'];
    }
    
    public function getProductToOrderById($_id) {
        global $lang_id; $i = 1; $data = array();
        
        $query = $this->db->query("SELECT `zet_product`.`id` AS `id`,`url`,`title`,`article`,`price`,`zet_product`.`picture` AS `picture`
        FROM `zet_product`,`zet_product_description`,`zet_product_option` 
        WHERE `zet_product_description`.`product_id`=`zet_product`.`id` 
        AND `zet_product_option`.`product_id`=`zet_product`.`id` 
        AND `zet_product_description`.`language_id`='".$lang_id."' 
        AND `zet_product`.`id`='".$_id."'");
        while ($row = $this->db->assoc($query)) {
            $row["price"] = NewPrice($row["price"]);
            $data[$i] = $row; $i++;
        }
        return $data;
    }
    
    public function redirect(){
        redirectTo(ADM_SRV."catalog/products/");
    }
    
    private function _uploadImg($_name, $tmp_name, $_opt_id, $_table){
        $_ext = end(explode(".", $_name));
        $_file = rand().'_'.time().'.'.$_ext;
        $_path = ROOT_FILES.'products/original_'.$_file;
        if(move_uploaded_file($tmp_name, $_path)){
            $this->db->query("UPDATE `".$_table."` SET `picture`='".$_file."' WHERE `id`='".$_opt_id."'");
            return $_file;
        } else return false;
    }
    
    public function copyProduct($_id){
        $_date = date('Y-m-d');
        
        $this->db->query("INSERT INTO `zet_product`(`status`,`new`,`recommended`,`hit`,`url`,`creation_date`,`no_instock_action`) (SELECT `status`,`new`,`recommended`,`hit`,CONCAT((SELECT MAX(`id`) FROM `zet_product`) + 1,'__',`url`),'".$_date."',`no_instock_action` FROM `zet_product` WHERE `id`='".$_id."')");
        $_last_id = $this->db->getLastId();
        
        $this->db->query("INSERT INTO `zet_product_description`(`product_id`,`language_id`,`title`,`description`,`meta_title`,`meta_h1`,`meta_keywords`,`meta_description`,`product_tags`) (SELECT '".$_last_id."',`language_id`,`title`,`description`,`meta_title`,`meta_h1`,`meta_keywords`,`meta_description`,`product_tags` FROM `zet_product_description` WHERE `product_id`='".$_id."')");
        
        $query = $this->db->query("SELECT `id` FROM `zet_product_option` WHERE `product_id`='".$_id."'");
        while($row = $this->db->assoc($query)){
            $this->db->query("INSERT INTO `zet_product_option`(`product_id`,`article`,`price`,`real_price`,`cross_price`,`quantity`) (SELECT '".$_last_id."',`article`,`price`,`real_price`,`cross_price`,`quantity` FROM `zet_product_option` WHERE `product_id`='".$_id."' AND `id`='".$row['id']."')");
            $_opt_id = $this->db->getLastId();
            $this->db->query("INSERT INTO `zet_product_option_description`(`product_id`,`option_id`,`language_id`,`name`) (SELECT '".$_last_id."','".$_opt_id."',`language_id`,`name` FROM `zet_product_option_description` WHERE `product_id`='".$_id."' AND `option_id`='".$row['id']."')");
        }
        
        $this->db->query("INSERT INTO `zet_product_to_category`(`product_id`,`category_id`,`is_main_category`) (SELECT '".$_last_id."',`category_id`,`is_main_category` FROM `zet_product_to_category` WHERE `product_id`='".$_id."')");
        
        $this->db->query("INSERT INTO `zet_product_to_brand`(`product_id`,`brand_id`) (SELECT '".$_last_id."',`brand_id` FROM `zet_product_to_brand` WHERE `product_id`='".$_id."')");
        
        $this->db->query("INSERT INTO `zet_product_to_property`(`product_id`,`property_id`) (SELECT '".$_last_id."',`property_id` FROM `zet_product_to_property` WHERE `product_id`='".$_id."')");
        $this->db->query("INSERT INTO `zet_product_to_property_values`(`product_id`,`property_id`,`property_value`) (SELECT '".$_last_id."',`property_id`,`property_value` FROM `zet_product_to_property_values` WHERE `product_id`='".$_id."')");
        
        $this->db->query("INSERT INTO `zet_product_promo`(`product_id`,`userlist_group`,`type`,`value`,`start`,`end`) (SELECT '".$_last_id."',`userlist_group`,`type`,`value`,`start`,`end` FROM `zet_product_promo` WHERE `product_id`='".$_id."')");
        $this->db->query("INSERT INTO `zet_product_wholesale`(`product_id`,`userlist_group`,`type`,`value`,`qty`) (SELECT '".$_last_id."',`userlist_group`,`type`,`value`,`qty` FROM `zet_product_wholesale` WHERE `product_id`='".$_id."')");
        //product_to_product
    }
    
    /** ----------------------------------------- **/
    public function GetAdditionalOption($_id) {
        $data = array();
        $query = $this->db->query("SELECT * FROM `zet_product_option` WHERE `zet_product_option`.`product_id`='".$_id."'");
        while ($row = $this->db->assoc($query)) {
            $data[$row['id']] = $row;
        }
        return $data;
    }
    
    public function getProductOptions($_id, $language_id, $count = 1) {
        global $lang_id;
        $data = array();
        $query = $this->db->query("SELECT * FROM `zet_product_option`,`zet_product_option_description` WHERE `zet_product_option`.`product_id`='".$_id."' AND `zet_product_option_description`.`option_id`=`zet_product_option`.`id` AND `zet_product_option_description`.`language_id`='".$lang_id."' ORDER BY `zet_product_option`.`id` ASC");
        while ($row = $this->db->assoc($query)) {
            $data[$row['id']] = $row;
        }
        return $data;
    }
    
    /** STORE FUNCTIONS **/
    /** Назва та опис товару **/
    public function _getProductDescription($_id){
        global $lang_id;
        $query = $this->db->query("SELECT * FROM `zet_product_description` WHERE `product_id`='".(int)$_id."' AND `language_id`='".$lang_id."'");
        $row = $this->db->assoc($query);
        $_data = array('title' => $row['title'],'description' => $row['description']);
        return $_data;
    }
    
    /** Варіанти товару **/
    public function _getProductOptions($_id){
        global $lang_id; $i = 0;
        $query = $this->db->query("
        SELECT * FROM 
        `zet_product_option`,`zet_product_option_description` WHERE 
        `zet_product_option`.`product_id`='".$_id."' 
        AND `zet_product_option_description`.`option_id`=`zet_product_option`.`id` 
        AND `zet_product_option_description`.`language_id`='".$lang_id."' 
        ORDER BY `zet_product_option`.`picture`='', `zet_product_option`.`quantity` DESC");
        while($row = $this->db->assoc($query)){
            $data[$i] = $row;
            //array(
            //    'price' => $row['price'],'quantity' => $row['quantity'],'article' => $row['article'],
            //    'id' => $row['id'],'name' => $row['name'],'cross_price' => $row['cross_price'],
            //    'picture' => $row['picture']
            //);
            $i++;
        }
        return $data;
    }
    
    /** Попередній та Наступний товари **/
    public function _getProductsInCategory($url){
        $i = 1;
        $query = $this->db->query("SELECT `id` FROM `zet_product` WHERE `url`='".$url."'");
        $row = $this->db->assoc($query);
        $_id = $row['id'];
        
        $query = $this->db->query("SELECT `category_id` FROM `zet_product_to_category` WHERE `product_id`='".$_id."' AND `is_main_category`='1'");
        $row = $this->db->assoc($query);
        $_category = $row['category_id'];
        
        $query = $this->db->query("SELECT `url` FROM `zet_product`,`zet_product_to_category` WHERE `zet_product_to_category`.`product_id`=`zet_product`.`id` AND `zet_product_to_category`.`category_id`='".$_category."' AND `zet_product_to_category`.`is_main_category`='1'");
        while($row = $this->db->assoc($query)){
            $data[$i] = $row['url'];
            $i++;
        }
        return $data;
    }
    
    /** Перевірка наявності фото **/
    public function _checkImg($img){
        $_path = FILES.'products/'.$img;
        $_file = ROOT_FILES.'products/'.$img;
        if(empty($img)) return false;
        else {
            if(file_exists($_file)) return $_path;
            else return false;
        }
    }
    
    /** Перевірка наявності бренда **/
    public function _hasBrand($_id){
        $query = $this->db->query("SELECT `brand_id` FROM `zet_product_to_brand` WHERE `product_id`='".$_id."'");
        $result = $this->db->assoc($query);
        return ($result) ? true : false;
    }
    
    public function _getBrand($_id){
        global $lang_id;
        $query = $this->db->query("SELECT `brand_id` FROM `zet_product_to_brand` WHERE `product_id`='".$_id."'");
        $res = $this->db->assoc($query);
        $_brand = $res['brand_id'];
        
        $query = $this->db->query("SELECT `url`,`title` FROM `zet_brand`,`zet_brand_description` WHERE `zet_brand_description`.`brand_id`=`zet_brand`.`id` AND `zet_brand_description`.`language_id`='".$lang_id."' AND `zet_brand`.`id`='".$_brand."'");
        $res = $this->db->assoc($query);
        $data = array('url' => $res['url'],'title' => $res['title']);
        return $data;
    }
    
    /** Коментарі до товару **/
    public function _countComments($_id){
        $query = $this->db->query("SELECT COUNT(*) AS `total` FROM `zet_comments_to_products` WHERE `product_id`='".$_id."'");
        $res = $this->db->assoc($query);
        return $res['total'];
    }
    
    /** "Хлібні Крихти" - Breadcrumbs **/
    public function _getBreadcrumbs($_id){
        $data = array();
        $query = $this->db->query("SELECT `category_id` FROM `zet_product_to_category` WHERE `product_id`='".$_id."' AND `is_main_category`='1'");
        $row = $this->db->assoc($query);
        $_category = $row['category_id'];
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
    
    /** Характеристики товару **/
    public function _getProductProperties($_id){
        global $lang_id; $i = 0; $data = array();
        $query = $this->db->query("SELECT `property_id`, `property_value` FROM `zet_product_to_property_values` WHERE `product_id`='".$_id."'");
        while($row = $this->db->assoc($query)){
            $_property = $this->_getPropertyNameAndType($row['property_id']);
            $_property_value = $this->_getPropertyValue($row['property_id'], $_property['type']);
            $data[$i] = array('name' => $_property['name'], 'value' => $_property_value);
            $i++;
        }
        return $data;
    }
    
    public function _getPropertyNameAndType($_id){
        global $lang_id;
        $query = $this->db->query("SELECT `type`,`name` FROM `zet_product_properties`,`zet_product_properties_description` WHERE `zet_product_properties_description`.`property_id`=`zet_product_properties`.`id` AND `zet_product_properties_description`.`language_id`='".$lang_id."' AND `zet_product_properties`.`id`='".$_id."'");
        $row = $this->db->assoc($query);
        return $row;
    }
    
    public function _getPropertyValue($_id, $_type){
        global $lang_id;
        if($_type == '1' || $_type == '2') $language = "`language_id`='".$lang_id."' AND";
        $query = $this->db->query("SELECT `id`, `name`, `val_1`, `val_2`, `val_3` FROM `zet_product_properties_values` WHERE ".$language." `property_id`='".$_id."'");
        while($row = $this->db->assoc($query)){
            if($_type == '1' || $_type == '2') $res = $row['name'];
            if($_type == '3') $res = $row['val_1'];
            if($_type == '4') $res = $row['val_1'].' - '.$row['val_2'];
            if($_type == '5') $res = $row['val_1'].' × '.$row['val_2'];
            if($_type == '6') $res = $row['val_1'].' × '.$row['val_2'].' × '.$row['val_3'];
        }
        return $res;
    }
    
    /** У списку бажань **/
    public function InWishlist($_id){
        $_user = $_SESSION['USER_ID'];
        $query = $this->db->query("SELECT `id` FROM `zet_wishlist` WHERE `product_id`='".$_id."' AND `user_id`='".$_user."'");
        $result = $this->db->assoc($query);
        return ($result) ? true : false;
    }





    /** FLOR PEOPLE **/
    public function FLOR_AddProduct($data, $files) {
        $_status = ($data['status'] == "on") ? 1 : 0;
        $_new = ($data['new'] == "on") ? 1 : 0;
        $_recommended = ($data['recommended'] == "on") ? 1 : 0;
        $_hit = ($data['hit'] == "on") ? 1 : 0;
        $_date = (empty($data['create_date'])) ? date('Y-m-d') : $data['create_date'];
        $_additional = (empty($data['additional'])) ? "0" : "1";
        
        $this->db->query("INSERT INTO `zet_product` (`status`,`new`,`recommended`,`hit`,`creation_date`,`no_instock_action`,`additional`) VALUES ('".$_status."','".$_new."','".$_recommended."','".$_hit."','".$_date."','".$data['no_instock_action']."','".$_additional."')");
        $_id = $this->db->getLastId();
        
        $this->_linkTransliteration($_id, $data['url'], $data['title'][1], 'zet_product');
        
        foreach ($data['title'] as $language_id => $value) {
            $this->db->query("INSERT INTO `zet_product_description` (`product_id`,`language_id`,`title`,`description`,`meta_title`,`meta_h1`,`meta_keywords`,`meta_description`,`product_tags`,`product_ts`,`product_tm`,`product_tl`) VALUES ('".$_id."','".$language_id."','".$data['title'][$language_id]."','".$data['description'][$language_id]."','".$data['meta_title'][$language_id]."','".$data['meta_h1'][$language_id]."','".$data['meta_keywords'][$language_id]."','".$data['meta_description'][$language_id]."','".$data['product_tags'][$language_id]."','".$data['product_ts'][$language_id]."','".$data['product_tm'][$language_id]."','".$data['product_tl'][$language_id]."')");
        }
        
        if (!empty($files['picture']['name'])) {
            $_pic = $this->_uploadImg($files['picture']['name'], $files['picture']['tmp_name'], $_id, 'zet_product');
            $_picture = ROOT_FILES.'products/original_'.$_pic;
            $_big = ROOT_FILES.'products/'.$_pic;
            crop($_picture, $_big, 250, 250);
        }
        
        foreach ($data['variant_price'] as $key => $value) {
            $this->db->query("INSERT INTO `zet_product_option` (`product_id`,`article`,`price`,`real_price`,`cross_price`,`quantity`) VALUES ('".$_id."','".$data['variant_article'][$key]."','".$data['variant_price'][$key]."','".$data['variant_real_price'][$key]."','".$data['variant_cross_price'][$key]."','".$data['variant_quantity'][$key]."')");
            $_opt_id = $this->db->getLastId();
            
            foreach ($data["variant_name"] as $language_id => $value) {
                $this->db->query("INSERT INTO `zet_product_option_description` (`product_id`,`option_id`,`language_id`,`name`) VALUES ('".$_id."','".$_opt_id."','".$language_id."','".$data["variant_name"][$language_id][$key]."')");
            }
        }
        
        $this->db->query("INSERT INTO `zet_product_to_category` (`product_id`,`category_id`,`is_main_category`) VALUES ('".$_id."','".$data['main_category']."','1')");
        
        if (!empty($data['gallery_picture_name'])) {
            foreach ($data['gallery_picture_name'] as $key => $val) {
                $this->db->query("INSERT INTO `zet_product_gallery` (`product_id`,`picture_name`,`picture_title`,`picture_alt`) VALUES ('".$_id."','".$data['gallery_picture_name'][$key]."','".$data['gallery_picture_title'][$key]."','".$data['gallery_picture_alt'][$key]."')");
            }
        }
        
        if (!empty($data['product_promo_group'])) {
            foreach ($data['product_promo_group'] as $key => $val) {
                $this->db->query("INSERT INTO `zet_product_promo` (`product_id`,`userlist_group`,`type`,`value`,`start`,`end`) VALUES ('".$_id."','".$data['product_promo_group'][$key]."','".$data['product_promo_type'][$key]."','".$data['product_promo_value'][$key]."','".$data['product_promo_start'][$key]."','".$data['product_promo_end'][$key]."')");
            }
        }
        
        if (count($data["sub_category"]) > 0) {
            foreach ($data["sub_category"] as $key => $val) {
                $this->db->query("INSERT INTO `zet_product_to_category` (`product_id`,`category_id`) VALUES ('".$_id."','".$data["sub_category"][$key]."')");
            }
        }
    }

    public function FLOR_EditProduct($_id, $data, $files){
        $_status = ($data['status'] == "on") ? 1 : 0;
        $_new = ($data['new'] == "on") ? 1 : 0;
        $_recommended = ($data['recommended'] == "on") ? 1 : 0;
        $_hit = ($data['hit'] == "on") ? 1 : 0;
        $_date = (empty($data['create_date'])) ? date('Y-m-d') : $data['create_date'];

        $this->db->query("UPDATE `zet_product` SET `status`='".$_status."',`new`='".$_new."',`recommended`='".$_recommended."',`hit`='".$_hit."',`creation_date`='".$_date."',`no_instock_action`='".$data['no_instock_action']."' WHERE `id`='".$_id."'");

        $this->_linkTransliteration($_id, $data['url'], $data['title'][1], 'zet_product');

        $this->db->query("DELETE FROM `zet_product_description` WHERE `product_id`='".$_id."'");
        foreach($data['title'] as $language_id => $value) {
            $this->db->query("INSERT INTO `zet_product_description` (`product_id`,`language_id`,`title`,`description`,`meta_title`,`meta_h1`,`meta_keywords`,`meta_description`,`product_tags`,`product_ts`,`product_tm`,`product_tl`) VALUES ('".$_id."','".$language_id."','".$data['title'][$language_id]."','".$data['description'][$language_id]."','".$data['meta_title'][$language_id]."','".$data['meta_h1'][$language_id]."','".$data['meta_keywords'][$language_id]."','".$data['meta_description'][$language_id]."','".$data['product_tags'][$language_id]."','".$data['product_ts'][$language_id]."','".$data['product_tm'][$language_id]."','".$data['product_tl'][$language_id]."')");
        }

        if(!empty($files['picture']['name'])) {
            $_pic = $this->_uploadImg($files['picture']['name'], $files['picture']['tmp_name'], $_id, 'zet_product');
            $_picture = ROOT_FILES.'products/original_'.$_pic;
            $_big = ROOT_FILES.'products/'.$_pic;
            crop($_picture, $_big, 250, 250);
        }

        $this->db->query("DELETE FROM `zet_product_option_description` WHERE `product_id`='".$_id."'");
        foreach($data['variant_price'] as $key => $value) {
            $query = $this->db->query("SELECT `id` FROM `zet_product_option` WHERE `id`='".$key."'");
            $row = $this->db->assoc($query);
            if($row){
                $this->db->query("UPDATE `zet_product_option` SET `product_id`='".$_id."',`article`='".$data['variant_article'][$key]."',`price`='".$data['variant_price'][$key]."',`real_price`='".$data['variant_real_price'][$key]."',`cross_price`='".$data['variant_cross_price'][$key]."',`quantity`='".$data['variant_quantity'][$key]."' WHERE `id`='".$key."'");
                $_opt_id = $key;
            } else {
                $this->db->query("INSERT INTO `zet_product_option`(`product_id`,`article`,`price`,`real_price`,`cross_price`,`quantity`) VALUES ('".$_id."','".$data['variant_article'][$key]."','".$data['variant_price'][$key]."','".$data['variant_real_price'][$key]."','".$data['variant_cross_price'][$key]."','".$data['variant_quantity'][$key]."')");
                $_opt_id = $this->db->getLastId();
            }

            foreach($data["variant_name"] as $language_id => $value){
                $this->db->query("INSERT INTO `zet_product_option_description`(`product_id`,`option_id`,`language_id`,`name`) VALUES ('".$_id."','".$_opt_id."','".$language_id."','".$data["variant_name"][$language_id][$key]."')");
            }
        }

        $this->db->query("DELETE FROM `zet_product_to_category` WHERE `product_id`='".$_id."'");
        $this->db->query("INSERT INTO `zet_product_to_category`(`product_id`,`category_id`,`is_main_category`) VALUES ('".$_id."','".$data['main_category']."','1')");

        $this->db->query("DELETE FROM `zet_product_gallery` WHERE `product_id`='".$_id."'");
        if(!empty($data['gallery_picture_name'])){
            foreach($data['gallery_picture_name'] as $key => $val){
                $this->db->query("INSERT INTO `zet_product_gallery`(`product_id`,`picture_name`,`picture_title`,`picture_alt`) VALUES ('".$_id."','".$data['gallery_picture_name'][$key]."','".$data['gallery_picture_title'][$key]."','".$data['gallery_picture_alt'][$key]."')");
            }
        }

        $this->db->query("DELETE FROM `zet_product_promo` WHERE `product_id`='".$_id."'");
        if(!empty($data['product_promo_group'])){
            foreach($data['product_promo_group'] as $key => $val){
                $this->db->query("INSERT INTO `zet_product_promo`(`product_id`,`userlist_group`,`type`,`value`,`start`,`end`) VALUES ('".$_id."','".$data['product_promo_group'][$key]."','".$data['product_promo_type'][$key]."','".$data['product_promo_value'][$key]."','".$data['product_promo_start'][$key]."','".$data['product_promo_end'][$key]."')");
            }
        }
        
        if (count($data["sub_category"]) > 0) {
            foreach ($data["sub_category"] as $key => $val) {
                $this->db->query("INSERT INTO `zet_product_to_category` (`product_id`,`category_id`) VALUES ('".$_id."','".$data["sub_category"][$key]."')");
            }
        }
    }
    
    public function FLOR_GetProducts($data, $language_id, $additional = 0) {
        $_bool = (empty($data['pg'])) ? false : true;
        $_page = ($data['pg'] > 0) ? $data['pg'] - 1: $data['pg'];

        switch($data['on_page']){
            case '':
                $_products_per_page = config('products_per_admin_page');
                $_initial_product = ($_bool) ? $_page * $_products_per_page : 0;
                $_limit = "LIMIT {$_initial_product},{$_products_per_page}";
                break;
            case 'all': $_limit = ""; break;
            default:
                $_products_per_page = $data['on_page'];
                $_initial_product = ($_bool) ? $_page * $_products_per_page : 0;
                $_limit = "LIMIT {$_initial_product},{$_products_per_page}";
                break;
        }

        $order = "ORDER BY `creation_date` DESC, `id` DESC";
        if(!empty($data["sort"])){
            $sort = explode('_', $data["sort"]);
            $sort[1] = ($sort[1] == "old") ? "ASC" : "DESC";
            $sort[0] = ($sort[0] == "cross") ? "cross_price" : $sort[0];
            $order = " ORDER BY `{$sort[0]}` {$sort[1]}";
        }

        $query = $this->db->query("
            SELECT `zet_product`.`id`,`status`,`new`,`recommended`,`hit`,`url`,`title`,`zet_product`.`picture`
            FROM `zet_product`,`zet_product_description`,`zet_product_option`
            WHERE `zet_product_option`.`product_id`=`zet_product`.`id`
            AND `zet_product_description`.`product_id`=`zet_product`.`id`
            AND `zet_product_description`.`language_id`='".$language_id."'
            AND `zet_product`.`additional`='".$additional."' 
            GROUP BY `zet_product`.`id` {$order} {$_limit}");
        return $query;
    }
    
    public function GetRandomProducts($quantity = 10) {
        global $lang_id;
        $data = array();
        $_limit = "LIMIT 0,{$quantity}";
        $_order = "ORDER BY RAND()";
        
        $query = $this->db->query("SELECT `zet_product`.`id` AS `id`,`new`,`recommended`,`hit`,`url`,`title`,`zet_product`.`picture`,`price`,`quantity`,`cross_price` FROM `zet_product`,`zet_product_description`,`zet_product_option` WHERE `zet_product_option`.`product_id`=`zet_product`.`id` AND `zet_product_description`.`product_id`=`zet_product`.`id` AND `zet_product_description`.`language_id`='".$lang_id."' AND `zet_product`.`status`='1' AND `zet_product`.`additional`='0' GROUP BY `zet_product`.`id` {$_order} {$_limit}");
        while ($row = $this->db->assoc($query)) {
            $query_category = $this->db->query("SELECT `url` FROM `zet_category`,`zet_product_to_category` WHERE `zet_product_to_category`.`product_id`='".$row['id']."' AND `zet_product_to_category`.`is_main_category`='1' AND `zet_product_to_category`.`category_id`=`zet_category`.`id`");
            $row_category = $this->db->assoc($query_category);
            $data[$row["id"]] = $row;
            $data[$row["id"]]["category"] = $row_category["url"];
            $data[$row["id"]]["price"] = NewPrice($row["price"]);
        }
        return $data;
    }
    
    public function GetProductGallery($url){
        $data = array();
        $query = $this->db->query("SELECT `picture_name` FROM `zet_product_gallery`,`zet_product` WHERE `zet_product_gallery`.`product_id`=`zet_product`.`id` AND `zet_product`.`url`='".$url."'");
        while ($row = $this->db->assoc($query)) {
            $data[] = $row;
        }
        return $data;
    }
    
    public function GetProductDescription($url) {
        global $lang_id;
        $query = $this->db->query("SELECT `title`,`description`,`product_ts`,`product_tm`,`product_tl` FROM `zet_product`,`zet_product_description` WHERE `zet_product_description`.`product_id`=`zet_product`.`id` AND `zet_product_description`.`language_id`='".$lang_id."' AND `zet_product`.`url`='".$url."'");
        $row = $this->db->assoc($query);
        $data = $row;
        return $data;
    }
    
    public function GetProductVariants($url) {
        global $lang_id;
        $query = $this->db->query("
        SELECT `zet_product`.`id` AS `id`,`zet_product_option`.`id` AS `option_id`,`price`,`cross_price`,`name` 
        FROM `zet_product_option`,`zet_product_option_description`,`zet_product` 
        WHERE `zet_product_option`.`product_id`=`zet_product`.`id` AND `zet_product_option_description`.`product_id`=`zet_product`.`id` AND `zet_product_option_description`.`option_id`=`zet_product_option`.`id` AND `zet_product_option_description`.`language_id`='".$lang_id."' AND `zet_product`.`url`='".$url."' ORDER BY `zet_product_option`.`id` ASC");
        while ($row = $this->db->assoc($query)) {
            $row["price"] = NewPrice($row["price"]);
            $data[] = $row;
        }
        return $data;
    }
    
    public function GetNextProduct($url) {
        $id = $this->GetProductId($url);
        $category = $this->GetProductCategory($id);
        
        $query = $this->db->query("SELECT `url` FROM `zet_product` WHERE `id`=(SELECT MIN(`id`) FROM `zet_product` WHERE `id`>'".$id."' AND `additional`='0')");
        $row = $this->db->assoc($query);
        
        if (empty($row["url"])) {
            $query = $this->db->query("SELECT `url` FROM `zet_product` ORDER BY `id` ASC LIMIT 1");
            $row = $this->db->assoc($query);
        }
        
        $data["url"] = $row["url"];
        $data["category"] = $category;
        return $data;
    }
    
    public function GetPreviousProduct($url) {
        $id = $this->GetProductId($url);
        $category = $this->GetProductCategory($id);
        
        $query = $this->db->query("SELECT `url` FROM `zet_product` WHERE `id`=(SELECT MAX(`id`) FROM `zet_product` WHERE `id`<'".$id."' AND `additional`='0')");
        $row = $this->db->assoc($query);
        
        if (empty($row["url"])) {
            $query = $this->db->query("SELECT `url` FROM `zet_product` ORDER BY `id` DESC LIMIT 1");
            $row = $this->db->assoc($query);
        }
        
        $data["url"] = $row["url"];
        $data["category"] = $category;
        return $data;
    }
    
    public function GetProductCategoryByUrl($url) {
        $id = $this->GetProductId($url);
        $category = $this->GetProductCategory($id);
        return $category;
    }
    
    private function GetProductId($url) {
        $query = $this->db->query("SELECT `id` FROM `zet_product` WHERE `url`='".$url."'");
        $row = $this->db->assoc($query);
        return $row["id"];
    }
    
    private function GetProductCategory($id) {
        $query = $this->db->query("SELECT `url` FROM `zet_category`,`zet_product_to_category` WHERE `zet_product_to_category`.`product_id`='".$id."' AND `zet_product_to_category`.`is_main_category`='1' AND `zet_product_to_category`.`category_id`=`zet_category`.`id`");
        $row = $this->db->assoc($query);
        return $row["url"];
    }
}