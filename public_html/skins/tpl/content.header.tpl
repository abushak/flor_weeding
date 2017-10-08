<div id="nav">
    <div class="wbody">
        
        <div>
            <label for="search_trigger" id="search-button"></label>
            <div class="lang">
                <ul>
                    <?php $links = $route; ?>
                    <?php $query = $mysql->query("SELECT `code` FROM `zet_language` WHERE `id`='".$lang_id."'"); ?>
                    <?php while($row = $mysql->assoc($query)){ ?>
                    <?php $links[0] = $row['code']; ?>
                    <?php $links = array_del_empty($links); ?>
                    <?php $url = implode('/', $links); ?>
                    <li class="active"><a href="<?php echo SRV.$url; ?>"><?php echo $row['code']; ?></a></li>
                    <?php } ?>
                    <?php $query = $mysql->query("SELECT `code` FROM `zet_language` WHERE `id`<>'".$lang_id."' ORDER BY `id` ASC"); ?>
                    <?php while($row = $mysql->assoc($query)){ ?>
                    <?php $links[0] = $row['code']; ?>
                    <?php $links = array_del_empty($links); ?>
                    <?php $url = implode('/', $links); ?>
                    <li><a href="<?php echo SRV.$url; ?>"><?php echo $row['code']; ?></a></li>
                    <?php } ?>
                </ul>
            </div>
            <input type="checkbox" id="search_trigger" />
            <form class="soc" id="search-form" action="<?php echo SRV_."search/"; ?>">
                <a rel="fb" href="<?php echo config("social_fb"); ?>" target="_blank"></a>
                <a rel="gp" href="<?php echo config("social_ins"); ?>" target="_blank"></a>
                <a rel="vk" href="<?php echo config("social_vk"); ?>" target="_blank"></a>
                <input type="search" placeholder="<?php echo WORD_47; ?>" id="search-input" name="q">
            </form>
        </div>
        
        <ul>
            <?php $query = $mysql->query("SELECT `url`,`title` FROM `zet_pages`,`zet_pages_description` WHERE `page_id`=`id` AND `language_id`='".$lang_id."' AND `status`='1' ORDER BY `priority` ASC"); ?>
            <?php while($row = $mysql->assoc($query)){ ?>
            <li <?php echo ($dir == $row['url']) ? 'class="active"' : false; ?>><a href="<?php echo SRV_."{$row['url']}"; ?>"><?php echo $row['title']; ?></a></li>
            <?php } ?>
        </ul>
    </div>
</div>
<div id="header" class="wbody">
    <?php $callback_id = 1; ?>
    <?php include TPL."common/callback.tpl"; ?>
    <div class="cart">
        <a href="<?php echo SRV_."cart"; ?>" class="count"><?php echo $_Cart->ItemsInCart($__session); ?></a>
        <a href="<?php echo SRV_."cart"; ?>" class="caption <?php echo ($dir == "cart") ? "active": false; ?>" <?php echo ($dir != "cart") ? (($_Cart->ItemsInCart($__session) > 0) ? 'style="text-decoration: underline;"' : false) : false; ?>><?php echo WORD_46; ?></a>


    <div class="autho">
        <a href="<?php echo SRV_."auth"; ?>" class="key"></a>
        <a href="<?php echo ($_SESSION['username']===null) ? (SRV_.'auth') : (SRV_.'profile') ?>" class="caption <?php echo ($dir == "auth") ? "active": false; ?>"><?php echo ($_SESSION['username']!=null) ? ($_SESSION['username']) : (Вход) ?></a>
    </div>


    </div>
    <a href="<?php echo SRV_; ?>"></a>
    <!-- <span><?php echo WORD_131; ?></span> -->
</div>
<div class="menu wmin">
    <div class="nav">
        <?php $query = $mysql->query("SELECT `url`,`title` FROM `zet_pages_static`,`zet_pages_static_description` WHERE `page_id`=`id` AND `language_id`='".$lang_id."' AND `status`='1' AND `parent`='0' ORDER BY `priority` ASC"); ?>
        <?php while($row = $mysql->assoc($query)){ ?>
        <a <?php echo ($dir == $row['url']) ? 'class="active"' : false; ?> <?php echo ($row['url'] == "shop") ? 'style="color: #D080A3; font-weight: 500;"' : false; ?> href="<?php echo SRV_."{$row['url']}"; ?>"><?php echo $row['title']; ?></a>
        <?php } ?>
    

</div>
</div>
        