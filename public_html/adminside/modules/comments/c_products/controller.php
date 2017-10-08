<?php
switch($_GET['act']) {
    case 'delete':
    $comments_products->deleteComment($route[4]);
    $comments_products->redirect();
    break;
}