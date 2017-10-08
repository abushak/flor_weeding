<?php
switch($route[3]){
    case ("all_callback"): include ADM_TPL."{$route[2]}/all/main.tpl"; break;
    case ("treated_callback"): include ADM_TPL."{$route[2]}/treated/main.tpl"; break;
    default: include ADM_TPL."{$route[2]}/new/main.tpl"; break;
}