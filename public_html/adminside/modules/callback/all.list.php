<?php
$query = $callback->getCallbacks($_GET);
while($callback_row = $mysql->assoc($query)) {
        include ADM_TPL."callback/row.tpl";
}
