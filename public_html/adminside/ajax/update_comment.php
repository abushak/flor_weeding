<?php
$id = $mysql->escape($_POST["id"]);
$name = $mysql->escape($_POST["name"]);
$date = $mysql->escape($_POST["date"]);
$text = $mysql->escape($_POST["text"]);

$mysql->query("UPDATE `zet_comments_to_products` SET `date`='$date', `name`='$name', `text`='$text' WHERE `id`='{$id}'");
