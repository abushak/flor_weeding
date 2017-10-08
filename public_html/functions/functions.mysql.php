<?php
function getRow($row_needle, $table, $row_index, $row_val) {
    global $mysql;
    
    $row_val = mysql_real_escape_string($row_val);
    $str = "SELECT `{$row_needle}` FROM `{$table}` WHERE `{$row_index}`=".(strstr($row_val, "(SELECT") ? $row_val : (strstr($row_val, "AND") ? $row_val : "'{$row_val}'"));
    $query = $mysql->query($str) or die(mysql_error());
    $row = $mysql->assoc($query);
    
    return myLangFilter($row[$row_needle]);
}

function mysql_select_where($table, $row, $row_val) {
    global $mysql;
    
    $row_val = mysql_real_escape_string($row_val);
    $str = "SELECT * FROM `{$table}` WHERE `{$row}`='{$row_val}'";
    $query = $mysql->query($str) or die(mysql_error());
    $row = $mysql->assoc($query);
    
    return $row;
}

function mysql_delete($table, $row, $row_val, $mess = false) {
    global $mysql, $route;
    
    $row_val = mysql_real_escape_string($row_val);
    $str = "DELETE FROM `{$table}` WHERE `{$row}`='{$row_val}'";
    $query = $mysql->query($str) or die(mysql_error());
    
    if($query and $mess) {
        if(intval($mess)) redirectTo(ADM_SRV.$route[2].'/?m='.$mess);
        else redirectTo($mess);
    }
}

function mysql_update($table, $row, $row_val, $mess = false) {
	global $mysql, $route;
    
    $row_val = mysql_real_escape_string($row_val);
    if(array_key_exists('url', $_POST)){
        $_POST['url'] = check_translite($_POST);
    }
    
    $str = "UPDATE `{$table}` SET ";
    foreach($_POST as $key => $val) {
        $val = is_array($val) ? implode("||+||", mysql_real_escape_string($val)) : mysql_real_escape_string($val);
        if(!strstr($key, "file")) $str .= "`{$key}`='{$val}',";
	}
    $str = substr($str, 0, -1);
    $str .= " WHERE `{$row}`='{$row_val}'";
    $query = $mysql->query($str) or die(mysql_error());
    
    foreach($arr as $key => $value){
        $uploaddir = ROOT.'files/'.$table.'/';
        $uploadfile = upload_files($_FILES);
        $targetThumbFile = $uploaddir.'th_'.$uploadfile;
        $targetFile = $uploaddir.$uploadfile;
        $width = 200;
        $height = 200;
        crop($targetFile, $targetThumbFile, $width, $height);
    }
    
    if($query and $mess) {
        if(intval($mess)) redirectTo(ADM_SRV . $route[2] . '/?m=' . $mess);
        else redirectTo($mess);
    }
}

function mysql_update_single_value($table, $row, $row_val, $where, $where_val) {
    global $mysql, $route;
    
    $row_val = mysql_real_escape_string($row_val);
    $where_val = mysql_real_escape_string($where_val);
    $str = "UPDATE `{$table}` SET `{$row}`='{$row_val}' WHERE `{$where}`='{$where_val}'";
	$query = $mysql->query($str) or die(mysql_error());
    
    foreach($arr as $key => $value){
        $uploaddir = ROOT.'files/'.$table.'/';
        $uploadfile = upload_files($_FILES, $row['id']);
        $targetThumbFile = $uploaddir.'th_'.$uploadfile;
        $targetFile = $uploaddir.$uploadfile;
        $width = 200;
        $height = 200;
        crop($targetFile, $targetThumbFile, $width, $height);
    }
}

function mysql_insert($table, $vars, $mess = false) {
    global $mysql, $route;
    
    if(array_key_exists('url', $vars)){
        $vars['url'] = check_translite($vars);
    }
    
    $str = 'INSERT INTO `'.$table.'` (';
    foreach($vars as $key => $val) { if(!strstr($key, "file")) $str .= '`'.$key.'`,'; }
    $str = substr($str, 0, -1);
    $str .= ') VALUES (';
    foreach($vars as $key => $val) {
        $val = is_array($val) ? implode("||+||", mysql_real_escape_string($val)) : mysql_real_escape_string($val);
        if(!strstr($key, "file")) $str .= '"'.mysql_real_escape_string($val).'",';
    }
    $str = substr($str, 0, -1);
    $str .= ')';
    
    $query = $mysql->query($str) or die(mysql_error());
    
    $str = 'SELECT `id` FROM `'.$table.'` ORDER BY `id` DESC LIMIT 1';
    $query = $mysql->query($str) or die(mysql_error());
    $row = $mysql->assoc($query);
    
    foreach($arr as $key => $value){
        $uploaddir = ROOT.'files/'.$table.'/';
        $uploadfile = upload_files($_FILES, $row['id']);
        $targetThumbFile = $uploaddir.'th_'.$uploadfile;
        $targetFile = $uploaddir.$uploadfile;
        $width = 200;
        $height = 200;
        crop($targetFile, $targetThumbFile, $width, $height);
    }
    
    if($mess) {
        if(intval($mess)) redirectTo(ADM_SRV.$route[2].'/?m='.$mess);
        else redirectTo($mess);
    }
}

function autoIncrementValue($table) {
    $query = mysql_query("SHOW TABLE STATUS LIKE '{$table}'");
    $id = mysql_result($query, 0, 'Auto_increment');
    return $id;
}

function countRows($table) {
    $query = mysql_query("SELECT COUNT(*) FROM `{$table}`");
    $id = ($query == false) ? "0" : mysql_result($query, 0, 'COUNT(*)');
    return $id;
}

function countWhere($table, $where) {
    $query = mysql_query("SELECT COUNT(*) FROM `{$table}` {$where}");
    $id = mysql_result($query, 0, 'COUNT(*)');
    return $id;
}

function showFiles($table) {
    global $mysql, $skinUrl, $route;
    $str = 'SELECT * FROM `'.$table.'` ORDER BY `priority` ASC';
    $query = $mysql->query($str) or die(mysql_error());
    while($row = $mysql->assoc($query)) {
        $file = findFile(ROOT_FILES_FIND, $row['picture']);
        ADM_TPL.'admin/files.tpl';
    }
}


function showFilesWhere($table, $where) {
    global $mysql, $skinUrl, $route;
    $str = "SELECT * FROM `{$table}` WHERE {$where} ORDER BY `priority` ASC";
    $query = $mysql->query($str) or die(mysql_error());
    while($row = $mysql->assoc($query)) {
        $file = findFile(ROOT_FILES_FIND, $row['picture']);
        ADM_TPL.'admin/files.tpl';
    }
}