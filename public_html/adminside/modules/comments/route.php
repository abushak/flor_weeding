<?php
switch($route[3]){
    case ("reviews"): include ADM_TPL."{$route[2]}/reviews/main.tpl"; break;
    default: include ADM_TPL."{$route[2]}/c_products/main.tpl"; break;
}