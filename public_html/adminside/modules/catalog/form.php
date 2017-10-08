<?php
switch($route[3]){
    case ("categories"): include ADM_TPL."{$route[2]}/categories/form.tpl"; break;
    case ("brands"): include ADM_TPL."{$route[2]}/brands/form.tpl"; break;
    case ("filters"): include ADM_TPL."{$route[2]}/filters/form.tpl"; break;
    case ("properties"):
        if($_GET['act'] == 'add') include ADM_TPL."{$route[2]}/properties/form.tpl";
        else if($_GET['act'] == 'edit') include ADM_TPL."{$route[2]}/properties/edit.form.tpl";
    break;
    case ("imp_exp"): include ADM_TPL."{$route[2]}/imp_exp/form.tpl"; break;
    default: include FORM."{$route[3]}/add.form.tpl"; break;
}