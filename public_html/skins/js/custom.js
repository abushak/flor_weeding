jQuery(function($) {
    /** Пошук **/
    $("#search-button").click(function(e) {
        var _q = $("#search-input").val();
            _q = $.trim(_q);
        
        if (_q != "") {
            e.preventDefault();
            $("#search-form").submit();
        }
    });
    
    /** Вибір розміру **/
    $("body").on("click", '.product [rel="size"]', function() {
        var price = $(this).attr("data-price");
        
        $(this).parents(".product").attr("data-price", price);
        $("#item-price").text(price);
        $(".product .prices .euro").text(("$" + (price/USD).toFixed(0)));
        
        $("li", $(this).parents("ul")).removeClass("active");
        $(this).parent().addClass("active");
    });
    
    $("body").on("click", '.product .size-selector', function() {
        var price = $(this).find("a").attr("data-price");
        
        $(this).parents(".product").attr("data-price", price);
        $("#item-price").text(price);
        $(".product .prices .euro").text(("$" + (price/USD).toFixed(0)));
        
        $("li", $(this).parents("ul")).removeClass("active");
        $(this).addClass("active");
    });
    
    $("td.size li").on("click", function() {
        var el = $(this);
        $("li", el.parent()).removeClass("active");
        el.addClass("active");
        var ck = $("input", el.parents("td.size"));
        if (ck.prop("checked")) {
            setTimeout(function() {
                ck.prop("checked", false).change();
            }, 10);
        }
    });
    
    /** Додати до кошика **/
    $("body").on("click", '.product [rel="buy"]', function() {
        var product_id = $(this).parents(".product").attr("data-product-id"),
            option_id = $(".product .other .active").attr("data-option-id"),
            quantity = $("#quantity").val();
        AddToCart(product_id, option_id, quantity);
    });

    function flipBuyCard () {
        var card = $('.product [rel="buy"]');
        var e = $('>div.show', card.parents('.panel')).removeClass('show').addClass('hide');
        setTimeout(function(){
            e.removeClass('hide');
        },250);
        $('.incart', card.parents('.panel')).addClass('show');
    }
    
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
                flipBuyCard();
                UpdateCart();
            },
            error: function(html){
                console.log('Add to cart fail');
            }
        });
    }
    
    /** Видалити з кошика **/
    $("body").on("click", '.product [rel="unbuy"]', function() {
        var product_id = $(this).parents(".product").attr("data-product-id"),
            option_id = $(".product .other .active").attr("data-option-id");
        RemoveFromCart(product_id, option_id);
    });
    
    $("body").on("click", ".cartpage .cart-delete", function() {
        var product_id = $(this).parents("tr").attr("data-product-id"),
            option_id = $(this).parents("tr").attr("data-option-id");
        $(this).parents("tr").remove();
        $(".additional").find(".item[data-product-id=" + product_id + "]").removeClass("incart");
        RemoveFromCart(product_id, option_id);
        UpdateCartPrice();
        
        var InCart = $(".cartpage .cart-item").length;
        if (RT1 == "cart" && InCart == 0) {
            location.replace(SRV + HL + "shop");
        }
    });
    
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
    
    /** Швидке замовлення **/
    $("body").on("click", '.product [rel="checkout2"]', function() {
        if (checkRequired(".fast-required")) {
            var e = $(">div.show", $(this).parents(".panel")).removeClass("show").addClass("hide");
            setTimeout(function(){
                e.removeClass("hide");
            }, 250);
            $(".done", $(this).parents(".panel")).addClass("show");
            
            var product_id = $(this).parents(".product").attr("data-product-id"),
                option_id = $(".product .other .active").attr("data-option-id"),
                quantity = $("#quantity").val(),
                user_name = $("#fast-name").val(),
                user_phone = $("#fast-phone").val(),
                user_comment = $("#fast-comment").val();
            AddFastOrder(product_id, option_id, quantity, user_name, user_phone, user_comment);
        }
    });
    
    function AddFastOrder(product_id, option_id, quantity, user_name, user_phone, user_comment) {
        $.ajax({
            url: SRV + 'bin/ajax.php',
            type: 'POST',
            data: {
                'function': 'order.fast.add',
                'product_id': product_id,
                'option_id': option_id,
                'quantity': quantity,
                'user_name': user_name,
                'user_phone': user_phone,
                'user_comment': user_comment
            }
        });
    }
    
    /** Зворотній зв'язок **/
    $("body").on("click", '.contacts [rel="mail"]', function() {
        var e = $('>div.show', $(this).parents('.panel')).removeClass('show').addClass('hide');
        setTimeout(function() {
            e.removeClass("hide");
        }, 250);
        $(".form", $(this).parents(".panel")).addClass("show");
    });
    
    $("body").on("click", '.contacts [rel="cancel"]', function() {
        var e = $('>div.show', $(this).parents('.panel')).removeClass('show').addClass('hide');
        setTimeout(function() {
            e.removeClass("hide");
        }, 250);
        $(".base", $(this).parents(".panel")).addClass("show");
    });
    
    $("body").on("click", '.contacts [type="submit"]', function(e) {
        e.preventDefault();
        var el = $('>div.show', $(this).parents('.panel')).removeClass('show').addClass('hide');
        setTimeout(function() {
            el.removeClass("hide");
        }, 250);
        $(".done", $(this).parents(".panel")).addClass("show");
    });
    
    /** Поля для вводу номера телефона **/
    $(".phone-mask").mask("+99 (999) 999-99-99");
    $(".phone-mask-ua").mask("+38 (999) 999-99-99");
    
    /** Зміна кількості в кошику **/
    $(".cartpage table tbody").on("change", ".cart-item .quantity", function() {
        var price = $(this).parents(".cart-item").find("li.active").attr("data-price"),
            quantity = $(this).val();
        var _price = price * quantity;
        $(this).parents(".cart-item").attr("data-price", _price);
        $(this).parents(".cart-item").children("td.price").text(_price + " " + CURRENCY_NAME);
        UpdateCartPrice();
    });
    
    /** Зміна розміру в кошику **/
    $('td.size li').on('click', function() {
        var price = $(this).attr("data-price"),
            quantity = $(this).parents(".cart-item").find(".quantity").val(),
            article = $(this).attr("data-article");
            id = $(this).attr("data-id");
        var _price = price * quantity;
        $(this).parents(".cart-item").attr("data-price", _price);
        $(this).parents(".cart-item").find(".option_id").val(id);
        $(this).parents(".cart-item").children("td.price").text(_price + " " + CURRENCY_NAME);
        $(this).parents(".cart-item").find(".article").text(article);
        UpdateCartPrice();
    });
    
    /** Оновити ціну в кошику **/
    function UpdateCartPrice() {
        var price = 0;
        $(".cart-item").each(function() {
            var itemPrice = parseFloat($(this).attr('data-price'));
            price += itemPrice;
        });
        $(".cartpage div.price").find("span").text(price);
        $(".cartpage .prices .euro").text(("$" + (price/USD).toFixed(0)));
    }
    
    /** Підтвердження замовлення **/
    $("#order-confirm").click(function(e) {
        e.preventDefault();
        var url = $(this).attr("href"),
            _Data = new FormData(document.getElementById("order-form"));
        
        _Data.append("function", "cart.update.content");
        $.ajax({
            url: SRV + "bin/ajax.php",
            type: "POST",
            data: _Data,
            processData: false,
            contentType: false,
            success: function(html) {
                location.replace(url);
            }
        });
    });
    
    $("#order-info-form").submit(function(e) {
        if (!checkRequired(".order-required:visible")) {
            e.preventDefault();
            $("#not-all-fields").css("display", "block");
        }
    });
    
    /** Колбек **/
    $(".callback-button").click(function(e) {
        e.preventDefault();
        var phone = $(this).parent("label").find(".callback-phone").val()
        if (phone == "") {
            $(this).parent("label").find(".callback-phone").css("border", "1px solid #FA1B36");
            _checkTimeout = setTimeout(function() {
                $(this).parent("label").find(".callback-phone").css("border", "");
            }, 2000);
        } else {
            $(this).parents(".phone").find(".popup_phone_done_").prop("checked", true);
            $(this).parent("label").find(".callback-phone").val("");
            $.ajax({
                url: SRV + "bin/ajax.php",
                type: "POST",
                data: {
                    "function": "callback.add",
                    "phone": phone
                }
            });
        }
    });
    
    /** Залишити відгук **/
    $(".review-submit").submit(function(e) {
        e.preventDefault();
        if (checkRequired(".review-required")) {
            var form = $(this),
                name = form.find("input[name=name]").val(),
                review = form.find("textarea[name=review]").val();
            form.find("input[type=text], textarea").val("");
            
            $.ajax({
                url: SRV + "bin/ajax.php",
                type: "POST",
                data: {
                    "function": "review.add",
                    "name": name,
                    "review": review
                }
            });
        }
    });
    
    /** Зміна способу доставки **/
    $("input[name=delivery_method]").change(function() {
        var delivery_price = parseInt($(this).attr("data-price")),
            order_price = parseInt($("#order-price").attr("data-price")),
            price = order_price + delivery_price;
        $("#order-price").text(price);
        $(".order .prices .euro").text(("$" + (price/USD).toFixed(0)));
    });
    
    /** VIP PopUp **/
    $('body').on('click', 'a[rel="vip"]', function() {
        $('.vip-required').val('');
        $('.vip-request').addClass('show');
        $('.vip-success').removeClass('show');
        $('.zopa_s_ruchkoy').addClass('show');
        return false;
    });
    
    $('.close-vip').click(function() {
        $('.zopa_s_ruchkoy').removeClass('show');
        return false;
    });
    
    $('.vip-request').submit(function(e) {
        e.preventDefault(); e.stopPropagation();
        var form = $(this);
        if (checkRequired('.vip-required')) {
            $('.vip-request').removeClass('show');
            $('.vip-success').addClass('show');
            $.ajax({
                url: SRV + 'bin/ajax.php',
                type: 'POST',
                data: {
                    'function': 'vip.request',
                    'name': form.find('input[name="name"]').val(),
                    'email': form.find('input[name="email"]').val(),
                    'phone': form.find('input[name="phone"]').val()
                }
            });
        }
    });
    
    
    /** Провірка поля на наявність тексту **/
    var _checkTimeout;
    function checkRequired(selector) {
        clearTimeout(_checkTimeout);
        var isEmpty = 0;
        $(selector).each(function() {
            var elem = $(this);
            if (elem.val() == "") {
                isEmpty++;
                elem.css("border", "1px solid #FA1B36");
                _checkTimeout = setTimeout(function() {
                    elem.css("border", "");
                }, 5000);
            }
        });        
        if(isEmpty != 0) return false;
        else return true;
    }

    $('#popup_map').change(function(){
        ymaps.load(['package.standard'],function() {
            var fMap, fPlacemark;
            fPlacemark = new ymaps.Placemark([50.42477279, 30.50638250], {content: WORD_1 + " FLOR People", balloonContent: WORD_1 + " FLOR People"});
            fMap = new ymaps.Map("mapcontainer", {center: [50.42477279, 30.50638250], zoom: 15});
            fMap.geoObjects.add(fPlacemark);
            fMap.controls.add("zoomControl", {left: 25, top: 25});
            if (RT1 == 'contacts') {
                var cMap, cPlacemark;
                cPlacemark = new ymaps.Placemark([50.42477279, 30.50638250], {content: WORD_1 + " FLOR People", balloonContent: WORD_1 + " FLOR People"});
                cMap = new ymaps.Map("map", {center: [50.42477279, 30.50638250], zoom: 15});
                cMap.geoObjects.add(cPlacemark);
                cMap.controls.add("zoomControl", {left: 25, top: 25});
            }
        });
    });
});