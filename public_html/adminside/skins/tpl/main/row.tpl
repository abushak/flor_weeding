<tr data-id="<?php echo $row['id']; ?>">
    <td><a href="<?php echo ADM_SRV."orders/new/{$row['id']}/?act=view"; ?>"><?php echo $row['id']; ?></a></td>
    <td>
        <?php if($row['user_id'] != 0) { ?>
        <a href="<?php echo ADM_SRV."userlist/users/{$row['user_id']}/?act=view"; ?>"><?php echo $row['name']; ?></a>
        <?php } else { ?>
        <?php echo $row['name']; ?>
        <?php } ?>
        <?php if($row['fast'] == 1) { ?><span style="color: #ff0000;">(FAST)</span><?php } ?>
    </td> 
    <td><?php include ADM_TPL."select/status.select.tpl"; ?></td>
    <td><?php echo $row['date']; ?></td>
    <td><?php echo $row['final_price']; ?></td>
    <td><a href="#" class="order_info show-order-box"></a></td>
</tr>