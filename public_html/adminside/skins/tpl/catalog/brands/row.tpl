<section class="brand row main_row" id="id_<?php echo $brand_row["id"]; ?>">
    <section class="span7">
        <section class="checkbox_list">
            <input type="checkbox" id="t_check<?php echo $brand_row["id"]; ?>" data-id="<?php echo $brand_row["id"]; ?>"/>
            <label for="t_check<?php echo $brand_row["id"]; ?>"><span></span></label>
        </section>
        
        <a href="#" class="list_t"><span><img src="<?php echo ADM_SKIN; ?>image/list.jpg" /></span> <i><?php echo $brand_row["title"]; ?></i></a>
    </section>
    
    <section class="center_text span2"><?php echo $brand_row["products"]; ?></section>
    <section class="center_text span2"><a class="table_link status_link <?php echo ($brand_row["status"] == 1) ? "active" : "disable";?>" data-id="<?php echo $brand_row["id"]; ?>" href="#"></a></section>
    <section class="center_text span2">
        <a href="<?php echo ADM_SRV."catalog/brands/".$brand_row["id"]."/?act=edit" ?>" class="admin_order_edit" title="Редагувати"></a>
        <a href="<?php echo ADM_SRV."catalog/brands/".$brand_row["id"]."/?act=delete" ?>" class="admin_order_delete" title="Видалити"></a>
    </section>
</section>