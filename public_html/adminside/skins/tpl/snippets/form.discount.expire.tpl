<section class="description">
    <label><?php echo WORD_103; ?>:</label>
    <ul class="checkbox_list st_search_date">
        <input type="text" class="datepicker" name="expire_date" value="<?php echo($params["expire_date"] != "0000-00-00") ? $params["expire_date"] : false; ?>" />
    </ul>
</section>