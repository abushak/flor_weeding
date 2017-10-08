<section class="admin_all_order">
    <section class="row">
        <section class="admin_count_order"><?php echo WORD_192; ?></section>
        <section class="admin_btn_close"><a class="admin_btn del_all" href="#">x <?php echo WORD_18; ?></a></section>
        <section class="admin_btn_close">
            <a class="admin_btn admin_btn_list" href="#"><?php echo WORD_19; ?></a>
            <section class="wrap_action_list">
                <ul class="action_list">
                    <li><a href="#" class="visible_all"><?php echo WORD_194; ?></a></li>
                    <li><a href="#" class="disable_all"><?php echo WORD_195; ?></a></li>
                    <a class="close" href="#"><i class="icon_close"></i></a>
                </ul>
            </section>
        </section>
    </section>
</section>

<section class="admin_search">
    <section class="admin_input_search not_padding">
        <form method="GET">
            <input type="text" required="required" name="q" />
            <input type="submit" value="<?php echo WORD_54; ?>" />
        </form>
    </section>
</section>

<section class="wrap_admin_table">
    <table class="admin_table brand">
        <?php include ADM_TPL."comments/c_products/caption.row.tpl"; ?>
        <?php include ADM_ROOT."modules/comments/c_products.list.php"; ?>
    </table>
</section>