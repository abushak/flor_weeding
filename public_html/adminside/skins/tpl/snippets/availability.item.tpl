<li>
    <input type="checkbox" id="box<?php echo $lang_row["id"]; ?>" name="ugroup[]" value="<?php echo $lang_row["id"]; ?>" <?php if(isset($opt)) foreach($opt as $key => $group_id) { echo ($group_id == $lang_row["id"]) ? "checked='checked'" : false; } ?>/>
    <label for="box<?php echo $lang_row["id"]; ?>"><span></span><?php echo $lang_row["name"]; ?></label>
</li>