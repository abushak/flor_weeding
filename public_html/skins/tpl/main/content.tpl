<!-- SLIDER -->
<?php $_DesignSlide = new DesignSlide(); ?>
<?php $slides = $_DesignSlide->GetSlides(); ?>
<?php $bool = true; ?>
<?php if($slides): ?>
    <div id="slider" class="wmin slider">
        <?php foreach ($slides as $key => $val) { ?>
        <?php include TPL."main/slide.item.tpl"; ?>
        <?php $bool = false; ?>
        <?php } ?>
        <div class="nav">
            <div class="wbody">
                <?php foreach ($slides as $key => $val) { ?>
                <label for="slide_<?php echo $key; ?>"></label>
                <?php } ?>
            </div>
        </div>
    </div>
<?php endif; ?>

<!-- SLIDER END -->

<!-- ABILITIES -->
<?php include TPL."main/abilities.tpl"; ?>
<!-- ABILITIES END -->

<!-- SINGE SLIDE -->
<?php $slides = $_DesignSlide->GetSlides(1); ?>
<div class="wmin slider" style="height: 400px">
    <?php foreach ($slides as $key => $val) { ?>
    <div style="background-image: url(<?php echo FILES."design/{$val['picture']}"; ?>);" class="slide show">
        <div class="wbody half">
            <h4><?php echo $val['title']; ?></h4>
            <p><?php echo $val['text']; ?></p>
            <a href="<?php echo $val['url'] ?>"><?php echo $val['link_text']; ?></a>
        </div>
    </div>
    <?php } ?>
</div>
<!-- SINGE SLIDE END -->

<!-- CATALOG -->
<?php $_CatalogProducts = new CatalogProduct(); ?>
<?php $products = $_CatalogProducts->GetRandomProducts(); ?>
<div class="catalog simple wbody">
    <h1><?php echo WORD_17; ?></h1>
    <div class="items">
        <?php foreach ($products as $key => $val) { ?>
        <?php $new = ($val['new'] == 1) ? " new" : false; ?>
        <?php $hit = ($val['hit'] == 1) ? " hit" : false; ?>
        <?php $sale = ($val['cross_price'] > $val['price']) ? " sale" : false; ?>
        <?php include TPL."common/catalog.item.tpl"; ?>
        <?php } ?>
    </div>
    <a href="<?php echo SRV.HREFLANG."shop/"; ?>"><?php echo WORD_18; ?></a>
</div>
<!-- CATALOG END -->

<!-- REVIEWS -->
<?php $_Comments = new Comment(); ?>
<?php $reviews = $_Comments->GetReviewsStore(1); ?>

<?php $query = $mysql->query("SELECT `text`,`photo` FROM `zet_chief` WHERE `id`='1'"); ?>
<?php $row = $mysql->assoc($query); ?>
<?php $chief = json_decode($row["text"], true); ?>
<?php $chief = explode("|", $chief[LANG]); ?>
<div class="instablock"> 
<div class="instaframe"> 
<iframe src="/inwidget/index.php?width=1000&amp;inline=4&amp;view=12&amp;toolbar=false&amp;preview=large" scrolling="no" frameborder="no" style="border:none;width:1000px;height:835px;overflow:hidden;"></iframe> 
</div> 
</div>
<div class="reviews wmin">
    <div class="wbody">
        <div class="review">
            <a href="<?php echo SRV.HREFLANG."reviews/"; ?>"><?php echo WORD_20; ?> &rarr;</a>
            <h2><?php echo WORD_19; ?></h2>
            <div>
                <?php foreach ($reviews as $key => $val) { ?>
                <div><span><?php echo $val["date"]; ?></span><?php echo $val["name"]; ?></div>
                <p><?php echo $val["text"]; ?></p>
                <?php } ?>
            </div>
        </div>
        <div class="addreview">
            <div class="dama">
                <img src="<?php echo FILES."{$row["photo"]}"; ?>" alt=""/><?php echo $chief[0]; ?><br />
                <span style="font-size: 12px;"><?php echo $chief[1]; ?></span>
            </div>
            <?php include TPL."common/review.form.tpl"; ?>
        </div>
    </div>
</div>
<!-- REVIEWS END -->

<!-- SEO TEXT -->
<?php $_PagesStatic = new PagesStatic(); ?>
<?php $page = $_PagesStatic->GetPageData($dir); ?>
<div class="seotext wbody">
    <h1><?php echo $page['meta_h1']; ?></h1>
    <p><?php echo $page['description']; ?></p>
</div>
<!-- SEO TEXT END -->