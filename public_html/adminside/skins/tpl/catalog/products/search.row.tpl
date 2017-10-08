<div class="wrap_cell">
    <form method="GET" id="catalog-search-form">
        <div class="cell c_text">
            <section class="checkbox_list">
                <input type="checkbox" id="t_check_all" />
                <label for="t_check_all"><span></span></label>
            </section>
        </div>
        
        <div class="cell">
            <a class="admin_order_img" href="#"><img src="<?php echo ADM_SKIN."image/nophoto_small.png"; ?>" /></a>
        </div>
        <div class="cell">
            <input type="text" name="name" value="<?php echo $_GET["name"]; ?>" />
        </div>
        <div class="cell c_text">
            <ul class="variants">
                <li>
                    <i class="label"><?php echo WORD_238; ?></i>
                    <input type="text" name="price_min" value="<?php echo $_GET["price_min"]; ?>" class="small_input" />
                    <input type="text" name="cross_min" value="<?php echo $_GET["cross_min"]; ?>" class="small_input" />
                    <input type="text" name="count_min" value="<?php echo $_GET["count_min"]; ?>" class="small_input" />
                    <input type="text" name="article" value="<?php echo $_GET["article"]; ?>" class="small_input" />
                </li>
                <li>
                    <i class="label"><?php echo WORD_239; ?></i>
                    <input type="text" name="price_max" value="<?php echo $_GET["price_max"]; ?>" class="small_input" />
                    <input type="text" name="cross_max" value="<?php echo $_GET["cross_max"]; ?>" class="small_input" />
                    <input type="text" name="count_max" value="<?php echo $_GET["count_max"]; ?>" class="small_input" />
                    <input type="text" class="small_input" style="visibility:hidden;" />
                </li>
            </ul>
        </div>
        
        <div class="cell">
            <select name="status_type">
                <option <?php echo ($_GET["status_type"] == 0) ? 'selected="selected"' : ""; ?> value="0"><?php echo WORD_37; ?></option>
                <option <?php echo ($_GET["status_type"] == 1) ? 'selected="selected"' : ""; ?> value="1"><?php echo WORD_257; ?></option>
                <option <?php echo ($_GET["status_type"] == 2) ? 'selected="selected"' : ""; ?> value="2"><?php echo WORD_258; ?></option>
                <option <?php echo ($_GET["status_type"] == 3) ? 'selected="selected"' : ""; ?> value="3"><?php echo WORD_259; ?></option>
            </select>
        </div>
        
        <input type="hidden" id="category_id_input" name="category_id" value="<?php echo $_GET["category_id"]; ?>" />
        <div class="cell c_text">
            <input type="submit" value="ок" />
        </div>
    </form>
</div>