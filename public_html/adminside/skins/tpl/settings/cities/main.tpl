<section class="admin_all_order color">
    <section class="row">
        <section class="admin_count_order"><?php echo WORD_285; ?></section>
        <section class="span4"><a class="add_order" href="<?php echo ADM_SRV.routesToLink(3, 2).'?act=add' ?>">+ <?php echo WORD_286; ?></a></section>
        <section class="admin_btn_close"><a class="admin_btn del_all" href="#">x <?php echo WORD_45; ?></a></section>
    </section>
</section>

<section class="wrap_admin_table">
    <section class="admin_table brand">
        <?php include ADM_TPL."settings/cities/caption.row.tpl"; ?>
        <?php include ADM_ROOT."modules/settings/cities.list.php"; ?>
    </section>
</section>