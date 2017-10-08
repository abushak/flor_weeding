<?php
if($_GET["sort"]) $query = $publications_news->getNews($site_language["id"], 0, $_GET["sort"]);
else $query = $publications_news->getNews($site_language["id"]);
while($news_row = $mysql->assoc($query)) {
    if($_GET["q"]){
        $pos = strpos($news_row["title"], $_GET["q"]);
        if($pos !== false) include ADM_TPL."publications/row.tpl";
    }
    else include ADM_TPL."publications/row.tpl";
}
