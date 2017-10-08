<?php
/* ----- global ----- */
function config($param) {
    if(file_exists(ROOT.'setup/config.dev.inc')){
        $config_path = ROOT.'setup/config.dev.inc';
    }else{
        $config_path = ROOT.'setup/config.inc';
    }
    $file = file_get_contents($config_path);
    $repl = PHP_OS == 'WINNT' ? "\r\n" : "\n";
    $file = str_replace($repl, '', $file);
    $exp = explode(");", $file);
    for($i = 0; $i <= count($exp) - 2; $i++) {
        list($var, $value) = explode("=(", $exp[$i]);
        $config[$var] = ($value);
    }
    return $config[$param];
}

function findFile($dir, $tosearch){
    $files = array_diff(scandir($dir), Array(".", ".."));
    foreach($files as $d){
        if(!is_dir($dir."/".$d)){
            if($d == $tosearch) {
                $path = $dir."/".$d;
                $path = str_replace(ROOT, SRV, $path);
                return $path;
            }
        } else {
            $res = findFile($dir."/".$d, $tosearch);
            if($res){
                $path = $res;
                $path = str_replace(ROOT, SRV, $path);
                return $path;
            }
        }
    }
    return false;
}

function getFile($tosearch){
    $res = findFile(ROOT_FILES_FIND, $tosearch);
    if($res) return $res;
    else return ADM_SKIN."image/nophoto.jpg";
}

function encoding($enc) {
    return header('Content-type: text/html; charset='.$enc);
}

function redirectTo($link) {
    echo "<script>document.location.href='{$link}';</script>";
}

function substr_function($string, $count) {
    if($count < strlen($string)) {
        $string = iconv('UTF-8', 'windows-1251', $string );
        $string = substr($string, 0, $count);
        $string = iconv('windows-1251', 'UTF-8', $string );
        $string .='...';
    }
    return $string;
}

function translite($str) {
    static $tbl = array(
        'а'=>'a',   'б'=>'b',   'в'=>'v',   'г'=>'g',   'д'=>'d',   'е'=>'e',   'ж'=>'g',   'з'=>'z',
        'и'=>'i',   'й'=>'y',   'к'=>'k',   'л'=>'l',   'м'=>'m',   'н'=>'n',   'о'=>'o',   'п'=>'p',
        'р'=>'r',   'с'=>'s',   'т'=>'t',   'у'=>'u',   'ф'=>'f',   'ы'=>'i',   'э'=>'e',   'А'=>'A',
        'Б'=>'B',   'В'=>'V',   'Г'=>'G',   'Д'=>'D',   'Е'=>'E',   'Ж'=>'G',   'З'=>'Z',   'И'=>'I',
        'Й'=>'Y',   'К'=>'K',   'Л'=>'L',   'М'=>'M',   'Н'=>'N',   'О'=>'O',   'П'=>'P',   'Р'=>'R',
        'С'=>'S',   'Т'=>'T',   'У'=>'U',   'Ф'=>'F',   'Ы'=>'I',   'Э'=>'E',   'ё'=>'yo',  'х'=>'h',
        'ц'=>'ts',  'ч'=>'ch',  'ш'=>'sh',  'щ'=>'shch','ъ'=>'',    'ь'=>'',    'ю'=>'yu',  'я'=>'ya',
        'Ё'=>'YO',  'Х'=>'H',   'Ц'=>'TS',  'Ч'=>'CH',  'Ш'=>'SH',  'Щ'=>'SHCH','Ъ'=>'',    'Ь'=>'',
        'Ю'=>'YU',  'Я'=>'YA',  ' '=>'_',   'і'=>'i',   'І'=>'I',   'Ї'=>'I',   'ї'=>'i',   'Є'=>'E',
        'є'=>'e',   '.'=>'',    ' - '=>'_', '-'=>'_',   ':'=>'',    '"'=>'',    ','=>'',    '«'=>'',
        '»'=>'',    '!'=>'',    '?'=>'',    '('=>'',    ')'=>'',    '\''=>'',   '$'=>'',    '`'=>'',
        '~'=>'',    '+'=>'',    '’'=>'',    '—'=>'_',   ' — '=>'_', ' – '=>'_', '–'=>'_',   '%'=>'',
        '/'=>'',    '&'=>'',    "®"=>'',    '\\'=>'',   '@'=>'',    '#'=>'',    '^'=>'',    '*'=>'',
        '='=>'',    '['=>'',    ']'=>'',    '{'=>'',    '}'=>'',    ','=>'',    '<'=>'',    '>'=>'',
        ';'=>'',    '|'=>'',    '№'=>'',    'ґ'=>'g',   'Ґ'=>'G');
    return strtolower(strtr($str, $tbl));
}

