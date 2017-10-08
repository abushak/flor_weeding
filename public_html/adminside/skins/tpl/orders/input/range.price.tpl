<label><?php echo WORD_324; ?>:</label> <input type="text" name="price_min" id="price_min" value="<?php echo $_GET["price_min"]; ?>" /> - <input type="text" name="price_max" id="price_max" value="<?php echo $_GET["price_max"]; ?>" />
<script type="text/javascript">
jQuery(function($) {
    _range_.init({
        _minSelector: "#price_min",
        _maxSelector: "#price_max"
    });
})
</script>