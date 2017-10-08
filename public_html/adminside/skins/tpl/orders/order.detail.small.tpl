<section class="status_r row">
    <section class="span6">
        <?php include SELECT."status.select.tpl" ?>
    </section>
    
    <section class="admin_order_action">
        <a href="#" data-order-id="<?php echo $_order_id; ?>" data-type="<?php echo md5("|confirm|confirm|".date("Y-m-d H")); ?>" class="admin_order_print print-order"></a>
        <a href="<?php echo ADM_SRV."orders/new/{$_order_id}/?act=edit"; ?>" class="admin_order_edit"></a>
        <a href="<?php echo ADM_SRV."orders/new/{$_order_id}/?act=delete"; ?>" class="admin_order_delete delete-order"></a>
    </section>
</section>

<section class="admin_order_info row">
    <table style="width: 100%;">
        <tr>
            <td>
                <section>
                    <p class="admin_caption"><?php echo $user["name"]; ?></p>
                    <?php echo WORD_405; ?>
                    <?php if (!empty($user["email"])) { ?>
                        <p><b><?php echo WORD_293; ?>:</b> <?php echo $user["email"]; ?></p>
                    <?php } ?>
                    <?php if (!empty($user["phone"])) { ?>
                        <p><b><?php echo WORD_294; ?>:</b> <?php echo $user["phone"]; ?></p>
                    <?php } ?>
                    <?php if (!empty($user["comment"])) { ?>
                        <p><b><?php echo WORD_344; ?>:</b> <?php echo $user["comment"]; ?></p>
                    <?php } ?>
                </section>
            </td>
            <td>
                <?php if ($receiver != false) { ?>
                <section>
                    <p class="admin_caption"><?php echo $receiver["name"]; ?></p>
                    <?php echo WORD_406; ?>
                    <?php if (!empty($receiver["phone"])) { ?>
                        <p><b><?php echo WORD_294; ?>:</b> <?php echo $receiver["phone"]; ?></p>
                    <?php } ?>
                    <?php if (!empty($params["rdate"])) { ?>
                        <p><b><?php echo WORD_407; ?>:</b> <?php echo $params["rdate"]." ".$params["ftime"]." - ".$params["ttime"]; ?></p>
                    <?php } ?>
                    <?php if ($params["photos"] == 1) { ?>
                        <p><b><?php echo WORD_408; ?></b></p>
                    <?php } ?>
                    <?php if($params["card"] == 1) { ?>
                        <p><b><?php echo WORD_409; ?>:</b> <?php echo $params["card_text"]; ?></p>
                    <?php } ?>
                </section>
                <?php } ?>
            </td>
        </tr>
    </table>
    
    <?php if ((!empty($user["np"])) || (!empty($user["adress"])) || (!empty($params["npn"])) || (!empty($params["delivery_metnod"]) && $params["delivery_metnod"] != 0) || (!empty($params["payment_method"]) && $params["payment_method"] != 0)) { ?>
    <section class="admin_other_info info-block">
        <?php if (!empty($params["delivery_metnod"]) && $params["delivery_metnod"] != 0) { ?>
            <p><b><?php echo WORD_338; ?>:</b> <?php echo getDeliveryMethodNameById($params["delivery_metnod"], $site_language["id"]); ?></p>
        <?php } ?>
        <?php if (!empty($user["np"])) { ?>
            <p><b><?php echo WORD_367; ?>:</b> <?php echo $user["np"]; ?></p>
        <?php } ?>
        <?php if (!empty($user["adress"])) { ?>
            <p><b><?php echo WORD_297; ?>:</b> <?php echo $user["adress"]; ?></p>
        <?php } ?>
        <?php if (!empty($params["npn"])) { ?>
            <p><b><?php echo WORD_368; ?>:</b> <?php echo $params["npn"]; ?></p>
        <?php } ?>
        
        <?php if (!empty($params["payment_method"]) && $params["payment_method"] != 0) { ?>
        <section class="pay_to">
            <b><?php echo WORD_339; ?>:</b> <?php echo getPaymentMethodNameById($params["payment_method"], $site_language["id"]); ?>
            <select id="payment_status_select" data-order-id="<?php echo $_order_id; ?>">
                <option value="0"><?php echo WORD_419; ?></option>
                <option <?php echo ($params["payment_status"] == 1) ? 'selected="selected"' : ""; ?> value="1"><?php echo WORD_418; ?></option>
            </select>
        </section>
        <?php } ?>
    </section>
    <?php } ?>
</section>

<table class="admin_order_table">
    <tr>
        <td><?php echo WORD_11; ?></td>
        <td><?php echo WORD_240; ?></td>
        <td><?php echo WORD_241; ?></td>
        <td><?php echo WORD_324; ?> <?php echo $site_currency["abbr"]; ?></td>
    </tr>
    
    <?php $_products_in = $orders_order->GetOrderProducts($_order_id); foreach($_products_in as $key => $val) { ?>
    <tr>
        <td>
            <a href="<?php echo SRV."shop/category/{$_products_in[$key]['url']}"; ?>" target="_blank" class="admin_order_img"><img src="<?php echo (file_exists(ROOT_FILES."products/".$_products_in[$key]["picture"]) && !is_dir(ROOT_FILES."products/".$_products_in[$key]["picture"])) ? FILES."products/".$_products_in[$key]["picture"] : ADM_SKIN."image/nophoto_small.png"; ?>" /></a>
            <a href="<?php echo SRV."shop/category/{$_products_in[$key]['url']}"; ?>" target="_blank"><?php echo $_products_in[$key]['title']; ?></a>
        </td>
        <td><?php echo $_products_in[$key]["article"]; ?></td>
        <td><?php echo $_products_in[$key]["price"]; ?> <?php echo $_products_in[$key]["qty"]; ?><?php echo config("item_unit"); ?></td>
        <td><?php echo $_products_in[$key]["price"] * $_products_in[$key]["qty"]; ?></td>
    </tr>
    <?php } ?>
    
    <tr>
        <td colspan="3"><span><?php echo WORD_337; ?>:</span> <span><?php echo WORD_349; ?>:</span> <span><?php echo WORD_338; ?>:</span></td>
        <td><span><?php echo $params["real_price"]; ?></span> <span><?php echo $params["discount"]; ?></span> <span><?php echo $params["del_price"]; ?></span></td>
    </tr>
</table>

<p class="after_admin_table">
    <b><?php echo WORD_346; ?>:</b>
    <span class="admin_caption"><?php echo $params["final_price"]; ?> <?php echo $site_currency["abbr"]; ?></span>
</p>

<input type="hidden" id="order-id" value="<?php echo $params["id"]; ?>" />
<section class="admin_order_history">
    <p class="history_title"><?php echo WORD_347; ?></p>
    <a href="#" class="admin_order_comment"><span><?php echo WORD_348; ?></span></a>
    <section id="admin_comment">
        <textarea id="order-comment-text" style="margin-bottom: 5px;"></textarea>
        <input id="order-comment-submit" type="button" value="<?php echo WORD_348; ?>" style="margin-bottom: 20px;" />
    </section>
    <section id="order-comment-box">
        <?php $query = $mysql->query("SELECT * FROM `zet_order_comments` WHERE `order_id`='".$params["id"]."' ORDER BY `date` DESC"); ?>
        <?php while($row = $mysql->assoc($query)){ ?>
        <p class="admin_order_date" style="margin-bottom: 5px;"><span><?php echo $row["date"]; ?></span> <?php echo $row["text"]; ?></p>
        <?php } ?>
    </section>
</section>