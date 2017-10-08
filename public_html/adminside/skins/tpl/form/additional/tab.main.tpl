<table class="add">
    <thead>
        <tr class="choose_lang">
            <td></td>
            <td> <?php include ADM_ROOT.'modules/snippets/lang.list.php'; ?> </td>
        </tr>
    </thead>
    <?php $query = $mysql->query("SELECT * FROM `zet_language` ORDER BY `store_default`<>'0' DESC"); ?>
    <?php $bool = true; ?>
    <?php while ($row = $mysql->assoc($query)) { ?>
    <?php $display = ($bool == false) ? "display:none;" : false; ?>
    <tbody class="lang_body" style="<?php echo $display; ?>">
        <tr>
            <td><?php echo CT_TITLE; ?>:</td>
            <td class="padding_left">
                <input type="text" class="required_" value='<?php echo $language[$row["id"]]["title"]; ?>' name="title[<?php echo $row["id"]; ?>]" />
            </td>
        </tr>
    </tbody>
    <?php $bool = false; ?>
    <?php } ?>
</table>

<hr class="desc_line mrg_t" />

<p class="inner_status">
    <?php echo WORD_255; ?>:
    <a href="#" class="admin_btn on <?php echo ($params['status'] == 1 || $_GET['act'] == 'add') ? 'active' : false; ?>"><?php echo WORD_256; ?></a>
    <input type="checkbox" name="status" id="check-status" <?php echo ($params['status'] == 1 || $_GET['act'] == 'add') ? 'checked="checked"' : false; ?> style="visibility:hidden;position:absolute;" />
</p>

<input type="hidden" name="main_category" value="5" />
<input type="hidden" name="additional" value="1" />
<section>
    <section style="width: 63%; float: left;">
        <div class="add_table variant">
            <?php include FORM."{$route[3]}/caption.row.tpl"; ?>
            <div class="product-variants">
                <?php if($_GET['act'] == 'add') { ?>
                <?php include FORM."{$route[3]}/variant.row.tpl"; ?>
                <?php } else { ?>
                <?php $op_query = $mysql->query("SELECT * FROM `zet_product_option` WHERE `product_id`='".(int)$route[4]."'"); ?>
                <?php while($op_row = $mysql->assoc($op_query)){ ?>
                <?php include FORM."{$route[3]}/variant.row.tpl"; ?>
                <?php } ?><?php } ?>
            </div>
        </div>
    </section>
    
    <section style="width: 35%; float: left; margin-left: 2%;">
        <section class="upload w9">
            <input type="file" name="picture" style="visibility:hidden; width: 0px;" id="picture_box" />
            <section class="foto_item">
                <img src="<?php echo getFile($params["picture"]); ?>" />
                <a class="admin_btn del_pic" href="#"><img src="<?php echo ADM_SKIN; ?>image/del.png" /> <?php echo WORD_38; ?></a>
            </section>
            
            <section class="choose_file">
                <p><?php echo WORD_39; ?>:</p> <span class="file_name"><?php echo WORD_40; ?> </span><br />
                <a class="admin_btn upload_pic" href="#"><img src="<?php echo ADM_SKIN; ?>image/upload.png" /> <?php echo WORD_41; ?></a>
            </section>
        </section>
    </section>
</section>