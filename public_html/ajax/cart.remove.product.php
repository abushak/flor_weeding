<?php
$_Cart = new Cart();
$session = session_id();
$product = $_POST['product_id'];
$option = $_POST['option_id'];

$_Cart->RemoveItem($session, $product, $option);