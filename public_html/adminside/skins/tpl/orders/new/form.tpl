<section class="wrap_order_detal">
    <section class="caption_box">
        <section class="row">
            <section class="span10">
                <a href="<?php echo ADM_SRV."{$route[2]}/$route[3]/"; ?>" class="admin_btn">&#8592; <?php echo WORD_26; ?></a>
                <p class="admin_order_title"><?php echo ($_GET['act'] == 'add') ? WORD_341 : WORD_342; ?></p>
            </section>
            <section class="admin_btn_close"><a href="#" class="admin_save"><?php echo WORD_28; ?></a></section>
        </section>
    </section>
    
    <section class="wrap_order_box">
        <form method="POST" class="edit_form">
            <section class="status_r row">
                <section class="span4"><?php include SELECT."status.select.tpl"; ?></section>
            </section>
            
            <section class="admin_order_info row">
                <section class="span6">
                    <section id="name_auto_complete"><?php include INPUT."autocomplete.name.tpl"; ?></section>
                    <section>
                        <label><?php echo WORD_293; ?>:</label>
                        <input type="text" name="email" id="user_email" value="<?php echo $user['email']; ?>" />
                    </section>
                    <section>
                        <label><?php echo WORD_294; ?>:</label>
                        <input type="text" name="phone" id="user_phone" value="<?php echo $user['phone']; ?>" />
                    </section>
                    <!-- <section>
                        <label><?php echo WORD_295; ?>:</label>
                        <select name="city" id="user_city">
                            <?php $query = $mysql->query("SELECT `city_id`,`name` FROM `zet_cities` WHERE `language_id`='".$site_language['id']."' ORDER BY `priority` ASC"); ?>
                            <?php while($row = $mysql->assoc($query)){ ?>
                            <option <?php echo ($row['city_id'] == $user['city_id']) ? 'selected="selected"' : false; ?> value="<?php echo $row['city_id']; ?>"><?php echo $row['name']; ?></option>
                            <?php } ?>
                        </select>
                    </section> -->
                    <section>
                        <label><?php echo WORD_344; ?>:</label>
                        <textarea name="comment"><?php echo $user['comment']; ?></textarea>
                    </section>
                    <section>
                        <ul class="checkbox_list-update" style="margin-left: 118px; width: 165px;">
                            <li style="padding-left: 0px;">
                                <label>
                                    <input type="checkbox" class="has-subs" name="is_gift" id="is_gift" <?php echo ($receiver["receiver"] == 1) ? 'checked="checked"' : false; ?> />
                                    <span></span> <?php echo WORD_412; ?>
                                </label>
                            </li>
                        </ul>
                    </section>
                </section>
                
                <section class="span6" style="height: 225px;">
                    <section>
                        <label><?php echo WORD_338; ?>:</label>
                        <select name="delivery_metnod" id="delivery_metnod">
                            <?php $query = $mysql->query("SELECT `id`,`price`,`free_from`,(SELECT `title` FROM `zet_delivery_method_description` WHERE `delivery_id`=`zet_delivery_method`.`id` AND `language_id`='".$site_language['id']."') AS `title` FROM `zet_delivery_method` ORDER BY `priority` ASC"); ?>
                            <?php while($row = $mysql->assoc($query)){ ?>
                            <option <?php echo ($row['id'] == $params['delivery_metnod']) ? 'selected="selected"' : false; ?> data-price="<?php echo $row['price']; ?>" data-free="<?php echo $row['free_from']; ?>" value="<?php echo $row['id']; ?>"><?php echo $row['title']; ?></option>
                            <?php } ?>
                        </select>
                    </section>
                    <section>
                        <label><?php echo WORD_297; ?>:</label>
                        <input type="text" name="adress" id="adress" value="<?php echo $user['adress']; ?>" />
                    </section>
                    <section>
                        <label><?php echo WORD_414; ?>:</label>
                        <input type="text" name="rdate" id="rdate" value="<?php echo $params['rdate']; ?>" />
                    </section>
                    <section>
                        <label><?php echo WORD_413; ?>:</label>
                        <input type="text" name="from" id="from" value="<?php echo $params['ftime']; ?>" style="width: 29%;" /> -
                        <input type="text" name="to" id="to" value="<?php echo $params['ttime']; ?>" style="width: 29%;" />
                    </section>
                    <section>
                        <label><?php echo WORD_339; ?>:</label>
                        <select name="payment_method">
                            <?php $query = $mysql->query("SELECT `id`,(SELECT `title` FROM `zet_payment_method_description` WHERE `payment_id`=`zet_payment_method`.`id` AND `language_id`='".$site_language['id']."') AS `title` FROM `zet_payment_method` ORDER BY `priority` ASC"); ?>
                            <?php while($row = $mysql->assoc($query)){ ?>
                            <option <?php echo ($row['id'] == $params['payment_method']) ? 'selected="selected"' : false; ?> value="<?php echo $row['id']; ?>"><?php echo $row['title']; ?></option>
                            <?php } ?>
                        </select>
                        <label></label>
                        <select name="payment_status">
                            <option value="0"><?php echo WORD_419; ?></option>
                            <option <?php echo ($params["payment_status"] == 1) ? 'selected="selected"' : ""; ?> value="1"><?php echo WORD_418; ?></option>
                        </select>
                    </section>
                </section>
                
                <section class="span6" id="gift_box" style="margin: 0; display: <?php echo ($receiver["receiver"] == 1) ? "block" : "none"; ?>;">
                    <section>
                        <label><?php echo WORD_343; ?>:</label>
                        <input type="text" name="rname" value="<?php echo $receiver['name']; ?>" />
                    </section>
                    <section>
                        <label><?php echo WORD_294; ?>:</label>
                        <input type="text" name="rphone" value="<?php echo $receiver['phone']; ?>" />
                    </section>
                    <section>
                        <ul class="checkbox_list-update" style="margin-left: 118px; width: 165px;">
                            <li style="padding-left: 0px;">
                                <label>
                                    <input type="checkbox" class="has-subs" name="photos" id="photos" <?php echo ($params["photos"] == 1) ? 'checked="checked"' : false; ?> />
                                    <span></span> <?php echo WORD_415; ?>
                                </label>
                            </li>
                        </ul>
                    </section>
                    <section>
                        <ul class="checkbox_list-update" style="margin-left: 118px; width: 225px;">
                            <li style="padding-left: 0px;">
                                <label>
                                    <input type="checkbox" class="has-subs" name="gift_card" id="gift_card" <?php echo ($params["card"] == 1) ? 'checked="checked"' : false; ?> />
                                    <span></span> <?php echo WORD_416; ?>
                                </label>
                            </li>
                        </ul>
                    </section>
                    <section id="gift_card_text" style="display: <?php echo ($params["card"] == 1) ? "block" : "none"; ?>;">
                        <label><?php echo WORD_417; ?></label>
                        <textarea name="card_text"><?php echo $params['card_text']; ?></textarea>
                    </section>
                </section>
            </section>
            
            <?php include ADM_TPL.'orders/form/order.items.tpl'; ?>
        </form>
        
        <input type="hidden" id="order-id" value="<?php echo $params['id']; ?>" />
        <section class="admin_order_history">
            <p class="history_title"><?php echo WORD_347; ?></p>
            <a href="#" class="admin_order_comment"><span><?php echo WORD_348; ?></span></a>
            <section id="admin_comment">
                <textarea id="order-comment-text" style="margin-bottom: 5px;"></textarea>
                <input id="order-comment-submit" type="button" value="<?php echo WORD_348; ?>" style="margin-bottom: 20px;" />
            </section>
            <section id="order-comment-box">
                <?php $query = $mysql->query("SELECT * FROM `zet_order_comments` WHERE `order_id`='".$params['id']."' ORDER BY `date` DESC"); ?>
                <?php while($row = $mysql->assoc($query)){ ?>
                <p class="admin_order_date" style="margin-bottom: 5px;"><span><?php echo $row['date']; ?></span> <?php echo $row['text']; ?></p>
                <?php } ?>
            </section>
        </section>
    </section>
</section>

<script type="text/javascript">
jQuery(function($) {
    $("#is_gift").click(function() {
        if ($(this).prop("checked")) {
            $("#gift_box").css("display", "block");
        } else {
            $("#gift_box").css("display", "none");
        }
    });
    
    $("#gift_card").click(function() {
        if ($(this).prop("checked")) {
            $("#gift_card_text").css("display", "block");
        } else {
            $("#gift_card_text").css("display", "none");
        }
    });
})
</script>