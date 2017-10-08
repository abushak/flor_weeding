<table class="admin_table product_promo_table">
    <tr>
        <td><?php echo WORD_275; ?></td>
        <td><?php echo WORD_276; ?></td>
        <td><?php echo WORD_277; ?></td>
        <td><?php echo WORD_280; ?></td>
        <td><?php echo WORD_281; ?></td>
        <td></td>
    </tr>
    <?php $pr_query = $mysql->query("SELECT * FROM `zet_product_promo` WHERE `product_id`='".(int)$route[4]."'"); ?>
    <?php while($pr_row = $mysql->assoc($pr_query)){ ?>
    <?php include ROW.'product.form.promo.tpl'; ?>
    <?php } ?>
</table>
<a class="admin_order_comment add_product_promo_item" href="#"><span><?php echo WORD_279; ?></span></a>

<script>
$(function(){
    $('.add_product_promo_item').click(function(){
        $.post(ADM_SRV + 'bin/jquery.php', {
            func: 'load.row',
            name: 'product.form.promo'
        }).done(function(data) {
            $('.product_promo_table').append(data);
            $('.datepicker_nolimit').datepicker({'minDate': null});
        });
        return false;
    });
    
    $('.product_promo_table').on('click', '.del_product_promo_item', function(){
        if(confirm(WORD_18)) $(this).parents('tr').remove();
        return false;
    });
});
</script>