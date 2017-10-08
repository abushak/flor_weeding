<section class="admin_all_order color">
    <section class="row">
        <section class="admin_count_order"><a class="admin_btn" href="<?php echo ADM_SRV.routesToLink(3, 2); ?>">&#8592; <?php echo WORD_26; ?></a> <?php echo WORD_27; ?></section>
        <section class="admin_btn_close"><a class="admin_save" href="#"><?php echo WORD_28; ?></a></section>
        <section class="admin_btn_close"><a class="admin_btn" href="<?php echo ADM_SRV.routesToLink(3, 2); ?>"><?php echo WORD_29; ?></a></section>
    </section>
</section>

<section class="wrap_admin_table">
    <section class="wrap_add">
        <form method="POST" enctype="multipart/form-data" >
            <?php include ADM_TPL."snippets/form.description.tpl"; ?>
            
            <hr class="desc_line mrg_t" />
            
            <section class="description">
                <label><?php echo WORD_30; ?>:</label>
                <select name="parent_category">
                    <option value="0"><?php echo WORD_31; ?></option>
                    <?php $query = $catalog_category->getCategories($site_language["id"]);
                    while($category_row = $mysql->assoc($query)) {
                        include ADM_TPL."catalog/categories/select.row.tpl";
                        $sub_query = $catalog_category->getCategories($site_language["id"], $category_row["id"]);
                        while($category_row = $mysql->assoc($sub_query)) {
                            include ADM_TPL."catalog/categories/select.sub.row.tpl";
                        }
                    } ?>
                </select>
            </section>
            
            <?php include ADM_TPL."snippets/form.url.tpl"; ?>
            <?php include ADM_TPL."snippets/form.status.tpl"; ?>
            <?php include ADM_TPL."snippets/form.availability.tpl"; ?>
            <!-- <?php //include ADM_TPL."snippets/form.picture.tpl"; ?> -->
        </form>
    </section>	
</section>
