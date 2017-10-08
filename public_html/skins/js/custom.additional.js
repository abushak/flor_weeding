jQuery(function($) {
    "use strict";
    
    $("body").on("click", ".count_widget [rel=inc]", function() {
        var input = $("input", $(this).parents(".count_widget"));
        input.val(Math.min(99, parseInt(input.val()) + 1)).change();
    });
    
    $("body").on("click", ".count_widget [rel=dec]", function() {
        var input = $("input", $(this).parents(".count_widget"));
        input.val(Math.max(1, parseInt(input.val()) - 1)).change();
    });
    
    $("body").on("mousewheel", ".count_widget input", function(e) {
        e.preventDefault();
        $(this).val(Math.min(99, Math.max(1, parseInt($(this).val()) + e.originalEvent.wheelDelta / 120))).change();
    });
    
    var timer;
    (function (additional, item) {
        var prev = parseInt($(".cartpage").attr("data-price"));
        
        function setprice(to) {
            clearTimeout(timer);
            var d = Math.floor(to - prev), abs = Math.abs(d);
            prev = d === 0 ? prev : Math.floor(prev + Math.max(1, abs * .3) * (d / abs));
            $(".cartpage .price >div>span").text(prev);
            if (d) {
                timer = setTimeout(function () {
                    setprice(to);
                }, 20);
            }
        }
        
        $(".item > .img > a", additional).on("click", function() {
            $(this).parents(".item").toggleClass("incart");
            var add = 0;
            $(".item.incart", additional).each(function() {
                add -= -$(this).attr("data-price");
            });
            var price = parseInt($(".cartpage").attr("data-price"));
            setprice(add + price);
            $(".cartpage .prices .summary").text(add ? [price, add].join(" + ") : "");
            $(".cartpage .prices .euro").text("$" + ((add + price)/USD).toFixed(0));
            
            if ($(this).parents(".item").hasClass("incart")) {
                var product_id = $(this).parents(".item").attr("data-product-id"),
                    option_id = $(this).parents(".item").attr("data-option-id"),
                    quantity = 1;
                
                AddToCart(product_id, option_id, quantity);
            } else {
                var product_id = $(this).parents(".item").attr("data-product-id"),
                    option_id = $(this).parents(".item").attr("data-option-id");
                $("tr[data-product-id=" + product_id + "]").remove();
                RemoveFromCart(product_id, option_id);
                UpdateCartPrice();
            }
        });
        
        var count = $(".item", additional).length,
            width = count * item,
            left = 0,
            el = $(">div>div", additional);
        
        el.css("width", width);
        $('a[rel="next"]', additional).on("click", function() {
            left = Math.min(width - el.parent().width(), left + item);
            el.css("left", -left);
        });
        $('a[rel="prev"]', additional).on("click", function() {
            left = Math.max(0, left - item);
            el.css("left", -left);
        });
    })($(".additional"), 213 + 24);
    
    function AddToCart(product_id, option_id, quantity) {
        $.ajax({
            url: SRV + "bin/ajax.php",
            type: "POST",
            data: {
                "function": "cart.add.product",
                "product_id": product_id,
                "option_id": option_id,
                "quantity": quantity,
                "lang_code": CODE
            },
            success: function(html) {
                alert(111);
                UpdateCart();
                $(".cartpage table tbody").append(html);
                $("#order-form").append(html);
            }
        });
    }
    
    function RemoveFromCart(product_id, option_id) {
        $.ajax({
            url: SRV + "bin/ajax.php",
            type: "POST",
            data: {
                "function": "cart.remove.product",
                "product_id": product_id,
                "option_id": option_id
            },
            success: function(html) {
                UpdateCart();
            }
        });
    }
    
    function UpdateCart() {
        $.ajax({
            url: SRV + "bin/ajax.php",
            type: "POST",
            data: {
                "function": "cart.update"
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
    
    function UpdateCartPrice() {
        var price = 0;
        $(".cart-item").each(function() {
            var itemPrice = parseFloat($(this).attr("data-price"));
            price += itemPrice;
        });
        $(".cartpage div.price").find("span").text(price);
        $(".cartpage .prices .euro").text(("$" + ((add + price)/USD).toFixed(0)));
    }
    
});
