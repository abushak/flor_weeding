jQuery(function ($) {
    "use strict";

    //Вібор размера
    //$('body').on('click', '.product .size-selector', function () {
    //    $('li', $(this).parents('ul')).removeClass('active');
    //    $(this).addClass('active');
    //});


    //Купить
    /*$('body').on('click', '.product [rel="buy"]', function () {
        var e = $('>div.show', $(this).parents('.panel')).removeClass('show').addClass('hide');
        setTimeout(function(){
            e.removeClass('hide');
        },250);
        $('.incart', $(this).parents('.panel')).addClass('show');
    });*/


    // Убрать из корзині
    $('body').on('click', '.product [rel="unbuy"]', function () {
        var e = $('>div.show', $(this).parents('.panel')).removeClass('show').addClass('hide');
        setTimeout(function(){
            e.removeClass('hide');
        },250);
        $('.base', $(this).parents('.panel')).addClass('show');
    });

    // Бістрій заказ
    $('body').on('click', '.product [rel="order"]', function () {
        var e = $('>div.show', $(this).parents('.panel')).removeClass('show').addClass('hide');
        setTimeout(function(){
            e.removeClass('hide');
        },250);
        $('.form', $(this).parents('.panel')).addClass('show');
    });

    // Бістрій заказ cancel
    $('body').on('click', '.product [rel="cancel"]', function () {
        var e = $('>div.show', $(this).parents('.panel')).removeClass('show').addClass('hide');
        setTimeout(function(){
            e.removeClass('hide');
        },250);
        $('.base', $(this).parents('.panel')).addClass('show');
    });

    // Бістрій заказ Done
    $('body').on('click', '.product [rel="close"]', function () {
        var e = $('>div.show', $(this).parents('.panel')).removeClass('show').addClass('hide');
        setTimeout(function(){
            e.removeClass('hide');
        },250);
        $('.base', $(this).parents('.panel')).addClass('show');
    });

    // количество
    $('body').on('click touchstart', '.count_widget [rel="inc"]', function (e) {
        e.preventDefault();
        var input = $('input', $(this).parents('.count_widget'));
        input.val(Math.min(99, parseInt(input.val()) + 1)).change();
    });
    $('body').on('click touchstart', '.count_widget .dec', function (e) {
        e.preventDefault();
        var input = $('input', $(this).parents('.count_widget'));
        input.val(Math.max(1, parseInt(input.val()) - 1)).change();
    });
    $('body').on('mousewheel', '.count_widget input', function (e) {
        e.preventDefault();
        $(this).val(Math.min(99, Math.max(1, parseInt($(this).val()) + e.originalEvent.wheelDelta / 120))).change();
    });


    var timer;
    (function (additional, item) {
        var prev = parseInt($('.product').attr('data-price'));

        function setprice(to) {
            clearTimeout(timer);
            var d = Math.floor(to - prev), abs = Math.abs(d);
            prev = d === 0 ? prev : Math.floor(prev + Math.max(1, abs * .3) * (d / abs));
            $('.product .price >div>span').text(prev);
            if (d) {
                timer = setTimeout(function () {
                    setprice(to);
                }, 20);
            }
        }

        $('.item > .img > a', additional).on('click', function () {
            $(this).parents('.item').toggleClass('incart');
            var add = 0;
            $('.item.incart', additional).each(function () {
                add -= -$(this).attr('data-price');
            });
            var price = parseInt($('.product').attr('data-price'));
            setprice(add + price);
            $('.product .prices .summary').text(add ? [price, add].join(' + ') : '');
            $('.product .prices .euro').text(("$" + ((add + price)/USD).toFixed(0)));
            
            
            if ($(this).parents(".item").hasClass("incart")) {
                    var product_id = $(this).parents(".item").attr("data-product-id"),
                        option_id = $(this).parents(".item").attr("data-option-id"),
                        quantity = 1;
                    
                    AddToCart(product_id, option_id, quantity);
            } else {
                var product_id = $(this).parents(".item").attr("data-product-id"),
                    option_id = $(this).parents(".item").attr("data-option-id");
                    
                    RemoveFromCart(product_id, option_id);
                    UpdateCart();
                }
            
        });
        var
            count = $('.item', additional).length,
            width = count * item,
            left = 0,
            el = $('>div>div', additional);
        el.css('width', width);
        $('a[rel="next"]', additional).on('click', function () {
            left = Math.min(width - el.parent().width(), left + item);
            el.css('left', -left);

        });
        $('a[rel="prev"]', additional).on('click', function () {
            left = Math.max(0, left - item);
            el.css('left', -left);
        });
    })($('.additional'), 213 + 24);

    $('td.size li').on('click', function () {
        var el = $(this);
        $('li', el.parent()).removeClass('active');
        el.addClass('active');
        var ck = $("input", el.parents('td.size'));
        if (ck.prop('checked')) {
            setTimeout(function () {
                ck.prop('checked', false).change();
            }, 10);
        }
    });
    
    function AddToCart(product_id, option_id, quantity) {
        $.ajax({
            url: SRV + 'bin/ajax.php',
            type: 'POST',
            data: {
                'function': 'cart.add.product',
                'product_id': product_id,
                'option_id': option_id,
                'quantity': quantity
            },
            success: function(html) {
                UpdateCart();
            }
        });
    }
    
    function RemoveFromCart(product_id, option_id) {
        $.ajax({
            url: SRV + 'bin/ajax.php',
            type: 'POST',
            data: {
                'function': 'cart.remove.product',
                'product_id': product_id,
                'option_id': option_id
            },
            success: function(html) {
                UpdateCart();
            }
        });
    }
    
    /** Оновити кошик **/
    function UpdateCart() {
        $.ajax({
            url: SRV + 'bin/ajax.php',
            type: 'POST',
            data: {
                'function': 'cart.update'
            },
            success: function(html) {
                var _Result_ = $.parseJSON(html),
                    quantity = _Result_.quantity;
                
                if (quantity > 0) {
                    $("#header .cart .count").text(quantity);
                    $("#header .cart .caption").css("text-decoration", "underline");
                } else {
                    $("#header .cart .count").text("0");
                    $("#header .cart .caption").css("text-decoration", "");
                }
            }
        });
    }
    
});
