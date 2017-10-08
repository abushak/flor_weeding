<?php
$query = $callback->getCallbacks($_GET, 1);
while($callback_row = $mysql->assoc($query)) {
        include ADM_TPL."callback/row.tpl";
}
