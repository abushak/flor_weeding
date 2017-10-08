<?php
$_Cart = new Cart();
$session = session_id();

$_Cart->UpdateCart($_POST, $session);