<section class="admin_all_order">
    <section class="row">
        <section class="admin_count_order"><a class="admin_btn" href="<?php echo ADM_SRV.routesToLink(3, 2); ?>">&#8592; <?php echo WORD_26; ?></a> <?php echo ($_GET["act"] == "add") ? WORD_205 : WORD_206; ?></section>
        <section class="admin_btn_close"><a class="admin_save" href="#"><?php echo WORD_28; ?></a></section>
        <section class="admin_btn_close"><a class="admin_btn" href="<?php echo ADM_SRV.routesToLink(3, 2); ?>"><?php echo WORD_29; ?></a></section>
    </section>
</section>

<section class="wrap_admin_table">
    <section class="wrap_add">
        <table class="add">
            <form method="POST" enctype="multipart/form-data" >
                <?php include ADM_TPL."snippets/form.description.tpl"; ?>
                
                <hr class="desc_line mrg_t" />
                
                <?php if($params["type"] != "1"){ ?>
                <section class="description">
                    <label><?php echo WORD_30; ?>:</label>
                    <select name="parent_category">
                        <option value="0"><?php echo WORD_31; ?></option>
                        <?php include ADM_ROOT."modules/pages/main_menu/parent.category.php" ?>
                    </select>
                </section>
                
                <?php include ADM_TPL."snippets/form.url.tpl"; ?>
                
                <?php } ?>
                
                <?php include ADM_TPL."snippets/form.status.tpl"; ?>
                
                <?php include ADM_TPL."snippets/form.availability.tpl"; ?>
            </form>
        </table>
    </section>
</section>