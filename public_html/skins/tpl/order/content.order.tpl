<?php if(isset($_POST['govno']))
   redirectTo(SRV_."calendar") ;?>


<?php $_PagesStatic = new PagesStatic(); ?>
<?php $page = $_PagesStatic->GetPageData($dir); ?>

<?php $_StoreSettings = new StoreSettings(); ?>
<?php $delivery = $_StoreSettings->GetDeliveryMethods(); ?>
<?php $payment = $_StoreSettings->GetPaymentMethods(); ?>

<?php $products = $_Cart->GetItems($__session); ?>
<?php $cart_price = $_Cart->CartPrice($products); ?>
<?php $total_products = $_Cart->ItemsInCart($__session); ?>

<?php $query = $mysql->query("SHOW TABLE STATUS FROM `".config('database')."` LIKE 'zet_orders'") ?>
<?php $row = $mysql->assoc($query); ?>
<?php $order_id = $row['Auto_increment']; ?>
<?php $_USD = config("usd"); ?>

<?php if ($total_products < 1) redirectTo(SRV_."shop"); ?>

<div class="pathway wbody">
    <ul>
        <li><a href="<?php echo SRV_; ?>"><?php echo WORD_54; ?></a></li>
        <li><a href="<?php echo SRV_."shop"; ?>"><?php echo WORD_55; ?></a></li>
        <li><a href="<?php echo SRV_."cart"; ?>"><?php echo WORD_46; ?></a></li>
        <li><a href="<?php echo SRV_."order"; ?>"><?php echo WORD_72; ?></a></li>
    </ul>
</div>

