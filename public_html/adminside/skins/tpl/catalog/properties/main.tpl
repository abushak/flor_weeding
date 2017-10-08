<section class="admin_all_order">
    <section class="row">
        <section class="admin_count_order"><?php echo WORD_14; ?></section>
        <section class="span3"><a href="<?php echo ADM_SRV."{$route[2]}/{$route[3]}/?act=add"; ?>" class="add_order">+ <?php echo WORD_213; ?></a></section>
        <section class="admin_btn_close"><a class="admin_btn del_all" href="#">x <?php echo WORD_18; ?></a></section>
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
        <section class="title_brand row">
            <section class="span7">
                <section class="checkbox_list">
                    <input type="checkbox" id="t_check_all" />
                    <label for="t_check_all"><span></span></label>
                </section>
                <span class="padding_left"><?php echo WORD_22; ?></span>
            </section>
            <section class="center_text span2"></section>
            <section class="center_text span2"><?php echo WORD_24; ?></section>
            <section class="center_text span2"><?php echo WORD_25; ?></section>
        </section>
        <?php include ADM_ROOT."modules/catalog/properties/list.php"; ?>
    </section>
</section>