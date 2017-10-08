<div style="background-color:#e8edf1;padding:20px;font-family: Arial, Helvetica, Verdana, Tahoma, sans-serif;">
    <div style="width:730px;margin:0 auto;background-color:white;border:1px solid rgba(12,36,56,.3);">
        <div style="padding:20px 25px;">
            <img src="<?php echo SKIN."image/maillogo.png"; ?>" alt="FlorPeople" style="float:right;display:block;width:117px;height:141px;margin-right:15px" />
            <p style="font-size:30px;color:#ff1459;margin-top:0;font-weight:normal;margin:0 0 13px"><?php echo $title; ?></p>
            <p style="font-size:12px;margin:0 0 13px"><?php echo $date; ?></p>
            <p style="font-size:14px;margin:0 0 13px"><strong>Статус заказа: </strong><?php echo $status; ?></p>
            <!-- <p style="font-size:14px;margin:0 0 30px">Вы всегда можете проверить состояние заказа по ссылке:<br /><a href="<?php echo SRV."order/" ?>/zakaz123" target="_blank" style="color:#82637b">http://site.com.ua/zakaz123</a></p> -->
            <?php if ($params["payment_method"] == 2) { ?>
            <p style="font-size:12px;margin:0 0 13px"><?php echo $payment_description; ?></p>
            <?php } ?>
                
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
                        <td style="border-bottom:1px dotted #a3a3a3;text-align:center;vertical-align:middle;"><img src="<?php echo FILES."products/{$val["picture"]}"; ?>" alt="<?php echo $val["title"]; ?>" style="width:100px;" /></td>
                        <td style="border-bottom:1px dotted #a3a3a3;font-size:14px;padding-left:15px;"><a href="<?php echo SRV."shop/{$val["category"]}/{$val["url"]}"; ?>" target="_blank" style="color:#82637b;"><?php echo $val["title"]; ?></a><div style="margin-top:5px;">арт. <?php $val["article"] ?></div></td>
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
                                <?php if ($params["payment_method"] == 1) { ?>
                                <a href="<?php echo $html; ?>" target="_blank" style="background-color:#ff2430;text-align:center;width:120px;height:35px;line-height:35px;border-radius:5px;display:inline-block;text-decoration:none;color:white;">Оплатить</a>
                                <?php } ?>
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