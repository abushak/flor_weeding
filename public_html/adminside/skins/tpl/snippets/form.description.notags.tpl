<table class="add">
    <thead>
        <tr class="choose_lang">
            <td></td>
            <td> <?php include ADM_ROOT.'modules/snippets/lang.list.php'; ?> </td>
        </tr>
    </thead>
    <?php include ADM_ROOT.'modules/snippets/lang.body.list.no.php'; ?>    
</table>

<script>
    CKEDITOR.config.width = '98%';
    CKEDITOR.config.height = '250px';
    CKFinder.setupCKEditor(null, "<?php echo ADM_SRV.'modules/ckfinder/'; ?>");
</script>