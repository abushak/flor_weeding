<?php
$type = $_POST['type'];
switch($type){
    case '1': include ADM_TPL."catalog/properties/text.field.row.tpl"; break;
    case '2': include ADM_TPL."catalog/properties/color.row.tpl"; break;
    case '3': include ADM_TPL."catalog/properties/value.row.tpl"; break;
    case '4': include ADM_TPL."catalog/properties/range.row.tpl"; break;
    case '5': include ADM_TPL."catalog/properties/values.2.row.tpl"; break;
    case '6': include ADM_TPL."catalog/properties/values.3.row.tpl"; break;
    case '7': include ADM_TPL."catalog/properties/text.field.row.tpl"; break;
    case '8': include ADM_TPL."catalog/properties/text.field.row.tpl"; break;
}