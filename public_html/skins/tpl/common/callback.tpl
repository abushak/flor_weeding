<div class="phone">
    <span><a href="tel:+380930008803" itemprop = "telephone">093 000-88-03</a></span>
    <label for="popup_phone<?php echo $callback_id; ?>" class="label"><?php echo WORD_2; ?></label>
    <input type="radio" name="popup" id="popup_phone<?php echo $callback_id; ?>"/>
    <label for="popup_phone<?php echo $callback_id; ?>" class="box popup_phone_">
        <span><?php echo WORD_3; ?></span>
        <input type="text" name="phone" class="phone-mask callback-phone callback-required" placeholder="<?php echo WORD_4; ?>"/>
        <label for="popup_phone_done<?php echo $callback_id; ?>" class="callback-button"><?php echo WORD_5; ?></label>
        <label for="popup_none" class="no"><?php echo WORD_6; ?></label>
    </label>
    <input id="popup_phone_done<?php echo $callback_id; ?>" class="popup_phone_done_" name="popup" type="radio"/>
    <label for="popup_phone_done<?php echo $callback_id; ?>" class="box">
        <span><?php echo WORD_7; ?></span>
        <label for="popup_none" class="no"><?php echo WORD_45; ?></label>
    </label>
	
</div>
