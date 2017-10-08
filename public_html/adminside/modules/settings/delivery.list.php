<?php
$query = $settings_delivery->getMethods($site_language["id"]);
while($delivery_row = $mysql->assoc($query)) {
    include ADM_TPL."settings/delivery/row.tpl";
}