<?php
switch($_GET['act']) {
    case 'edit':
    if($_POST) {
        $settings_currency->addCurrency($_POST);
        $settings_currency->redirect();
    } break;
    case 'delete':
    $settings_currency->deleteCurrency($route[4]);
    $settings_currency->redirect();
    break;
}