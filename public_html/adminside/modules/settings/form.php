<?php
switch($route[3]){
    case ("cities"): include ADM_TPL."{$route[2]}/cities/form.tpl"; break;
    case ("payment"): include ADM_TPL."{$route[2]}/payment/form.tpl"; break;
    case ("delivery"): include ADM_TPL."{$route[2]}/delivery/form.tpl"; break;
    case ("currency"): include ADM_TPL."{$route[2]}/currency/form.tpl"; break;
    default: include ADM_TPL."{$route[2]}/main/form.tpl"; break;
}