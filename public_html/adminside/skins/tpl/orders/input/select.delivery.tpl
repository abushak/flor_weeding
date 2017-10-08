<label><?php echo WORD_322; ?>:</label>
<select name="delivery_metnod" id="select-delivery">
    <option value="0"><?php echo WORD_314; ?></option>
    <?php $query = $mysql->query("SELECT `id`,`title` FROM `zet_delivery_method`,`zet_delivery_method_description` WHERE `zet_delivery_method`.`id`=`zet_delivery_method_description`.`delivery_id` AND `zet_delivery_method_description`.`language_id`='".$lang_id."' ORDER BY `priority` ASC"); ?>
    <?php while ($row = $mysql->assoc($query)) { ?>
    <option <?php echo ($_GET["delivery_metnod"] == $row["id"]) ? 'selected="selected"' : false; ?> value="<?php echo $row["id"]; ?>"><?php echo $row["title"]; ?></option>
    <?php } ?>
</select>