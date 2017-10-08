<section class="show_item">
    <section class="span4">
        <?php echo WORD_12; ?>:
        <select id="category_id_select">
            <option value="0"><?php echo WORD_283; ?> (<?php echo $catalog_product->count(); ?>)</option>
            <?php $query = $mysql->query("SELECT `id`,(SELECT `title` FROM `zet_category_description` WHERE `language_id`='".$site_language['id']."' AND `category_id`=`zet_category`.`id`) AS `title`, (SELECT COUNT(*) FROM `zet_product_to_category` WHERE `category_id`=`zet_category`.`id`) AS `products` FROM `zet_category` WHERE `static`='0' ORDER BY `priority` ASC"); ?>
            <?php while($res = $mysql->assoc($query)){ ?>
            <option value="<?php echo $res["id"]; ?>" <?php echo ($_GET['category_id'] == $res['id']) ? 'selected="selected"' : ""; ?>><?php echo $res['title']; ?> <?php echo ($res['products'] != 0) ? '('.$res['products'].')' : ""; ?></option>
            <?php } ?>
        </select>
    </section>
    
    <!-- <section class="span4">
        Показовать по:
        <select>
            <option>10</option>
            <option>20</option>
            <option>30</option>
        </select>
    </section> -->
</section>

<section class="admin_all_order">
    <section class="row">
        <section class="admin_count_order"><?php echo WORD_230; ?>: <?php echo $catalog_product->count(); ?></a></section>
        <section class="span3"><a href="<?php echo ADM_SRV.routesToLink(3, 2).'?act=add' ?>" class="add_order">+ <?php echo WORD_231; ?></a></section>
        <section class="admin_btn_close"><a class="admin_btn del_all" href="#">x <?php echo WORD_18; ?></a></section>
        <section class="admin_btn_close">
            <a class="admin_btn admin_btn_list" href="#"><?php echo WORD_19; ?></a>
            <section class="wrap_action_list">
                <ul class="action_list">
                    <li><a href="#" class="hit_all"><?php echo WORD_232; ?></a></li>
                    <li><a href="#" class="new_all"><?php echo WORD_233; ?></a></li>
                    <li><a href="#" class="visible_all"><?php echo WORD_20; ?></a></li>
                    <li><a href="#" class="disable_all"><?php echo WORD_21; ?></a></li>
                    <li><a href="#" class="recommended_all"><?php echo WORD_234; ?></a></li>
                    <li><a href="#" class="copy_all"><?php echo WORD_235; ?></a></li>
                    <li>
                        <a href="#" class="category_all"><?php echo WORD_237; ?></a>
                        <select id="change-category-id" style="width:115px;display:none;margin-top:10px;margin-bottom:-5px;">
                            <option value="0"><?php echo WORD_266; ?></option>
                            <?php $query = $mysql->query("SELECT `id`,`parent_category`,(SELECT `title` FROM `zet_category_description` WHERE `language_id`='".$site_language['id']."' AND `category_id`=`zet_category`.`id`) AS `title` FROM `zet_category` ORDER BY `priority` ASC"); ?>
                            <?php while($res = $mysql->assoc($query)){ ?>
                            <option <?php echo ($res['parent_category'] == 0) ? 'disabled="disabled"' : false; ?> value="<?php echo $res['id']; ?>"><?php echo ($res['parent_category'] == 0) ? $res['title'] : '  --'.$res['title']; ?></option>
                            <?php } ?>
                        </select>
                    </li>
                    <a class="close" href="#"><i class="icon_close"></i></a>
                </ul>
            </section>
        </section>
    </section>
</section>

<section class="wrap_admin_table">
    <div class="div_table">
        <?php include ADM_TPL."catalog/products/caption.row.tpl"; ?>
        <?php include ADM_TPL."catalog/products/search.row.tpl"; ?>
        <?php $_Products = $catalog_product->GetProducts($_GET); ?>
        <?php foreach ($_Products as $key => $val) { ?>
        <?php $row = $val; ?>
        <?php include ADM_TPL."catalog/products/row.multi.tpl"; ?>
        <?php } ?>
        <?php //$query = $catalog_product->FLOR_GetProducts($_GET, $site_language['id']); ?>
        <?php //while($row = $mysql->assoc($query)){ ?>
        <?php //include ADM_TPL."catalog/products/row.multi.tpl"; ?>
        <?php //} ?>
    </div>
</section>

