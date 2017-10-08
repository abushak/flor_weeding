<section class="admin_all_order color">
    <section class="row">
        <section class="admin_count_order"><?php echo WORD_212; ?></section>
        <section class="admin_btn_close"><a class="admin_save" href="#"><?php echo WORD_28; ?></a></section>
    </section>
</section>

<section class="wrap_admin_table">
    <section class="wrap_add">
        <section class="upload w9" id="banner_upload">
            <input type="file" multiple="multiple" name="picture" class="banner_selector" id="picture_box" style="display: none;" />
            <a href="#" class="admin_btn upload_pic"><img src="<?php echo ADM_SKIN; ?>image/upload.png" /> <?php echo WORD_210; ?></a>
            <?php echo WORD_211; ?>
        </section>
        <section class="uploader_progress" style="display: none;">
            <img src="<?php echo ADM_SKIN; ?>image/inprogress.gif" />
        </section>
        <form method="POST" action="<?php echo ADM_SRV."design/banners/?act=edit" ?>">
            <section class="pictures_form row-fluid">
                <?php $query = $mysql->query("SELECT * FROM `zet_banner` ORDER BY `id` DESC"); ?>
                <?php while($pic_row = $mysql->assoc($query)){ ?>
                <?php include ADM_TPL."design/banners/slide.tpl"; ?>
                <?php } ?>
            </section>
        </form>
    </section>
</section>