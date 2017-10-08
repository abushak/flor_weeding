<?php
switch($_GET['act']) {
    case 'add':
    if($_POST){
        $settings_payment->addMethod($_POST);
        $settings_payment->redirect();
    } else include ADM_ROOT."bin/form.php"; break;
    case 'edit':
    if($_POST) {
        $settings_payment->editMethod($route[4], $_POST);
        $settings_payment->redirect();
    } else {
        if($settings_payment->checkMethod($route[4])){
            $params = $settings_payment->getMethod($route[4]);
            $language = $settings_payment->getMethodDescriptions($route[4]);
            $opt = $settings_payment->getMethodOptions($route[4]);
            include ADM_ROOT."bin/form.php";
        } else echo NO_PAGE;
    } break;
    case 'delete':
    $settings_payment->deleteMethod($route[4]);
    $settings_payment->redirect();
    break;
}