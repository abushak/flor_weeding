<?php
$link = $_POST['link'];
$file = str_replace(SRV, ROOT, $link);
if($file != ROOT.'adminside/skins/image/nophoto.jpg') unlink($file);

if(file_exists(ROOT.'setup/config.dev.inc')){
    $path = ROOT.'setup/config.dev.inc';
}else{
    $path = ROOT.'setup/config.inc';
}
$file = file_get_contents($path);
$exp = explode(');', $file);
for($i = 0; $i <= count($exp) - 2; $i++) {
    list($var, $value) = explode('=(', $exp[$i]);
    foreach($_POST as $key => $val) {
        if(strstr($var, $key)) $value = $val;
        if(strstr($var, "water_mark_img")) $value = "";
    }
    $text .= $var.'=('.$value.');';
}

$file = fopen($path, 'w');
fwrite($file, $text . "\r\n");
fclose($file);
