<?php
switch($_GET['act']) {
    case 'add':
    if($_POST){
        $pages_main->addPage($_POST);
        $pages_main->redirect();
    } else include ADM_ROOT."bin/form.php"; break;
    case 'edit':
    if($_POST) {
        $pages_main->editPage($route[4], $_POST);
        $pages_main->redirect();
    } else {
        if($pages_main->checkPage($route[4])){
            $params = $pages_main->getPage($route[4]);
            $language = $pages_main->getPageDescription($route[4]);
            $opt = $pages_main->getPageToGroups($route[4]);
            include ADM_ROOT."bin/form.php";
        } else echo NO_PAGE;
    } break;
    case 'delete':
    $pages_main->deletePage($route[4]);
    $pages_main->redirect();
    break;
}