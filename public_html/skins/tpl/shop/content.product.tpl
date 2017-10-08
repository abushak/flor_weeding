<?php $_Product = new CatalogProduct(); ?>
<?php if (!empty($route[3]) && $_Product->checkProductByUrl($route[3]) == false) redirectTo(SRV_.'404'); ?>
<?php $images = $_Product->GetProductGallery($route[3]); ?>
<?php $description = $_Product->GetProductDescription($route[3]); ?>
<?php $variants = $_Product->GetProductVariants($route[3]); ?>
<?php $next = $_Product->GetNextProduct($route[3]); ?>
<?php $prev = $_Product->GetPreviousProduct($route[3]); ?>

<?php $_StoreSettings = new StoreSettings(); ?>
<?php $delivery = $_StoreSettings->GetDeliveryMethods(); ?>
<?php $_USD = config("usd"); ?>

<div class="pathway wbody">
    <ul>
        <li><a href="<?php echo SRV_; ?>"><?php echo WORD_54; ?></a></li>
        <li><a href="<?php echo SRV_."shop"; ?>"><?php echo WORD_55; ?></a></li>
        <li><a href="<?php echo SRV_."shop/{$route[2]}"; ?>"><?php echo GetCategoryTitle($route[2]); ?></a></li>
        <li><a href="<?php echo SRV_."shop/{$route[2]}/{$route[3]}"; ?>"><?php echo $description['title']; ?></a></li>
    </ul>
</div>

<div class="product wmin" data-price="<?php echo $variants[0]['price']; ?>" data-product-id="<?php echo $variants[0]['id']; ?>">
<div>
    <?php $bool = true; ?>
    <?php foreach ($images as $key => $val) { ?>
    <?php $key += 1; ?>
    <input id="gallery_<?php echo $key; ?>" name="gallery" type="radio" <?php echo ($bool) ? 'checked="checked"' : false; ?> />
    <div style="background-image: url(<?php echo FILES."products/{$val['picture_name']}"; ?>)" class="bg"></div>
    <?php $bool = false; ?>
    <?php } ?>
    <div class="note"><?php echo WORD_71; ?></div>
    <?php if (count($images) == 0) { ?>
    <input id="gallery_1" name="gallery" type="radio" checked="checked" />
    <div style="background-image: url(<?echo SKIN."image/n_photo.jpg"; ?>)" class="bg"></div>  
    <?php } ?>
    
    <div class="wbody">
        <div class="imgsnav">
            <?php foreach ($images as $key => $val) { ?>
            <?php $key += 1; ?>
            <label for="gallery_<?php echo $key; ?>" style="background-image: url(<?php echo FILES."products/{$val['picture_name']}"; ?>)"></label>
            <?php } ?>
        </div>
        
        <div class="panel">
            <div class="base show">
                <a rel="next" href="<?php echo SRV_."shop/{$next["category"]}/{$next["url"]}"; ?>"></a>
                <a rel="prev" href="<?php echo SRV_."shop/{$prev["category"]}/{$prev["url"]}"; ?>"></a>
                <div class="top">
                    <div class="desc">
                        <div>
                            <h1><?php echo $description['title']; ?></h1>
 <script type="text/javascript" src="//yastatic.net/es5-shims/0.0.2/es5-shims.min.js" charset="utf-8"></script>
                <script type="text/javascript" src="//yastatic.net/share2/share.js" charset="utf-8"></script>
                 <div class=shara align="center"><div class="ya-share2" data-services="vkontakte,facebook,gplus,twitter" data-counter="" data-image="(<?php echo FILES."products/{$val['picture_name']}"; ?>)"></div>
                      </div>
                            <?php echo $description['description']; ?>
                        </div>
                    </div>
                    <div class="other"><span><?php echo WORD_116; ?></span>
                        <ul>
                            <?php foreach ($variants as $key => $val) { ?>
                            <?php $class = ($key == 0) ? "s active" : (($key == 1) ? "m" : "l"); ?>
                            <li class="size-selector <?php echo $class ?>" data-option-id="<?php echo $val['option_id']; ?>">
                                <a rel="size" data-price="<?php echo $val['price']; ?>"><?php echo $val['name']; ?></a>
                                <?php $pt = ($key == 0) ? "s" : (($key == 1) ? "m" : "l"); ?>
                                <?php if (!empty($description["product_t{$pt}"])) { ?>
                                <div><?php echo $description["product_t{$pt}"]; ?></div>
                                <?php } ?>
                            </li>
                            <?php } ?>
                        </ul>
                        <div class="price">
                            <div>
                                <span id="item-price"><?php echo $variants[0]['price']; ?></span> <?php echo $site_currency['abbr']; ?>
                            </div>
                        </div>
                        <div class="prices">
                            <span class="summary"></span>
                            <span class="euro"><?php echo "$".intval($variants[0]['price'] / $_USD); ?></span>
                        </div>
                        <div style="clear: both"></div>
                        <div class="count count_widget">
                            <span>шт.</span>
                            <div><a rel="inc"></a></div>
                            <input type="text" readonly="readonly" value="1" id="quantity" />
                            <div><a rel="dec" class="dec"></a></div>
                        </div>
                        <a rel="buy"><?php echo WORD_34; ?></a>
                        <div style="clear: both"></div>
                        <a></a>
                        <a rel="order"><?php echo WORD_35; ?></a>
                    </div>
                </div>
                <div class="bottom"><?php echo WORD_33; ?> <?php echo $delivery[1]['free_from']; ?> <?php echo $site_currency['abbr']; ?></div>
            </div>
            
            <div class="incart">
                <div class="top">
                    <h2><?php echo $description['title']; ?></h2>
                    <div class="circle"></div>
                    <p><?php echo WORD_36; ?></p>
                    <a rel="checkout" href="<?php echo SRV_."cart"; ?>"><?php echo WORD_37; ?></a>
                    <a rel="unbuy" class="button"><?php echo WORD_38; ?></a>
                </div>
                <div class="bottom"><?php echo WORD_33; ?> <?php echo $delivery[1]['free_from']; ?> <?php echo $site_currency['abbr']; ?></div>
            </div>
            
            <div class="form">
                <div class="top">
                    <h2><?php echo $description['title']; ?></h2>
                    <input type="text" class="fast-required" id="fast-name" placeholder="<?php echo WORD_39; ?>" />
                    <input type="text" class="fast-required phone-mask" id="fast-phone" placeholder="<?php echo WORD_40; ?>" />
                    <textarea id="fast-comment" placeholder="<?php echo WORD_41; ?>"></textarea>
                    <a rel="checkout2"><?php echo WORD_37; ?></a>
                    <a rel="cancel" class="button"><?php echo WORD_42; ?></a>
                </div>
                <div class="bottom"><?php echo WORD_33; ?> <?php echo $delivery[1]['free_from']; ?> <?php echo $site_currency['abbr']; ?></div>
            </div>
            
            <div class="done">
                <div class="top">
                    <h2><?php echo $description['title']; ?></h2>
                    <div class="circle"></div>
                    <p><?php echo WORD_43; ?></p>
                    <span><?php echo WORD_44; ?></span>
                    <a rel="close" class="button"><?php echo WORD_45; ?></a>
                </div>
                <div class="bottom"><?php echo WORD_33; ?> <?php echo $delivery[1]['free_from']; ?> <?php echo $site_currency['abbr']; ?></div>
            </div>
        </div>
    </div>
</div>
</div>

<?php include TPL."common/additional.tpl"; ?>
<?php include TPL."common/gifts.tpl"; ?>