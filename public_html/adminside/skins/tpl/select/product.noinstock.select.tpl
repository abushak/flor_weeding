<section class="description">
    <label><?php echo WORD_268; ?>: <?php include TIPS.'url.tpl'; ?></label>
    <select name="no_instock_action">
        <option <?php echo ($params['no_instock_action'] == '0') ? 'selected="selected"' : false; ?> value="0"><?php echo WORD_269; ?></option>
        <option <?php echo ($params['no_instock_action'] == '1') ? 'selected="selected"' : false; ?> value="1"><?php echo WORD_270; ?></option>
    </select>
</section>