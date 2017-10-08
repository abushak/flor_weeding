<table class="admin_table product_wholesale_table">
    <tr>
        <!-- <td><?php echo WORD_275; ?></td> -->
        <td><?php echo WORD_276; ?></td>
        <td><?php echo WORD_277; ?></td>
        <td><?php echo WORD_278; ?></td>
        <td></td>
    </tr>
    <?php $ws_query = $mysql->query("SELECT * FROM `zet_product_wholesale` WHERE `product_id`='".(int)$route[4]."'"); ?>
    <?php while($ws_row = $mysql->assoc($ws_query)){ ?>
    <?php include ROW.'product.form.wholesale.tpl'; ?>
    <?php } ?>
</table>
<a class="admin_order_comment add_product_wholesale_item" href="#"><span><?php echo WORD_279; ?></span></a>

<script>
$(function(){
    $('.add_product_wholesale_item').click(function(){
        $.post(ADM_SRV + 'bin/jquery.php', {
            func: 'load.row',
            name: 'product.form.wholesale'
        }).done(function(data) {
            $('.product_wholesale_table').append(data);
        });
        return false;
    });
    
    $('.product_wholesale_table').on('click', '.del_product_wholesale_item', function(){
        if(confirm(WORD_18)) $(this).parents('tr').remove();
        return false;
    });
});
</script>