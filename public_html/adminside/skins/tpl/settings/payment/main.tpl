<section class="admin_all_order color">
    <section class="row">
        <section class="admin_count_order"><!-- Готівкою --><?php echo WORD_134; ?></section>
        <!-- <section class="span4"><a class="add_order" href="<?php echo ADM_SRV.routesToLink(3, 2).'?act=add' ?>">+ <?php echo WORD_157; ?></a></section> -->
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
        <?php include ADM_TPL."settings/payment/caption.row.tpl"; ?>
        <?php include ADM_ROOT."modules/settings/payment.list.php"; ?>
    </section>
</section>

<!-- <section class="admin_all_order color">
    <section class="row">
        <section class="admin_count_order">Безготівкою<?php //echo WORD_134; ?></section>
    </section>
</section> -->