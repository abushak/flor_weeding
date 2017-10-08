<?php $options = $catalog_product->getProductOptions($row['id'], $site_language['id']); ?>
<?php $_noo = count($options); ?>
<?php $bool = false; ?>

<div class="wrap_cell product-item" data-product-id="<?php echo $row['id']; ?>">
    <div class="cell c_text">
        <section class="checkbox_list">
            <input type="checkbox" id="t_check<?php echo $row['id']; ?>" />
            <label for="t_check<?php echo $row['id']; ?>"><span></span></label>
        </section>
    </div>
    <div class="cell"><a class="admin_order_img" href="<?php echo SRV."shop/category/{$row['url']}"; ?>" target="_blank"><img src="<?php echo (file_exists(ROOT_FILES."products/".$row["picture"]) && !is_dir(ROOT_FILES."products/".$row["picture"])) ? FILES."products/".$row["picture"] : ADM_SKIN.'image/nophoto_small.png'; ?>" /></a></div>
    <div class="cell"><a href="<?php echo SRV."shop/category/{$row['url']}"; ?>" target="_blank"><?php echo $row['title']; ?></a></div>
    <div class="cell c_text">
        <ul class="variants">
        <?php foreach($options as $key => $val){ ?>
            <li <?php echo ($bool) ? 'class="hidden-variants"' : false; ?> data-product-id="<?php echo $row['id']; ?>" data-option-id="<?php echo $options[$key]['id']; ?>">
                <i class="label"><?php echo $options[$key]['name']; ?></i>
                <input type="text" value="<?php echo $options[$key]['price']; ?>" class="small_input live-input" data-name="price" />
                <input type="text" value="<?php echo $options[$key]['cross_price']; ?>" class="small_input live-input" data-name="cross_price" />
                <input type="text" value="<?php echo $options[$key]['quantity']; ?>" class="small_input live-input" data-name="quantity" />
                <input type="text" value="<?php echo $options[$key]['article']; ?>" class="small_input live-input" data-name="article" />
            </li>
            <?php $bool = true; ?>
        <?php } ?>
        <?php if($_noo > 1) { ?>
            <a href="#" class="variant variant-list-button"><span><?php echo $_noo; ?> варианта</span>&nbsp;&#8593;</a>
        <?php }?>
        </ul>
    </div>
    <div class="cell">
        <a href="#" title="<?php echo WORD_24; ?>" data-name="status" data-value="<?php echo $row['status']; ?>" class="table_link product-status sub-status <?php echo ($row['status'] == 1) ? 'active' : 'disable'; ?>"></a>
        <a href="#" title="<?php echo WORD_257; ?>" data-name="new" data-value="<?php echo $row['new']; ?>" class="table_link product-status sub-new <?php echo ($row['new'] == 1) ? 'disable' : false; ?>"></a>
        <a href="#" title="<?php echo WORD_258; ?>" data-name="recommended" data-value="<?php echo $row['recommended']; ?>" class="table_link product-status sub-recommended <?php echo ($row['recommended'] == 1) ? 'disable' : false; ?>"></a>
        <a href="#" title="<?php echo WORD_259; ?>" data-name="hit" data-value="<?php echo $row['hit']; ?>" class="table_link product-status sub-hit <?php echo ($row['hit'] == 1) ? 'disable' : false; ?>"></a>
    </div>
    <div class="cell c_text">
        <a title="<?php echo LIST_EDIT; ?>" class="admin_order_edit" href="<?php echo ADM_SRV."$route[2]/$route[3]/{$row['id']}/?act=edit"; ?>"></a>
        <a title="<?php echo LIST_DEL; ?>" class="admin_order_delete delete-catalog" href="<?php echo ADM_SRV."$route[2]/$route[3]/{$row['id']}/?act=delete"; ?>"></a>
    </div>
</div>