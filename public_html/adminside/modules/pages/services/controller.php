<?php
switch ($_GET["act"]) {
    case "add":
        if ($_POST) {
            $subPage->AddSubPage($_POST, $_FILES);
            $subPage->_redirect(ADM_SRV."{$route[2]}/{$route[3]}/");
        } else include ADM_ROOT."bin/form.php";
        break;
    case "edit":
        if ($_POST) {
            $subPage->EditSubPage($route[4], $_POST, $_FILES);
            $subPage->_redirect(ADM_SRV."{$route[2]}/{$route[3]}/");
        } else {
            $params = $pages_static->getPage($route[4]);
            $language = $pages_static->getPageDescription($route[4]);
            include ADM_ROOT."bin/form.php";
        } break;
    case "delete":
        $subPage->DeleteSubPage($route[4]);
        $subPage->_redirect(ADM_SRV."{$route[2]}/{$route[3]}/");
        break;
}