<?php if ($val["additional"] == 0) { ?>
<?php $options = $_Cart->GetItemOptions($val['product_id']); ?>
<tr class="cart-item" data-product-id="<?php echo $val['product_id']; ?>" data-option-id="<?php echo $val['option_id']; ?>" data-price="<?php echo $val['price'] * $val['quantity']; ?>">
    <td class="img">
        <div style="background-image: url(<?php echo FILES."products/{$val['picture']}"; ?>);"></div>
    </td>
    <td class="name">
        <a href="<?php echo SRV_."shop/{$val['category']}/{$val['url']}"; ?>"><?php echo $val['title']; ?></a><br /><?php echo WORD_60." <span class='article'>{$val['article']}</span>"; ?>
        <input type="hidden" name="product_id[]" value="<?php echo $val['product_id']; ?>" />
        <input type="hidden" name="option_id[]" class="option_id" value="<?php echo $val['option_id']; ?>" />
    </td>
    <td class="count">
        <div class="count_widget">
            <div><a rel="inc"></a></div>
            <input type="text" readonly="readonly" class="quantity" name="quantity[]" value="<?php echo $val['quantity']; ?>" />
            <div><a rel="dec"></a></div>
        </div>
    </td>
    <td class="size">
        <div>
            <input id="size_<?php echo $key; ?>" type="radio" name="popup" />
            <label for="size_<?php echo $key; ?>">
                <ul>
                    <?php foreach ($options as $k => $v) { ?>
                    <li data-price="<?php echo $v['price']; ?>" data-article="<?php echo $v['article']; ?>" data-id="<?php echo $v['id']; ?>" <?php echo ($v['id'] == $val['option_id']) ? 'class="active"' : false; ?>><a><?php echo $v['name']; ?></a></li>
                    <?php } ?>
                </ul>
            </label>
        </div>
    </td>
    <td class="price"><?php echo $val['price'] * $val['quantity']." {$site_currency['abbr']}"; ?></td>
    <td class="close"><a rel="close" class="cart-delete"></a></td>
</tr>
<?php } else { ?>
<tr class="cart-item additional-item" data-product-id="<?php echo $val["product_id"]; ?>" data-option-id="<?php echo $val["option_id"]; ?>" data-price="<?php echo $val["price"] * $val["quantity"]; ?>">
    <td class="img">
        <div style="background-image: url(<?php echo FILES."products/{$val["picture"]}"; ?>);"></div>
    </td>
    <td class="name">
        <a href="#" onclick="return false;"><?php echo $val["title"]; ?></a><br /><?php echo WORD_60." <span class='article'>{$val["article"]}</span>"; ?>
        <input type="hidden" name="product_id[]" value="<?php echo $val["product_id"]; ?>" />
        <input type="hidden" name="option_id[]" class="option_id" value="<?php echo $val["option_id"]; ?>" />
    </td>
    <td class="count">
        <div class="count_widget">
            <div><a rel="inc"></a></div>
            <input type="text" readonly="readonly" class="quantity" name="quantity[]" value="<?php echo $val["quantity"]; ?>" />
            <div><a rel="dec"></a></div>
        </div>
    </td>
    <td class="size">
        <div>
            <ul style="list-style: none;">
                <li data-price="<?php echo $val["price"]; ?>" class="active"><a></a></li>
            </ul>
        </div>
    </td>
    <td class="price"><?php echo $val["price"] * $val["quantity"]." {$site_currency["abbr"]}"; ?></td>
    <td class="close"><a rel="close" class="cart-delete"></a></td>
</tr>
<?php } ?>