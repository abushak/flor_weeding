<div style="background-color:#e8edf1;padding:20px;font-family: Arial, Helvetica, Verdana, Tahoma, sans-serif;">
    <div style="width:730px;margin:0 auto;background-color:white;border:1px solid rgba(12,36,56,.3);">
        <div style="padding:20px 25px;">
            <img src="<?php echo SKIN."image/maillogo.png"; ?>" alt="FlorPeople" style="float:right;display:block;width:117px;height:141px;margin-right:15px" />
            <p style="font-size:30px;color:#ff1459;margin-top:0;font-weight:normal;margin:0 0 13px"><?php echo $title; ?></p>
            <p style="font-size:12px;margin:0 0 13px"><?php echo $date; ?></p>
            <p style="font-size:14px;margin:0 0 13px"><strong>Статус заказа: </strong><?php echo $status; ?></p>
            <p></p><!-- <p style="font-size:14px;margin:0 0 30px">Вы всегда можете проверить состояние заказа по ссылке:<br /><a href="<?php echo SRV."order/" ?>/zakaz123" target="_blank" style="color:#82637b">http://site.com.ua/zakaz123</a></p> -->
                
            <table style="width:100%;border-collapse:collapse">
                <thead>
                    <tr style="height:44px;">
                        <th style="width:45px;border-bottom:3px solid #ff1459;"></th>
                        <th style="width:115px;border-bottom:3px solid #ff1459;font-size:12px;color:#a19fa5;font-weight:normal;">Товары</th>
                        <th style="border-bottom:3px solid #ff1459;"></th>
                        <th style="width:70px;border-bottom:3px solid #ff1459;font-size:12px;color:#a19fa5;font-weight:normal;">Размер</th>
                        <th style="width:70px;border-bottom:3px solid #ff1459;font-size:12px;color:#a19fa5;font-weight:normal;">К-во</th>
                        <th style="width:90px;border-bottom:3px solid #ff1459;font-size:12px;color:#a19fa5;font-weight:normal;">Цена, грн</th>
                        <th style="width:90px;border-bottom:3px solid #ff1459;background-color:#e7e8e9;font-size:12px;color:#a19fa5;font-weight:normal;">Сумма, грн</th>
                        <th style="width:24px;border-bottom:3px solid #ff1459;"></th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($_products_in as $key => $val) { ?>
                    <tr style="height:130px;">
                        <td style="border-bottom:1px dotted #a3a3a3;text-align:center;vertical-align:middle;color:#999999;font-size:12px;"><?php echo $key; ?></td>
                        <td style="border-bottom:1px dotted #a3a3a3;font-size:14px;padding-left:15px;"><a href="<?php echo SRV."shop/{$val["category"]}/{$val["url"]}"; ?>" target="_blank" style="color:#82637b;"><?php echo $val["title"]; ?></a><div style="margin-top:5px;">арт. <?php echo $val["article"] ?></div></td>
                        <td style="border-bottom:1px dotted #a3a3a3;text-align:center;vertical-align:middle;"></td>
                        <td style="border-bottom:1px dotted #a3a3a3;text-align:center;vertical-align:middle;font-size:16px;"><?php echo $val["option_name"]; ?></td>
                        <td style="border-bottom:1px dotted #a3a3a3;text-align:center;vertical-align:middle;font-size:16px;">x <?php echo $val["qty"]; ?></td>
                        <td style="border-bottom:1px dotted #a3a3a3;text-align:center;vertical-align:middle;font-size:16px;"><?php echo $val["price"]; ?></td>
                        <td style="border-bottom:1px dotted #a3a3a3;text-align:center;vertical-align:middle;font-size:16px;background-color:#e7e8e9;"><?php echo $val["qty"] * $val["price"]; ?></td>
                        <td style="border-bottom:1px dotted #a3a3a3;"></td>
                    </tr>
                    <?php } ?>
                        
                    <tr style="height:30px;">
                        <td colspan="6" style="text-align:right;padding-right:30px;">Общая стоимость без учета доставки:</td>
                        <td style="text-align:center;vertical-align:middle;font-size:16px;background-color:#e7e8e9;"><?php echo $params["real_price"]; ?></td>
                        <td></td>
                    </tr>
                    <?php if ($params["discount"] > 0) { ?>
                    <tr style="height:30px;">
                        <td colspan="6" style="text-align:right;padding-right:30px;">Стоимость с учетом скидки:</td>
                        <td style="text-align:center;vertical-align:middle;font-size:16px;background-color:#e7e8e9;"><?php echo $params["real_price"] - $params["discount"]; ?></td>
                        <td></td>
                    </tr>
                    <?php } ?>
                    <tr style="height:30px;">
                        <td colspan="6" style="text-align:right;padding-right:30px;">Доставка:</td>
                        <?php if ($params["del_price"] == 0) { ?>
                        <td style="text-align:center;vertical-align:middle;font-size:16px;background-color:#e7e8e9;color:#03CB33;">Бесплатная</td>
                        <?php } else { ?>
                        <td style="text-align:center;vertical-align:middle;font-size:16px;background-color:#e7e8e9;"><?php echo $params["del_price"]; ?></td>
                        <?php } ?>
                        <td></td>
                    </tr>
                    <?php if ($params["photos"] == 1) { ?>
                    <tr style="height:30px;">
                        <td colspan="6" style="text-align:right;padding-right:30px;">Фотоотчет:</td>
                        <td style="text-align:center;vertical-align:middle;font-size:16px;background-color:#e7e8e9;"><?php echo $photo_price; ?></td>
                        <td></td>
                    </tr>
                    <?php } ?>
                    <?php if ($params["card"] == 1) { ?>
                    <tr style="height:30px;">
                        <td colspan="6" style="text-align:right;padding-right:30px;">Поздравительная открытка:</td>
                        <td style="text-align:center;vertical-align:middle;font-size:16px;background-color:#e7e8e9;"><?php echo $card_price; ?></td>
                        <td></td>
                    </tr>
                    <?php } ?>
                    <tr style="height:30px;">
                        <td colspan="6" style="text-align:right;padding-right:30px;font-weight:bold;">Итоговая сумма заказа:</td>
                        <td style="text-align:center;vertical-align:middle;font-size:16px;background-color:#e7e8e9;font-weight:bold;"><?php echo $params["final_price"]; ?></td>
                        <td></td>
                    </tr>
                </tbody>
            </table>
            
            <div style="border-top:1px solid #e7e8e9;margin-top:25px;">
                <table style="width:100%;border-collapse:collapse;">
                    <tbody>
                        <tr>
                            <td style="width:50%;font-size:14px;vertical-align:top;">
                                <p style="color:#ff1459;font-size:18px;">Информация о Вас:</p>
                                <p><strong>Имя: </strong><?php echo $user["name"]; ?></p>
                                <?php if (!empty($user["email"])) { ?>
                                <p><strong>E-mail: </strong><?php echo $user["email"]; ?></p>
                                <?php } ?>
                                <?php if (!empty($user["phone"])) { ?>
                                <p><strong>Телефон: </strong><?php echo $user["phone"]; ?></p>
                                <?php } ?>
                            </td>
                            <td style="width:50%;vertical-align:top;">
                                <p style="color:#ff1459;font-size:18px;">Информация о доставке и оплате:</p>
                                <p><strong>Доставка: </strong><?php echo $delivery; ?></p>
                                <?php if (!empty($user["adress"])) { ?>
                                <p><strong>Адрес: </strong><?php echo $user["adress"]; ?></p>
                                <?php } ?>
                                <p><strong>Оплата: </strong><?php echo $payment; ?></p>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            
            <?php if ($receiver != false) { ?>
            <div style="border-top:1px solid #e7e8e9;margin-top:25px;">
                <table style="width:100%;border-collapse:collapse;">
                    <tbody>
                        <tr>
                            <td style="width:50%;font-size:14px;vertical-align:top;">
                                <p style="color:#ff1459;font-size:18px;">В подарок:</p>
                                <p><strong>Имя: </strong><?php echo $receiver["name"]; ?></p>
                                <?php if (!empty($receiver["phone"])) { ?>
                                <p><strong>Телефон: </strong><?php echo $receiver["phone"]; ?></p>
                                <?php } ?>
                                <?php if (!empty($params["rdate"])) { ?>
                                <p><strong>Дата доставки: </strong><?php echo $params["rdate"]." ".$params["ftime"]." - ".$params["ttime"]; ?></p>
                                <?php } ?>
                            </td>
                            <td style="width:50%;vertical-align:top;">
                                <p style="color:#ff1459;font-size:18px;">Дополнительно:</p>
                                <?php if ($params["photos"] == 1) { ?>
                                <p>Нужен фотоотчет</p>
                                <?php } ?>
                                <?php if($params["card"] == 1) { ?>
                                <p>Поздравительная открытка:</p>
                                <div style="border:1px solid #e7e8e9;padding:10px 15px;font-size:12px;"><?php echo $params["card_text"]; ?></div>
                                <?php } ?>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <?php } ?>
            
            <div style="border-top:1px solid #e7e8e9;margin-top:25px;padding:20px 0 10px;font-size:13px;text-align:center;line-height:150%">Интернет-магазин «FlorPeople»<br/>Телефон: <?php echo config("phone"); ?> Эл.почта: <a href="mailto:<?php echo config("notify_email"); ?>" style="color:#82637b;"><?php echo config("notify_email"); ?></a> Сайт: <a href="<?php echo SRV; ?>" target="_blank" style="color:#82637b;"><?php echo SRV; ?></a></div>
        </div>
    </div>
