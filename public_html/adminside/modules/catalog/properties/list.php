<?php
$query = $catalog_prop->getProps($site_language['id']);
while($prop_row = $mysql->assoc($query)){
    include ADM_TPL."catalog/properties/row.tpl"; 
}