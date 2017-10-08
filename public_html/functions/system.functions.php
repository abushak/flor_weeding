<?php
function array_del_empty($array){
    return array_diff($array, array(''));
}