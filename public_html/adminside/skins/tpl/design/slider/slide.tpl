<section class="wrap_slide" id="id_<?php echo $pic_row["id"] ?>" style="border-bottom: 1px solid #E2EAF0;padding-bottom:16px;">
    <section class="foto_slide">
        <img src="<?php echo FILES."slider/".$pic_row["picture"]; ?>" />
        <a href="#" class="admin_btn del_slide" data-id="<?php echo $pic_row["id"] ?>"><img src="<?php echo ADM_SKIN; ?>image/del.png" /> <?php echo WORD_38; ?></a>
    </section>
    <input type="text" name="title[<?php echo $pic_row["id"] ?>]" value="<?php echo $pic_row["title"] ?>" placeholder="<?php echo WORD_49; ?>" />
    <input type="text" name="alt[<?php echo $pic_row["id"] ?>]" value="<?php echo $pic_row["alt"] ?>" placeholder="<?php echo WORD_48; ?>" />
    <input type="text" name="url[<?php echo $pic_row["id"] ?>]" value="<?php echo $pic_row["url"] ?>" placeholder="<?php echo FRM_LINK; ?>" />
</section>