<?php
$mysql->query("UPDATE `zet_orders` SET `npn`='".$mysql->escape($_POST['ttn'])."' WHERE `id`='".(int)$_POST['order_id']."'"); 