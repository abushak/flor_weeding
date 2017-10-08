<?php
switch($route[3]){
    case ("promo"): include ADM_TPL."{$route[2]}/promo/main.tpl"; break;
    default: include ADM_TPL."{$route[2]}/news/main.tpl"; break;
}