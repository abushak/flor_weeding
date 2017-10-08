<?php
switch($_GET['act']) {
    case 'edit':
    if($_POST) {
        $mysql->query("UPDATE `zet_language` SET `store_default`='0' WHERE `store_default`='1'");
        $mysql->query("UPDATE `zet_language` SET `store_default`='1' WHERE `id`='".$_POST["store_default"]."'");
        $mysql->query("UPDATE `zet_language` SET `admin_default`='0' WHERE `admin_default`='1'");
        $mysql->query("UPDATE `zet_language` SET `admin_default`='1' WHERE `id`='".$_POST["admin_default"]."'");

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
                if(!empty($_FILES['picture']['name']) and strstr($var, "water_mark_img")) {
                    $value = $_FILES['picture']['name'];
                }
            }
            $text .= $var.'=('.$value.');';
        }
        
        if($_FILES['picture']['name']) {
            $addr = 'files/';
            $name = $_FILES['picture']['name'];
            $file = $name;
            copy($_FILES['picture']['tmp_name'], ROOT . $addr . $file);
            if(file_exists(ROOT.$addr.config("water_mark_img"))) unlink(ROOT.$addr.config("water_mark_img"));
        }
        
        $file = fopen($path, 'w');
        fwrite($file, $text . "\r\n");
        fclose($file);
        
        redirectTo(ADM_SRV.$route[2].DS.$route[3].DS); 
    } break;
}