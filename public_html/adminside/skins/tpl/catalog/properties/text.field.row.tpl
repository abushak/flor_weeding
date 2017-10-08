<tr>
    <td class="left_text">
        <a href="#" class="list_t"><span></span></a>
        <?php $query = $mysql->query("SELECT * FROM `zet_language` ORDER BY `store_default`<>'0' DESC"); ?>
        <?php while($row = $mysql->assoc($query)) { ?>
        <input type="text" class="required_" value="<?php echo $names[$row['id']]['name'][$__i]; ?>" name="<?php echo "value_name[{$row['id']}][]"; ?>" /> <span class="add_tl">(<?php echo $row['code']; ?>)</span>
        <?php } ?>
    </td>
    <td class="center_text"><!-- <a class="table_link active" href="#"></a> --></td>
    <td class="center_text"><a href="#" class="admin_order_delete del_prop" title="<?php echo LIST_DEL; ?>"></a></td>
</tr>