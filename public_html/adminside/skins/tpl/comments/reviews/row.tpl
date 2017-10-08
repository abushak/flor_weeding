<tr>
    <td class="w4">
        <section class="checkbox_list">
            <input type="checkbox" id="t_check<?php echo $com_row["id"]; ?>" data-id="<?php echo $com_row["id"]; ?>" />
            <label for="t_check<?php echo $com_row["id"]; ?>"><span></span></label>
        </section>
    </td>
    <td class="w4"><span class="k_name"><?php echo $com_row["name"]; ?></span></td>
    <td><?php echo $com_row["date"]; ?></td>
    <td class="center_text"><a class="table_link status_link <?php echo ($com_row["status"] == 1) ? "active" : "disable";?>" href="#" id="status_<?php echo $com_row["id"]; ?>" data-id="<?php echo $com_row["id"]; ?>"></a></td>
    <td class="center_text">
        <a title="<?php echo LIST_EDIT; ?>" class="admin_order_edit" href="<?php echo ADM_SRV."comments/reviews/".$com_row["id"]."/?act=edit" ?>"></a>
        <a title="<?php echo LIST_DEL; ?>" class="admin_order_delete delete-review" href="<?php echo ADM_SRV."comments/reviews/".$com_row["id"]."/?act=delete" ?>"></a>
    </td>
</tr>
<tr>
    <td colspan="5"><?php echo $com_row["text"]; ?></td>
</tr>