<section class="admin_all_order">
    <section class="row">
        <section class="admin_count_order"><?php echo ($_GET['act'] == "add") ? WORD_91 : WORD_92;?></section>
        <section class="admin_btn_close"><a class="admin_save" href="#"><?php echo WORD_28; ?></a></section>
        <section class="admin_btn_close"><a class="admin_btn" href="<?php echo ADM_SRV.routesToLink(3, 2); ?>">x <?php echo WORD_29; ?></a></section>
    </section>
</section>

<section class="wrap_admin_table">
    <section class="wrap_add">
        <form method="POST" enctype="multipart/form-data/">
            <?php include ADM_TPL."snippets/form.input.name.tpl"; ?>
            <!-- <?php include ADM_TPL."snippets/form.input.discount.tpl"; ?> -->
        </form>
    </section>
</section>