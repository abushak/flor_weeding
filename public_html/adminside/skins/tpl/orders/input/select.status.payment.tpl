<label><?php echo WORD_320; ?>:</label>
<select name="payment_status" id="select-status-payment">
    <option <?php echo ($_GET["payment_status"] == 0) ? 'selected="selected"' : false; ?> value="0"><?php echo WORD_314; ?></option>
    <option <?php echo ($_GET["payment_status"] == 1) ? 'selected="selected"' : false; ?> value="1"><?php echo WORD_331; ?></option>
    <option <?php echo ($_GET["payment_status"] == 2) ? 'selected="selected"' : false; ?> value="2"><?php echo WORD_332; ?></option>
</select>