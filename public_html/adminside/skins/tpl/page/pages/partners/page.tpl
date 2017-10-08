<section class="admin_all_order">
    <section class="row">
        <section class="admin_count_order"><?php echo WORD_371; ?></section>
        <section class="span3"><a href="<?php echo ADM_SRV."{$route[2]}/{$route[3]}/?act=add"; ?>" class="add_order">+ <?php echo WORD_372; ?></a></section>
    </section>
</section>

<section class="wrap_admin_table">
    <section class="admin_table brand">
        <section class="title_brand row">
            <section class="span7">
                <section class="checkbox_list"></section>
                <span class="padding_left"><?php echo WORD_22; ?></span>
            </section>
            <section class="center_text span2"></section>
            <section class="center_text span2"></section>
            <section class="center_text span2"><?php echo WORD_25; ?></section>
        </section>
        <?php $partners_ = $partners->GetPartners(); ?>
        <?php foreach($partners_ as $key => $val){ ?>
        <section class="brand row main_row" id="id_<?php echo $partners_[$key]["id"]; ?>">
            <section class="span7">
                <section class="checkbox_list"></section>
                <a href="<?php echo SRV."partners/"; ?>" class="list_t"><span></span><i><?php echo $partners_[$key]["title"]; ?></i></a>
            </section>
            <section class="center_text span2"></section>
            <section class="center_text span2"></section>
            <section class="center_text span2">
                <a href="<?php echo ADM_SRV."{$route[2]}/{$route[3]}/{$partners_[$key]["id"]}/?act=edit" ?>" class="admin_order_edit" title="<?php echo LIST_EDIT; ?>"></a>
                <a href="<?php echo ADM_SRV."{$route[2]}/{$route[3]}/{$partners_[$key]["id"]}/?act=delete" ?>" class="admin_order_delete delete-partners" title="<?php echo LIST_DEL; ?>"></a>
            </section>
        </section>
        <?php } ?>
    </section>
</section>