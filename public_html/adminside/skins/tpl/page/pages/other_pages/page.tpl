<section class="admin_all_order">
    <section class="row">
        <section class="admin_count_order"><?php echo WORD_351; ?></section>
    </section>
</section>

<section class="wrap_admin_table">
    <section class="admin_table brand">
        <?php include PAGE."{$route[2]}/{$route[3]}/caption.row.tpl"; ?>
        <?php $query = $pages_static->getPages($site_language["id"]); ?>
        <?php while($page_row = $mysql->assoc($query)){ ?>
        <?php include PAGE."{$route[2]}/{$route[3]}/row.tpl"; ?>
        <?php } ?>
    </section>
</section>