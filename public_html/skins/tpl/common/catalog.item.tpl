<?php $picture = (empty($val['picture'])) ? SKIN."image/n_photo_mal.jpg" : FILES."products/{$val['picture']}"; ?>
<div id="<?php echo $val['key']; ?>" class="item<?php echo $new.$hit.$sale; ?> unvisible" data-url="<?php echo $val['url']; ?>">
    <div >
        <div class="img">
            <a href="<?php echo SRV.HREFLANG."cart/"; ?>"></a>
            <div><a href="<?php echo SRV.HREFLANG."shop/{$val['category']}/{$val['url']}"; ?>" style="background-image: url(<?php echo $picture; ?>);"></a></div>
        </div>
        <a href="<?php echo SRV.HREFLANG."shop/{$val['category']}/{$val['url']}"; ?>"><?php echo $val['title']; ?></a>
        <div class="hr"></div>
        <span><?php echo $val['price']; ?> грн<div><a href="<?php echo SRV.HREFLANG."shop/{$val['category']}/{$val['url']}"; ?>" >Купить</a></div></span>
    </div>
</div>