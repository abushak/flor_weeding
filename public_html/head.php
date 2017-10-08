<?php
if ($route[1] == "services") {
    $url = "services";
    $meta_tags = GetMetaTags("pages_static", "page", $url);
} else if ($route[1] == "for_companies") {
    $url = "for_companies";
    $meta_tags = GetMetaTags("pages_static", "page", $url);
} else if ($route[1] == "shop") {
    if (empty($route[3]) || $_GET) {
        if (empty($route[2]) || $_GET) {
            $url = "shop";
            $meta_tags = GetMetaTags("pages_static", "page", $url);
        } else {
            $url = $route[2];
            $meta_tags = GetMetaTags("category", "category", $url);
        }
    } else {
        $url = $route[3];
        $meta_tags = GetMetaTags("product", "product", $url);
    }
} else if ($route[1] == "vip") {
    $url = "vip";
    $meta_tags = GetMetaTags("pages_static", "page", $url);
} else if ($route[1] == "news") {
    if (empty($route[2]) || $_GET) {
        $url = "news";
        $meta_tags = GetMetaTags("pages", "page", $url);
    } else {
        $url = $route[2];
        $meta_tags = GetMetaTags("news", "news", $url);
    }
	
} else if ($route[1] == "pay_del") {
    $url = "pay_del";
    $meta_tags = GetMetaTags("pages", "page", $url);
} else if ($route[1] == "userorder") {
    $url = "userorder";
    $meta_tags = GetMetaTags("pages", "page", $url);
} else if ($route[1] == "about") {
    $url = "about";
    $meta_tags = GetMetaTags("pages", "page", $url);
} else if ($route[1] == "reviews") {
    $url = "reviews";
    $meta_tags = GetMetaTags("pages", "page", $url);
} else if ($route[1] == "partners") {
    $url = "partners";
    $meta_tags = GetMetaTags("pages", "page", $url);
} else if ($route[1] == "gifts") {
    $url = "gifts";
    $meta_tags = GetMetaTags("pages", "page", $url);
} else if ($route[1] == "contacts") {
    $url = "contacts";
    $meta_tags = GetMetaTags("pages", "page", $url);
} else if ($route[1] == "cart") {
    $meta_tags["title"] = WORD_46;
} else if ($route[1] == "order") {
    $meta_tags["title"] = WORD_72;
} else if ($route[1] == "search") {
    $meta_tags["title"] = WORD_47;
} else if ($route[1] == "auth") {
    $url = "auth";
    $meta_tags = GetMetaTags("pages", "page", $url);
} else if ($route[1] == "reg") {
    $url = "reg";
    $meta_tags = GetMetaTags("pages", "page", $url);
} else if ($route[1] == "forgot") {
    $url = "forgot";
    $meta_tags = GetMetaTags("pages", "page", $url);
} else if ($route[1] == "accept") {
    $url = "accept";
    $meta_tags = GetMetaTags("pages", "page", $url);	
} else if ($route[1] == "mydates") {
    $url = "mydates";
    $meta_tags = GetMetaTags("pages", "page", $url);    
} else if ($route[1] == "myorder") {
    $url = "myorder";
    $meta_tags = GetMetaTags("pages", "page", $url); 
} else if ($route[1] == "myhistory") {
    $url = "myhistory";
    $meta_tags = GetMetaTags("pages", "page", $url); 
} 

 else if ($route[1] == "calendar") {
    $url = "calendar";
    $meta_tags = GetMetaTags("pages", "page", $url); 
}else {
    $url = "main";
    $meta_tags = GetMetaTags("pages_static", "page", $url);
}

$title = $meta_tags["title"];
$description = strip_tags($meta_tags["description"]);
$keywords = $meta_tags["meta_keywords"];
$url = "main";
include TPL."head.tpl";