<ul class="admin_page_nav">
    <?php echo $catalog_product->Paginate($_GET); ?>
</ul>

<script type="text/javascript">
jQuery(function($) {
    $("body").on("change", "#category_id_select", function() {
        var CategoryId = $("option:selected", this).val();
        $("#category_id_input").val(CategoryId);
        $("#catalog-search-form").submit();
    });
        
        
        $('.variant-list-button').click(function(){
            $(this).toggleClass("show-list");
            if($(this).hasClass("show-list")) $(this).parent('.variants').children('.hidden-variants').css('display', 'block');
            else $(this).parent('.variants').children('.hidden-variants').css('display', 'none');
            return false;
        });

        $('.select-redirect').on('change', function(){
            location.replace($(this).val());
        });

        $('.div_table').on('change', '.live-input', function(){
            var _table = 'product_option',
                _column = $(this).attr('data-name'),
                _val = $(this).val(),
                _product = parseFloat($(this).parent('li').attr('data-product-id')),
                _option = parseFloat($(this).parent('li').attr('data-option-id'));
            liveUpdateProduct(_table, _column, _val, _product, _option);
        });

        $('.div_table').on('click', '.product-status', function(){
            changeStatus($(this), false);
            return false;
        });

        $('.hit_all').on('click', function(){
            $('.checkbox_list input:checkbox:checked').each(function(){
                var _element = $(this).parents('.product-item').find('.sub-hit');
                changeStatus(_element, true);
            });
            return false;
        });

        $('.new_all').on('click', function(){
            $('.checkbox_list input:checkbox:checked').each(function(){
                var _element = $(this).parents('.product-item').find('.sub-new');
                changeStatus(_element, true);
            });
            return false;
        });

        $('.recommended_all').on('click', function(){
            $('.checkbox_list input:checkbox:checked').each(function(){
                var _element = $(this).parents('.product-item').find('.sub-recommended');
                changeStatus(_element, true);
            });
            return false;
        });

        $('.visible_all').on('click', function(){
            $('.checkbox_list input:checkbox:checked').each(function(){
                var _element = $(this).parents('.product-item').find('.sub-status');
                changeStatus(_element, true);
            });
            return false;
        });

        $('.disable_all').on('click', function(){
            $('.checkbox_list input:checkbox:checked').each(function(){
                var _element = $(this).parents('.product-item').find('.sub-status');
                changeStatus(_element, true, true);
            });
            return false;
        });

        $('.copy_all').on('click', function(){
            var _Products = [],
                _Data = new FormData();

            $('.checkbox_list input:checkbox:checked').each(function(){
                _Products.push($(this).parents('.product-item').attr('data-product-id'));
            });

            _Data.append('function', 'product.copy');
            _Data.append('products', _Products);
            ajaxSendPost(_Data);
            location.reload();
            return false;
        });

        $('.brand_all').on('click', function(){
            $('#change-brand-id').css('display', 'block');
            return false;
        });

        $('#change-brand-id').on('change', function(){
            var _Products = [],
                _Data = new FormData(),
                _brand = $(this).val();

            $('.checkbox_list input:checkbox:checked').each(function(){
                _Products.push($(this).parents('.product-item').attr('data-product-id'));
            });

            _Data.append('function', 'product.brand');
            _Data.append('products', _Products);
            _Data.append('brand', _brand);
            ajaxSendPost(_Data);

            $(this).css('display', 'none');
            return false;
        });

        $('.category_all').on('click', function(){
            $('#change-category-id').css('display', 'block');
            return false;
        });

        $('#change-category-id').on('change', function(){
            var _Products = [],
                _Data = new FormData(),
                _category = $(this).val();

            $('.checkbox_list input:checkbox:checked').each(function(){
                _Products.push($(this).parents('.product-item').attr('data-product-id'));
            });

            _Data.append('function', 'product.category');
            _Data.append('products', _Products);
            _Data.append('category', _category);
            ajaxSendPost(_Data);

            $(this).css('display', 'none');
            return false;
        });
    })

    function changeStatus(selector, _allItems, _disable){
        var _Data = new FormData(),
            _product = selector.parents('.product-item').attr('data-product-id'),
            _column = selector.attr('data-name'),
            _val = parseFloat(selector.attr('data-value'));

        if(_allItems) {
            if(selector.hasClass('sub-status')){
                if(_disable) {
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

    function liveUpdateProduct(_table, _column, _val, _product, _option){
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