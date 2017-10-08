<section class="brand row main_row" id="id_<?php echo $delivery_row["id"]; ?>">
    <section class="span7">
        <section class="checkbox_list">
            <input type="checkbox" id="t_check<?php echo $delivery_row["id"]; ?>" data-id="<?php echo $delivery_row["id"]; ?>" />
            <label for="t_check<?php echo $delivery_row["id"]; ?>"><span></span></label>
        </section>
        
        <a href="<?php echo ADM_SRV."settings/delivery/".$delivery_row["id"]."/?act=edit" ?>" class="list_t"><span><img src="<?php echo ADM_SKIN; ?>image/list.jpg" /></span> <i><?php echo $delivery_row["title"]; ?></i></a>
    </section>
    
    <section class="center_text span2"></section>
    <section class="center_text span2"><a class="table_link status_link <?php echo ($delivery_row["status"] == 1) ? "active" : "disable";?>" id="status_<?php echo $delivery_row["id"]; ?>" data-id="<?php echo $delivery_row["id"]; ?>" href="#"></a></section>
    <section class="center_text span2">
        <a href="<?php echo ADM_SRV."settings/delivery/".$delivery_row["id"]."/?act=edit" ?>" class="admin_order_edit" title="<?php echo LIST_EDIT; ?>"></a>
        <!-- <a href="<?php echo ADM_SRV."settings/delivery/".$delivery_row["id"]."/?act=delete" ?>" class="admin_order_delete" title="<?php echo LIST_DEL; ?>"></a> -->
    </section>
</section>