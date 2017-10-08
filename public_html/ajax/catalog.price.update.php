<?php
unset($_POST["function"]);
$res = "?";
foreach ($_POST as $key => $val) {
    if (is_array($val)) {
        foreach ($val as $k => $v) {
            $res .= $key."[]=".$v."&";
        }
    } else if ($key && $val) {
        $res .= $key."=".$val."&";
    }
}

$res = substr($res, 0, -1);

echo $res;