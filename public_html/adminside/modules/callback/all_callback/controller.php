<?php
switch($_GET['act']) {
    case 'delete':
    $callback->deleteCallback($route[4]);
    $callback->redirect();
    break;
}