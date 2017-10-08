<?php $_PagesMain = new PagesMain(); ?>
<?php $page = $_PagesMain->GetPageData($dir); ?>

<?php $files = array(); $i = 1; ?>
<?php $query = $mysql->query("SELECT `picture` FROM `zet_about_gallery` ORDER BY `id` DESC"); ?>
<?php while ($row = $mysql->assoc($query)) { ?>
<?php $files[$i] = $row; $i++; ?>
<?php } ?>

<div class="pathway wbody">
    <ul>
        <li><a href="<?php echo SRV_; ?>"><?php echo WORD_54; ?></a></li>
        <li><a href="<?php echo SRV_."gifts"; ?>"><?php echo $page["title"]; ?></a></li>
    </ul>
</div>

<div class="about wmin">
    <div class="gallery">
        <?php foreach ($files as $key => $val) { ?>
        <?php $last = count($files); ?>
        <?php $prev = ($key == 1) ? $last : $key - 1; ?>
        <?php $next = ($key == $last) ? 1 : $key + 1; ?>
        <input type="radio" name="image" id="image_<?php echo $key; ?>" <?php echo ($key == 1) ? 'checked="checked"': ""; ?> />
        <div style="background-image: url(<?php echo FILES."banner/{$val["picture"]}"; ?>)" class="image">
            <label for="image_<?php echo $next; ?>" rel="next"></label>
            <label for="image_<?php echo $prev; ?>" rel="prev"></label>
        </div>
        <?php } ?>
        
        <div class="labels">
            <?php foreach ($files as $key => $val) { ?>
            <label for="image_<?php echo $key; ?>"></label>
            <?php } ?>
        </div>
    </div>
    
    <div class="content wbody">
        <h2><?php echo $page["meta_h1"]; ?></h2>
        <p><?php echo $page["description"]; ?></p>
    </div>
</div>