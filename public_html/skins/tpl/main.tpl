<label for="popup_none">
    <?php if ($dir != '404') { ?>
    <?php include TPL."content.header.tpl"; ?>
    <?php } ?>
    <?php include TPL."{$dir}/content.tpl"; ?>
    <?php if ($dir != '404') { ?>
    <?php include TPL."content.footer.tpl"; ?>
    <?php } ?>
</label>