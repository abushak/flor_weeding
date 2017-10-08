<section class="admin_all_order">
    <section class="row">
        <section class="admin_count_order"><?php echo ($_GET['act'] == "add") ? WORD_200 : WORD_201;?></section>
        <section class="admin_btn_close"><a class="admin_save" href="#"><?php echo WORD_28; ?></a></section>
        <section class="admin_btn_close"><a class="admin_btn" href="<?php echo ADM_SRV.routesToLink(3, 2); ?>">x <?php echo WORD_29; ?></a></section>
    </section>
</section>

<section class="wrap_admin_table">
    <section class="wrap_add">
        <form method="POST" enctype="multipart/form-data/" class="edit_form">
            <table class="add">
                <tbody class="lang_body" style="<?php echo $display; ?>">
                    <tr>
                        <td><?php echo WORD_185; ?>:</td>
                        <td class="padding_left">
                            <input type="text" name="name" class="required_" value="<?php echo $params["name"]; ?>" />
                        </td>
                    </tr>
                    <tr>
                        <td><?php echo WORD_196; ?>:</td>
                        <td class="padding_left">
                            <input type="text" name="date" class="required_ datepicker_nolimit" value="<?php echo $params["date"]; ?>" />
                        </td>
                    </tr>
                    <tr>
                        <td><?php echo FRM_TEXT; ?>:</td>
                        <td class="padding_left">
                            <textarea name="text" class="required_"><?php echo $params["text"]; ?></textarea>
                        </td>
                    </tr>
                </tbody>
            </table>
        </form>
    </section>
</section>