<?php
$stamp_name = config('water_mark_img');
$stamp_path = ROOT_FILES.$stamp_name;
$bool = (empty($stamp_name)) ? false: true;
        
foreach($_FILES['variant_picture']['name'] as $key => $name){
    $uploaddir = ROOT_FILES.'products/';
    $extension = end(explode('.', $_FILES['variant_picture']['name'][$key]));
    $uploadfile = rand().'_'.time().'.'.$extension;
    $file = $uploaddir.$uploadfile;
    if(move_uploaded_file($_FILES['variant_picture']['tmp_name'][$key], $file)){
        if($bool) watermark($file, $stamp_path);
        echo $uploadfile;
    }
}