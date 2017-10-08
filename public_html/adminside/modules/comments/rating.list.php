<?php
for($i = 1; $i <= 5; $i++) { 
    if($i <= $com_row["mark"]) include ADM_TPL."comments/c_products/rating.item.selected.tpl";
    else include ADM_TPL."comments/c_products/rating.item.tpl";
}