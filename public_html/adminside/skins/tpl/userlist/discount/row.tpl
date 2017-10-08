<tr>
    <td class="w4">
        <section class="checkbox_list">
            <input type="checkbox" name="" id="t_check<?php echo $discount_row["id"]; ?>" data-id="<?php echo $discount_row["id"]; ?>"/>
            <label for="t_check<?php echo $discount_row["id"]; ?>"><span></span></label>
        </section>
    </td>
    <td><a href="<?php echo ADM_SRV."userlist/discount/".$discount_row["id"]."/?act=edit" ?>"><?php echo $discount_row["name"]; ?></a></td>
    <td><?php echo WORD_105; ?> <?php echo $discount_row["min_order_sum"]; ?> <?php echo $site_currency["abbr"]; ?> <?php echo WORD_106; ?> <?php echo $discount_row["max_order_sum"]; ?> <?php echo $site_currency["abbr"]; ?></td>
    <td class="center_text"><?php echo $discount_row["discount_value"]; ?><?php echo ($discount_row["discount_type"] == 1) ? "%" : " ".$site_currency["abbr"]; ?></td>
    <td class="center_text"><a href="#" class="table_link status_link <?php echo ($discount_row["status"] == 1) ? "active" : "disable";?>" id="status_<?php echo $discount_row["id"]; ?>" data-id="<?php echo $discount_row["id"]; ?>"></a></td>
    <td class="center_text">
        <a title="<?php echo LIST_EDIT; ?>" class="admin_order_edit" href="<?php echo ADM_SRV."userlist/discount/".$discount_row["id"]."/?act=edit" ?>"></a>
        <a title="<?php echo LIST_DEL; ?>" class="admin_order_delete delete-discount" href="<?php echo ADM_SRV."userlist/discount/".$discount_row["id"]."/?act=delete" ?>"></a>
    </td>
</tr>