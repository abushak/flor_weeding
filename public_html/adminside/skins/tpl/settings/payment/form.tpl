<section class="admin_all_order color">
    <section class="row">
        <section class="admin_count_order"><a href="<?php echo ADM_SRV."{$route[2]}/{$route[3]}"; ?>" class="admin_btn">&#8592; <?php echo WORD_26; ?></a> <?php echo ($_GET["act"] == "add") ? WORD_158 : WORD_159; ?></section>
        <section class="admin_btn_close"><a href="#" class="admin_save"><?php echo WORD_28; ?></a></section>
        <section class="admin_btn_close"><a href="<?php echo ADM_SRV."{$route[2]}/{$route[3]}"; ?>" class="admin_btn"><?php echo WORD_29; ?></a></section>
    </section>
</section>

<section class="wrap_admin_table">
    <section class="wrap_add">
        <form method="POST" enctype="multipart/form-data">
            <table class="add">
                <thead>
                    <tr class="choose_lang">
                        <td></td>
                        <td>
                            <?php $bool = true; ?>
                            <?php foreach ($langs as $key => $val) { ?>
                            <a href="#" class="admin_lang<?php echo ($bool == true) ? " t_lang" : false; ?>"><?php echo $val["name"]; ?></a>
                            <?php $bool = false; ?>
                            <?php } ?>
                        </td>
                    </tr>
                </thead>
                <?php $bool = true; ?>
                <?php foreach ($langs as $key => $val) { ?>
                <tbody class="lang_body" style="<?php echo ($bool == false) ? "display: none;" : false; ?>">
                    <tr>
                        <td><?php echo CT_TITLE; ?>:</td>
                        <td class="padding_left">
                            <input type="text" class="required_" value="<?php echo $language[$val["id"]]["title"]; ?>" name="title[<?php echo $val["id"]; ?>]" />
                        </td>
                    </tr>
                    <tr>
                        <td><?php echo WORD_404; ?>:</td>
                        <td class="padding_left">
                            <input type="text" value="<?php echo $language[$val["id"]]["short_description"]; ?>" name="short_description[<?php echo $val["id"]; ?>]" />
                        </td>
                    </tr>
                    <tr>
                        <td><?php echo FRM_TEXT; ?>:</td>
                        <td class="padding_left">
                            <textarea class="ckeditor" name="description[<?php echo $val["id"]; ?>]"><?php echo $language[$val["id"]]["description"]; ?></textarea>
                        </td>
                    </tr>
                </tbody>
                <?php $bool = false; ?>
                <?php } ?>
            </table>
            
            <script>
                CKEDITOR.config.width = '98%';
                CKEDITOR.config.height = '250px';
                CKFinder.setupCKEditor(null, "<?php echo ADM_SRV.'modules/ckfinder/'; ?>");
            </script>
            
            <hr class="desc_line mrg_t" />
            
            <?php include ADM_TPL."snippets/form.status.tpl"; ?>
        </form>
    </section>
</section>