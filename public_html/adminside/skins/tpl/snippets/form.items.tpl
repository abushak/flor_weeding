<section class="connect_item w9">
    <section class="caption">
        <?php echo WORD_353; ?>:
        <a href="#" class="admin_order_comment add_item_open"><span><?php echo WORD_231; ?></span></a>
        <section class="add_new" style="display: none;">
            <a class="close add_new_cancel" href="#"><i class="icon_close"></i></a>
            <section class="wrap_select">
                <select id="product_name">
                    <option></option>
                    <?php $query = $mysql->query("SELECT `id`,(SELECT `title` FROM `zet_product_description` WHERE `product_id`=`zet_product`.`id` AND `language_id`='".$site_language['id']."') AS `title` FROM `zet_product` ORDER BY `creation_date` DESC"); ?>
                    <?php while($row = $mysql->assoc($query)){ ?>
                    <option value="<?php echo $row['id']; ?>"><?php echo $row['title']; ?></option>
                    <?php } ?>
                </select>
            </section>
        </section>
    </section>
    
    <select name="connected-items" style="position:absolute;visibility:hidden;" multiple="multiple">
        <?php $query = $mysql->query("SELECT `id`,(SELECT `title` FROM `zet_product_description` WHERE `product_id`=`zet_product`.`id` AND `language_id`='".$site_language['id']."') AS `title` FROM `zet_product` ORDER BY `creation_date` DESC"); ?>
        <?php while($row = $mysql->assoc($query)){ ?>
        <option value="<?php echo $row['id']; ?>" id="_id_<?php echo $row['id']; ?>"><?php echo $row['title']; ?></option>
        <?php } ?>
    </select>
    <section id="connect-items"></section>
</section>

<script>
$(function(){
/** CONNECT ITEMS **/
    $('#product_name').select2({ 'width':'100%' });
    
    $('.add_item_open').click(function(){
        $('.add_new').css('display', '');
        return false;
    });
    
    $('.add_new_cancel').click(function(){
        $('.add_new').css('display', 'none');
        return false;
    });
    
    $('#product_name').change(function(){
        var product_id = $(this).val();
        var hidden = $('#_id_' + product_id);
        if(!hidden.attr('selected')){
            hidden.attr('selected', true);
            $.post(ADM_SRV + "bin/jquery.php", {
                func: 'get.connect.items',
                product_id: product_id
            }).done(function(data){
                $('#product_name').val($('#product_name option:first').val());
                $('#connect-items').append(data);
            });
        }
    });
    
    $('#connect-items').on('click', '.connect-item-del', function(){
        var _id = $(this).parents('.c_item').attr('data-id');
        var hidden = $('#_id_' + _id);
        hidden.attr('selected', false);
        $(this).parents('.c_item').remove();
        return false;
    });
});
</script>