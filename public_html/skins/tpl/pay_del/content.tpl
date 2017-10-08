<?php $_PagesMain = new PagesMain(); ?>
<?php $page = $_PagesMain->GetPageData($dir); ?>

<style>.about:before { background: none; }</style>

<div class="pathway wbody">
    <ul>
        <li><a href="<?php echo SRV_; ?>"><?php echo WORD_54; ?></a></li>
        <li><a href="<?php echo SRV_."gifts"; ?>"><?php echo $page["title"]; ?></a></li>
    </ul>
</div>

<div class="about wmin">
    <div class="content wbody">
        <h2><?php echo $page["meta_h1"]; ?></h2>
        <p><?php echo $page["description"]; ?></p>
    </div>
</div>