<section class="admin_all_order">
    <section class="row">
        <section class="admin_count_order"><?php echo WORD_107; ?>: <?php echo $userlist_users->countUsers(); ?></section>
        <section class="span4"><a class="add_order" href="<?php echo ADM_SRV.routesToLink(3, 2).'?act=add' ?>">+ <?php echo WORD_108; ?></a></section>
        <section class="admin_btn_close"><a class="admin_btn del_all" href="#">x <?php echo WORD_18; ?></a></section>
    </section>
</section>

<?php include PAGE."{$route[2]}/{$route[3]}/search.form.tpl"; ?>

<section class="wrap_admin_table">
    <table class="admin_table brand group">
        <?php include PAGE."{$route[2]}/{$route[3]}/caption.row.tpl"; ?>
        <?php $query = $userlist_users->getUsers($site_language['id'], $_GET); ?>
        <?php while($row = $mysql->assoc($query)){ ?>
        <?php include PAGE."{$route[2]}/{$route[3]}/row.tpl"; ?>
        <?php } ?>
    </table>
</section>