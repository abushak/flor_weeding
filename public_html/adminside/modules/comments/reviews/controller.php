<?php
switch($_GET['act']) {
    case 'add':
    if($_POST){
        $comments_rew->addCom($_POST);
        $comments_rew->redirect();
    } else include ADM_ROOT."bin/form.php"; break;
    case 'edit':
    if($_POST) {
        $comments_rew->editCom($route[4], $_POST);
        $comments_rew->redirect();
    } else {
        if($comments_rew->check($route[4])){
            $params = $comments_rew->getCom($route[4]);
            include ADM_ROOT."bin/form.php";
        } else echo NO_PAGE;
    } break;
    case 'delete':
    $comments_rew->deleteCom($route[4]);
    $comments_rew->redirect();
    break;
}