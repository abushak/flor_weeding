<?php
switch($_GET['act']) {
    case 'add':
        if($_POST){
            $catalog_prop->addProp($_POST);
            $catalog_prop->redirect();
        } else include ADM_ROOT."bin/form.php"; break;
    case 'edit':
        if($_POST) {
            if($route[4] == 8){
                $catalog_prop->updateColor($route[4], $_POST);
                $catalog_prop->redirect();
            } else {
                $catalog_prop->editProp($route[4], $_POST);
                $catalog_prop->redirect();
            }
        } else {
            if($catalog_prop->checkProp($route[4])){
                if($route[4] == 8){
                    $params = $catalog_prop->GetColorProperty($route[4]);
                    $language = $catalog_prop->GetColorPropertyDescription($route[4]);
                } else {
                    $params = $catalog_prop->getProp($route[4]);
                    $language = $catalog_prop->getPropDesc($route[4]);
                }
                include ADM_ROOT."bin/form.php";
            } else echo NO_PAGE;
        } break;
    case 'delete':
        $catalog_prop->delProp($route[4]);
        $catalog_prop->redirect();
        break;
}