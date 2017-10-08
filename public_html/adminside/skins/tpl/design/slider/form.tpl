<section class="admin_all_order color">
    <section class="row">
        <section class="admin_count_order"><a class="admin_btn" href="<?php echo ADM_SRV."{$route[2]}/{$route[3]}/"; ?>">&#8592; <?php echo WORD_26; ?></a> <?php echo WORD_209; ?></section>
        <section class="admin_btn_close"><a class="admin_save" href="#"><?php echo WORD_28; ?></a></section>
        <section class="admin_btn_close"><a class="admin_btn" href="<?php echo ADM_SRV."{$route[2]}/{$route[3]}/"; ?>"><?php echo WORD_29; ?></a></section>
    </section>
</section>

<section class="wrap_admin_table">
    <section class="wrap_add">
        <form method="POST" enctype="multipart/form-data" >
            <!-- DESCRIPTION -->
            <table class="add">
                <thead>
                    <tr class="choose_lang">
                        <td></td>
                        <td>
                            <?php $bool = true; ?>
                            <?php foreach ($langs as $key => $val) { ?>
                            <?php $class = ($bool == true) ? "t_lang" : false; ?>
                            <a href="#" class="admin_lang <?php echo $class; ?>"><?php echo $val["name"]; ?></a>
                            <?php $bool = false; ?>
                            <?php } ?>
                        </td>
                    </tr>
                </thead>
                <?php $bool = true; ?>
                <?php foreach ($langs as $key => $val) { ?>
                <?php $display = ($bool == false) ? "display:none;" : false; ?>
                <tbody class="lang_body" style="<?php echo $display; ?>">
                    <tr>
                        <td><?php echo CT_TITLE; ?>:</td>
                        <td class="padding_left"><input type="text" class="required_" value='<?php echo $description[$val["id"]]["title"]; ?>' name="title[<?php echo $val["id"]; ?>]" /></td>
                    </tr>
                    <tr>
                        <td><?php echo WORD_399; ?>:</td>
                        <td class="padding_left"><input type="text" class="required_" value='<?php echo $description[$val["id"]]["link_text"]; ?>' name="link_text[<?php echo $val["id"]; ?>]" /></td>
                    </tr>
                    <tr>
                        <td><?php echo FRM_TEXT; ?>:</td>
                        <td class="padding_left"><textarea style="width: 98%; height: 200px; resize: none;" name="description[<?php echo $val["id"]; ?>]"><?php echo $description[$val["id"]]["text"]; ?></textarea></td>
                    </tr>
                </tbody>
                <?php $bool = false; ?>
                <?php } ?>
            </table>
            <!-- DESCRIPTION END -->

            <hr class="desc_line mrg_t" />

            <!-- URL -->
            <section class="description">
                <label><?php echo WORD_32; ?>:</label>
                <input type="text" value="<?php echo $params["url"]; ?>" class="url required_" name="url" />
            </section>
            <!-- URL END -->

            <!-- PICTURE -->
            <section class="upload <?php echo ($route[3] == 'products') ? false : 'w9'; ?>">
                <input type="file" name="picture" style="visibility:hidden; width: 0px;" id="picture_box" />
                <section class="foto_item">
                    <img src="<?php echo getFile($params["picture"]); ?>" />
                    <a class="admin_btn del_pic" href="#"><img src="<?php echo ADM_SKIN; ?>image/del.png" /> <?php echo WORD_38; ?></a>
                </section>
                <section class="choose_file">
                    <p><?php echo WORD_400; ?></p> <span class="file_name"><?php echo WORD_40; ?> </span><br />
                    <a class="admin_btn upload_pic" href="#"><img src="<?php echo ADM_SKIN; ?>image/upload.png" /> <?php echo WORD_41; ?></a>
                </section>
            </section>
            <!-- PICTURE END -->
        </form>
    </section>
</section>
