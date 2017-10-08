<section class="caption_box">
    <section class="row">
        <section class="span6">
            <p class="admin_order_title"><?php echo WORD_397.$params['id']; ?></p>
            <p class="admin_order_time"><?php echo $params['date']; ?></p>
        </section>
        
        <section class="admin_btn_close">
            <a href="#" class="admin_btn close-order-popup">x <?php echo WORD_398; ?></a>
        </section>
    </section>
</section>

<section class="wrap_order_box">
    <section class="admin_order_info row">
        <section class="span5">
            <p class="admin_caption"><?php echo $user['name']; ?> <!-- <a href="#"><?php echo WORD_350; ?> - </a> --></p>
            <?php if(!empty($user['email'])) { ?>
            <p><b><?php echo WORD_293; ?>:</b> <?php echo $user['email']; ?></p>
            <?php } ?>
            <?php if(!empty($user['phone'])) { ?>
            <p><b><?php echo WORD_294; ?>:</b> <?php echo $user['phone']; ?></p>
            <?php } ?>
            <?php if(!empty($user['comment'])) { ?>
            <p><b><?php echo WORD_344; ?>:</b> <?php echo $user['comment']; ?></p>
            <?php } ?>
        </section>
        
        <section class="admin_other_info span4">
            <p><b><?php echo WORD_338; ?>:</b> <?php echo getDeliveryMethodNameById($params['delivery_metnod'], $site_language['id']); ?></p>
            <?php if(!empty($user['np'])) { ?>
            <p><b><?php echo WORD_367; ?>:</b> <?php echo $user['np']; ?></p>
            <?php } ?>
            <?php if(!empty($user['adress'])) { ?>
            <p><b><?php echo WORD_297; ?>:</b> <?php echo $user['adress']; ?></p>
            <?php } ?>
            <?php if(!empty($params['npn'])) { ?>
            <p><b><?php echo WORD_368; ?>:</b> <?php echo $params['npn']; ?></p>
            <?php } ?>
            <section class="pay_to">
                <b><?php echo WORD_339; ?>:</b> <?php echo getPaymentMethodNameById($params['payment_method'], $site_language['id']); ?> 
            </section>
        </section>
    </section>
    
    <table class="admin_order_table">
        <tr>
            <td><?php echo WORD_11; ?></td>
            <td><?php echo WORD_240; ?></td>
            <td><?php echo WORD_241; ?></td>
            <td><?php echo WORD_324; ?> <?php echo $site_currency['abbr']; ?></td>
        </tr>
        
        <?php $_products_in = $orders_order->GetOrderProducts($_order_id); foreach($_products_in as $key => $val) { ?>
        <tr>
            <td>
                <a href="<?php echo SRV."shop/category/{$_products_in[$key]['url']}"; ?>" target="_blank" class="admin_order_img"><img src="<?php echo (file_exists(ROOT_FILES."products/".$_products_in[$key]["picture"]) && !is_dir(ROOT_FILES."products/".$_products_in[$key]["picture"])) ? FILES."products/".$_products_in[$key]["picture"] : ADM_SKIN.'image/nophoto_small.png'; ?>" /></a>
                <a href="<?php echo SRV."shop/category/{$_products_in[$key]['url']}"; ?>" target="_blank"><?php echo $_products_in[$key]['title']; ?></a>
            </td>
            <td><?php echo $_products_in[$key]['article']; ?></td>
            <td><?php echo $_products_in[$key]['price']; ?> <?php echo $_products_in[$key]['qty']; ?><?php echo config('item_unit'); ?></td>
            <td><?php echo $_products_in[$key]['price'] * $_products_in[$key]['qty']; ?></td>
        </tr>
        <?php } ?>
        <tr>
            <td colspan="3"><span><?php echo WORD_337; ?>:</span> <span><?php echo WORD_349; ?>:</span> <span><?php echo WORD_338; ?>:</span></td>
            <td><span><?php echo $params['real_price']; ?></span> <span><?php echo $params['discount']; ?></span> <span><?php echo $params['del_price']; ?></span></td>
        </tr>
    </table>
    
    <p class="after_admin_table">
        <b><?php echo WORD_346; ?>:</b>
        <span class="admin_caption"><?php echo $params['final_price']; ?> <?php echo $site_currency['abbr']; ?></span>
    </p>
</section>
<br /><br />