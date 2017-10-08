<section class="description">
    <label><?php echo WORD_227; ?>: <?php include_once TIPS.'sitename.tpl'; ?></label>
    <ul class="checkbox_list">
        <li>
            <input type="checkbox" id="on_page" name="on_page" <?php echo ($params['on_page'] == '1') ? 'checked="checked"' : false; ?> />
            <label for="on_page"><span></span></label>
        </li>
    </ul>
</section>

<section class="description">
    <label><?php echo WORD_228; ?>: <?php include_once TIPS.'url.tpl'; ?></label>
    <ul class="checkbox_list">
        <li>
            <input type="checkbox" id="as_filter" name="as_filter" <?php echo ($params['as_filter'] == '1') ? 'checked="checked"' : false; ?> />
            <label for="as_filter" id="as_filter_l"><span></span></label>
        </li>
    </ul>
</section>