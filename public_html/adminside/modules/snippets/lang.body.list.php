<?php
$lang_str = "SELECT * FROM `zet_language` ORDER BY `store_default`<>'0' DESC";
$lang_query = $mysql->query($lang_str);
$bool = true;
while($lang_row = $mysql->assoc($lang_query)) {
    $display = ($bool == false) ? "display:none;" : false;
    include ADM_TPL."snippets/form.body.tpl";
    $bool = false;
}