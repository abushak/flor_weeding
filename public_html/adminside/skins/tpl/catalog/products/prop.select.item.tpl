<section class="description">
<label><?php echo $row['title'] ?>:</label>
    <input type="hidden" name="property_id[]" value="<?php echo $row['id'] ?>"/>
    <select name="property_value[<?php echo $row['id'] ?>]">
        <option value="0"><?php echo WORD_121; ?></option>
        <?php if($row['type'] == '1' || $row['type'] == '2') $langg = " `language_id`='".$site_language['id']."' AND "; ?>
        <?php $sub_query = $mysql->query("SELECT `id`, `name`, `val_1`, `val_2`, `val_3` FROM `zet_product_properties_values` WHERE ".$langg." `property_id`='".$row['id']."'"); ?>
        <?php while($sub_row = $mysql->assoc($sub_query)){ ?>
        <?php if($row['type'] == '1' || $row['type'] == '2') $title = $sub_row['name']; ?>
        <?php if($row['type'] == '3') $title = $sub_row['val_1']; ?>
        <?php if($row['type'] == '4') $title = WORD_105.' '.$sub_row['val_1'].' '.WORD_106.' '.$sub_row['val_2']; ?>
        <?php if($row['type'] == '5') $title = $sub_row['val_1'].' × '.$sub_row['val_2']; ?>
        <?php if($row['type'] == '6') $title = $sub_row['val_1'].' × '.$sub_row['val_2'].' × '.$sub_row['val_3']; ?>
        <option <?php if($_GET['act'] == 'edit' && isset($prop_array[$row['id']])) echo (in_array($sub_row['id'], $prop_array[$row['id']])) ? 'selected="selected"' : false; ?> value="<?php echo $sub_row['id']; ?>"><?php echo $title; ?></option>
    <?php } ?>
    </select>
</section>