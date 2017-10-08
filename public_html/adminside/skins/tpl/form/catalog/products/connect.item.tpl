<section class="c_item" data-id="<?php echo $row['id']; ?>">
    <section class="foto_item">
        <img src="<?php echo FILES."products/{$row['picture']}"; ?>" />
        <a href="#" class="admin_btn connect-item-del"><img src="<?php echo ADM_SKIN; ?>image/del.png" /> <?php echo WORD_38; ?></a>
    </section>
    
    <a href="#"><?php echo $row['title']; ?></a>
    <p class="c_price"><?php echo $row['price']; ?> <?php echo $site_currency['abbr']; ?></p>
</section>