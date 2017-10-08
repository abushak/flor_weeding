<?php
switch($_GET['act']) {
    case 'add':
    if($_POST){
        $userlist_discount->addDiscount($_POST);
        $userlist_discount->redirect();
    } else include ADM_ROOT."bin/form.php"; break;
    case 'edit':
    if($_POST) {
        $userlist_discount->editDiscount($route[4], $_POST);
        $userlist_discount->redirect();
    } else {
        if($userlist_discount->checkDiscount($route[4])){
            $params = $userlist_discount->getDiscount($route[4]);
            include ADM_ROOT."bin/form.php";
        } else echo NO_PAGE;
    } break;
    case 'delete':
    $userlist_discount->deleteDiscount($route[4]);
    $userlist_discount->redirect();
    break;
}