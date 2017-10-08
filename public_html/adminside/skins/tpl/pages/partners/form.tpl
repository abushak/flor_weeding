<section class="admin_all_order">
    <section class="row">
        <section class="admin_count_order"><a class="admin_btn" href="<?php echo ADM_SRV."{$route[2]}/{$route[3]}/"; ?>">&#8592; <?php echo WORD_26; ?></a> <?php echo WORD_371; ?></section>
        <section class="admin_btn_close"><a class="admin_save" href="#"><?php echo WORD_28; ?></a></section>
        <section class="admin_btn_close"><a class="admin_btn" href="<?php echo ADM_SRV."{$route[2]}/{$route[3]}/"; ?>"><?php echo WORD_29; ?></a></section>
    </section>
</section>

<section class="wrap_admin_table">
    <section class="wrap_add">
        <form method="POST" enctype="multipart/form-data" >
            <table class="add">
                <thead>
                    <tr class="choose_lang">
                        <td></td>
                        <td> <?php include ADM_ROOT.'modules/snippets/lang.list.php'; ?> </td>
                    </tr>
                </thead>
                <?php $bool = true; ?>
                <?php $query = $mysql->query("SELECT * FROM `zet_language` ORDER BY `store_default`<>'0' DESC"); ?>
                <?php while($row = $mysql->assoc($query)){ ?>
                <?php $display = ($bool) ? false : "display:none;"; ?>
                <tbody class="lang_body" style="<?php echo $display; ?>">
                    <tr>
                        <td><?php echo CT_TITLE; ?>*:</td>
                        <td class="padding_left">
                            <input type="text" class="required_" value='<?php echo $language[$row["id"]]["title"]; ?>' name="title[<?php echo $row["id"]; ?>]" />
                        </td>
                    </tr>
                    <tr>
                        <td><?php echo FRM_TEXT; ?>:</td>
                        <td class="padding_left">
                            <textarea class="ckeditor" name="description[<?php echo $row["id"]; ?>]"><?php echo $language[$row["id"]]["text"]; ?></textarea>
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
            
            <br />
            <section class="description">
                <label><?php echo WORD_32; ?>:</label>
                <input type="text" value="<?php echo $params["link"]; ?>" class="url" name="url" />
            </section>
            
            <?php include ADM_TPL."snippets/form.picture.tpl"; ?>
        </form>
    </section>
</section>