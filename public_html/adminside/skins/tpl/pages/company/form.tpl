<section class="admin_all_order">
    <section class="row">
        <section class="admin_count_order"><a class="admin_btn" href="<?php echo ADM_SRV."{$route[2]}/{$route[3]}"; ?>">&#8592; <?php echo WORD_26; ?></a> <?php echo ($route[3] == "company") ? WORD_402 : WORD_401; ?></section>
        <section class="admin_btn_close"><a class="admin_save" href="#"><?php echo WORD_28; ?></a></section>
        <section class="admin_btn_close"><a class="admin_btn" href="<?php echo ADM_SRV."{$route[2]}/{$route[3]}"; ?>"><?php echo WORD_29; ?></a></section>
    </section>
</section>

<section class="wrap_admin_table">
    <section class="wrap_add">
        <table class="add">
            <form method="POST" enctype="multipart/form-data" >
                <?php include ADM_TPL."snippets/form.description.notags.tpl"; ?>
                
                <hr class="desc_line mrg_t" />
                
                <section class="upload w9">
                    <input type="file" name="picture" style="visibility:hidden; width: 0px;" id="picture_box" />
                    <section class="foto_item">
                        <img src="<?php echo getFile($params["file"]); ?>" />
                        <a class="admin_btn del_pic" href="#"><img src="<?php echo ADM_SKIN; ?>image/del.png" /> <?php echo WORD_38; ?></a>
                    </section>
                    
                    <section class="choose_file">
                        <p><?php echo WORD_39; ?>:</p> <span class="file_name"><?php echo WORD_40; ?> </span><br />
                        <a class="admin_btn upload_pic" href="#"><img src="<?php echo ADM_SKIN; ?>image/upload.png" /> <?php echo WORD_41; ?></a>
                    </section>
                </section>
                <input type="hidden" name="parent" value="<?php echo $route[3]; ?>" />
            </form>
        </table>
    </section>
</section>