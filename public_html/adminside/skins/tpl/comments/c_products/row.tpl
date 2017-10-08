<tr>
    <td class="w4">
        <section class="checkbox_list">
            <input type="checkbox" name="" id="t_check<?php echo $com_row["id"]; ?>" data-id="<?php echo $com_row["id"]; ?>" />
            <label for="t_check<?php echo $com_row["id"]; ?>"><span></span></label>
        </section>
    </td>
    <td class="w4"><span class="k_name"><span id="input_convert_<?php echo $com_row["id"]; ?>"><?php echo $com_row["name"]; ?></span></span></td>
    <td><span id="date_convert_<?php echo $com_row["id"]; ?>"><?php echo $com_row["date"]; ?></span></td>
    <td class="rating">
        <ul class="unselectable">
            <?php include ADM_ROOT."modules/comments/rating.list.php"; ?>            
        </ul>
    </td>
    <td class="center_text"><a class="table_link status_link <?php echo ($com_row["status"] == 1) ? "active" : "disable";?>" href="#" id="status_<?php echo $com_row["id"]; ?>" data-id="<?php echo $com_row["id"]; ?>"></a></td>
    <td class="center_text">
        <a title="<?php echo LIST_EDIT; ?>" class="admin_order_edit edit_live" data-id="<?php echo $com_row["id"]; ?>" href="#"></a>
        <a title="<?php echo LIST_DEL; ?>" class="admin_order_delete" href="<?php echo ADM_SRV."comments/c_products/".$com_row["id"]."/?act=delete" ?>"></a>
    </td>
</tr>
<tr class="k_tovar">
    <td colspan="6"><span class="ph"><?php echo WORD_198; ?>:</span> <a target="_blank" href="<?php echo ADM_SRV."catalog/products/".$com_row["product_id"]."/?act=edit" ?>"><?php echo $com_row["title"]; ?></a></td>
</tr>
<tr>
    <td colspan="6">
        <form class="edit_form comment_form form_com_<?php echo $com_row["id"]; ?>" method="post">
            <span id="textarea_convert_<?php echo $com_row["id"]; ?>"><?php echo htmlspecialchars($com_row["text"]); ?></span>
        </form>
    </td>
</tr>