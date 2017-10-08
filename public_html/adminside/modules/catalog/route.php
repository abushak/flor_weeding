<?php
switch($route[3]){
    case ("categories"): include ADM_TPL."{$route[2]}/categories/main.tpl"; break;
    case ("brands"): include ADM_TPL."{$route[2]}/brands/main.tpl"; break;
    case ("properties"): include ADM_TPL."{$route[2]}/properties/main.tpl"; break;
    case ("additional"): include ADM_TPL."{$route[2]}/additional/main.tpl"; break;
    case ("filters")   : include ADM_TPL."{$route[2]}/filters/main.tpl"; break;
    case ("imp_exp"): include ADM_TPL."{$route[2]}/imp_exp/main.tpl"; break;
    default: include ADM_TPL."{$route[2]}/products/main.tpl"; break;
}