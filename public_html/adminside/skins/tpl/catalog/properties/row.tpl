<section class="brand row main_row" id="id_<?php echo $prop_row["id"]; ?>">
    <section class="span7">
        <section class="checkbox_list">
            <input type="checkbox" id="t_check<?php echo $prop_row["id"]; ?>" data-id="<?php echo $prop_row["id"]; ?>" />
            <label for="t_check<?php echo $prop_row["id"]; ?>"><span></span></label>
        </section>
        <a href="#" class="list_t"><span><img src="<?php echo ADM_SKIN; ?>image/list.jpg" /></span> <i><?php echo $prop_row["title"]; ?></i></a>
    </section>
    
    <section class="center_text span2"></section>
    <section class="center_text span2">
        <?php if($prop_row["id"] != 8) { ?>
            <a class="table_link status_link <?php echo ($prop_row["status"] == 1) ? "active" : "disable";?>" data-id="<?php echo $prop_row["id"]; ?>" id="status_<?php echo $prop_row["id"]; ?>" href="#"></a>
        <?php } ?>
    </section>
    <section class="center_text span2">
        <a href="<?php echo ADM_SRV."catalog/properties/".$prop_row["id"]."/?act=edit" ?>" class="admin_order_edit" title="<?php echo LIST_EDIT; ?>"></a>
        <?php if($prop_row["id"] != 8) { ?>
        <a href="<?php echo ADM_SRV."catalog/properties/".$prop_row["id"]."/?act=delete" ?>" class="admin_order_delete" title="<?php echo LIST_DEL; ?>"></a>
        <?php } ?>
    </section>
</section>