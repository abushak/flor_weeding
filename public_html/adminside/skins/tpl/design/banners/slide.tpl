<section class="span3" id="id_<?php echo $pic_row["id"] ?>">
    <section class="foto_item">
        <img src="<?php echo FILES."banner/".$pic_row["picture"]; ?>" />
        <a class="admin_btn del_banner" href="#" data-id="<?php echo $pic_row["id"] ?>"><img src="<?php echo ADM_SKIN; ?>image/del.png" /> <?php echo WORD_38; ?></a>
    </section>
    
    <input type="text" name="title[<?php echo $pic_row["id"] ?>]" value="<?php echo $pic_row["title"] ?>" placeholder="<?php echo WORD_49; ?>" />
    <input type="text" name="alt[<?php echo $pic_row["id"] ?>]" value="<?php echo $pic_row["alt"] ?>" placeholder="<?php echo WORD_48; ?>" />
    <input type="text" name="url[<?php echo $pic_row["id"] ?>]" value="<?php echo $pic_row["url"] ?>" placeholder="<?php echo FRM_LINK; ?>" />
</section>