<?php
/* $result = base64_decode("eyJ2ZXJzaW9uIjozLCJwdWJsaWNfa2V5IjoiaTY5ODQxNzY5NzQ3IiwiYW1vdW50IjoiMS4wMCIsImN1cnJlbmN5IjoiVUFIIiwiZGVzY3JpcHRpb24iOiLQl9Cw0LrQsNC3IOKEliAzMiIsInR5cGUiOiJidXkiLCJvcmRlcl9pZCI6Im9yZGVyXzMyIiwibGlxcGF5X29yZGVyX2lkIjoiMTA4ODYwdTE0MjE0MTkyNjM3Njg4NjYiLCJzdGF0dXMiOiJzYW5kYm94IiwidHJhbnNhY3Rpb25faWQiOjQ4NjA3MDY0LCJzZW5kZXJfcGhvbmUiOiIzODA1MDczNDM3MzEiLCJzZW5kZXJfY29tbWlzc2lvbiI6MCwicmVjZWl2ZXJfY29tbWlzc2lvbiI6MC4wMywiYWdlbnRfY29tbWlzc2lvbiI6MH0=");
$data = json_decode($result, true);

$tmp = explode("_", $data["order_id"]);
$order = $tmp[1];
echo $order."<br />";
echo $data["status"]."<br />"; 

function newTitle($title_ru, $title_ua) {
    $rand = rand(0, 9);
    $title = array(
        1 => array(
            0 => 'Заказать букет '.$title_ru.' с доставкой',
            1 => 'Купить букет '.$title_ru.' с доставкой',
            2 => 'Купить букет '.$title_ru.' с доставкой по Киеву',
            3 => 'Букет '.$title_ru.' купить в Киеве',
            4 => 'Букет '.$title_ru.' заказать в Киеве',
            5 => 'Букет '.$title_ru.' купить Киев',
            6 => 'Букет '.$title_ru.' купить онлайн',
            7 => 'Букет '.$title_ru.' купить с доставкой',
            8 => 'Букет цветов '.$title_ru.' купить в Киеве',
            9 => 'Букет '.$title_ru.' заказ и доставка по Киеву'
        ),
        2 => array(
            0 => 'Замовити букет '.$title_ua.' з доставкою',
            1 => 'Купити букет '.$title_ua.' з доставкою',
            2 => 'Купити букет '.$title_ua.' з доставкою по Києву',
            3 => 'Букет '.$title_ua.' купити в Києві',
            4 => 'Букет '.$title_ua.' замовити в Києві',
            5 => 'Букет '.$title_ua.' купити Київ',
            6 => 'Букет '.$title_ua.' купити онлайн',
            7 => 'Букет '.$title_ua.' купити з доставкою',
            8 => 'Букет квітів '.$title_ua.' купити в Києві',
            9 => 'Букет '.$title_ua.' замовлення і доставка по Києву'
        )
    );
    
    return array(
        1 => $title[1][$rand],
        2 => $title[2][$rand]
    );

}

include $_SERVER["DOCUMENT_ROOT"]."/libs/includer.php";
$mysql = new mysql;
encoding("utf-8");
$i = 0;
$query = $mysql->query("SELECT * FROM `zet_product` WHERE `additional`='0'");
while ($row = $mysql->assoc($query)) {
    $query_ = $mysql->query("SELECT `title` FROM `zet_product_description` WHERE `product_id`='".$row['id']."' AND `language_id`='1'");
    $title = $mysql->assoc($query_);
    $title_ru = $title['title'];
    
    $query_ = $mysql->query("SELECT `title` FROM `zet_product_description` WHERE `product_id`='".$row['id']."' AND `language_id`='2'");
    $title = $mysql->assoc($query_);
    $title_ua = $title['title'];
    
    $title = newTitle($title_ru, $title_ua);
    $mysql->query("UPDATE `zet_product_description` SET `meta_title`='".$title[1]."' WHERE `product_id`='".$row['id']."' AND `language_id`='1'");
    $mysql->query("UPDATE `zet_product_description` SET `meta_title`='".$title[2]."' WHERE `product_id`='".$row['id']."' AND `language_id`='2'");
    $i++;
}
echo 'DONE - '.$i; */

/*





*/