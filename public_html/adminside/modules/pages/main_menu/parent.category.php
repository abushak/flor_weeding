<?php
$query = $pages_main->getPages($site_language["id"], 0, 0);
while($p_row = $mysql->assoc($query)) {
    include ADM_TPL."pages/main_menu/select.row.tpl";
}
