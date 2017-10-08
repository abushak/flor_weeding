<tr>
    <td>
        <section class="checkbox_list">
            <input type="checkbox" id="t_check<?php echo $row['id']; ?>" />
            <label for="t_check<?php echo $row['id']; ?>"><span></span></label>
        </section>
    </td>
    <td><a class="admin_order_img" href="#"><img src="<?php echo (file_exists(ROOT_FILES."products/".$row["picture"]) && !is_dir(ROOT_FILES."products/".$row["picture"])) ? FILES."products/".$row["picture"] : ADM_SKIN.'image/nophoto_small.png'; ?>" /></a></td>
    <td><?php echo $row['article']; ?></td>
    <td><a href="#"><?php echo $row['title']; ?></a></td>
    <td class="c_text"><?php echo $row['price']; ?></td>
    <td class="c_text"><strike><?php echo $row['cross_price']; ?></strike></td>
    <td class="c_text"><?php echo $row['quantity']; ?></td>
    <td>
        <a href="#" class="table_link active"></a>
        <a href="#" class="table_link"></a>
        <a href="#" class="table_link"></a>
        <a href="#" class="table_link"></a>
    </td>
    <td>
        <a title="<?php echo LIST_EDIT; ?>" class="admin_order_edit" href="<?php echo ADM_SRV.'catalog/products/'.$row['id'].'/?act=edit'; ?>"></a>
        <a title="<?php echo LIST_DEL; ?>" class="admin_order_delete delete-catalog" href="<?php echo ADM_SRV.'catalog/products/'.$row['id'].'/?act=delete'; ?>"></a>
    </td>
</tr>