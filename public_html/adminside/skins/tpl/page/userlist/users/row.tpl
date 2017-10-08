<tr>
    <td class="w4">
        <section class="checkbox_list">
            <input type="checkbox" name="" id="t_check<?php echo $row['id']; ?>" />
            <label for="t_check<?php echo $row['id']; ?>"><span></span></label>
        </section>
    </td>
    <td></td>
    <td><?php echo $row['id']; ?></td>
    <td>
        <a href="<?php echo ADM_SRV."userlist/users/{$row['id']}/?act=view"; ?>"><?php echo $row['lastname']; ?> <?php echo $row['name']; ?></a>
        <br /> <span class="t_c"><?php echo $row['city']; ?></span>
    </td>
    <td><?php echo $row['email']; ?></td>
    <td>
        <?php if(!empty($row['last_order'])){ ?>
        <a href="<?php echo ADM_SRV."orders/new/{$row['last_order']}/?act=view"; ?>">№<?php echo $row['last_order']; ?></a> <br /> <span class="t_c"><?php echo $row['last_order_date']; ?></span>
        <?php } ?>
    </td>
    <td class="center_text"><?php echo $row['phone']; ?></td>
    <td class="center_text"><?php echo $row['orders_total']; ?></td>
    <td class="center_text">
        <a title="<?php echo LIST_EDIT; ?>" class="admin_order_edit" href="<?php echo ADM_SRV.'userlist/users/'.$row['id'].'/?act=edit'; ?>"></a>
        <a title="<?php echo LIST_DEL; ?>" class="admin_order_delete delete-user" href="<?php echo ADM_SRV.'userlist/users/'.$row['id'].'/?act=delete'; ?>"></a>
    </td>
</tr>