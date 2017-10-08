<section class="span3" id="id_<?php echo $pic_row["id"] ?>" style="margin: 0 15px 10px 0;">
    <section class="foto_item" style="width: 236px;">
        <img src="<?php echo FILES."banner/{$pic_row["picture"]}"; ?>" />
        <a class="admin_btn del-about" href="#" data-id="<?php echo $pic_row["id"] ?>"><img src="<?php echo ADM_SKIN; ?>image/del.png" /> <?php echo WORD_38; ?></a>
    </section>
    
    <input type="text" name="title[<?php echo $pic_row["id"] ?>]" value="<?php echo $pic_row["title"] ?>" placeholder="<?php echo WORD_49; ?>" />
    <input type="text" name="alt[<?php echo $pic_row["id"] ?>]" value="<?php echo $pic_row["alt"] ?>" placeholder="<?php echo WORD_48; ?>" />
</section>