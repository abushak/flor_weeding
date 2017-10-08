<tr>
    <!-- <td>
        <select name="product_wholesale_group[]">
            <option value="0"><?php echo WORD_282; ?></option>
            <?php $query = $mysql->query("SELECT `id`, `name` FROM `zet_userlist_group` WHERE `status`='1'"); ?>
            <?php while($row = $mysql->assoc($query)){ ?>
            <option <?php echo ($ws_row['userlist_group'] == $row['id']) ? 'selected="selected"' : false; ?> value="<?php echo $row['id']; ?>"><?php echo $row['name']; ?></option>
            <?php } ?>
        </select>
    </td> -->
    <td>
        <select name="product_wholesale_type[]">
            <option <?php echo ($ws_row['type'] == '1') ? 'selected="selected"' : false; ?> value="1"><?php echo WORD_93; ?></option>
            <option <?php echo ($ws_row['type'] == '2') ? 'selected="selected"' : false; ?> value="2"><?php echo WORD_94; ?></option>
        </select>
    </td>
    <td>
        <input type="text" name="product_wholesale_value[]" value="<?php echo $ws_row['value']; ?>" class="small_input required_" />
    </td>
    <td>
        <input type="text" placeholder="&mdash;" name="product_wholesale_qty[]" value="<?php echo (empty($ws_row['qty'])) ? 0 : $ws_row['qty']; ?>" class="required_" />
    </td>
    <td>
        <a title="<?php echo LIST_DEL; ?>" class="admin_order_delete del_product_wholesale_item" href="#"></a>
    </td>
</tr>