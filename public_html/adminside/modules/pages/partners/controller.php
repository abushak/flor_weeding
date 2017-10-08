<?php
switch($_GET['act']){
    case 'add':
        if($_POST){
            $partners->AddPartner($_POST, $_FILES);
            $partners->_redirect(ADM_SRV."{$route[2]}/{$route[3]}/");
        } else include ADM_ROOT."bin/form.php"; break;
    case 'edit':
        if($_POST) {
            $partners->EditPartner($route[4], $_POST, $_FILES);
            $partners->_redirect(ADM_SRV."{$route[2]}/{$route[3]}/");
        } else {
            $params = $partners->GetPartner($route[4]);
            $language = $partners->GetPartnerDescription($route[4]);
            include ADM_ROOT."bin/form.php";
        } break;
    case 'delete':
        $partners->DeletePartner($route[4]);
        $partners->_redirect(ADM_SRV."{$route[2]}/{$route[3]}/");
        break;
}