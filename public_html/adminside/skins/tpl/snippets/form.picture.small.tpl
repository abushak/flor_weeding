<section class="upload">
    <input type="file" name="picture" style="display:none;" id="picture_box" />
    <p>Главное изображение:</p>
    <section class="foto_item">
        <img src="<?php echo getFile($params["picture"]); ?>" />
        <a href="#" class="admin_btn del_pic"><img src="<?php echo ADM_SKIN; ?>image/del.png" /> <?php echo WORD_38; ?></a>
    </section>
    
    <section class="choose_file">
        <span class="file_name"><?php echo WORD_40; ?> </span><br />
        <a class="admin_btn upload_pic" href="#"><img src="<?php echo ADM_SKIN; ?>image/upload.png" /> <?php echo WORD_41; ?></a><br />
        <a class="seo" href="#"><?php echo WORD_42; ?></a>
        <section class="seo_block" style="display: none;">
            <input type="text" name="picture_title" value="<?php echo $params['picture_title'] ?>" placeholder="<?php echo WORD_49; ?>" />
            <input type="text" name="picture_alt" value="<?php echo $params['picture_alt'] ?>" placeholder="<?php echo WORD_48; ?>" />
            <input type="submit" name="" value="ок" />
        </section>
    </section>
</section>