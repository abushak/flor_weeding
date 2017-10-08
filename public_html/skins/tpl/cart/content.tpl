<?php $products = $_Cart->GetItems($__session); ?>
<?php $cart_price = $_Cart->CartPrice($products); ?>
<?php $total_products = $_Cart->ItemsInCart($__session); ?>

<?php $query = $mysql->query("SHOW TABLE STATUS FROM `".config('database')."` LIKE 'zet_orders'") ?>
<?php $row = $mysql->assoc($query); ?>
<?php $order_id = $row["Auto_increment"]; ?>

<?php $_StoreSettings = new StoreSettings(); ?>
<?php $delivery = $_StoreSettings->GetDeliveryMethods(); ?>
<?php $_USD = config("usd"); ?>

<div class="pathway wbody">
    <ul>
        <li><a href="<?php echo SRV_; ?>"><?php echo WORD_54; ?></a></li>
        <li><a href="<?php echo SRV_."shop"; ?>"><?php echo WORD_55; ?></a></li>
        <li><a href="<?php echo SRV_."cart"; ?>"><?php echo WORD_46; ?></a></li>
    </ul>
</div>

<div class="wbody cartpage" data-price="<?php echo $cart_price; ?>">
    <h2><?php echo ($total_products < 1) ? WORD_114 : WORD_46; ?></h2>
    <?php if ($total_products < 1) { ?>
        <p style="font-size: 16px; color: #3e3f44; text-align: center;"><?php echo config("phone"); ?></p>
        <p style="font-size: 16px; color: #3e3f44; text-align: center;"><a href="<?php echo SRV_."shop"; ?>" style="color: #7c6574;margin: 10px 0;display: inline-block;"><?php echo WORD_115; ?></a></p>
    <?php } else { ?>
    <div class="right">
        <div>
            <h2><?php echo WORD_59; ?></h2>
            <div class="price">
                <div>
                    <span><?php echo $cart_price; ?></span> <?php echo $site_currency['abbr']; ?>
                </div>
            </div>
            <div class="prices">
                <span class="summary"></span>
                <span class="euro">$<?php echo round($cart_price/$_USD); ?></span>
            </div>
            <a id="order-confirm" href="<?php echo SRV_."order"; ?>"><?php echo WORD_37; ?></a>
        </div>
    </div>
    <div class="left">
        <div>
            <table>
                <thead>
                    <tr>
                        <th class="img"></th>
                        <th class="name"><?php echo WORD_56; ?></th>
                        <th class="count"></th>
                        <th class="size"><?php echo WORD_57; ?></th>
                        <th class="price"><?php echo WORD_58; ?></th>
                        <th class="close"></th>
                    </tr>
                </thead>
                <tbody>
                    <form id="order-form" method="POST" enctype="multipart/form-data">
                    <?php foreach ($products as $key => $val) { ?>
                    <?php include TPL."cart/cart.item.tpl"; ?>
                    <?php } ?>
                    </form>
                </tbody>
            </table>
            <div class="shiping"><?php echo WORD_33; ?> <?php echo $delivery[1]['free_from']; ?> <?php echo $site_currency['abbr']; ?></div>
        </div>
    </div>
    <?php } ?>
</div>
<?php if ($total_products > 0) { ?>
<?php include TPL."common/additional.tpl"; ?>
<?php } ?>
<?php include TPL."common/gifts.tpl"; ?>