<?php $_cc = new CatalogCategory(); ?>
<?php $_cl = $_cc->GetCategoriesList(); ?>
<section class="admin_all_order color">
    <section class="row">
        <section class="admin_count_order"><a class="admin_btn" href="<?php echo ADM_SRV."{$route[2]}/{$route[3]}/"; ?>">&#8592; <?php echo WORD_26; ?></a> <?php echo ($_GET["act"] == "add") ? WORD_214 : WORD_215; ?></section>
        <section class="admin_btn_close"><a class="admin_save" href="#"><?php echo WORD_28; ?></a></section>
        <section class="admin_btn_close"><a class="admin_btn" href="<?php echo ADM_SRV."{$route[2]}/{$route[3]}/"; ?>"><?php echo WORD_29; ?></a></section>
    </section>
</section>

<?php if($route[4] == '8') { include ADM_TPL."{$route[2]}/{$route[3]}/form.color.tpl"; } else { ?>
<section class="wrap_admin_table">
    <section class="wrap_add">
        <form method="POST">
            <?php include ADM_TPL."{$route[2]}/{$route[3]}/form.input.name.tpl"; ?>
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
<?php } ?>
<script>
jQuery(function($){
    $('.check-all').click(function(){
        $('#category-check').find('input:checkbox').prop('checked', true);
        return false;
    });
    
    $('.uncheck-all').click(function(){
        $('#category-check').find('input:checkbox').prop('checked', false);
        return false;
    });
    
    if($('#as_filter').prop('checked')) $('#categories-list').css('display','');
    else $('#categories-list').css('display','none');
    
    $('#as_filter_l').click(function(){
        if($('#as_filter').prop('checked')) $('#categories-list').slideUp();
        else $('#categories-list').slideDown();
    });
})
</script>