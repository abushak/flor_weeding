<section class="admin_all_order">
    <section class="row">
        <section class="admin_count_order"><?php echo WORD_401; ?></section>
        <section class="span3"><a href="<?php echo ADM_SRV."{$route[2]}/{$route[3]}/?act=add"; ?>" class="add_order">+ <?php echo WORD_372; ?></a></section>
    </section>
</section>

<section class="wrap_admin_table">
    <section class="admin_table brand">
        <?php include PAGE."{$route[2]}/company/row.caption.tpl"; ?>
        <?php $query = $pages_static->getPages($site_language["id"], 1); ?>
        <?php while($page_row = $mysql->assoc($query)){ ?>
        <?php include PAGE."{$route[2]}/company/row.tpl"; ?>
        <?php } ?>
    </section>
</section>