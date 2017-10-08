<?php
switch($_GET['act']) {
    case 'add':
    if($_POST){
        $catalog_brand->addBrand($_POST, $_FILES);
        $catalog_brand->redirect();
    } else include ADM_ROOT."bin/form.php"; break;
    case 'edit':
    if($_POST) {
        $catalog_brand->editBrand($route[4], $_POST, $_FILES);
        $catalog_brand->redirect();
    } else {
        if($catalog_brand->checkBrand($route[4])){
            $params = $catalog_brand->getBrand($route[4]);
            $language = $catalog_brand->getBrandDescriptions($route[4]);
            
            include ADM_ROOT."bin/form.php";
        } else echo NO_PAGE;
    } break;
    case 'delete':
    $catalog_brand->deleteBrand($route[4]);
    $catalog_brand->redirect();
    break;
}