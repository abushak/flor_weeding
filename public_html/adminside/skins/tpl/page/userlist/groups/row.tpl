<tr>
    <td class="w4">
        <section class="checkbox_list">
            <?php if(!$static){ ?>
            <input type="checkbox" id="t_check<?php echo $row["id"]; ?>" data-id="<?php echo $row["id"]; ?>"/>
            <label for="t_check<?php echo $row["id"]; ?>"><span></span></label>
            <?php } ?>
        </section>
    </td>
    <td>
        <?php if(!$static){ ?>
        <a href="<?php echo ADM_SRV."userlist/groups/{$row["id"]}/?act=edit" ?>"><?php echo $row["name"]; ?></a>
        <?php } else { ?>
        <?php echo $row["name"]; ?>
        <?php } ?>
    </td>
    <td class="center_text">
        <!-- <?php echo $row["discount_value"]; ?><?php echo ($row["discount_type"] == 1) ? "%" : " ".$site_currency["abbr"]; ?> -->
    </td>
    <td class="center_text">
        <?php if(!$static){ ?>
        <a href="#" class="table_link status_link <?php echo ($row["status"] == 1) ? "active" : "disable";?>" id="status_<?php echo $row["id"]; ?>" data-id="<?php echo $row["id"]; ?>"></a>
        <?php } ?>
    </td>
    <td class="center_text">
        <?php if(!$static){ ?>
        <a title="<?php echo LIST_EDIT; ?>" class="admin_order_edit" href="<?php echo ADM_SRV."userlist/groups/{$row["id"]}/?act=edit" ?>"></a>
        <a title="<?php echo LIST_DEL; ?>" class="admin_order_delete delete-user" href="<?php echo ADM_SRV."userlist/groups/{$row["id"]}/?act=delete" ?>"></a>
        <?php } ?>
    </td>
</tr>
