<?php
$mysql->query("UPDATE `zet_orders` SET `status`='".(int)$_POST['status_id']."' WHERE `id`='".(int)$_POST['order_id']."'"); 