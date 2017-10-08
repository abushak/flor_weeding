<label><?php echo WORD_325; ?>:</label> <input type="text" name="date_min" id="date_min" value="<?php echo $_GET["date_min"]; ?>" /> - <input type="text" name="date_max" id="date_max" value="<?php echo $_GET["date_max"]; ?>" />
<script type="text/javascript">
jQuery(function($) {
    $("#date_min").datepicker({
        onClose: function(selectedDate) {
            $("#date_max").datepicker("option", "minDate", selectedDate);
        }
    });
    
    $("#date_max").datepicker({
        onClose: function(selectedDate) {
            $("#date_min").datepicker("option", "maxDate", selectedDate);
        }
    });
})
</script>