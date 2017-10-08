<?php
$query = $mysql->query("SELECT * FROM `zet_language`");
while($l_row = $mysql->assoc($query)){
    include ADM_TPL."settings/main/lang.row.tpl";
}