<?php
if(!$_GET['act']) include_once ADM_ROOT."modules/{$route[2]}/route.php";
else {
    if($route[2] == 'orders') include_once ADM_ROOT."modules/{$route[2]}/new/controller.php";
    else include_once ADM_ROOT."modules/{$route[2]}/{$route[3]}/controller.php";
}