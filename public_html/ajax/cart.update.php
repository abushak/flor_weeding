<?php
$_Cart = new Cart();
$session = session_id();
$_result = array("quantity" => $_Cart->ItemsInCart($session));
echo json_encode($_result);