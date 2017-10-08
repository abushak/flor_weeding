<?php
switch($route[3]){
    case ("partners"): include ADM_TPL."{$route[2]}/partners/form.tpl"; break;
    case ("other_pages"): include ADM_TPL."{$route[2]}/other_pages/form.tpl"; break;
    case ("company"): include ADM_TPL."{$route[2]}/company/form.tpl"; break;
    case ("services"): include ADM_TPL."{$route[2]}/company/form.tpl"; break;
    default: include ADM_TPL."{$route[2]}/main_menu/form.tpl"; break;
}