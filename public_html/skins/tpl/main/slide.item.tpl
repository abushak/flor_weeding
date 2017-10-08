<input type="radio" id="slide_<?php echo $key; ?>" <?php echo ($bool) ? 'checked="checked"' : false; ?> name="slider">
<div style="background-image: url(<?php echo FILES."design/{$val['picture']}"; ?>)" class="slide">
    <div class="wbody">
        <h4><?php echo $val['title']; ?></h4>
        <p><?php echo $val['text']; ?></p>
        <a href="<?php echo $val['url'] ?>"><?php echo $val['link_text']; ?></a>
    </div>
</div>