<?php $real_cart_price = $cart_price; ?>
<?php $delivery_price = ($cart_price > $delivery[1]['free_from']) ? 0 : $delivery[1]['price']; ?>
<?php $cart_price = $cart_price + $delivery_price; ?>
<div class="wbody order">
    <h2><?php echo WORD_72; ?></h2>
    <div class="right">
        <div>
            <h2><?php echo WORD_59; ?></h2>
            <div class="price">
                <div>
                    <span data-price="<?php echo $real_cart_price; ?>" id="order-price"><?php echo $cart_price; ?></span> <?php echo $site_currency['abbr']; ?>
                </div>
            </div>
            <div class="prices">
                <span class="summary"></span>
                <span class="euro">$<?php echo round($cart_price/$_USD); ?></span>
            </div>
        </div>
        
        <?php echo $page['description']; ?>
    </div>
    
    <input id="help_<?php echo $payment[2]["id"]; ?>" type="radio" name="popup" />
    <input id="help_<?php echo $payment[3]["id"]; ?>" type="radio" name="popup" />
    <form action="<?php echo SRV_."order/confirm"; ?>" method="POST" class="left order_params" id="order-info-form">
        <h3><?php echo WORD_73; ?></h3>
        <div class="shipping">
            <div>
                <table>
                    <tbody>
                        <tr>
                            <td style="width:25px">
                                <input id="shiping_<?php echo $delivery[1]['id']; ?>" value="<?php echo $delivery[1]['id']; ?>" type="radio" name="delivery_method" checked="checked" data-price="<?php echo $delivery_price; ?>" />
                                <label for="shiping_<?php echo $delivery[1]['id']; ?>" class="check"></label>
                            </td>
                            <td>
                                <label for="shiping_<?php echo $delivery[1]['id']; ?>"><?php echo $delivery[1]['title']; ?></label>
                            </td>
                            <td><?php echo WORD_74; ?></td>
                            <?php if ($cart_price > $delivery[1]['free_from']) { ?>
                            <td class="freeprice"><span style="text-decoration: line-through; color: #D00F0F;">&nbsp;<span style="color: black;"><?php echo $delivery[1]['price']; ?> <?php echo $site_currency['abbr']; ?></span>&nbsp;</span></td>
                            <td class="free" style="color: #0FBA0F;"><?php echo WORD_75; ?></td>
                            <?php } else { ?>
                            <td class="freeprice"></td>
                            <td class="free"><span><?php echo $delivery[1]['price']; ?> <?php echo $site_currency['abbr']; ?></span></td>
                            <?php } ?>
                        </tr>
                        <tr>
                            <td>
                                <input id="shiping_<?php echo $delivery[2]['id']; ?>" value="<?php echo $delivery[2]['id']; ?>" type="radio" name="delivery_method" data-price="0" />
                                <label for="shiping_<?php echo $delivery[2]['id']; ?>" class="check"></label>
                            </td>
                            <td colspan="4">
                                <label for="shiping_<?php echo $delivery[2]['id']; ?>"><?php echo $delivery[2]['title']; ?>
                                    <label for="popup_map"><?php echo WORD_76; ?></label>
                                </label>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        
        <h3><?php echo WORD_77; ?></h3>
        <div class="payment">
            <div>
                <input id="payment_<?php echo $payment[1]['id']; ?>" value="<?php echo $payment[1]['id']; ?>" type="radio" name="payment_method" checked="checked" />
                <label for="payment_<?php echo $payment[1]['id']; ?>" class="checkbox"></label>
                <label for="payment_<?php echo $payment[1]['id']; ?>"><?php echo $payment[1]['title']; ?></label>
                <div><?php echo $payment[1]['short_description']; ?></div>
            </div>
            
            <div>
                <input id="payment_<?php echo $payment[2]['id']; ?>" value="<?php echo $payment[2]['id']; ?>" type="radio" name="payment_method" />
                <label for="payment_<?php echo $payment[2]['id']; ?>" class="checkbox"></label>
                <label for="payment_<?php echo $payment[2]['id']; ?>"><?php echo $payment[2]['title']; ?></label>
                <label for="help_<?php echo $payment[2]['id']; ?>" class="help">?
                    <div class="help_<?php echo $payment[2]['id']; ?>">
                        <span></span>
                        <label for="popup_none"></label>
                        <?php echo $payment[2]['description']; ?>
                    </div>
                </label>
                <div><?php echo $payment[2]['short_description']; ?></div>
            </div>
            
            <div>
                <input id="payment_<?php echo $payment[3]['id']; ?>" value="<?php echo $payment[3]['id']; ?>" type="radio" name="payment_method" />
                <label for="payment_<?php echo $payment[3]['id']; ?>" class="checkbox"></label>
                <label for="payment_<?php echo $payment[3]['id']; ?>"><?php echo $payment[3]['title']; ?></label>
                <label for="help_<?php echo $payment[3]['id']; ?>" class="help">?
                    <div class="help_<?php echo $payment[3]['id']; ?>">
                        <span></span>
                        <label for="popup_none"></label>
                        <?php echo $payment[3]['description']; ?>
                    </div>
                </label>
                <div><?php echo $payment[3]['short_description']; ?></div>
            </div>
        </div>
        
        <!-- USER DATA -->
        <div class="form">
            <input id="recipient_1" type="radio" name="recipient" value="0" checked="checked" />
            <input id="recipient_2" type="radio" name="recipient" value="1" />
            
            <div class="form-group">
                <div class="control-label"><?php echo WORD_78; ?><span>*</span></div>
                <div class="input-group"><input type="text" name="user_name" class="input order-required" value="<?php echo $_SESSION['username'];?>" /></div>
            </div>
            
            <div class="form-group">
                <div class="control-label"><?php echo WORD_79; ?><span>*</span></div>
                <div style="width:100%" class="input-group">
                    <div style="width:50%" class="group">
                        <input type="text" name="user_phone" class="input phone-mask order-required" value="<?php echo trim($_SESSION['phone']);?>"/>
                        <div class="note"><?php echo WORD_124; ?></div>
                    </div>
                    <div style="width:32%" class="sep2"><?php echo WORD_80; ?></div>
                </div>
            </div>
            
            <div class="form-group">
                <div class="control-label"><?php echo WORD_81; ?><span>*</span></div>
                <div style="width:100%" class="input-group">
                    <div style="width:50%" class="group"><input type="email" name="user_email" class="input order-required" value="<?php echo $_SESSION['useremail'];?>"/></div>
                    <div style="width:29%" class="sep2"><?php echo WORD_82; ?></div>
                </div>
            </div>
            
            <div class="form-group">
                <div class="input-group">
                    <p><?php echo WORD_83; ?></p>
                    <label for="recipient_1" class="check"><?php echo WORD_84; ?></label>
                    <label for="recipient_2" class="check"><?php echo WORD_85; ?></label>
                </div>
            </div>
            
            <div class="form-group recipient_2">
                <div class="control-label"><?php echo WORD_86; ?><span>*</span></div>
                <div class="input-group"><input type="text" name="recipient_name" class="input order-required" /></div>
            </div>
            
            <div class="form-group recipient_2">
                <div class="control-label"><?php echo WORD_79; ?><span>*</span></div>
                <div class="input-group"><input type="text" name="recipient_phone" class="input phone-mask-ua order-required" /></div>
            </div>
            
            <div class="form-group">
                <div class="control-label"><?php echo WORD_87; ?></div>
                <div style="width:100%" class="input-group">
                    <div style="width:50%" class="group">
                        <div class="input"><span><?php echo WORD_88; ?></span><input name="door_address"required /></div>
                        <div class="note"><?php echo WORD_89; ?></div>
                    </div>
                    
                    <div style="width:15%" class="group">
                        <input type="text" name="floor" class="input" />
                        <div class="note"><?php echo WORD_90; ?></div>
                    </div>
                </div>
            </div>
            
            <div class="form-group">
                <div class="control-label"><?php echo WORD_91; ?></div>
                <div style="width:100%" class="input-group">
                    <div style="width:30%" class="group"><input name="date" class="input" id="datepicker"value="<?php echo $_SESSION['orderdate'];?>" /><input type="hidden" id="hiddentime" /></div>
                    <div class="sep"><?php echo WORD_92; ?></div>
                    <div style="width:10%" class="group"><input type="text" name="from" class="input timepicker" id="timestart" /></div>
                    <div class="sep"><?php echo WORD_93; ?></div>
                    <div style="width:10%" class="group"><input type="text" name="to" class="input timepicker" id="timeend" /></div>
                </div>
            </div>
            
            <div class="form-group recipient_2">
                <div class="input-group">
                    <p><?php echo WORD_94; ?></p>
                    <input id="photo_1" type="radio" name="photo" value="1" data-price="<?php echo config("photo_price"); ?>" />
                    <label for="photo_1" class="check"><?php echo WORD_95; ?> (+<?php echo config("photo_price"); ?> <?php echo $site_currency["abbr"]; ?>)</label>
                    <input id="photo_2" type="radio" name="photo" value="0" data-price="0" checked="checked" />
                    <label for="photo_2" class="check"><?php echo WORD_96; ?></label> 
                </div>
            </div>
            
            <div class="form-group recipient_2">
                <div class="input-group">
                    <p><?php echo WORD_97; ?></p>
                    <input id="card_1" type="radio" name="card" value="1" data-price="<?php echo config("card_price"); ?>" />
                    <label for="card_1" class="check"><?php echo WORD_95; ?> (+<?php echo config("card_price"); ?> <?php echo $site_currency["abbr"]; ?>)</label>
                    <input id="card_2" type="radio" name="card" value="0" data-price="0" checked="checked" />
                    <label for="card_2" class="check"><?php echo WORD_96; ?></label>
                    <div></div>
                    <textarea name="card_text" class="input"></textarea>
                </div>
            </div>
            
            <div class="form-group">
                <div class="input-group msg">
                    <input id="msg" type="checkbox" />
                    <label for="msg"><?php echo WORD_98; ?></label>
                    <textarea name="comment" class="input"></textarea>
                </div>
            </div>
        </div>
        
        <div class="button"  style="text-align: center;">
            <form method='POST' >     <button type="submit" name="govno" id="bl9"><?php echo WORD_99; ?></button></form>
            <span style="color: #ff0000; display: none;" id="not-all-fields"><?php echo WORD_113; ?></span>
        </div>
    </form>
