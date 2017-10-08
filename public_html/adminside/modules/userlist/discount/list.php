<?php
$query = $userlist_discount->getDiscounts();
while($discount_row = $mysql->assoc($query)) {
    include ADM_TPL."userlist/discount/row.tpl";
}
