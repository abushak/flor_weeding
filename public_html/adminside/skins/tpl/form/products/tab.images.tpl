<section class="upload w9" id="product-gallery-container">
    <input type="file" multiple="multiple" name="gallery_picture" class="product-gallery-files-selector" style="visibility:hidden;position:absolute;" />
    <a href="#" class="admin_btn product-gallery-upload-link"><img src="<?php echo ADM_SKIN; ?>image/upload.png" /> <?php echo WORD_210; ?></a>
    <?php echo WORD_211; ?>
</section>

<section class="upload-progress" style="display: none;">
    <img src="<?php echo ADM_SKIN; ?>image/inprogress.gif" />
</section>

<section class="product-gallery-container-img row-fluid">
    <?php $pic_query = $mysql->query("SELECT * FROM `zet_product_gallery` WHERE `product_id`='".(int)$route[4]."'"); ?>
    <?php while($pic_row = $mysql->assoc($pic_query)){ ?>
    <?php include ROW.'product.form.pic.tpl'; ?>
    <?php } ?>
</section>

<script>
$(function(){
    $('.product-gallery-upload-link').on('click', function(){
        $('.product-gallery-files-selector').trigger('click');
        return false;
    });
    
    $('#product-gallery-container').on('dragover', function(e) {
        e.preventDefault();
        e.stopPropagation();
    });
    
    $('#product-gallery-container').on('dragenter', function(e) {
        e.preventDefault();
        e.stopPropagation();
    });
    
    $('#product-gallery-container').on('drop', function(e){
        if(e.originalEvent.dataTransfer){
            if(e.originalEvent.dataTransfer.files.length){
                e.preventDefault();
                e.stopPropagation();
                productGalleryUpload(e.originalEvent.dataTransfer.files);
            }
        }
    });
    
    function productGalleryUpload(files){
        $('.upload-progress').css('display','');
        var formData = new FormData();
        for (var i = 0; i < files.length; i++) {
            formData.append('gallery_picture[]', files[i]);
        }
        
        $.ajax({
            url: ADM_SRV + 'bin/jquery.php?func=upload.product.gallery',
            data: formData,
            processData: false,
            contentType: false,
            type: 'POST',
            success: function(data){
                $('.product-gallery-container-img').prepend(data);
                $('.upload-progress').css('display','none');
            }
        });
    }
    
    $('.product-gallery-files-selector').on('change', function(){
        productGalleryUpload($(this)[0].files);
    });
    
    $('.product-gallery-container-img').on('click', '.del_gallery_picture', function(){
        if(confirm(WORD_18)){
            var picture = $(this).parent('.foto_item').children('.gallery_uploaded_picture_name').val();
            $(this).parent('.foto_item').parent('.span3').remove();
            $.post(ADM_SRV + 'bin/jquery.php', {
                func: 'delete.product.gallery',
                name: picture
            });
            return false;
        } else return false;
    });
});
</script>