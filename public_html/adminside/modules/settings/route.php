<?php
switch($route[3]){
    case ("cities"): include ADM_TPL."{$route[2]}/cities/main.tpl"; break;
    case ("payment"): include ADM_TPL."{$route[2]}/payment/main.tpl"; break;
    case ("delivery"): include ADM_TPL."{$route[2]}/delivery/main.tpl"; break;
    case ("currency"): include ADM_TPL."{$route[2]}/currency/main.tpl"; break;
    case ("chief"): include ADM_TPL."{$route[2]}/chief/main.tpl"; break;
    default: include ADM_TPL."{$route[2]}/main/main.tpl"; break;
}