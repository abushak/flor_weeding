<?php
$query = $mysql->query("SELECT `picture` FROM `zet_slider` WHERE `id`='".$mysql->escape($_POST["id"])."'");
while($row = $mysql->assoc($query)){
    $file = getFile($row["picture"]);
    unlink(str_replace(SRV, ROOT, $file));
}
$mysql->query("DELETE FROM `zet_slider` WHERE `id`='".$mysql->escape($_POST["id"])."'");