<?php
$query = $mysql->query("SELECT * FROM `zet_currency` WHERE `default`='1'");
while($cur_row = $mysql->assoc($query)){
    include ADM_TPL."settings/currency/main.row.tpl";
}