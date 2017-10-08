<section class="admin_all_order">
    <section class="row">
        <section class="admin_count_order"><?php echo WORD_43; ?>: <?php echo $catalog_brand->getTotalBrands(); ?></section>
        <section class="span3"><a href="<?php echo ADM_SRV.routesToLink(3, 2).'?act=add' ?>" class="add_order">+ <?php echo WORD_44; ?></a></section>
        <section class="admin_btn_close"><a class="admin_btn del_all" href="#">x <?php echo WORD_45; ?></a></section>
        <section class="admin_btn_close">
            <a class="admin_btn admin_btn_list" href="#"><?php echo WORD_19; ?></a>
            <section class="wrap_action_list">
                <ul class="action_list">
                    <li><a href="#" class="visible_all"><?php echo WORD_20; ?></a></li>
                    <li><a href="#" class="disable_all"><?php echo WORD_21; ?></a></li>
                    <a class="close" href="#"><i class="icon_close"></i></a>
                </ul>
            </section>
        </section>
    </section>
</section>

<section class="wrap_admin_table">
    <section class="admin_table brand">
        <?php include ADM_TPL."catalog/brands/caption.row.tpl"; ?>
        <?php $query = $catalog_brand->getBrands($site_language["id"]);
        while($brand_row = $mysql->assoc($query)) {
            include ADM_TPL."catalog/brands/row.tpl";
        } ?>
    </section>
</section>