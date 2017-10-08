<?php
$query = $settings_city->getCities($site_language['id']);
while($row = $mysql->assoc($query)){
    include ADM_TPL."settings/cities/row.tpl";
}