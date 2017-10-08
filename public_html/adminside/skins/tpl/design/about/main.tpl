<section class="admin_all_order color">
    <section class="row">
        <section class="admin_count_order"><?php echo WORD_209; ?></section>
        <section class="admin_btn_close"><a class="admin_save" href="#"><?php echo WORD_28; ?></a></section>
    </section>
</section>

<section class="wrap_admin_table">
    <section class="wrap_add">
        <section class="upload w9" id="about-upload">
            <input type="file" multiple="multiple" name="picture" class="about-selector" id="picture_box" style="display: none;" />
            <a href="#" class="admin_btn upload_pic"><img src="<?php echo ADM_SKIN; ?>image/upload.png" /> <?php echo WORD_210; ?></a>
            <?php echo WORD_211; ?>
        </section>
        
        <section class="uploader_progress" style="display: none;">
            <img src="<?php echo ADM_SKIN; ?>image/inprogress.gif" />
        </section>
        
        <form method="POST" action="<?php echo ADM_SRV."design/about/?act=edit" ?>">
            <section class="pictures_form row-fluid">
                <?php $query = $mysql->query("SELECT * FROM `zet_about_gallery` ORDER BY `id` DESC"); ?>
                <?php while($pic_row = $mysql->assoc($query)){ ?>
                <?php include ADM_TPL."design/about/slide.tpl"; ?>
                <?php } ?>
            </section>
        </form>
    </section>
</section>

<script type="text/javascript">
jQuery(function($) {
    $("body").on("dragover", "#about-upload", function(e) {
        e.preventDefault();
        e.stopPropagation();
    });
    
    $("body").on("dragenter", "#about-upload", function(e) {
        e.preventDefault();
        e.stopPropagation();
    });
    
    $("body").on("drop", "#about-upload", function(e) {
        if (e.originalEvent.dataTransfer) {
            if (e.originalEvent.dataTransfer.files.length) {
                e.preventDefault();
                e.stopPropagation();
                UploadFiles(e.originalEvent.dataTransfer.files);
            }
        }
    });
    
    $("body").on("change", ".about-selector", function(e) {
        UploadFiles($(this)[0].files);
    });
    
    $("body").on("click", ".del-about", function(e) {
        e.preventDefault();
        if (confirm(WORD_18)) {
            var id = $(this).attr("data-id");
            
            $.ajax({
                url: ADM_SRV + 'bin/ajax.php',
                type: "POST",
                data: {
                    "function": "del_about",
                    "id": id
                },
                success: function(data) {
                    $("#id_" + id).remove();
                }
            });
        }
    });
    
    function UploadFiles(files) {
        $(".uploader_progress").css("display", "");
        var Data = new FormData();
        Data.append("function", "upload_about");
        for (var i = 0; i < files.length; i++) {
            Data.append("picture[]", files[i]);
        }
        
        $.ajax({
            url: ADM_SRV + 'bin/ajax.php',
            data: Data,
            processData: false,
            contentType: false,
            type: "POST",
            success: function(data) {
                $(".pictures_form").prepend(data);
                $(".uploader_progress").css("display", "none");
            }
        });
    }
})
</script>