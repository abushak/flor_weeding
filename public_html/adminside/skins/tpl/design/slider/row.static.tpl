<section class="brand row main_row" id="id_<?php echo $key; ?>">
    <section class="span7">
        <section class="checkbox_list"></section>
        <a href="#" class="list_t false"><span></span> <i><?php echo $val["title"]; ?></i></a>
    </section>
    <section class="center_text span2"></section>
    <section class="center_text span2"></section>
    <section class="center_text span2">
        <a href="<?php echo ADM_SRV."{$route[2]}/{$route[3]}/{$key}/?act=edit" ?>" class="admin_order_edit" title="<?php echo LIST_EDIT; ?>"></a>
    </section>
</section>