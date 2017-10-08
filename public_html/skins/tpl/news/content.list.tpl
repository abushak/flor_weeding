<?php $_PagesMain = new PagesMain(); ?>
<?php $page = $_PagesMain->GetPageData($dir); ?>

<div class="pathway wbody">
    <ul>
        <li><a href="<?php echo SRV_; ?>"><?php echo WORD_54; ?></a></li>
        <li><a href="<?php echo SRV_."news"; ?>"><?php echo $page["title"]; ?></a></li>
    </ul>
</div>

<div class="allnews wmin">
    <div class="wbody content">
        <h2><?php echo $page["meta_h1"]; ?></h2>
        <div class="items"></div>
        
        <div class="actions">
            <div class="pages"></div>
        </div>
    </div>
</div>