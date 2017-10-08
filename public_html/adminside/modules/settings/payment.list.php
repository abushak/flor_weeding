<?php
$query = $settings_payment->getMethods($site_language["id"]);
while($payment_row = $mysql->assoc($query)) {
    include ADM_TPL."settings/payment/row.tpl";
}