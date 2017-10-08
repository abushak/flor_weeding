<?php
switch ($_GET["act"]) {
    case "add":
        if ($_POST) {
            $catalog_product->FLOR_AddProduct($_POST, $_FILES);
            $catalog_product->_redirect(ADM_SRV."{$route[2]}/$route[3]/");
        } else include ADM_ROOT."bin/form.php";
        break;
    case "edit":
        if ($_POST) {
            $catalog_product->FLOR_EditProduct($route[4], $_POST, $_FILES);
            $catalog_product->_redirect(ADM_SRV."{$route[2]}/$route[3]/");
        } else {
            if ($catalog_product->check($route[4])) {
                $params = $catalog_product->getProduct($route[4]);
                $language = $catalog_product->getPDescriptions($route[4]);
                include ADM_ROOT."bin/form.php";
            } else echo NO_PAGE;
        } break;
    case "delete":
        $catalog_product->del($route[4]);
        $catalog_product->_redirect(ADM_SRV."{$route[2]}/$route[3]/");
        break;
}