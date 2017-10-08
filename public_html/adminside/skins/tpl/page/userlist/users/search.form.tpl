<section class="admin_search">
    <section>
        <section class="admin_input_search">
            <form method="GET">
                <input type="text" required="required" name="q" />
                <input type="submit" value="<?php echo WORD_109; ?>" name="" />
                
                <a class="more_search" href="#"><?php echo WORD_110; ?></a>
                <section class="st_search">
                    <section class="st_r">
                        <section class="span5 st_search_price">
                            <label class="t_right"><?php echo WORD_111; ?>:</label>
                            <input type="text" name="order_sum_min" /> - <input type="text" name="order_sum_max" />
                        </section>
                        <section class="span5 st_search_price">
                            <label class="t_right"><?php echo WORD_112; ?>:</label>
                            <input type="text" name="order_num_min" /> - <input type="text" name="order_num_max" />
                        </section>
                        <section class="span2"><a class="clear_form" href="#null"><?php echo WORD_113; ?></a></section>
                    </section>
                    
                    <section class="st_r">
                        <section class="span5">
                            <label class="t_right"><?php echo WORD_114; ?>:</label>
                            <select class="input_select" name="user_group">
                                <option>Все группы</option>
                                <option>Новый</option>
                                <option>В обработке</option>
                                <option>Выполнен</option>
                            </select>
                            <script>
                            $(function(){
                                $('.input_select').select2({'width':'element'});
                            })
                            </script>
                        </section>
                        
                        <section class="span7 st_search_date">
                            <label class="t_right"><?php echo WORD_115; ?>:</label>
                            <input type="text" id="date1" class="datepicker_nolimit" name="reg_date_min" class="hasDatepicker" /> - <input type="text" class="datepicker_nolimit" id="date2" name="reg_date_max" class="hasDatepicker" />
                        </section>
                    </section>
                    
                    <section class="st_r">
                        <section class="span5">
                            <label><?php echo WORD_116; ?>:</label>
                            <section class="wrap_select" style="width: 140px;">
                                <input type="text" name="city" id="autocomplete_city" />
                                <a class="open_list" href="#" style="top: 5px; right: 7px;"><img alt="" src="<?php echo ADM_SKIN; ?>image/select.png" /></a>
                                <ul class="sort_list" style="min-width: 140px;">
                                    <li><a href="#">James</a></li>
                                    <li><a href="#">John</a></li>
                                    <li><a href="#">Jake</a></li>
                                    <li><a href="#">Johnson</a></li>
                                </ul>
                            </section>
                            <!-- <select name="city">
                                <option>Все города</option>
                                <option>Новый</option>
                                <option>В обработке</option>
                                <option>Выполнен</option>
                            </select> -->
                        </section>
                        
                        <section class="span5">
                            <label><?php echo WORD_117; ?>:</label>
                            <select name="subscribe">
                                <option value="0"><?php echo WORD_121; ?></option>
                                <option value="1"><?php echo WORD_118; ?></option>
                                <!-- <option value="2"><?php echo WORD_119; ?></option> -->
                                <option value="3"><?php echo WORD_120; ?></option>
                            </select>
                        </section>
                    </section>
                </section>
            </form>
        </section>
    </section>
</section>