<?php
function getLanguageIdByCode($code){
    global $mysql;
    
    $query = $mysql->query("SELECT `id` FROM `zet_language` WHERE `code`='".$code."'");
    $res = $mysql->assoc($query);
    
    return $res['id'];
}

function langActive($code){
    global $route, $language;
    $class = ($route[0] == $code || (empty($route[0]) && $code == $language['code'])) ? 'class="lang_active"' : false;
    return $class;
}

function langChange($link, $lang_code){
    global $route, $deflang;
    
    $cur_link = array_del_empty($route);
    if(!empty($route[0])) array_shift($cur_link);
    if($lang_code != $deflang) array_unshift($cur_link, $lang_code);
    $links = implode('/', $cur_link);
    
    return SRV.$links;
}

function declension($val, $words){
    $words = explode('_', $words);
    $val = (int)$val;
    $num = substr($val, -1);
    if($num == 1){
        if(strlen($val) > 1) $res = (substr($val, -2, 1) == 1) ? $words[2] : $words[0];
        else $res = $words[0];
    } elseif($num > 1 && $num < 5){
        if(strlen($val) > 1) $res = (substr($val, -2, 1) == 1) ? $words[2] : $words[1];
        else $res = $words[1];
    } else {
        $res = $words[2];
    }
    return $res;
}

function getTitlebyUrl($table, $url, $column_name){
    global $mysql, $lang_id;
    
    $query = $mysql->query("SELECT `title` FROM `".$table."`,`".$table."_description` WHERE `".$table."_description`.`".$column_name."_id`=`".$table."`.`id` AND `".$table."_description`.`language_id`='".$lang_id."' AND `".$table."`.`url`='".$url."'");
    $res = $mysql->assoc($query);
    return $res['title'];
}

function getTitleById($table, $id, $column_name){
    global $mysql, $lang_id;
    
    $query = $mysql->query("SELECT `title` FROM `".$table."`,`".$table."_description` WHERE `".$table."_description`.`".$column_name."_id`=`".$table."`.`id` AND `".$table."_description`.`language_id`='".$lang_id."' AND `".$table."`.`id`='".$id."'");
    $res = $mysql->assoc($query);
    return $res['title'];
}

function getH1byUrl($table, $url, $column_name){
    global $mysql, $lang_id;
    
    $query = $mysql->query("SELECT IF(`meta_h1`='', `title`, `meta_h1`) AS `h1` FROM `".$table."`,`".$table."_description` WHERE `".$table."_description`.`".$column_name."_id`=`".$table."`.`id` AND `".$table."_description`.`language_id`='".$lang_id."' AND `".$table."`.`url`='".$url."'");
    $res = $mysql->assoc($query);
    return $res['h1'];
}

function getDescriptionbyUrl($table, $url, $column_name){
    global $mysql, $lang_id;
    
    $query = $mysql->query("SELECT `description` FROM `".$table."`,`".$table."_description` WHERE `".$table."_description`.`".$column_name."_id`=`".$table."`.`id` AND `".$table."_description`.`language_id`='".$lang_id."' AND `".$table."`.`url`='".$url."'");
    $res = $mysql->assoc($query);
    return $res['description'];
}

function getProductIdByUrl($_url){
    global $mysql;
    
    $query = $mysql->query("SELECT `id` FROM `zet_product` WHERE `url`='".$_url."'");
    $res = $mysql->assoc($query);
    return $res['id'];
}

function getUrlById($table, $id){
    global $mysql;
    $query = $mysql->query("SELECT `url` FROM `".$table."` WHERE `id`='".$id."'");
    $res = $mysql->assoc($query);
    return $res['url'];
}