<?php
switch($route[3]){
    case ("promo"): include ADM_TPL."{$route[2]}/promo/form.tpl"; break;
    default: include ADM_TPL."{$route[2]}/news/form.tpl"; break;
}