<section class="admin_all_order">
    <section class="row">
        <section class="admin_count_order"><?php echo WORD_183; ?>: <?php echo $callback->countCallback(2); ?></section>
        <section class="admin_btn_close"><a class="admin_btn del_all" href="#">x <?php echo WORD_18; ?></a></section>
    </section>
</section>

<section class="admin_search">
    <section class="admin_input_search not_padding">
        <form method="GET">
            <input type="text" name="q" required="required" />
            <input type="submit" value="<?php echo WORD_54; ?>" />
        </form>
    </section>
</section>

<section class="wrap_admin_table">
    <table class="admin_table brand">
        <?php include ADM_TPL."callback/caption.row.tpl"; ?>
        <?php include ADM_ROOT."modules/callback/treated.list.php"; ?>
    </table>
</section>