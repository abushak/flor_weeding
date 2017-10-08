<?php
if ($_POST) {
    $text = '{';
    foreach ($_POST["text"] as $key => $val) {
        $text .= '"'.$key.'":"'.$val.'",';
    }
    $text = substr($text, 0, -1);
    $text .= '}';
    //$text = json_encode($_POST["text"]);
    $mysql->query("UPDATE `zet_chief` SET `text`='".$text."' WHERE `id`='1'");
    
    if ($_FILES["picture"]["name"]) {
        $path = ROOT."files/";
        $name = $_FILES["picture"]["name"];
        copy($_FILES["picture"]["tmp_name"],  $path.$name);
        $mysql->query("UPDATE `zet_chief` SET `photo`='".$name."' WHERE `id`='1'");
    }
}

$query = $mysql->query("SELECT `text`,`photo` FROM `zet_chief` WHERE `id`='1'");
$row = $mysql->assoc($query);
$text = json_decode($row["text"], true);?>


<section class="admin_all_order color">
    <section class="row">
        <section class="admin_count_order"><?php echo WORD_420; ?></section>
        <section class="admin_btn_close"><a class="admin_save" href="#"><?php echo WORD_28; ?></a></section>
    </section>
</section>

<form method="POST" enctype="multipart/form-data" action="<?php echo ADM_SRV."{$route[2]}/{$route[3]}"; ?>">
    <section class="wrap_admin_table">
        <section class="wrap_add">
            <p class="caption"><?php echo FRM_TEXT; ?></p>
            <?php foreach ($langs as $key => $val) { ?>
            <section class="description">
                <label><?php echo $val["code"]; ?></label>
                <input type="text" value="<?php echo $text[$val["code"]]; ?>" name="text[<?php echo $val["code"]; ?>]" />
            </section>
            <?php } ?>
            
            <hr class="desc_line mrg_t" />
            
            <p class="caption"><?php echo WORD_400; ?>:</p>
            <section class="upload w9">
                <input type="file" name="picture" style="visibility: hidden; width: 0px; position: absolute;" id="picture_box" />
                <section class="foto_item">
                    <img src="<?php echo getFile($row["photo"]); ?>" />
                    <a class="admin_btn del_pic_water" href="#"><img src="<?php echo ADM_SKIN; ?>image/del.png" /> <?php echo WORD_38; ?></a>
                </section>
                
                <section class="choose_file">
                    <p><?php echo WORD_400; ?>:</p> <span class="file_name"><?php echo WORD_40; ?> </span><br />
                    <a class="admin_btn upload_pic" href="#"><img src="<?php echo ADM_SKIN; ?>image/upload.png" /> <?php echo WORD_41; ?></a>
                </section>
            </section>
        </section>
    </section>
</form>