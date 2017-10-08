<?php $_status = (empty($row['status'])) ? 1 : $row['status']; ?>
<?php $_id = $row['id']; ?>
<a href="#" class="order_status" id="order_status_<?php echo $_id; ?>"><span id="order_status_name_<?php echo $_id; ?>"></span> <i class="arrow_triangle-down"></i></a>
<section class="wrap_action_list">
    <ul class="action_list" id="action_list_<?php echo $_id; ?>" data-id="<?php echo $_id; ?>">
        <li><a class="order_status_link" data-value="1" data-class="new" href="#"><?php echo WORD_326; ?></a></li>
        <li><a class="order_status_link" data-value="2" data-class="dealing" href="#"><?php echo WORD_309; ?></a></li>
        <li><a class="order_status_link" data-value="3" data-class="sending" href="#"><?php echo WORD_327; ?></a></li>
        <hr class="action_line" />
        <li><a class="order_status_link" data-value="4" data-class="ok" href="#"><?php echo WORD_328; ?></a></li>
        <li><a class="order_status_link" data-value="5" data-class="" href="#"><?php echo WORD_329; ?></a></li>
        <li><a class="order_status_link" data-value="6" data-class="" href="#"><?php echo WORD_330; ?></a></li>
        <a class="close" href="#"><i class="icon_close"></i></a>
    </ul>
</section>
<input type="hidden" data-id="<?php echo $_id; ?>" class="order_status_" name="order_status_value" value="<?php echo $_status; ?>" />

<script>
$(function(){
    $('.order_status_').each(function(){
        var order_status_value = $(this),
            id = order_status_value.attr('data-id');
        $('#order_status_name_' + id).html($('#action_list_' + id + ' .order_status_link[data-value=' + order_status_value.val() + ']').html());
        $('#order_status_' + id).addClass($('#action_list_' + id + ' .order_status_link[data-value=' + order_status_value.val() + ']').attr('data-class'));
    });
    
    $('.order_status_link').click(function(){
        var _id = $(this).parent('li').parent('ul').attr('data-id');
        var status_id = $(this).attr('data-value');
        var status_class = $(this).attr('data-class');
        var status_name = $(this).html();
        $('#order_status_' + _id).removeClass("new dealing sending ok");
        $('#order_status_' + _id).addClass(status_class);
        $('#order_status_name_' + _id).html(status_name);
        $('.order_status_[data-id=' + _id + ']').val(status_id);
        $(this).parent('li').parent('ul').css('display', 'none');
        return false;
    });
});
</script>