<tr class="currency_item" data-id="<?php echo $cur_row["id"]; ?>">
    <td><a class="list_t" href="#"><span></span></a> <input type="text" name="name[]" class="required_" value="<?php echo $cur_row["name"]; ?>" /></td>
    <td class="center_text"><input type="text" name="abbr[]" value="<?php echo $cur_row["abbr"]; ?>" class="znak_input required_" /></td>
    <td class="center_text"><input type="text" name="code[]" value="<?php echo $cur_row["code"]; ?>" class="znak_input required_" /></td>
    <td><input type="text" name="rate[]" value="<?php echo $cur_row["rate"]; ?>" class="znak_input required_" /></td>
    <td class="center_text"><a href="#" class="table_link status_link <?php echo ($cur_row["status"] == 1) ? "active" : "disable";?>" id="status_<?php echo $cur_row["id"]; ?>" data-id="<?php echo $cur_row["id"]; ?>"></a></td>
    <td class="center_text"><a title="<?php echo LIST_DEL; ?>" class="admin_order_delete del_currency_item" href="<?php echo ADM_SRV."settings/currency/".$cur_row["id"]."/?act=delete" ?>"></a></td>
</tr>