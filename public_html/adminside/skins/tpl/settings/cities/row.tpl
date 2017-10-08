<section class="brand row main_row" id="id_<?php echo $row["city_id"]; ?>">
    <section class="span7">
        <section class="checkbox_list">
            <input type="checkbox" id="t_check<?php echo $row["city_id"]; ?>" data-id="<?php echo $row["city_id"]; ?>" />
            <label for="t_check<?php echo $row["city_id"]; ?>"><span></span></label>
        </section>
        <a href="<?php echo ADM_SRV."settings/{$route[3]}/{$row["city_id"]}/?act=edit" ?>" class="list_t"><span><img src="<?php echo ADM_SKIN; ?>image/list.jpg" /></span> <i><?php echo $row["name"]; ?></i></a>
    </section>
    
    <section class="center_text span2"></section>
    <section class="center_text span2"></section>
    <section class="center_text span2">
        <a href="<?php echo ADM_SRV."settings/{$route[3]}/{$row["city_id"]}/?act=edit" ?>" class="admin_order_edit" title="<?php echo LIST_EDIT; ?>"></a>
        <a href="<?php echo ADM_SRV."settings/{$route[3]}/{$row["city_id"]}/?act=delete" ?>" class="admin_order_delete" title="<?php echo LIST_DEL; ?>"></a>
    </section>
</section>