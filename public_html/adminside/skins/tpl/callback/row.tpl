<tr>
    <td class="w4">
        <section class="checkbox_list">
            <input type="checkbox" name="" id="t_check<?php echo $callback_row["id"]; ?>" data-id="<?php echo $callback_row["id"]; ?>"/>
            <label for="t_check<?php echo $callback_row["id"]; ?>"><span></span></label>
        </section>
    </td>
    <td class="w4"><?php echo $callback_row["id"]; ?></td>
    <td><?php echo $callback_row["date"]; ?></td>
    <td><a href="<?php echo ADM_SRV."userlist/users/".$callback_row["user_id"]."/?act=view"; ?>"><?php echo $callback_row["user_name"]; ?></a></td>
    <td><?php echo $callback_row["phone"]; ?></td>
    <td>
        <?php include ADM_TPL."callback/status.item.".$callback_row["status"].".tpl"; ?>
    </td>
    <td><a title="<?php echo LIST_DEL; ?>" class="admin_order_delete delete-callback" href="<?php echo ADM_SRV."callback/".$route[3]."/".$callback_row["id"]."/?act=delete" ?>"></a></td>
</tr>