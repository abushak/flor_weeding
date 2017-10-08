<?php
switch($_GET['act']) {
    case 'add':
    if($_POST){
        $settings_city->add($_POST);
        $settings_city->redirect();
    } else include ADM_ROOT."bin/form.php"; break;
    case 'edit':
    if($_POST) {
        $settings_city->edit($route[4], $_POST);
        $settings_city->redirect();
    } else {
        $language = $settings_city->getCity($route[4]);
        include ADM_ROOT."bin/form.php";
    } break;
    case 'delete':
    $settings_city->del($route[4]);
    $settings_city->redirect();
    break;
}