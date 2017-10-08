<form class="fields review-submit">
    <?php if ($dir == "main") { ?>
    <h2><?php echo WORD_21; ?></h2>        
    <?php } else { ?>
    <h4><?php echo WORD_21; ?></h4>
    <?php } ?>
    <textarea name="review" placeholder="<?php echo WORD_105; ?>" class="review-required"></textarea>
    <input name="name" type="text" placeholder="<?php echo WORD_106; ?>" class="review-required" />
    <button type="submit"><?php echo WORD_22; ?></button>
</form>