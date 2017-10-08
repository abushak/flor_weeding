<section class="span4">
    <section class="filter_list">
        <p class="caption"><?php echo $row['title'] ?></p>
        <input type="hidden" name="check_property_id[]" value="<?php echo $row['id'] ?>"/>
        <ul class="checkbox_list">
        <?php if($row['type'] == '2') { ?>
        <?php $sub_query = $mysql->query("SELECT `id`,`value`,`title` FROM `zet_property_color`,`zet_property_color_description` WHERE `zet_property_color_description`.`color_id`=`zet_property_color`.`id` AND `zet_property_color_description`.`language_id`='".$site_language['id']."' AND `zet_property_color`.`property_id`='".$row['id']."'"); ?>
        <?php while($sub_row = $mysql->assoc($sub_query)){ ?>
            <li>
                <input <?php if($_GET['act'] == 'edit') echo (in_array($sub_row['id'], $prop_array[$row['id']])) ? 'checked="checked"' : false; ?> type="checkbox" value="<?php echo $sub_row['id']; ?>" name="check_property_values[<?php echo $row['id']; ?>][]" id="id_<?php echo $row['id'].'_'.$sub_row['id']; ?>" />
                <label for="id_<?php echo $row['id'].'_'.$sub_row['id']; ?>"><span></span> <?php echo $sub_row['title']; ?></label>
            </li>
        <?php } ?>
        
        <?php } else { ?>
        <?php if($row['type'] == '1') $langg = " `language_id`='".$site_language['id']."' AND "; ?>
        <?php $sub_query = $mysql->query("SELECT `id`, `name`, `val_1`, `val_2`, `val_3` FROM `zet_product_properties_values` WHERE ".$langg." `property_id`='".$row['id']."'"); ?>
        <?php while($sub_row = $mysql->assoc($sub_query)){ ?>
        <?php if($row['type'] == '1') $title = $sub_row['name']; ?>
        <?php if($row['type'] == '3') $title = $sub_row['val_1']; ?>
        <?php if($row['type'] == '4') $title = WORD_105.' '.$sub_row['val_1'].' '.WORD_106.' '.$sub_row['val_2']; ?>
        <?php if($row['type'] == '5') $title = $sub_row['val_1'].' × '.$sub_row['val_2']; ?>
        <?php if($row['type'] == '6') $title = $sub_row['val_1'].' × '.$sub_row['val_2'].' × '.$sub_row['val_3']; ?>
            <li>
                <input <?php if($_GET['act'] == 'edit') echo (in_array($sub_row['id'], $prop_array[$row['id']])) ? 'checked="checked"' : false; ?> type="checkbox" value="<?php echo $sub_row['id']; ?>" name="check_property_values[<?php echo $row['id']; ?>][]" id="id_<?php echo $row['id'].'_'.$sub_row['id']; ?>" />
                <label for="id_<?php echo $row['id'].'_'.$sub_row['id']; ?>"><span></span> <?php echo $title; ?></label>
            </li>
        <?php } ?><?php } ?>
        </ul>
    </section>
</section>