/** Реалізація параметрів GET запитів **/
function lRequest($param = null, $value = null) {
    $res = "?";
    foreach ($_GET as $key => $val) {
        if (is_array($val)) {
            foreach ($val as $k => $v) {
                $res .= $key."[]=".$v."&";
            }
        } else if ($param != $key) {
            $res .= $key."=".$val."&";
        }
    }
    if ($param && $value) $res .= $param."=".$value."&";
    $res = substr($res, 0, -1);
    return $res;
}

function defcurrency() {
    global $mysql;
    
    $str = "SELECT `id`,`abbr`,`code` FROM `zet_currency` WHERE `default`='1'";
    $query = $mysql->query($str);
    $res = $mysql->assoc($query);
    
    return $res;
}

function loadcurrency($code) {
    global $mysql;
    
    $query = $mysql->query("SELECT `id`,`abbr`,`code`,`default`,`rate` FROM `zet_currency` WHERE `code`='".$code."'");
    $res = $mysql->assoc($query);
    
    return $res;
}

function NewPriceByCurrency($price){
    global $site_currency;
    $default_currency = defcurrency();
    
    if($site_currency['id'] == $default_currency['id']){
        return $price;
    } else {
        $new_price = $price/$site_currency['rate'];
        $new_price = round($new_price, 2);
        return $new_price;
    }
}
/* ----- language ----- */
function deflang($admin_lang = false) {
    global $mysql;
    
    $lang = ($admin_lang == false) ? "store_default" : "admin_default";
    $str = "SELECT `id`,`code` FROM `zet_language` WHERE `{$lang}`='1'";
    $query = $mysql->query($str);
    $res = $mysql->assoc($query);
    
    return $res;
}

function language() {
	define(LANG, $_SESSION['lang']);
    langDefiner(LANG);
}

function langDefiner($lang, $admin_lang = false) {
    $category = ($admin_lang == false) ? ROOT : ADM_ROOT;
    $path = $category."lang/".$lang.".inc";
    $file = file_exists($path) ? file_get_contents($path) : false;
    $exp = explode(PHP_EOL, $file);
    foreach($exp as $values) {
        list($key, $val) = explode("=", $values);
        $key = trim($key);
        $val = trim($val);
        define($key, $val);
    }
}

/* ----- mySql ----- */
    
function check_translite($arr){
    if(empty($arr['url'])){
        reset($arr['title']);
        $title = current($arr['title']);
        $arr['url'] = translite($title);
        $url = getRow('id', $table, 'url', $arr['url']);
        if($url == false || empty($url)) $arr['url'] = str_replace(" ", "_", $arr['url']);
        else $arr['url'] .= "_".rand();
        
        return $arr['url'];
    } else {
        $urls = getRow('url', $table, $row, $row_val);
        if($urls == false || empty($urls)){
            $url = getRow('id', $table, 'url', $arr['url']);
            if($url == false || empty($url)){
                reset($arr['title']);
                $title = current($arr['title']);
                $arr['url'] = translite($title);
                $arr['url'] = str_replace(" ", "_", $arr['url']);
                
                return $arr['url'];
            }else{
                reset($arr['title']);
                $title = current($arr['title']);
                $arr['url'] = translite($title);
                $arr['url'] = str_replace(" ", "_", $arr['url']);
                $arr['url'] .= "_".rand();
                
                return $arr['url'];
            }
        }
    }
}

function upload_files($arr, $id = false){
    if(!empty($arr[$key]['name'])){
        $uploaddir = ROOT.'files/'.$table.'/';
        $temp = explode(".", $arr[$key]['name']);
        $extension = end($temp);
        $uploadfile = rand().'_'.time().'.'.$extension;
        
        if(copy($arr[$key]['tmp_name'], $uploaddir.$uploadfile)){
            if($id != false){ $row = 'id'; $row_val = $id; }
            $str = "UPDATE `{$table}` SET `{$key}`='{$uploadfile}' WHERE `{$row}`='{$row_val}'";
            $query = $mysql->query($str) or die(mysql_error());
            return $uploadfile;
        }
        
        else die(PIC_UPLOAD_ERROR);
    }
}

