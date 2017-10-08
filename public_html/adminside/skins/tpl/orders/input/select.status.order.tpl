<label><?php echo WORD_319; ?>:</label>
<select name="order_status" id="select-status-order">
    <option <?php echo ($_GET["order_status"] == 0) ? 'selected="selected"' : false; ?> value="0"><?php echo WORD_314; ?></option>
    <option <?php echo ($_GET["order_status"] == 1) ? 'selected="selected"' : false; ?> value="1"><?php echo WORD_326; ?></option>
    <option <?php echo ($_GET["order_status"] == 2) ? 'selected="selected"' : false; ?> value="2"><?php echo WORD_309; ?></option>
    <option <?php echo ($_GET["order_status"] == 3) ? 'selected="selected"' : false; ?> value="3"><?php echo WORD_327; ?></option>
    <option <?php echo ($_GET["order_status"] == 4) ? 'selected="selected"' : false; ?> value="4"><?php echo WORD_328; ?></option>
    <option <?php echo ($_GET["order_status"] == 5) ? 'selected="selected"' : false; ?> value="5"><?php echo WORD_329; ?></option>
    <option <?php echo ($_GET["order_status"] == 6) ? 'selected="selected"' : false; ?> value="6"><?php echo WORD_330; ?></option>
</select>