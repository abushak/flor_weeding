<tbody class="lang_body" style="<?php echo $display; ?>">
    <tr>
        <td><?php echo CT_TITLE; ?>*:</td>
        <td class="padding_left">
            <input type="text" class="required_" value='<?php echo $language[$lang_row["id"]]["title"]; ?>' name="title[<?php echo $lang_row["id"]; ?>]" />
            <a href="#" class="meta_link"><?php echo MT_METATITLE; ?></a>
        </td>
    </tr>
    <?php include ADM_TPL."snippets/meta.tags.tpl"; ?>
    <tr>
        <td><?php echo FRM_TEXT; ?>:</td>
        <td class="padding_left">
            <textarea class="ckeditor" name="description[<?php echo $lang_row["id"]; ?>]"><?php echo $language[$lang_row["id"]]["description"]; ?></textarea>
        </td>
    </tr>
    
    <?php if($route[2] == 'catalog' && $route[3] == 'products'){ ?>
    <tr>
        <td><?php echo FRM_TEXT; ?> S:</td>
        <td class="padding_left"><textarea name="product_ts[<?php echo $lang_row["id"]; ?>]"><?php echo $language[$lang_row["id"]]["product_ts"]; ?></textarea></td>
    </tr>
    <tr>
        <td><?php echo FRM_TEXT; ?> M:</td>
        <td class="padding_left"><textarea name="product_tm[<?php echo $lang_row["id"]; ?>]"><?php echo $language[$lang_row["id"]]["product_tm"]; ?></textarea></td>
    </tr>
    <tr>
        <td><?php echo FRM_TEXT; ?> L:</td>
        <td class="padding_left"><textarea name="product_tl[<?php echo $lang_row["id"]; ?>]"><?php echo $language[$lang_row["id"]]["product_tl"]; ?></textarea></td>
    </tr>
    <?php } ?>
</tbody>