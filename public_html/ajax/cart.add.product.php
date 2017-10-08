<?php
$_Cart = new Cart();
$session = session_id();
$product = $_POST['product_id'];
$option = $_POST['option_id'];
$quantity = (empty($_POST['quantity'])) ? 1 : $_POST['quantity'];

$query = $mysql->query("SELECT `additional` FROM `zet_product` WHERE `id`='".$product."'");
$row = $mysql->assoc($query);
$additional = $row["additional"];

$_Cart->InsertItem($session, $product, $option, $quantity, $additional);

if ($additional == 1) {
    $query = $mysql->query("SELECT `article`,`price`,`title`,`zet_product`.`picture` FROM `zet_product`,`zet_product_description`,`zet_product_option` WHERE `zet_product_option`.`product_id`=`zet_product`.`id` AND `zet_product_description`.`product_id`=`zet_product`.`id` AND `zet_product_description`.`language_id`='".$lang_id."' AND `zet_product`.`id`='".$product."'"); 
    $row = $mysql->assoc($query); 
    $_pp = NewPrice($row["price"]); ?>
<tr class="cart-item additional-item" data-product-id="<?php echo $product; ?>" data-option-id="<?php echo $option; ?>" data-price="<?php echo $row["price"] * $quantity; ?>">
    <td class="img">
        <div style="background-image: url(<?php echo FILES."products/{$row["picture"]}"; ?>);"></div>
    </td>
    <td class="name">
        <a href="#" onclick="return false;"><?php echo $row["title"]; ?></a><br /><?php echo WORD_60." <span class='article'>{$row["article"]}</span>"; ?>
        <input type="hidden" name="product_id[]" value="<?php echo $product; ?>" />
        <input type="hidden" name="option_id[]" class="option_id" value="<?php echo $option; ?>" />
    </td>
    <td class="count">
        <div class="count_widget">
            <div><a rel="inc"></a></div>
            <input type="text" readonly="readonly" class="quantity" name="quantity[]" value="<?php echo $quantity; ?>" />
            <div><a rel="dec"></a></div>
        </div>
    </td>
    <td class="size">
        <div>
            <ul style="list-style: none;">
                <li data-price="<?php echo $_pp; ?>" class="active"><a></a></li>
            </ul>
        </div>
    </td>
    <td class="price"><?php echo $_pp * $quantity." {$site_currency["abbr"]}"; ?></td>
    <td class="close"><a rel="close" class="cart-delete"></a></td>
</tr>
<?php } ?>