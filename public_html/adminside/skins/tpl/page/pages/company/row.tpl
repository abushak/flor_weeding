<section class="brand row main_row" id="id_<?php echo $page_row["id"]; ?>">
    <section class="span7">
        <section class="checkbox_list"></section>
        <a href="#" class="list_t"><span></span><i><?php echo $page_row["title"]; ?></i></a>
    </section>
    
    <section class="center_text span2"></section>
    <section class="center_text span2"></section>
    <section class="center_text span2">
        <a href="<?php echo ADM_SRV."{$route[2]}/{$route[3]}/{$page_row["id"]}/?act=edit" ?>" class="admin_order_edit" title="<?php echo LIST_EDIT; ?>"></a>
        <a href="<?php echo ADM_SRV."{$route[2]}/{$route[3]}/{$page_row["id"]}/?act=delete" ?>" class="admin_order_delete delete-cs" title="<?php echo LIST_DEL; ?>"></a>
    </section>
</section>