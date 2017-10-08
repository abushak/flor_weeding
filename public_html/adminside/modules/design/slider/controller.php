<?php
switch ($_GET['act']) {
    case 'add':
        if ($_POST) {
            $_DesignSlide->AddSlide($_POST, $_FILES);
            $_DesignSlide->_redirect(ADM_SRV."{$route[2]}/{$route[3]}/");
        } else include ADM_ROOT."bin/form.php";
        break;
    case 'edit':
        if ($_POST) {
            $_DesignSlide->EditSlide($route[4], $_POST, $_FILES);
            $_DesignSlide->_redirect(ADM_SRV."{$route[2]}/{$route[3]}/");
        } else {
            $params = $_DesignSlide->GetSlide($route[4]);
            $description = $_DesignSlide->GetSlideDescriptions($route[4]);
            include ADM_ROOT."bin/form.php";
        }
        break;
    case 'delete':
        $_DesignSlide->DeleteSlide($route[4]);
        $_DesignSlide->_redirect(ADM_SRV."{$route[2]}/{$route[3]}/");
        break;
}