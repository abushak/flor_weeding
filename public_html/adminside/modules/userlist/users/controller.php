<?php
switch($_GET['act']) {
    case 'add':
    if($_POST){
        $userlist_users->add($_POST);
        $userlist_users->redirect();
    } else include ADM_ROOT."bin/form.php"; break;
    case 'edit':
    if($_POST) {
        $userlist_users->edit($route[4], $_POST);
        $userlist_users->redirect();
    } else {
        //if($userlist_groups->checkGroup($route[4])){
            $params = $userlist_users->getUser($route[4]);
            $cities = $userlist_users->getAddress($route[4]);
            $subscribe = $userlist_users->getSubscribe($route[4]);
            include ADM_ROOT."bin/form.php";
        //} else echo NO_PAGE;
    } break;
    case 'view':
        $params = $userlist_users->getUser($route[4]);
        $cities = $userlist_users->getAddress($route[4]);
        $subscribe = $userlist_users->getSubscribe($route[4]);
        include ADM_ROOT."bin/view.php";
    break;
    case 'delete':
        $userlist_users->del($route[4]);
        $userlist_users->redirect();
    break;
}