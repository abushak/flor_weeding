<label><?php echo WORD_323; ?>:</label>
<select name="payment_method" id="select-payment">
    <option value="0"><?php echo WORD_314; ?></option>
    <?php $query = $mysql->query("SELECT `id`,`title` FROM `zet_payment_method`,`zet_payment_method_description` WHERE `zet_payment_method`.`id`=`zet_payment_method_description`.`payment_id` AND `zet_payment_method_description`.`language_id`='".$lang_id."' ORDER BY `priority` ASC"); ?>
    <?php while ($row = $mysql->assoc($query)) { ?>
    <option <?php echo ($_GET["payment_method"] == $row["id"]) ? 'selected="selected"' : false; ?> value="<?php echo $row["id"]; ?>"><?php echo $row["title"]; ?></option>
    <?php } ?>
</select>