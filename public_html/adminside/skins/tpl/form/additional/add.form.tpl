<section class="admin_all_order color">
    <section class="row">
        <section class="admin_count_order"><?php echo ($_GET['act'] == 'add') ? WORD_245 : WORD_246; ?></section>
        <section class="admin_btn_close"><a class="admin_save" href="#"><?php echo WORD_28; ?></a></section>
        <section class="admin_btn_close"><a class="admin_btn" href="<?php echo ADM_SRV.routesToLink(3, 2); ?>">x <?php echo WORD_29; ?></a></section>
    </section>
</section>

<section class="tab_order_content clearfix">
    <form method="POST" enctype="multipart/form-data" >
        <?php include FORM.$route[3].'/tab.main.tpl'; ?>
    </form>
</section>

<script>

function createPreview(input, pic){
    if(input.files){
        var reader = new FileReader();
        reader.onload = function(e){
            pic.attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
    }
}

jQuery(function($){
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
    $('body').on('change', '#picture_box', function(){
        var _pic = $(this).siblings('.foto_item').children('img');
        createPreview(this, _pic);
    });
    
    $('.product-variants').on('click', '.upload_variant_pic', function(){
        $(this).parent('div').children('.variant_picture_box').trigger('click');
        return false;
    });
});
</script>