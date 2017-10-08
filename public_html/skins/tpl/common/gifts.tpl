<?php $_StoreSettings = new StoreSettings(); ?>
<?php $delivery = $_StoreSettings->GetDeliveryMethods(); ?>
<div class="gifts wmin">
    <div class="img"></div>
    <div class="wbody">
        <!-- <div class="left"><a href="<?php echo SRV_."gifts/"; ?>"><span><?php echo WORD_31; ?></span></a></div> -->
        <div class="right">
            <div>
                <img src="<?php echo SKIN; ?>image/abil4.png" alt="<?php echo WORD_30; ?>">
                 <h2><?php echo WORD_30; ?> — <?php echo $delivery[1]['price']; ?> <?php echo $site_currency['abbr']; ?></h2>
                <p><?php echo WORD_29; ?> <?php echo $delivery[1]['free_from']; ?> <?php echo $site_currency['abbr']; ?></p>
            </div>
            <div>
                <img src="<?php echo SKIN; ?>image/abil5.png" alt="<?php echo WORD_27; ?>">
                <h2><?php echo WORD_27; ?></h2>
                <p><?php echo WORD_28; ?></p>
            </div>
            <div>
                <img src="<?php echo SKIN; ?>image/abil6.png" alt="<?php echo WORD_25; ?>">
                <h2><?php echo WORD_25; ?></h2>
                <p><?php echo WORD_26; ?></p>
            </div>
        </div>
    </div>
</div>