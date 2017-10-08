<section class="brand row main_row" id="id_<?php echo $page_row["id"]; ?>">
    <section class="span7">
        <section class="checkbox_list"></section>
        <a href="#" class="list_t"><span><img src="<?php echo ADM_SKIN; ?>image/list.jpg" /></span> <i><?php echo $page_row["title"]; ?></i></a>
    </section>
    
    <section class="center_text span2"></section>
    <section class="center_text span2"></section>
    <section class="center_text span2">
        <a href="<?php echo ADM_SRV."pages/main_menu/".$page_row["id"]."/?act=edit" ?>" class="admin_order_edit" title="<?php echo LIST_EDIT; ?>"></a>
    </section>
    
    <section class="sub_rows_container">
    <?php $query_2 = $pages_main->getPages($site_language["id"], $page_row["id"]); ?>
    <?php while($page_row = $mysql->assoc($query_2)){ ?>
    <?php include PAGE."{$route[2]}/{$route[3]}/s.sub.row.tpl"; ?>
    <?php } ?>
    </section>
</section>