<?php
switch($_GET['act']) {
    case 'add':
    if($_POST){
        $publications_news->addNewsItem($_POST, $_FILES);
        $publications_news->redirect();
    } else include ADM_ROOT."bin/form.php"; break;
    case 'edit':
    if($_POST) {
        $publications_news->editNewsItem($route[4], $_POST, $_FILES);
        $publications_news->redirect();
    } else {
        if($publications_news->checkNewsItem($route[4])){
            $params = $publications_news->getNewsItem($route[4]);
            $language = $publications_news->getNewsDescriptions($route[4]);
            include ADM_ROOT."bin/form.php";
        } else echo NO_PAGE;
    } break;
    case 'delete':
    $publications_news->deleteNewsItem($route[4]);
    $publications_news->redirect();
    break;
}