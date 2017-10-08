<?php
switch($route[3]){
    case "export": include ADM_TPL."{$route[2]}/export/main.tpl"; break;
    case "discount": include ADM_TPL."{$route[2]}/discount/main.tpl"; break;
    case "groups": include PAGE."{$route[2]}/{$route[3]}/page.tpl"; break;
    default: include PAGE."{$route[2]}/{$route[3]}/page.tpl"; break;
}