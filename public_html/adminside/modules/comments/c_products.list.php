<?php
$query = $comments_products->getComments($_GET, $site_language['id']);
while($com_row = $mysql->assoc($query)) {
    include ADM_TPL."comments/c_products/row.tpl";
}
