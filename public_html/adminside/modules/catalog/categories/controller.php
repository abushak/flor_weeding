<?php
switch($_GET['act']) {
    case 'add':
    if($_POST){
        $catalog_category->addCategory($_POST, $_FILES);
        $catalog_category->redirect();
    } else include ADM_ROOT."bin/form.php"; break;
    case 'edit':
    if($_POST) {
        $catalog_category->editCategory($route[4], $_POST, $_FILES);
        $catalog_category->redirect();
    } else {
        if($catalog_category->checkCategory($route[4])){
            $params = $catalog_category->getCategory($route[4]);
            $language = $catalog_category->getCategoryDescriptions($route[4]);
            
            include ADM_ROOT."bin/form.php";
        } else echo NO_PAGE;
    } break;
    case 'delete':
    $catalog_category->deleteCategory($route[4]);
    $catalog_category->redirect();
    break;
}