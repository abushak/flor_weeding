<section class="description">
    <label><?php echo WORD_88; ?>:</label>
    <input type="text" name="discount_value" class="small_input <?php echo ($route[3] == "discount") ? "required_" : false;?>" value="<?php echo $params["discount_value"]; ?>" />
    <select class="small_input" name="discount_type">
        <?php /* <!-- <option <?php echo ($params["discount_type"] == 0 || empty($params["discount_type"])) ? "selected='selected'" : false; ?> value="0"><?php echo WORD_95; ?></option> --> */ ?>
        <option <?php echo ($params["discount_type"] == 1) ? "selected='selected'" : false; ?> value="1"><?php echo WORD_93; ?></option>
        <option <?php echo ($params["discount_type"] == 2) ? "selected='selected'" : false; ?> value="2"><?php echo WORD_94; ?></option>
    </select>
</section>