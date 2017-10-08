<?php $_selected_variant = $_products_in[$key]['product_option_id']; ?>
<?php $opt = $orders_order->GetProductOptions_($_products_in[$key]['id']); ?>
<tr data-id="<?php echo $_products_in[$key]['id']; ?>">
    <td>
        <a title="<?php echo LIST_DEL; ?>" data-id="<?php echo $_products_in[$key]['id']; ?>" class="admin_order_delete delete_order_item_" href="#"></a>
    </td>
    <td>
        <a href="#" class="admin_order_img"><img src="
        <?php echo (file_exists(ROOT_FILES."products/".$_products_in[$key]["picture"]) && !is_dir(ROOT_FILES."products/".$_products_in[$key]["picture"])) ? FILES."products/".$_products_in[$key]["picture"] : ADM_SKIN.'image/nophoto_small.png'; ?>" /></a>
        <a href="#"><?php echo $_products_in[$key]['title']; ?></a>
    </td>
    <td>
        <span id="item_article_<?php echo $_products_in[$key]['id']; ?>"><?php echo $_products_in[$key]['article']; ?></span>
    </td>
    <td class="edit_form">
        <section>
            <select name="product_variant[<?php echo $_products_in[$key]['id']; ?>]" id="selected_option">
                <?php foreach($opt as $k => $v){ ?>
                <option data-product-id="<?php echo $_products_in[$key]['id']; ?>" data-article="<?php echo $opt[$k]['article']; ?>" data-price="<?php echo $opt[$k]['price']; ?>" <?php echo ($_selected_variant == $opt[$k]['id']) ? 'selected="selected"' : false; ?> value="<?php echo $opt[$k]['id']; ?>"><?php echo $opt[$k]['name']; ?></option>
                <?php } ?>
            </select>
        </section>
    </td>
    <td>
        <input type="hidden" id="hidden_item_price_<?php echo $_products_in[$key]['id']; ?>" name="item_price[<?php echo $_products_in[$key]['id']; ?>]" value="<?php echo $_products_in[$key]['price']; ?>" />
        <span id="item_price_<?php echo $_products_in[$key]['id']; ?>"><?php echo $_products_in[$key]['price']; ?></span>
    </td>
    <td>
        <input name="product_qty[<?php echo $_products_in[$key]['id']; ?>]" type="text" class="item_qty_" data-id="<?php echo $_products_in[$key]['id']; ?>" id="item_qty_<?php echo $_products_in[$key]['id']; ?>" value="<?php echo (empty($_products_in[$key]['qty'])) ? 1 : $_products_in[$key]['qty']; ?>" />
    </td>
    <td>
        <span class="item_total_price_" id="item_total_price_<?php echo $_products_in[$key]['id']; ?>"><?php echo (empty($_products_in[$key]['qty'])) ? $_products_in[$key]['price'] : $_products_in[$key]['price'] * $_products_in[$key]['qty']; ?></span>
    </td>
</tr>