<?php
switch ($val["delivery_metnod"]) {
    case "1": $del = WORD_410; break;
    case "2": $del = WORD_356; break;
}
switch ($val["payment_method"]) {
    case "1": $pay = WORD_361; break;
    case "2": $pay = WORD_358; break;
    case "3": $pay = WORD_411; break;
} ?>
<tr data-id="<?php echo $val['id']; ?>">
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
        <?php if($val['fast'] == 1) { ?><span style="color: #ff0000;">(FAST)</span><?php } ?>
    </td>
    <?php $row = $val; ?>
    <td><?php include ADM_TPL."select/status.select.tpl"; ?></td>
    <td><?php echo $val['final_price']; ?></td>
    <td><?php echo $del; ?></td>
    <td><?php echo $pay; ?></td>
    <td><a href="#" class="order_info show-order-box"></a></td>
    <td><a href="<?php echo ADM_SRV."orders/new/{$_order_id}/?act=edit"; ?>" class="admin_order_edit" title="<?php echo LIST_EDIT; ?>"></a></td>
    <td><a href="<?php echo ADM_SRV."orders/new/{$_order_id}/?act=delete"; ?>" class="admin_order_delete delete-order" title="<?php echo LIST_DEL; ?>"></a></td>
</tr>