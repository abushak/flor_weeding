<section class="span3">
    <section class="foto_item">
        <input type="hidden" name="gallery_picture_name[]" class="gallery_uploaded_picture_name" value="<?php echo $pic_row["picture_name"]; ?>" />
        <img src="<?php echo FILES."products/".$pic_row["picture_name"]; ?>" />
        <a class="admin_btn del_gallery_picture" href="#"><img src="<?php echo ADM_SKIN; ?>image/del.png" /> <?php echo WORD_38; ?></a>
    </section>
    
    <input type="text" name="gallery_picture_title[]" value="<?php echo $pic_row["picture_title"] ?>" placeholder="<?php echo WORD_49; ?>" />
    <input type="text" name="gallery_picture_alt[]" value="<?php echo $pic_row["picture_alt"] ?>" placeholder="<?php echo WORD_48; ?>" />
</section>