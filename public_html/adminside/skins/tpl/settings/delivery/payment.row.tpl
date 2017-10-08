<li>
    <input type="checkbox" value="<?php echo $payment_row["id"]; ?>" name="payment[]" id="pay_box<?php echo $payment_row["id"]; ?>" <?php if(isset($opt_2)) foreach($opt_2 as $key => $pay_id) { echo ($pay_id == $payment_row["id"]) ? "checked='checked'" : false; } ?> />
    <label for="pay_box<?php echo $payment_row["id"]; ?>"><span></span><?php echo $payment_row["title"]; ?></label>
</li>
<br />