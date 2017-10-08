<section class="brand row main_row" id="id_<?php echo $key; ?>">
    <section class="span7">
        <section class="checkbox_list">
            <input type="checkbox" id="t_check<?php echo $key; ?>" />
            <label for="t_check<?php echo $key; ?>"><span></span></label>
        </section>

        <a href="#" class="list_t false"><span><img src="<?php echo ADM_SKIN; ?>image/list.jpg" /></span> <i><?php echo $val["title"]; ?></i></a>
    </section>
    <section class="center_text span2"></section>
    <section class="center_text span2"><a class="table_link status_link <?php echo ($val["status"] == 1) ? "active" : "disable";?>" data-id="<?php echo $key; ?>" href="#"></a></section>
    <section class="center_text span2">
        <a href="<?php echo ADM_SRV."{$route[2]}/{$route[3]}/{$key}/?act=edit" ?>" class="admin_order_edit" title="<?php echo LIST_EDIT; ?>"></a>
        <a href="<?php echo ADM_SRV."{$route[2]}/{$route[3]}/{$key}/?act=delete" ?>" class="admin_order_delete delete-slide" title="<?php echo LIST_DEL; ?>"></a>
    </section>
</section>