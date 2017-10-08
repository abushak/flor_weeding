<section class="admin_all_order color">
    <section class="row">
        <section class="admin_count_order"><?php echo WORD_209; ?></section>
        <section class="span3"><a href="<?php echo ADM_SRV."{$route[2]}/{$route[3]}/?act=add"; ?>" class="add_order">+ <?php echo CT_ADD; ?></a></section>
    </section>
</section>

<section class="wrap_admin_table">
    <section class="admin_table brand">
        <?php include ADM_TPL."{$route[2]}/{$route[3]}/row.caption.tpl"; ?>
        <?php $_Slides = $_DesignSlide->GetAllSlides(); ?>
        <?php foreach ($_Slides as $key => $val) { ?>
        <?php include ADM_TPL."{$route[2]}/{$route[3]}/row.tpl"; ?>
        <?php } ?>
    </section>
</section>

<section class="wrap_admin_table">
    <section class="admin_table brand">
        <?php $_Slides = $_DesignSlide->GetSlides(1); ?>
        <?php foreach ($_Slides as $key => $val) { ?>
        <?php include ADM_TPL."{$route[2]}/{$route[3]}/row.static.tpl"; ?>
        <?php } ?>
    </section>
</section>