<tr>
    <td class="left_text">
        <a href="#" class="list_t"><span></span></a>
        <?php $query = $mysql->query("SELECT * FROM `zet_language` ORDER BY `store_default`<>'0' DESC"); ?>
        <?php while($row = $mysql->assoc($query)) { ?>
        <input type="text" class="required_" value="<?php echo $colors_description[$row['id']]['title']; ?>" name="<?php echo "value_name[{$row['id']}][{$colors_description[$row['id']]['color_id']}]"; ?>" /> <span class="add_tl">(<?php echo $row['code']; ?>)</span>
        <?php } ?>
        <i class="icon_color red" style="background-color: #<?php echo $colors[$key]['value']; ?>"></i> <input type="text" class="picker required_" name="value[<?php echo $colors[$key]['id']; ?>]" value="<?php echo $colors[$key]['value']; ?>" />
    </td>
    <td class="center_text"></td>
    <td class="center_text"><a href="#" class="admin_order_delete del_prop" title="<?php echo LIST_DEL; ?>"></a></td>
</tr>