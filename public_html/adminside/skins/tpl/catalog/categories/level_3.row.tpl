<section class="brand sub_sub row sub_sub_row" id="id_<?php echo $category_row["id"]; ?>">
    <section class="span7">
        <section class="checkbox_list">
            <input type="checkbox" id="t_check<?php echo $category_row["id"]; ?>" name="" />
            <label for="t_check<?php echo $category_row["id"]; ?>"><span></span></label>
        </section>
        
        <a href="#" class="list_t"><span><img src="<?php echo ADM_SKIN; ?>image/list.jpg" /></span> <i><?php echo $category_row["title"]; ?></i></a>
    </section>
												
    <section class="center_text span2"><?php echo $category_row["products"]; ?></section>
    <section class="center_text span2"><a class="table_link status_link <?php echo ($category_row["status"] == 1) ? "active" : "disable";?>" data-id="<?php echo $category_row["id"]; ?>" href="#"></a></section>
    <section class="center_text span2">
        <a href="<?php echo ADM_SRV."catalog/categories/".$category_row["id"]."/?act=edit" ?>" class="admin_order_edit" title=""></a>
        <a href="<?php echo ADM_SRV."catalog/categories/".$category_row["id"]."/?act=delete" ?>" class="admin_order_delete" title=""></a>
    </section>
</section>