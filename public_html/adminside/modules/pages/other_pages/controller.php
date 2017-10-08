<?php
switch($_GET['act']) {
    case 'edit':
    if($_POST) {
        $pages_static->editPage($route[4], $_POST);
        $pages_static->redirect();
    } else {
        if($pages_static->checkPage($route[4])){
            $params = $pages_static->getPage($route[4]);
            $language = $pages_static->getPageDescription($route[4]);
            include ADM_ROOT."bin/form.php";
        } else echo NO_PAGE;
    } break;
}