<?php
function addClassNav($route_id, $value, $class, $empty = false) {
    global $route;
    
    if($empty) { $res = ($route[$route_id] == $value || empty($route[$route_id])) ? "class='{$class}'" : false; }
    else { $res = ($route[$route_id] == $value) ? "class='{$class}'" : false; }
    
    return $res;
}

function routesToLink($last_route, $first_route = 1) {
    global $route;
    
    $res = "";
    for($i = $first_route; $i <= $last_route; $i++){ $res .= $route[$i].DS; }
    
    return $res;
}









function createArray($data) {
    $glob_array = array();
    foreach(explode(",", $data) as $array){
        list($key, $val) = explode("=>", $array);
        if(preg_match("/\[(.*?)\]/", $key, $matches)) {
            $key = preg_replace("/(\[.*?\])/", "", $key);
            $glob_array[trim($key)][$matches[1]] = trim($val);
        } else {
            $glob_array[trim($key)] = trim($val);
        }
    }
    
    end($glob_array);
    $array_last_key = key($glob_array);
    if(empty($array_last_key)) array_pop($glob_array);
    return $glob_array;
}

function getNotification() {
    $file = file_get_contents(ROOT.'adminside/setup/messages_'.config('deflang').'.inc');
    $repl = PHP_OS == 'WINNT' ? "\r\n" : "\n";
    $file = str_replace($repl, '', $file);
    $exp = explode(';', $file);
    for($i = 0; $i <= count($exp) - 2; $i++) {
        list($var, $value) = explode('=', $exp[$i]);
        $messages[$var] = $value;
    }
    
    $res = $messages[$_GET['m']];
    
    return $res;
}

function langToStrConv($row, $str) {
    list($temp_ua, $temp_ru, $temp_en) = explode('||+||', $row[$str]);
    $row[$str] = ${'temp_' . config('deflang')};
    
    return $row;
}