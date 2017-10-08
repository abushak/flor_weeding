<section class="upload <?php echo ($route[3] == 'products') ? false : 'w9'; ?>">
    <input type="file" name="picture" style="visibility:hidden; width: 0px;" id="picture_box" />
    <section class="foto_item">
        <img src="<?php echo getFile($params["picture"]); ?>" />
        <a class="admin_btn del_pic" href="#"><img src="<?php echo ADM_SKIN; ?>image/del.png" /> <?php echo WORD_38; ?></a>
    </section>
    
    <section class="choose_file">
        <p><?php echo WORD_39; ?>:</p> <span class="file_name"><?php echo WORD_40; ?> </span><br />
        <a class="admin_btn upload_pic" href="#"><img src="<?php echo ADM_SKIN; ?>image/upload.png" /> <?php echo WORD_41; ?></a>
        <a class="seo" href="#"><?php echo WORD_42; ?></a>
        <section class="seo_block" style="display: none;">
            <input type="text" name="picture_alt" placeholder="<?php echo WORD_48; ?>" />
            <input type="text" name="picture_title" placeholder="<?php echo WORD_49; ?>" />
            <input type="submit" name="" value="ок" />
        </section>
    </section>
</section>