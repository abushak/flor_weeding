<section class="wrap_admin_table">
    <section class="wrap_add">
        <form method="POST">
            <section class="description">
                <label><?php echo WORD_22; ?>:</label>
                <span><?php echo $language[$lang_id]["name"]; ?></span>
            </section>
            <input type="hidden" class="prop_type" name="type" value="<?php echo $params['type']; ?>" />
            
            <?php include ADM_TPL."{$route[2]}/{$route[3]}/form.input.status.tpl"; ?>
            <?php include ADM_TPL."{$route[2]}/{$route[3]}/form.input.categories.tpl"; ?>
            <hr class="desc_line mrg_t" />
            
            <table class="admin_table brand">
                <tr>
                    <td class="padding_left"><span class="padding_left"><?php echo WORD_22; ?></span></td>
                    <td class="center_text"></td>
                    <td></td>
                </tr>
                <tbody class="values" data-id="1">
                    <?php include ADM_ROOT."modules/catalog/properties/values.php"; ?>
                </tbody>
            </table>
            
            <a class="admin_order_comment mrg add_prop_value" href="#"><span><?php echo WORD_229; ?></span></a>
        </form>
    </section>
</section>