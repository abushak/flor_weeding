<?php
switch($_GET['act']) {
    case 'add':
    if($_POST){
        $userlist_groups->addGroup($_POST);
        $userlist_groups->redirect();
    } else include ADM_ROOT."bin/form.php"; break;
    case 'edit':
    if($_POST) {
        $userlist_groups->editGroup($route[4], $_POST);
        $userlist_groups->redirect();
    } else {
        if($userlist_groups->checkGroup($route[4])){
            $params = $userlist_groups->getGroup($route[4]);
            include ADM_ROOT."bin/form.php";
        } else echo NO_PAGE;
    } break;
    case 'delete':
    $userlist_groups->deleteGroup($route[4]);
    $userlist_groups->redirect();
    break;
}