</div>

<script>
$(function() {
    $("input[name=card]").change(function() {
        var card_price = "<?php echo config("card_price"); ?>",
            order_price = parseInt($("#order-price").text());
        var price = ($(this).val() == 1) ? order_price - (-card_price) : order_price - card_price;

        $("#order-price").text(price);
        $(".order .prices .euro").text(["$" + (price/USD).toFixed(0), "€" + (price/EU).toFixed(0)].join(" / "));
    });
    
    $("input[name=photo]").change(function() {
        var photo_price = "<?php echo config("photo_price"); ?>",
            order_price = parseInt($("#order-price").text());
        var price = ($(this).val() == 1) ? order_price - (-photo_price) : order_price - photo_price;
        $("#order-price").text(price);
        $(".order .prices .euro").text(["$" + (price/USD).toFixed(0), "€" + (price/EU).toFixed(0)].join(" / "));
    });
    /** Вибір дати та часу **/
    $.datepicker.setDefaults($.extend($.datepicker.regional["ru"]));
    $("#datepicker").datetimepicker({
        minDate: 1,
        dateFormat: "yy-mm-dd",
        showHour: false,
        showMinute: false,
        showSecond: false,
        showMillisec: false,
        showMicrosec: false,
        showTimezone: false,
        showTime: false,
        showButtonPanel: false,
        altField: "#hiddentime"
    });
    
    $(".timepicker").timepicker({
        timeOnlyTitle: 'Выберите время',
        timeText: 'Время',
        hourText: 'Часы',
        minuteText: 'Минуты',
        secondText: 'Секунды',
        millisecText: 'Миллисекунды',
        timezoneText: 'Часовой пояс',
        currentText: 'Сейчас',
        closeText: 'Закрыть',
        timeFormat: 'HH:mm',
        amNames: ['AM', 'A'],
        pmNames: ['PM', 'P'],
        isRTL: false,
        showButtonPanel: false
    });
})
</script>