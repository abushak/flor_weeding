<?php $_PagesMain = new PagesMain(); ?>
<?php $page = $_PagesMain->GetPageData($dir); ?>

<?php $_Partners = new Partners(); ?>
<?php $partners = $_Partners->GetPartnersDescription(); ?>
<div class="pathway wbody">
    <ul>
        <li><a href="<?php echo SRV_; ?>"><?php echo WORD_54; ?></a></li>
        <li><a href="<?php echo SRV_."partners"; ?>"><?php echo $page["title"]; ?></a></li>
    </ul>
</div>

<div class="wbody partners">
    <h2><?php echo $page["meta_h1"]; ?></h2>
    <ul>
        <?php foreach ($partners as $key => $val) { ?>
        <li>
            <a href="<?php echo $val["link"]; ?>" target="_blank"><div style="width: 200px; height: 200px; background-image: url(<?php echo FILES."catalog/brand/{$val["picture"]}"; ?>);background-repeat: no-repeat; background-position: center;"></div></a>
            <a href="<?php echo $val["link"]; ?>" target="_blank"><?php echo $val["title"]; ?></a>
            <p><?php echo $val["text"]; ?></p>
        </li>
        <?php } ?>
    </ul>
    <div style="clear:both"></div>
</div>