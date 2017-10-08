<section class="admin_all_order color">
    <section class="row">
        <section class="admin_count_order"> <a class="admin_btn" href="<?php echo ADM_SRV.routesToLink(3, 2); ?>">&#8592; <?php echo WORD_26; ?></a> <?php echo ($_GET['act'] == "add") ? WORD_289 : WORD_290;?></section>
        <section class="admin_btn_close"><a class="admin_save" href="#"><?php echo WORD_28; ?></a></section>
    </section>
</section>

<section class="wrap_admin_table">
    <section class="wrap_add">
        <form class="edit_form" method="POST">
            <section class="admin_order_info clearfix">
                <section class="span6">
                    <section>
                        <label><?php echo WORD_291; ?>:</label>
                        <input type="text" name="user_name" value="<?php echo $params['name']; ?>" />
                    </section>
                    <section>
                        <label><?php echo WORD_292; ?>:</label>
                        <input type="text" name="user_lastname" value="<?php echo $params['lastname']; ?>" />
                    </section>
                    <section>
                        <label><?php echo WORD_293; ?>:</label>
                        <input type="text" name="user_email" value="<?php echo $params['email']; ?>" />
                    </section>
                    <section>
                        <label><?php echo WORD_294; ?>:</label>
                        <input type="text" name="user_phone" value="<?php echo $params['phone']; ?>" />
                    </section>
                    <section>
                        <label><?php echo WORD_295; ?>:</label>
                        <select name="user_city">
                            <?php $query = $mysql->query("SELECT * FROM `zet_cities` WHERE `language_id`='".$site_language['id']."' ORDER BY `priority` ASC"); ?>
                            <?php while($row = $mysql->assoc($query)){ ?>
                            <?php $selected = ($params['city_id'] == $row['city_id']) ? 'selected="selected"' : false; ?>
                            <option <?php echo $selected; ?> value="<?php echo $row['city_id']; ?>"><?php echo $row['name']; ?></option>
                            <?php } ?>
                        </select>
                    </section>
                    <!-- <section>
                        <label>Номер склада:</label>
                        <select>
                            <option>Склад №10</option>
                            <option>Новый</option>
                            <option>В обработке</option>
                            <option>Выполнен</option>
                        </select>
                    </section> -->
                </section>
                
                <section class="span6">
                    <section>
                        <label><?php echo WORD_296; ?>:</label>
                        <input type="text" class="required_" name="user_password" value="<?php echo $params['password']; ?>"/>
                    </section>
                    <section class="addr_container">
                        <label><?php echo WORD_297; ?>:</label>
                        <?php if($_GET['act'] == 'edit'){ ?>
                        <?php if(!empty($cities)){ ?>
                        <?php foreach($cities as $key => $val){ ?>
                        <textarea name="user_address[]"><?php echo $val['address']; ?></textarea>
                        <?php } ?>
                        <?php } ?>
                        <?php } else { ?>
                        <textarea name="user_address[]"></textarea>
                        <?php } ?>
                    </section>
                    <section>
                        <label></label>
                        <a class="admin_order_comment add_address" href="#"><span><?php echo WORD_298; ?></span></a>
                    </section>
                    <section>
                        <label><?php echo WORD_299; ?>:</label>
                        <select name="user_group">
                            <?php $query = $mysql->query("SELECT * FROM `zet_userlist_group` WHERE `status`='1'"); ?>
                            <?php while($row = $mysql->assoc($query)){ ?>
                            <?php $selected = ($params['group_id'] == $row['id']) ? 'selected="selected"' : false; ?>
                            <option <?php echo $selected; ?> value="<?php echo $row['id']; ?>"><?php echo $row['name']; ?></option>
                            <?php } ?>
                        </select>
                    </section>
                </section>
            </section>
            
            <hr class="desc_line mrg_t" />
            
            <section class="admin_order_info clearfix">
                <section class="span6">
                    <section class="st_search_date">
                        <label><?php echo WORD_301; ?>:</label>
                        <input type="text" name="user_reg_date" class="datepicker_nolimit" value="<?php echo $params['register_date']; ?>" />
                    </section>
                </section>
            </section>
            
            <hr class="desc_line mrg_t" />
            
            <section class="description">
                <label><?php echo WORD_302; ?>:</label>
                <ul class="checkbox_list">
                    <li>
                        <input type="checkbox" <?php echo($_GET['act'] == 'edit') ? (in_array('1', $subscribe)) ? 'checked="checked"' : false : false; ?> id="subscribe_1" name="subscribe[]" value="1" />
                        <label for="subscribe_1"><span></span></label>
                    </li>
                </ul>
            </section>
            
            <section class="description">
                <label><?php echo WORD_303; ?>:</label>
                <ul class="checkbox_list">
                    <li>
                        <input type="checkbox" <?php echo($_GET['act'] == 'edit') ? (in_array('3', $subscribe)) ? 'checked="checked"' : false : false; ?> id="subscribe_3" name="subscribe[]" value="3" />
                        <label for="subscribe_3"><span></span></label>
                    </li>
                </ul>
            </section>
            
        </form>
    </section>
    
    <!-- <section class="admin_all_order color">
        <section class="row">
            <section class="admin_count_order">Заказов 2</section>
        </section>
    </section>
    
    <table class="admin_table last_order">
        <tr>
            <td><p class="padding_left">К-во</p></td>
            <td><a href="#">№ заказа</a></td>
            <td><a href="#">Добавлено</a></td>
            <td>Статус</td>
            <td><a href="#">Сумма</a></td>
            <td>Доставка</td>
            <td>Оплата</td>
            <td>Інфо</td>
        </tr>
        <tr>
            <td>№2</td>
            <td><a href="#">234</a></td>
            <td>04.04.2014</td>
            <td>
                <a class="order_status new" href="#null">Новый <i class="arrow_triangle-down"></i></a>
                <section class="wrap_action_list">
                    <ul class="action_list">
                        <li><a href="#">В обработке</a></li>
                        <li><a href="#">Отправленный</a></li>
                        <hr class="action_line" />
                        <li><a href="#">Выполнен</a></li>
                        <li><a href="#">Несостоявшийся</a></li>
                        <li><a href="#">Отмененный</a></li>
                        <a href="#null" class="close"><i class="icon_close"></i></a>
                    </ul>
                </section>
            </td>
            <td>124.00</td>
            <td>До дверей</td>
            <td>Наличными</td>
            <td><a class="order_info" href="#"></a></td>
        </tr>
    </table> -->
</section>