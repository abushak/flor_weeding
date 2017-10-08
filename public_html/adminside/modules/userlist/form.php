<?php
switch($route[3]){
    case "export": include ADM_TPL."{$route[2]}/export/form.tpl"; break;
    case "discount": include ADM_TPL."{$route[2]}/discount/form.tpl"; break;
    case "groups": include FORM."{$route[2]}/{$route[3]}/form.tpl"; break;
    default: include FORM."{$route[2]}/{$route[3]}/form.tpl"; break;
}