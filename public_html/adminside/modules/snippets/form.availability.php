<?php
$lang_query = $mysql->query("SELECT * FROM `zet_userlist_group` WHERE `status`='1' ORDER BY `id` DESC");
while($lang_row = $mysql->assoc($lang_query)) {
    include ADM_TPL."snippets/availability.item.tpl";
}