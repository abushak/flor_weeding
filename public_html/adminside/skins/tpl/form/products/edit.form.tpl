<section class="admin_all_order color">
    <section class="row">
        <section class="admin_count_order"><?php echo ($_GET['act'] == 'add') ? WORD_245 : WORD_246; ?></section>
        <section class="admin_btn_close"><a class="admin_save" href="#"><?php echo WORD_28; ?></a></section>
        <section class="admin_btn_close"><a class="admin_btn" href="<?php echo ADM_SRV.routesToLink(3, 2); ?>">x <?php echo WORD_29; ?></a></section>
    </section>
</section>

<ul class="admin_tab_order">
    <li><a href="#" class="active_tab"><span><?php echo WORD_247; ?></span></a></li>
    <li><a href="#"><span><?php echo WORD_248; ?></span></a></li>
    <li><a href="#"><span><?php echo WORD_249; ?></span></a></li>
    <li><a href="#"><span><?php echo WORD_250; ?></span></a></li>
    <li><a href="#"><span><?php echo WORD_251; ?></span></a></li>
    <li><a href="#"><span><?php echo WORD_252; ?></span></a></li>
</ul>

<section class="tab_order_content clearfix">
    <form method="POST" enctype="multipart/form-data" >
        <aside><?php include FORM.$route[3].'/tab.description.tpl'; ?></aside>
        <aside><?php include FORM.$route[3].'/tab.main.edit.tpl'; ?></aside>
        <aside><?php include FORM.$route[3].'/tab.features.tpl'; ?></aside>
        <aside><?php include FORM.$route[3].'/tab.images.tpl'; ?></aside>
        <aside><?php include FORM.$route[3].'/tab.promo.tpl'; ?></aside>
        <aside><?php include FORM.$route[3].'/tab.wholesale.tpl'; ?></aside>
    </form>
</section>


<script>
$(function(){
/*    $('.variants_list').on('click', '.upload_variant_pic', function(){
        $(this).parent('td').children('.variant_picture_box').trigger('click');
        return false;
    });
    
    var first_variant = 0;
    var items_
    $('.add_product_variant').click(function(){
        $('.product_variants').removeClass('variant_table');
        $('.product_photo').removeClass('variant_upload');
        
        var x = $(".variants_list tr").length;
        if(first_variant == 0 && x == 1){
            $(".caption_row").prepend('<td>' + WORD_22 + '</td>');
            $(".caption_row").append('<td></td><td></td>');
            $.post(ADM_SRV + 'bin/jquery.php', {
                func: 'get_variant',
                type: '0'
            }).success(function(data){
                $(".variants_list tr").first().remove();
                $(".variants_list").append(data);
                $('.variant tr').last().children('td').attr('colspan', '8');
            });
            first_variant++;
        }
        
        $.post(ADM_SRV + 'bin/jquery.php', {
            func: 'get_variant',
            type: '0'
        }).success(function(data){
            $(".variants_list").append(data);
        });
        
        return false;
    });
    
    $(".variants_list").on('click', '.del_variant', function(){
        var x = $(".variants_list tr").length;
        $(this).parent('td').parent('tr').remove();
        if(x == 2){
            $('.variants_list tr').first().remove();
            $('.product_variants').addClass('variant_table');
            $('.product_photo').addClass('variant_upload');
            $('.variant_upload').css('display', 'block');
            $('.caption_row td').first().remove();
            $('.caption_row td').last().remove();
            $('.caption_row td').last().remove();
            $('.variant tr').last().children('td').attr('colspan', '5');
            $.post(ADM_SRV + 'bin/jquery.php', {
                func: 'get_variant',
                type: '1'
            }).success(function(data){
                $(".variants_list").append(data);
            });
            first_variant = 0;
        }
        return false;
    }); */
});
</script>


<script>
$(function(){
/** PRODUCT STATUS **/
    $('.on').click(function(){
        var check = $('#check-status');
        $(this).toggleClass('active');
        if (check.attr('checked')) check.attr('checked', false); else check.attr('checked', true);
        return false;
    });
    
    $('.new').click(function(){
        var check = $('#check-new');
        $(this).toggleClass('active');
        if (check.attr('checked')) check.attr('checked', false); else check.attr('checked', true);
        return false;
    });
    
    $('.recom').click(function(){
        var check = $('#check-recommended');
        $(this).toggleClass('active');
        if (check.attr('checked')) check.attr('checked', false); else check.attr('checked', true);
        return false;
    });
    
    $('.hit').click(function(){
        var check = $('#check-hit');
        $(this).toggleClass('active');
        if (check.attr('checked')) check.attr('checked', false); else check.attr('checked', true);
        return false;
    });
    
/** PRODUCT OPTION **/
    $('.product-variants tr:nth-child(2) td:last-child').html('');
    
    $('.product-variants').on('click', '.upload_variant_pic', function(){
        $(this).parent('td').children('.variant_picture_box').trigger('click');
        return false;
    });
    
    $('.add_product_variant').click(function(){
        $.post(ADM_SRV + 'bin/jquery.php', {
            func: 'get_variant'
        }).success(function(data){
            $(".product-variants").append(data);
        });
        return false;
    });
    
    $(".product-variants").on('click', '.del_variant', function(){
        $(this).parent('td').parent('tr').remove();
        return false;
    });
});
</script>