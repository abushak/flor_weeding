<section class="admin_all_order color">
    <section class="row">
        <section class="admin_count_order"> <a class="admin_btn" href="<?php echo ADM_SRV."{$route[2]}/{$route[3]}/"; ?>">&#8592; <?php echo WORD_26; ?></a> <?php echo WORD_366;?></section>
    </section>
</section>

<section class="wrap_admin_table">
    <section class="wrap_add">
        <section class="edit_form">
            <section class="admin_order_info clearfix">
                <section class="span6">
                    <section>
                        <label><?php echo WORD_291; ?>:</label>
                        <label><?php echo $params['name']; ?> <?php echo $params['lastname']; ?></label>
                    </section>
                    <section>
                        <label><?php echo WORD_293; ?>:</label>
                        <label><?php echo $params['email']; ?></label>
                    </section>
                    <section>
                        <label><?php echo WORD_294; ?>:</label>
                        <label><?php echo $params['phone']; ?></label>
                    </section>
                    <section>
                        <label><?php echo WORD_295; ?>:</label>
                        <?php $query = $mysql->query("SELECT * FROM `zet_cities` WHERE `language_id`='".$site_language['id']."' ORDER BY `priority` ASC"); ?>
                        <?php while($row = $mysql->assoc($query)){ ?>
                        <?php if(($params['city_id'] == $row['city_id'])){ ?>
                        <?php $_city = $row['name']; break; ?>
                        <?php } else $_city = WORD_121; ?>
                        <?php } ?>
                        <label><?php echo $_city; ?></label>
                    </section>
                </section>
                
                <section class="span6">
                    <section class="addr_container">
                        <label><?php echo WORD_297; ?>:</label>
                        <?php if(!empty($cities)){ ?>
                        <?php foreach($cities as $key => $val){ ?>
                        <label><?php echo $val['address']; ?></label>
                        <?php } ?><?php } ?>
                    </section>
                    <section>
                        <label><?php echo WORD_299; ?>:</label>
                        <?php $query = $mysql->query("SELECT * FROM `zet_userlist_group` WHERE `status`='1'"); ?>
                        <?php while($row = $mysql->assoc($query)){ ?>
                        <?php if(($params['group_id'] == $row['id'])){ ?>
                        <?php $_group = $row['name']; break; ?>
                        <?php } ?><?php } ?>
                        <label><?php echo $_group; ?></label>
                    </section>
                    <section>
                        <label><?php echo WORD_301; ?>:</label>
                        <label><?php echo $params['register_date']; ?></label>
                    </section>
                </section>
            </section>
        </section>
    </section>
    
    <?php $query = $mysql->query("SELECT COUNT(*) AS `total` FROM `zet_orders`,`zet_orders_user` WHERE `zet_orders_user`.`order_id`=`zet_orders`.`id` AND (`zet_orders_user`.`user_id`='".(int)$route[4]."' OR `zet_orders_user`.`email`='".$params['email']."')"); ?>
    <?php $row = $mysql->assoc($query); ?>
    <?php $orders_count = $row['total']; ?>
    <section class="admin_all_order color">
        <section class="row">
            <section class="admin_count_order"><?php echo WORD_369; ?> <?php echo $orders_count; ?></section>
        </section>
    </section>
    
    <?php if($orders_count > 0){ ?>
    <table class="admin_table last_order">
        <tr>
            <td><p class="padding_left"><?php echo WORD_243; ?></p></td>
            <td><?php echo WORD_370; ?></a></td>
            <td><?php echo WORD_334; ?></a></td>
            <td><?php echo WORD_336; ?></td>
            <td><?php echo WORD_337; ?></a></td>
            <td><?php echo WORD_338; ?></td>
            <td><?php echo WORD_339; ?></td>
            <td><?php echo WORD_340; ?></td>
        </tr>
    <?php $i = $orders_count; ?>
    <?php $query = $mysql->query("SELECT `id`,`status`,`delivery_metnod`,`payment_method`,`date`,`real_price`,`discount`,`del_price`,`final_price`,`user_id`,`name`,`email`,`phone`,`city_id`,`comment` FROM `zet_orders`,`zet_orders_user` WHERE `zet_orders_user`.`order_id`=`zet_orders`.`id` AND (`zet_orders_user`.`user_id`='".(int)$route[4]."' OR `zet_orders_user`.`email`='".$params['email']."') ORDER BY `date` DESC"); ?>
    <?php while($row = $mysql->assoc($query)){ ?>
    <?php switch($row['delivery_metnod']){
        case '1': $del = WORD_355; break;
        case '2': $del = WORD_357; break;
        case '3': $del = WORD_356; break;
    }
    switch($row['payment_method']){
        case '1': $pay = WORD_358; break;
        case '2': $pay = WORD_359; break;
        case '3': $pay = WORD_360; break;
        case '4': $pay = WORD_361; break;
    } ?>
        <tr data-id="<?php echo $row['id']; ?>">
            <td><p class="padding_left">№<?php echo $i; ?></p></td>
            <td><a href="<?php echo ADM_SRV."orders/new/{$row['id']}/?act=view"; ?>"><?php echo $row['id']; ?></a></td>
            <td><?php echo $row['date']; ?></td>
            <td><?php include ADM_TPL."select/status.select.tpl"; ?></td>
            <td><?php echo $row['final_price']; ?></td>
            <td><?php echo $del; ?></td>
            <td><?php echo $pay; ?></td>
            <td><a class="order_info show-order-box" href="#"></a></td>
        </tr>
    <?php $i--; ?>
    <?php } ?>
    </table>
    <?php } ?>
</section>