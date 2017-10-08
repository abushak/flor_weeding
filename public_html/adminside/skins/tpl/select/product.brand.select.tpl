<?php $pb_query = $mysql->query("SELECT `brand_id` FROM `zet_product_to_brand` WHERE `product_id`='".(int)$route[4]."'"); ?>
<?php $pb_row = $mysql->assoc($pb_query); ?>
<section class="description">
    <label><?php echo WORD_265; ?></label>
    <select name="brand_id">
        <option value="0"><?php echo WORD_266; ?></option>
        <?php include_once M_SELECT.'product.brand.list.php'; ?>
    </select>
</section>