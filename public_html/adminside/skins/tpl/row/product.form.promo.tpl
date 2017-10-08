<tr>
    <td>
        <select name="product_promo_group[]">
            <option value="0"><?php echo WORD_282; ?></option>
            <?php $query = $mysql->query("SELECT `id`, `name` FROM `zet_userlist_group` WHERE `status`='1'"); ?>
            <?php while($row = $mysql->assoc($query)){ ?>
            <option <?php echo ($pr_row['userlist_group'] == $row['id']) ? 'selected="selected"' : false; ?> value="<?php echo $row['id']; ?>"><?php echo $row['name']; ?></option>
            <?php } ?>
        </select>
    </td>
    <td>
        <select name="product_promo_type[]">
            <option <?php echo ($pr_row['type'] == '1') ? 'selected="selected"' : false; ?> value="1"><?php echo WORD_93; ?></option>
            <option <?php echo ($pr_row['type'] == '2') ? 'selected="selected"' : false; ?> value="2"><?php echo WORD_94; ?></option>
        </select>
    </td>
    <td>
        <input type="text" name="product_promo_value[]" value="<?php echo $pr_row['value']; ?>" class="small_input required_" />
    </td>
    <td class="st_search_date">
        <input type="text" name="product_promo_start[]" value="<?php echo $pr_row['start']; ?>" class="datepicker_nolimit required_" />
    </td>
    <td class="st_search_date">
        <input type="text" name="product_promo_end[]" value="<?php echo $pr_row['end']; ?>" class="datepicker_nolimit required_" />
    </td>
    <td>
        <a title="<?php echo LIST_DEL; ?>" class="admin_order_delete del_product_promo_item" href="#"></a>
    </td>
</tr>