<?php
foreach ($_FILES["picture"]["name"] as $key => $name) {
    $uploaddir = ROOT_FILES."banner/";
    $extension = end(explode(".", $_FILES["picture"]["name"][$key]));
    $uploadfile = rand()."_".time().".".$extension;
    $file = $uploaddir.$uploadfile;
    if (move_uploaded_file($_FILES["picture"]["tmp_name"][$key], $file)) {
        $mysql->query("INSERT INTO `zet_about_gallery` (`picture`) VALUES ('".$uploadfile."')");
        
        $query = $mysql->query("SELECT * FROM `zet_about_gallery` WHERE `picture`='".$uploadfile."'");
        while ($pic_row = $mysql->assoc($query)) {
            include ADM_TPL."design/about/slide.tpl";
        }
    }
}