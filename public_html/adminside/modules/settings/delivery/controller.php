<?php
switch($_GET['act']) {
    case 'add':
    if($_POST){
        $settings_delivery->addMethod($_POST);
        $settings_delivery->redirect();
    } else include ADM_ROOT."bin/form.php"; break;
    case 'edit':
    if($_POST) {
        $settings_delivery->editMethod($route[4], $_POST);
        $settings_delivery->redirect();
    } else {
        if($settings_delivery->checkMethod($route[4])){
            $params = $settings_delivery->getMethod($route[4]);
            $language = $settings_delivery->getMethodDescriptions($route[4]);
            $opt = $settings_delivery->getMethodOptions($route[4]);
            $opt_2 = $settings_delivery->getMethodOptions_2($route[4]);
            include ADM_ROOT."bin/form.php";
        } else echo NO_PAGE;
    } break;
    case 'delete':
    $settings_delivery->deleteMethod($route[4]);
    $settings_delivery->redirect();
    break;
}