<?php
if($route[4] == 8){
    $colors = $catalog_prop->GetColors($route[4]);
    foreach($colors as $key => $val){
        $colors_description = $catalog_prop->GetColorDescription($colors[$key]['id']);
        include ADM_TPL."catalog/properties/color.row.tpl";
    }
} else {
    $__i = 0;
    $count = $catalog_prop->countProp($route[4], $params['type']);
    $names = $catalog_prop->getPropValDesc($route[4]);
    $vals = $catalog_prop->getPropVal($route[4]);
}

while($__i < $count){
    switch($params['type']){
        case '1': include ADM_TPL."catalog/properties/text.field.row.tpl"; break;
        case '3': include ADM_TPL."catalog/properties/value.row.tpl"; break;
        case '4': include ADM_TPL."catalog/properties/range.row.tpl"; break;
        case '5': include ADM_TPL."catalog/properties/values.2.row.tpl"; break;
        case '6': include ADM_TPL."catalog/properties/values.3.row.tpl"; break;
        case '7': include ADM_TPL."catalog/properties/text.field.row.tpl"; break;
        case '8': include ADM_TPL."catalog/properties/text.field.row.tpl"; break;
    }
    $__i++;
}