function crop($file_input, $file_output, $width = 200, $height = 200, $unlink = true){
    $os = getimagesize($file_input);
    if($os[2] == 2 || ($os[2] >= 9 && $os[2] <= 12)) $image = ImageCreateFromJPEG($file_input);
    if($os[2] == 3) $image = ImageCreateFromPng($file_input);
    if($os[2] == 1) $image = ImageCreateFromGIF($file_input);
    
    //4 = SWF, 5 = PSD, 6 = BMP, 7 = TIFF(байтовый порядок intel), 8 = TIFF(байтовый порядок motorola).
    
    $filename = $file_output;
    $thumb_width = $width;
    $thumb_height = $height;
    $width = imagesx($image);
    $height = imagesy($image);
    $original_aspect = $width / $height;
    $thumb_aspect = $thumb_width / $thumb_height;
    
    if($original_aspect >= $thumb_aspect){
        // If image is wider than thumbnail (in aspect ratio sense)
        $new_height = $thumb_height;
        $new_width = $width/($height/$thumb_height);
    } else {
        // If the thumbnail is wider than the image
        $new_width = $thumb_width;
        $new_height = $height/($width/$thumb_width);
    }
    if($unlink) unlink($file_input);
    $thumb = imagecreatetruecolor($thumb_width, $thumb_height);
    // Resize and crop
    imagecopyresampled($thumb, $image, 0 - ($new_width - $thumb_width)/2, 0 - ($new_height - $thumb_height)/2, 0, 0, $new_width, $new_height, $width, $height);
    if($os[2] == 3) imagepng($thumb, $filename, 0);
    else imagejpeg($thumb, $filename, 100);
}

function watermark($_photo, $_stamp){
    $stamp = imagecreatefrompng($_stamp);
	$im = imagecreatefromjpeg($_photo);
    $_path = $_photo;
    
    $_position = config('water_mark_position');
    
    switch($_position){
        case 1:
			/* RIGHT BOTTOM */
			$margin_lr = 10;
			$margin_tb = 10;
			$px = imagesx($im);
			$py = imagesy($im);
			$sx = imagesx($stamp);
			$sy = imagesy($stamp);
			
			$x = $px - $sx - $margin_lr;
			$y = $py - $sy - $margin_tb;
		break;
        case 2:
			/* LEFT BOTTOM */
			$margin_lr = 10;
			$margin_tb = 10;
			$px = 0;
			$py = imagesy($im);
			$sx = 0;
			$sy = imagesy($stamp);
			
			$x = $px + $sx + $margin_lr;
			$y = $py - $sy - $margin_tb;
		break;
        case 3:
			/* RIGHT TOP */
			$margin_lr = 10;
			$margin_tb = 10;
			$px = imagesx($im);
			$py = 0;
			$sx = imagesx($stamp);
			$sy = 0;
			
			$x = $px - $sx - $margin_lr;
			$y = $py + $sy + $margin_tb;
		break;
        case 4:
			/* LEFT TOP */
			$margin_lr = 10;
			$margin_tb = 10;
			$px = 0;
			$py = 0;
			$sx = 0;
			$sy = 0;
			
			$x = $px + $sx + $margin_lr;
			$y = $py + $sy + $margin_tb;
		break;
		default:
			/* CENTER */
			$px = imagesx($im);
			$py = imagesy($im);
			$sx = imagesx($stamp);
			$sy = imagesy($stamp);
			
			$x = ($px/2) - ($sx/2);
			$y = ($py/2) - ($sy/2);
		break;
	}
    
    imagecopy($im, $stamp, $x, $y, 0, 0, imagesx($stamp), imagesy($stamp));
    
    imagejpeg($im, $_path);
    imagedestroy($im);
}



function Pcrop($file_input, $file_output) {
    $os = getimagesize($file_input);
    if($os[2] == 2 || ($os[2] >= 9 && $os[2] <= 12)) $image = ImageCreateFromJPEG($file_input);
    if($os[2] == 3) $image = ImageCreateFromPng($file_input);
    if($os[2] == 1) $image = ImageCreateFromGIF($file_input);
    
    //4 = SWF, 5 = PSD, 6 = BMP, 7 = TIFF(байтовый порядок intel), 8 = TIFF(байтовый порядок motorola).
    
    $width = 200;
    $height = ($width * $os[1]) / $os[0];
    
    $filename = $file_output;
    $thumb_width = $width;
    $thumb_height = $height;
    
    $width = imagesx($image);
    $height = imagesy($image);
    $original_aspect = $width / $height;
    $thumb_aspect = $thumb_width / $thumb_height;
    
    $new_width = $thumb_width;
    $new_height = $height / ($width / $thumb_width);
    
    unlink($file_input);
    $thumb = imagecreatetruecolor($thumb_width, $thumb_height);
    
    if ($os[2] == 3) {
        imagealphablending($thumb, false);
        imagesavealpha($thumb, true);
    }
    
    imagecopyresampled($thumb, $image, 0 - ($new_width - $thumb_width)/2, 0 - ($new_height - $thumb_height)/2, 0, 0, $new_width, $new_height, $width, $height);
    if ($os[2] == 3) imagepng($thumb, $filename, 0);
    else imagejpeg($thumb, $filename, 100);
}