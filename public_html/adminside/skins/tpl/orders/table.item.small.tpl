<tr class="order-item" data-id="<?php echo $val['id']; ?>">
    <td>
        <section class="checkbox_list">
            <input type="checkbox" id="t_check<?php echo $val['id']; ?>" />
            <label for="t_check<?php echo $val['id']; ?>"><span></span></label>
        </section>
    </td>
    <td style="padding-left:5px;padding-right:5px;"><a href="#"><?php echo $val['id']; ?></a></td>
    <td><?php echo $val['date']; ?></td>
    <td>
        <?php if ($val['user_id'] != 0) { ?>
        <a href="<?php echo ADM_SRV."userlist/users/{$val['user_id']}/?act=view"; ?>"><?php echo $val['name']; ?></a>
        <?php } else { ?>
        <?php echo $val['name']; ?>
        <?php } ?>
        <?php if ($val['fast'] == 1) { ?><span style="color: #ff0000;">(FAST)</span><?php } ?>
    </td>
    <td></td>
    <td></td>
</tr>