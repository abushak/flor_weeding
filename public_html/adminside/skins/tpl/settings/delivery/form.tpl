<section class="admin_all_order color">
    <section class="row">
        <section class="admin_count_order"><a href="<?php echo ADM_SRV.routesToLink(3, 2); ?>" class="admin_btn">&#8592; <?php echo WORD_26; ?></a> <?php echo ($_GET["act"] == "add") ? WORD_169 : WORD_170; ?></section>
        <section class="admin_btn_close"><a href="#" class="admin_save"><?php echo WORD_28; ?></a></section>
        <section class="admin_btn_close"><a href="<?php echo ADM_SRV.routesToLink(3, 2); ?>" class="admin_btn"><?php echo WORD_29; ?></a></section>
    </section>
</section>

<section class="wrap_admin_table">
    <section class="wrap_add">
        <form method="POST" enctype="multipart/form-data" >
            <?php include ADM_TPL."snippets/form.description.notags.tpl"; ?>
            
            <hr class="desc_line mrg_t" />
            
            <?php include ADM_TPL."snippets/form.status.tpl"; ?>
            
            <?php include ADM_TPL."snippets/form.availability.tpl"; ?>
            
            <section class="description">
                <label><?php echo WORD_171; ?>:</label>
                <input type="text" name="price" value="<?php echo $params["price"]; ?>" class="sort_input" /> <?php echo $site_currency["abbr"]; ?>
            </section>
            
            <section class="description">
                <label><?php echo WORD_172; ?>:</label>
                <input type="text" name="free_from" value="<?php echo $params["free_from"]; ?>" class="sort_input" /> <?php echo $site_currency["abbr"]; ?>
            </section>
            
            <hr class="desc_line mrg_t" />
            
            <p class="caption"><?php echo WORD_173; ?></p>
            <section class="description">
                <label></label>
                <ul class="checkbox_list">
                    <?php include ADM_ROOT."modules/settings/delivery/payments.php"; ?>
                </ul>				
            </section>
        </form>
    </section>
</section>