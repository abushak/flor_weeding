<section class="admin_all_order">
    <section class="row">
        <section class="admin_count_order"><?php echo WORD_403; ?></section>
        <section class="span3"><a href="<?php echo ADM_SRV."{$route[2]}/{$route[3]}/?act=add"; ?>" class="add_order">+ <?php echo WORD_231; ?></a></section>
        <section class="admin_btn_close"><a class="admin_btn del_all" href="#">x <?php echo WORD_18; ?></a></section>
        <section class="admin_btn_close">
            <a class="admin_btn admin_btn_list" href="#"><?php echo WORD_19; ?></a>
            <section class="wrap_action_list">
                <ul class="action_list">
                    <li><a href="#" class="visible_all"><?php echo WORD_20; ?></a></li>
                    <li><a href="#" class="disable_all"><?php echo WORD_21; ?></a></li>
                    <li><a href="#" class="copy_all"><?php echo WORD_235; ?></a></li>
                    <a class="close" href="#"><i class="icon_close"></i></a>
                </ul>
            </section>
        </section>
    </section>
</section>

<section class="wrap_admin_table">
    <div class="div_table">
        <?php include ADM_TPL."catalog/additional/caption.row.tpl"; ?>
        <?php $query = $catalog_product->FLOR_GetProducts($_GET, $site_language['id'], 1); ?>
        <?php while($row = $mysql->assoc($query)){ ?>
        <?php include ADM_TPL."catalog/additional/row.multi.tpl"; ?>
        <?php } ?>
    </div>
</section>

<script type="text/javascript">
jQuery(function($) {
    $('.div_table').on('change', '.live-input', function() {
        var _table = 'product_option',
            _column = $(this).attr('data-name'),
            _val = $(this).val(),
            _product = parseFloat($(this).parent('li').attr('data-product-id')),
            _option = parseFloat($(this).parent('li').attr('data-option-id'));
        liveUpdateProduct(_table, _column, _val, _product, _option);
    });
    
    $('.div_table').on('click', '.product-status', function() {
        changeStatus($(this), false);
        return false;
    });
    
    $('.visible_all').on('click', function() {
        $('.checkbox_list input:checkbox:checked').each(function() {
            var _element = $(this).parents('.product-item').find('.sub-status');
            changeStatus(_element, true);
        });
        return false;
    });
    
    $('.disable_all').on('click', function() {
        $('.checkbox_list input:checkbox:checked').each(function() {
            var _element = $(this).parents('.product-item').find('.sub-status');
            changeStatus(_element, true, true);
        });
        return false;
    });
    
    $('.copy_all').on('click', function() {
        var _Products = [],
            _Data = new FormData();
        
        $('.checkbox_list input:checkbox:checked').each(function() {
            _Products.push($(this).parents('.product-item').attr('data-product-id'));
        });
        
        _Data.append('function', 'product.copy');
        _Data.append('products', _Products);
        ajaxSendPost(_Data);
        location.reload();
        return false;
    });
})

function changeStatus(selector, _allItems, _disable) {
    var _Data = new FormData(),
        _product = selector.parents('.product-item').attr('data-product-id'),
        _column = selector.attr('data-name'),
        _val = parseFloat(selector.attr('data-value'));
    
    if (_allItems) {
        if (selector.hasClass('sub-status')) {
            if (_disable) {
                selector.addClass('disable').removeClass('active');
                _val = 0;
            } else {
                selector.addClass('active').removeClass('disable');
                _val = 1;
            }
        } else {
            _val = 1;
            selector.addClass('disable');
        }
    } else {
        selector.toggleClass('active');
        selector.toggleClass('disable');
        _val = (_val == 1) ? 0 : 1;
    }
    selector.attr('data-value', _val);
    
    _Data.append('function', 'product.status');
    _Data.append('product_id', _product);
    _Data.append('column', _column);
    _Data.append('value', _val);
    ajaxSendPost(_Data);
}

function liveUpdateProduct(_table, _column, _val, _product, _option) {
    var _Data = new FormData();
    
    _Data.append('function', 'live.update');
    _Data.append('table', _table);
    _Data.append('column', _column);
    _Data.append('value', _val);
    _Data.append('product', _product);
    _Data.append('option', _option);
    
    ajaxSendPost(_Data);
}
</script>