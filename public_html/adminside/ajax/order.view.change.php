<?php
switch($_POST["view"]){
    case("block"): $_SESSION["TABLE_VIEW"] = "block"; break;
    case("list"): $_SESSION["TABLE_VIEW"] = "list"; break;
}