</div>


<!--





<section class="wrap_box" style="border: none; width: 900px; position: static; margin: auto; box-shadow: none; -webkit-box-shadow: none;">
    <section class="caption_box">
        <section class="row">
            <section class="span6">
                <p class="admin_order_title"><?php echo WORD_397.$params['id']; ?></p>
                <p class="admin_order_time"><?php echo $params['date']; ?></p>
            </section>
        </section>
    </section>
    
    <section class="wrap_order_box" style="width: 100%">
        <section class="admin_order_info row" style="height: auto;">
            <table style="width: 100%;">
                <tr>
                    <td>
                        <section class="span5">
                            <p class="admin_caption"><?php echo $user['name']; ?></p>
                            <?php echo WORD_405; ?>
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
                    </td>
                    <td>
                        <?php if ($receiver != false) { ?>
                        <section>
                            <p class="admin_caption"><?php echo $receiver['name']; ?></p>
                            <?php echo WORD_406; ?>
                            <?php if(!empty($receiver['phone'])) { ?>
                            <p><b><?php echo WORD_294; ?>:</b> <?php echo $receiver['phone']; ?></p>
                            <?php } ?>
                            <?php if(!empty($params['rdate'])) { ?>
                            <p><b><?php echo WORD_407; ?>:</b> <?php echo $params['rdate']." ".$params['ftime']." - ".$params['ttime']; ?></p>
                            <?php } ?>
                            <?php if($params['photos'] == 1) { ?>
                            <p><b><?php echo WORD_408; ?></b></p>
                            <?php } ?>
                            <?php if($params['card'] == 1) { ?>
                            <p><b><?php echo WORD_409; ?>:</b> <?php echo $params['card_text']; ?></p>
                            <?php } ?>
                        </section>
                        <?php } ?>
                    </td>
                </tr>
                <tr style="height: 25px;"></tr>
                <tr>
                    <td colspan="2">
                        <?php if((!empty($user['np'])) || (!empty($user['adress'])) || (!empty($params['npn'])) || (!empty($params['delivery_metnod']) && $params['delivery_metnod'] != 0) || (!empty($params['payment_method']) && $params['payment_method'] != 0)) { ?>
                        <section class="admin_other_info span5">
                            <?php if(!empty($params['delivery_metnod']) && $params['delivery_metnod'] != 0) { ?>
                            <p><b><?php echo WORD_338; ?>:</b> <?php echo getDeliveryMethodNameById($params['delivery_metnod'], $site_language['id']); ?></p>
                            <?php } ?>
                            <?php if(!empty($user['np'])) { ?>
                            <p><b><?php echo WORD_367; ?>:</b> <?php echo $user['np']; ?></p>
                            <?php } ?>
                            <?php if(!empty($user['adress'])) { ?>
                            <p><b><?php echo WORD_297; ?>:</b> <?php echo $user['adress']; ?></p>
                            <?php } ?>
                            <?php if(!empty($params['npn'])) { ?>
                            <p><b><?php echo WORD_368; ?>:</b> <?php echo $params['npn']; ?></p>
                            <?php } ?>
                            <?php if (!empty($params['payment_method']) && $params['payment_method'] != 0) { ?>
                            <p><b><?php echo WORD_339; ?>:</b> <?php echo getPaymentMethodNameById($params['payment_method'], $site_language['id']); ?></p>
                            <?php } ?>
                        </section>
                        <?php } ?>
                    </td>
                </tr>
            </table>
        </section>
        
        <table class="admin_order_table" style="border-left: 1px solid #ecf2f6;">
            <tr>
                <td><?php echo WORD_11; ?></td>
                <td><?php echo WORD_240; ?></td>
                <td><?php echo WORD_241; ?></td>
                <td><?php echo WORD_324; ?> <?php echo $site_currency['abbr']; ?></td>
            </tr>
            
            <?php foreach($_products_in as $key => $val) { ?>
            <tr>
                <td>
                    <a target="_blank" href="<?php echo SRV."shop/category/{$_products_in[$key]['url']}"; ?>"><?php echo $_products_in[$key]['title']; ?></a>
                </td>
                <td><?php echo $_products_in[$key]['article']; ?></td>
                <td><?php echo $_products_in[$key]['price']; ?> <?php echo $_products_in[$key]['qty']; ?><?php echo config('item_unit'); ?></td>
                <td><?php echo $_products_in[$key]['price'] * $_products_in[$key]['qty']; ?></td>
            </tr>
            <?php } ?>
            <tr>
                <td colspan="3" style="text-align: right;"><span><?php echo WORD_337; ?>:</span> <span><?php echo WORD_349; ?>:</span> <span><?php echo WORD_338; ?>:</span></td>
                <td><span><?php echo $params['real_price']; ?></span> <span><?php echo $params['discount']; ?></span> <span><?php echo $params['del_price']; ?></span></td>
            </tr>
        </table>
        
        <p class="after_admin_table" style="padding: 12px 35px 12px 10px">
            <b><?php echo WORD_346; ?>:</b>
            <span class="admin_caption"><?php echo $params['final_price']; ?> <?php echo $site_currency['abbr']; ?></span>
        </p>
        
        <p style="border-top: 1px solid #ecf2f6;"></p>
        <?php echo GetPaymentMethodDescription($params["payment_method"]); ?>
        
        <p class="after_admin_table" style="padding: 12px 35px 12px 10px"></p>
    </section>
</section> -->