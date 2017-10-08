<?php $options = $catalog_product->GetAdditionalOption($row['id']); ?>
<div class="wrap_cell product-item" data-product-id="<?php echo $row['id']; ?>">
    <div class="cell c_text">
        <section class="checkbox_list">
            <input type="checkbox" id="t_check<?php echo $row['id']; ?>" />
            <label for="t_check<?php echo $row['id']; ?>"><span></span></label>
        </section>
    </div>
    <div class="cell"><span class="admin_order_img" style="padding: 0"><img src="<?php echo (is_file(ROOT_FILES."products/{$row["picture"]}")) ? FILES."products/{$row["picture"]}" : ADM_SKIN."image/nophoto_small.png"; ?>" /></span></div>
    <div class="cell"><span><?php echo $row['title']; ?></span></div>
    <div class="cell c_text">
        <ul class="variants">
        <?php foreach($options as $key => $val){ ?>
            <li data-product-id="<?php echo $row['id']; ?>" data-option-id="<?php echo $options[$key]['id']; ?>">
                <input type="text" value="<?php echo $options[$key]['price']; ?>" class="small_input live-input" data-name="price" />
                <input type="text" value="<?php echo $options[$key]['cross_price']; ?>" class="small_input live-input" data-name="cross_price" />
                <input type="text" value="<?php echo $options[$key]['quantity']; ?>" class="small_input live-input" data-name="quantity" />
                <input type="text" value="<?php echo $options[$key]['article']; ?>" class="small_input live-input" data-name="article" />
            </li>
        <?php } ?>
        </ul>
    </div>
    <div class="cell">
        <a href="#" title="<?php echo WORD_24; ?>" data-name="status" data-value="<?php echo $row['status']; ?>" class="table_link product-status sub-status <?php echo ($row['status'] == 1) ? 'active' : 'disable'; ?>"></a>
    </div>
    <div class="cell c_text">
        <a href="<?php echo ADM_SRV."{$route[2]}/{$route[3]}/{$row['id']}/?act=edit"; ?>" class="admin_order_edit" title="<?php echo LIST_EDIT; ?>"></a>
        <a href="<?php echo ADM_SRV."{$route[2]}/{$route[3]}/{$row['id']}/?act=delete"; ?>" class="admin_order_delete delete-catalog" title="<?php echo LIST_DEL; ?>"></a>
    </div>
</div>