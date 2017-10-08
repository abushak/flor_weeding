<?php
if(isset($_SERVER['HTTP_X_REQUESTED_WITH']) && !empty($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest') { }
else {
    if(!empty($route[0]) && $route[0] == $elselang) {
        $_SESSION['lang'] = $elselang;
        define("HREFLANG", $elselang."/");
        $_SESSION['_lang'] = HREFLANG;
    } else {
        $_SESSION['lang'] = $deflang;
        define("HREFLANG", "");
        $_SESSION['_lang'] = HREFLANG;
    }
}