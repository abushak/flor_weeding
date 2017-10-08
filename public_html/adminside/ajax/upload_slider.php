<?php
foreach($_FILES['picture']['name'] as $key => $name){
    $uploaddir = ROOT_FILES.'slider/';
    $extension = end(explode(".", $_FILES['picture']['name'][$key]));
    $uploadfile = rand().'_'.time().'.'.$extension;
    $file = $uploaddir.$uploadfile;
    if(move_uploaded_file($_FILES['picture']['tmp_name'][$key], $file)){ 
        $mysql->query("INSERT INTO `zet_slider` (`id`, `picture`, `title`, `alt`, `url`) VALUES ('','".$uploadfile."','','','')");
        
        $query = $mysql->query("SELECT * FROM `zet_slider` WHERE `picture`='".$uploadfile."'");
        while($pic_row = $mysql->assoc($query)){
            include ADM_TPL."design/slider/slide.tpl";
        }
    }
}