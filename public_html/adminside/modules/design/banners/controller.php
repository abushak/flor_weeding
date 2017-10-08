<?php
switch($_GET['act']) {
    case 'edit':
    if($_POST) {
        foreach($_POST['title'] as $_banner_id => $val){
            $mysql->query("UPDATE `zet_banner` SET `title`='".$mysql->escape($_POST["title"][$_banner_id])."',`alt`='".$mysql->escape($_POST["alt"][$_banner_id])."',`url`='".$mysql->escape($_POST["url"][$_banner_id])."' WHERE `id`='".$_banner_id."'");
        }
        redirectTo(ADM_SRV."design/banners/");
    } else redirectTo(ADM_SRV."design/banners/");
    break;
}