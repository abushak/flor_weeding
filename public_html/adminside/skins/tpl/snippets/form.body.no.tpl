<tbody class="lang_body" style="<?php echo $display; ?>">
    <tr>
        <td><?php echo CT_TITLE; ?>*:</td>
        <td class="padding_left">
            <input type="text" class="required_" value="<?php echo $language[$lang_row["id"]]["title"]; ?>" name="title[<?php echo $lang_row["id"]; ?>]" />
        </td>
    </tr>
    <tr>
        <td><?php echo FRM_TEXT; ?>:</td>
        <td class="padding_left">
            <textarea class="ckeditor" name="description[<?php echo $lang_row["id"]; ?>]"><?php echo $language[$lang_row["id"]]["description"]; ?></textarea>
        </td>
    </tr>
</tbody>