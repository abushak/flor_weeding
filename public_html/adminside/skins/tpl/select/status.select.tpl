<?php
if($_GET['act'] == 'edit' || $_POST['func'] == 'get.order.info' || $_POST['function'] == 'get.order.info.box'){
    $_order_id = $params['id'];
    $_id = (empty($params['status'])) ? 1 : $params['status'];
} else {
    $_order_id = $row['id'];
    $_id = (empty($row['status'])) ? 1 : $row['status'];
} ?>

<?php echo (($route[2] == 'orders' && !$_GET['act']) || ($route[2] == 'userlist' && !$_GET['view']) || (empty($route[2]) || $route[2] == 'main')) ? false : WORD_24.':'; ?> <a href="#" class="order_status" id="order_status_<?php echo $_order_id; ?>">
<span id="order_status_name_<?php echo $_order_id; ?>"></span> <i class="arrow_triangle-down"></i></a>
<section class="wrap_action_list">
    <ul class="action_list" id="action_list_<?php echo $_order_id; ?>" data-id="<?php echo $_id; ?>" data-order-id="<?php echo $_order_id; ?>">
        <li><a class="order_status_link" data-value="1" data-class="new" href="#"><?php echo WORD_326; ?></a></li>
        <li><a class="order_status_link" data-value="2" data-class="dealing" href="#"><?php echo WORD_309; ?></a></li>
        <li>
            <a class="order_status_link" data-value="3" data-class="sending" href="#"><?php echo WORD_327; ?></a><br />
            <input class="order-send npn-val" type="text" placeholder="<?php echo WORD_368; ?>" style="width: 100%; margin-top: 10px; display: none;" />
            <input class="order-send update-npn" type="button" value="<?php echo WORD_28; ?>" style="width: 100%; margin-top: 10px; display: none;" />
        </li>
        
        <hr class="action_line" />
        <li><a class="order_status_link" data-value="4" data-class="ok" href="#"><?php echo WORD_328; ?></a></li>
        <li><a class="order_status_link" data-value="5" data-class="cancel" href="#"><?php echo WORD_329; ?></a></li>
        <li><a class="order_status_link" data-value="6" data-class="cancel" href="#"><?php echo WORD_330; ?></a></li>
        <a class="close close-list" href="#"><i class="icon_close"></i></a>
    </ul>
</section>
<input type="hidden" data-id="<?php echo $_order_id; ?>" class="order_status_" name="order_status_value" value="<?php echo $_id; ?>" />

<script>
$(function(){
    $('.order_status_').each(function(){
        var order_status_value = $(this),
            id = order_status_value.attr('data-id'),
            _html = $('#action_list_' + id + ' .order_status_link[data-value=' + order_status_value.val() + ']').html(),
            _class = $('#action_list_' + id + ' .order_status_link[data-value=' + order_status_value.val() + ']').attr('data-class');
        
        $('#order_status_name_' + id).html(_html);
        $('#order_status_' + id).addClass(_class);
    });
    
    $('body').on('click', '.order_status_link', function(){
        var _id = $(this).parents('ul').attr('data-id'),
            _order_id = $(this).parents('ul').attr('data-order-id'),
            status_id = $(this).attr('data-value'),
            status_class = $(this).attr('data-class'),
            status_name = $(this).html();
        
        $('#order_status_' + _order_id).removeClass("new dealing sending ok cancel");
        $('#order_status_' + _order_id).addClass(status_class);
        $('#order_status_name_' + _order_id).html(status_name);
        $('.order_status_[data-id=' + _order_id + ']').val(status_id);
        
        if(Number(status_id) == 3){
            $('.order-send').fadeIn();
        } else {
            $(this).parents('ul').css('display', 'none');
        }
        
        UpdateOrderStatus(_order_id, status_id);
        return false;
    });
    
    $('body').on('click', '.close-list', function(){
        $(this).parents('ul').css('display', 'none');
        return false;
    });
    
    $('body').on('click', '.update-npn', function(){
        var _Data = new FormData(),
            _ttn = $(this).parents('li').children('.npn-val').val(),
            _order_id = $(this).parents('ul').attr('data-order-id');
        
        _Data.append('function', 'order.update.ttn');
        _Data.append('order_id', _order_id);
        _Data.append('ttn', _ttn);
        ajaxSendPostAsync(_Data);
        
        $('.order-send').css('display', 'none');
        $(this).parents('ul').css('display', 'none');
        return false;
    });
    
    function UpdateOrderStatus(_order_id, _status_id){
        var _Data = new FormData();
        
        _Data.append('function', 'order.update.status');
        _Data.append('order_id', _order_id);
        _Data.append('status_id', _status_id);
        ajaxSendPostAsync(_Data);
    }
});
</script>