<?php $_PagesMain = new PagesMain(); ?>
<?php $page = $_PagesMain->GetPageData($dir); ?>

<?php $_News = new PublicationsNews(); ?>
<?php $news = $_News->GetDescription($route[2]); ?>

<div class="pathway wbody">
    <ul>
        <li><a href="<?php echo SRV_; ?>"><?php echo WORD_54; ?></a></li>
        <li><a href="<?php echo SRV_."news"; ?>"><?php echo $page["title"]; ?></a></li>
        <li><a href="<?php echo SRV_."news/{$route[2]}"; ?>"><?php echo $news["title"]; ?></a></li>
    </ul>
</div>

<div class="about wmin">
    <div class="gallery">
        <input type="radio" name="image" id="image_1" checked="checked" />
        <div style="background-image: url(<?php echo $news["picture"]; ?>)" class="image"></div>
    </div>
    
    <div class="content wbody">
        <h2><?php echo $news["title"]; ?></h2>
        <p><?php echo $news["description"]; ?></p>
    </div>
</div>