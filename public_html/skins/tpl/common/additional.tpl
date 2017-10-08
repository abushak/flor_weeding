<?php $data = array(); ?>
<?php $query = $mysql->query("SELECT `product_id` FROM `zet_cart`,`zet_cart_products` WHERE `zet_cart_products`.`cart_id`=`zet_cart`.`id` AND `zet_cart`.`session`='".$__session."'"); ?>
<?php while ($row = $mysql->assoc($query)) { ?>
<?php array_push($data, $row["product_id"]); ?>
<?php } ?>

<div class="additional wbody">
    <h2><?php echo WORD_32; ?></h2>
    <a rel="prev"></a>
    <a rel="next"></a>
    <?php $query = $mysql->query("SELECT COUNT(*) AS `total` FROM `zet_product` WHERE `additional`='1'"); ?>
    <?php $row = $mysql->assoc($query); ?>
    <div>
        <div data-count="<?php echo $row['total']; ?>">
        <?php $query = $mysql->query("SELECT `zet_product`.`id` AS `id`,`zet_product_option`.`id` AS `option_id`,`price`,`title`,`zet_product`.`picture` FROM `zet_product`,`zet_product_description`,`zet_product_option` WHERE `zet_product_option`.`product_id`=`zet_product`.`id` AND `zet_product_description`.`product_id`=`zet_product`.`id` AND `zet_product_description`.`language_id`='".$lang_id."' AND `zet_product`.`additional`='1' GROUP BY `zet_product`.`id` ORDER BY RAND()"); ?>
        <?php while ($row = $mysql->assoc($query)) { ?>
        <?php $_pp = NewPrice($row["price"]); ?>
        <div class="item <?php echo (in_array($row["id"], $data)) ? "incart" : ""; ?>" data-price="<?php echo $_pp; ?>" data-product-id="<?php echo $row["id"]; ?>" data-option-id="<?php echo $row["option_id"]; ?>">
            <div style="background-image:url(<?php echo FILES."products/{$row['picture']}"; ?>)" class="img"><a></a></div><span class="caption"><?php echo $row['title']; ?></span>
            <div class="hr"></div><span class="price"><?php echo "+{$_pp} {$site_currency['abbr']}"; ?></span>
        </div>
        <?php } ?>
        </div>
    </div>
</div>