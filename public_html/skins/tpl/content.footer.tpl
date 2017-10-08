<div class="footer">
    <div class="wbody">
        <div class="left">
            <ul>
                <?php $query = $mysql->query("SELECT `url`,`title` FROM `zet_pages`,`zet_pages_description` WHERE `page_id`=`id` AND `language_id`='".$lang_id."' AND `status`='1' ORDER BY `priority` ASC LIMIT 0,3"); ?>
                <?php while($row = $mysql->assoc($query)){ ?>
                <li <?php echo ($dir == $row['url']) ? 'class="active"' : false; ?>><a href="<?php echo SRV_."{$row['url']}"; ?>"><?php echo $row['title']; ?></a></li>
                <?php } ?>
            </ul>
            <?php $callback_id = 2; ?>
            <?php include TPL."common/callback.tpl"; ?>
        </div>
        <div class="right">
            <ul>
                <?php $query = $mysql->query("SELECT `url`,`title` FROM `zet_pages`,`zet_pages_description` WHERE `page_id`=`id` AND `language_id`='".$lang_id."' AND `status`='1' ORDER BY `priority` ASC LIMIT 3,3"); ?>
                <?php while($row = $mysql->assoc($query)){ ?>
                <li <?php echo ($dir == $row['url']) ? 'class="active"' : false; ?>><a href="<?php echo SRV_."{$row['url']}"; ?>"><?php echo $row['title']; ?></a></li>
                <?php } ?>
            </ul>
            <div>
                <?php echo WORD_107; ?>
                <label for="popup_map"><?php echo WORD_108; ?></label>
            </div>
        </div>
        <div class="social">
            <div class="copy">&copy; <?php echo (date('Y') > "2014") ? "2014 - ".date('Y') : "2014"; ?> <?php echo WORD_8; ?></div>
        </div>
    </div>
</div>
<div class="wbody visa" style="text-align: center; padding-top: 26px;">
    <span style="color: #E2E2E2; font-size: 6px; cursor: auto;"><?php echo WORD_118; ?></span>
</div>

<input name="popup" id="popup_map" type="radio" />
<div class="mappopup">
    <label for="popup_map" id="mapcontainer" class="wbody">
        <label for="popup_none"></label>
    </label>
</div>
<div id="z"><a href="http://zaycevstudio.com/" target="_blank" style="background: url(<?php echo SKIN."image/z.jpg"; ?>) no-repeat;"></a></div>