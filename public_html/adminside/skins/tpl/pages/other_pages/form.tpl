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
                
                <?php if ($route[4] == '1' || $route[4] == '2') { ?>
                <hr class="desc_line mrg_t" />
                <section class="description">
                    <label>PDF</label>
                    <input type="file" name="pdf" />
                </section>
                <?php } ?>
            </form>
        </table>
    </section>
</section>