<?php 
 $url ="http://".$_SERVER['HTTP_HOST']."/adminside/catalog/filters";
 
if($_GET['categoryId']!=null){
    if($mysql->query("UPDATE `zet_category_description` SET `filter_category_id`='0' WHERE `category_id`='".$_GET['categoryId']."'")){
        $filters = $catalog_category->BackendGetFiltersByStatus(0, 0);
        echo "<script> window.location.href ='".$url."'; </script>";
    };
}
?>
<section class="brand sub row sub_row" id="id_<?php echo $fs["category_id"]; ?>">
    <section class="span7">
        <section class="checkbox_list">
        </section>
        <a href="#" class="list_t"><span><img src="<?php echo ADM_SKIN; ?>image/list.jpg" /></span> <i><?php echo $fs["title"]; ?></i></a>
    </section>
    <section class="center_text span2"><?php  ?></section>
    <section class="center_text span2"></section>
    <section class="center_text span2"><a href="<?php echo $_SERVER['REQUEST_URI']."?categoryId=".$fs["category_id"] ?>" class="admin_order_delete delete-catalog" title="Видалити"></a></section>
    
    <section class="sub_sub_rows_container">
    <aside></aside>
    </section>
</section>

