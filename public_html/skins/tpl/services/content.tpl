<?php $_PagesStatic = new PagesStatic(); ?>
<?php $page = $_PagesStatic->GetPageData($dir); ?>

<?php $query = $mysql->query("SELECT `file` FROM `zet_pages_static` WHERE `id`='1'"); ?>
<?php $row = $mysql->assoc($query); ?>
<?php $file = FILES."news/{$row['file']}"; ?>

<div class="pathway wbody">
    <ul>
        <li><a href="<?php echo SRV_; ?>"><?php echo WORD_54; ?></a></li>
        <li><a href="<?php echo SRV_."services"; ?>"><?php echo $page['meta_h1']; ?></a></li>
    </ul>
</div>

<div class="company wmin">
    <div class="pred wbody content">
        <?php if (!empty($row['file'])) { ?>
        <a href="<?php echo $file; ?>"><?php echo WORD_62; ?></a>
        <?php } ?>
        <h2><?php echo $page['meta_h1']; ?></h2>
        <p><?php echo $page['description']; ?></p>
    </div>
    <div class="wimages wmin">
        <?php $query = $mysql->query("SELECT `file`,`title`,`description` FROM `zet_pages_static`,`zet_pages_static_description` WHERE `page_id`=`id` AND `language_id`='".$lang_id."' AND `parent`='1'"); ?>
        <?php while ($row = $mysql->assoc($query)) { ?>
        <?php include TPL."common/services.item.tpl" ?>
        <?php } ?>
    </div>
</div>