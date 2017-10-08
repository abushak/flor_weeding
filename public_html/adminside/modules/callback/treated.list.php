<?php
$query = $callback->getCallbacks($_GET, 2);
while($callback_row = $mysql->assoc($query)) {
        include ADM_TPL."callback/row.tpl";
}
