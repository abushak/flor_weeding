jQuery(function ($) {
    var curr = null;
    var gallery = null;
    var product = $('.product', gallery);
    
    function load(el) {
        var _url = el.attr('data-url');
        $.ajax({
            url: SRV + 'bin/ajax.php',
            type: 'POST',
            data: {
                'function': 'product.fast.preview',
                'lang_code': CODE,
                'url': _url
            },
            context: this,
            success: function (html) {
                product = $(html);
                curr = $(el);
                update();
                $(".phone-mask").mask("+38 (999) 99-99-999");
            }
        });
    }
    
    $('.catalog').on('click', '.img', function (e) {
        e.preventDefault();
        load($(this).parents('.item'));
    }).on('click', '[rel="next"]', function () {
        var c = curr.nextAll('.item');
        if (c.length) load($(c[0]));
    }).on('click', '[rel="prev"]', function () {
        var c = curr.prevAll('.item');
        if (c.length) load($(c[0]));
    });
    
    $(document).on('keydown', function (e) {
        var c;
        if (curr)
            switch (e.which) {
                case 37: // left
                    c = curr.prevAll('.item');
                    break;
                case 39: // right
                    c = curr.nextAll('.item');
                    break;
                default: return; // exit this handler for other keys
            }
        if (c.length) load($(c[0]));
        e.preventDefault(); // prevent the default action (scroll / move caret)
    });
    
    $(window).on('resize', function () {
        update();
    });

    var prev = -1;
    function update() {
        if (curr == null) return;

        var row = window.innerWidth >= 1160 ? 5 : 4;
        var items = $('.catalog .item');
        var k = 0;
        items.removeClass('gal');
        curr.addClass('gal');
        for (var i = 0; i < items.length; ++i) {
            if (items[i] == curr[0]) {
                k = i + 1;
            }
        }
        i = Math.min(Math.ceil(k / row) * row, items.length) - 1;
        if (prev !== i) {
            var gal = $('<div class="gallery"><div class="inner wmin"><div class="mask"></div><div class="mask2"></div></div></div>');
            gal.insertAfter(items[i]);
            if (gallery) {
                (function (gallery) {
                    gallery.removeClass('show');
                    setTimeout(function () {
                        gallery.remove();
                        $('body,html').animate({
                            scrollTop: gal.position().top - (window.innerHeight - 660) / 2
                        });
                    }, 250);
                })(gallery);
            } else {
                $('body,html').animate({
                    scrollTop: gal.position().top - (window.innerHeight - 660) / 2
                });
            }
            setTimeout(function () {
                gal.addClass('show');
            }, 10);
            gallery = gal;
        }
        $('.mask', gallery).css({'right': $('.inner', gallery).width() - curr.offset().left - curr.width() / 2});
        $('.mask2', gallery).css({'left': curr.offset().left + curr.width() / 2});
        $('.product', gallery).remove();
        $('.inner', gallery).append(product);
        prev = i;
    }
    
    $('[rel="sort"]').on('click', function () {
        $(this).parent().toggleClass('open');
    });
    
    $(".range").ionRangeSlider({
        type: "double",
        grid: false,
        hide_min_max: true,
        decorate_both: false,
        onFinish: function(params) {
            $.ajax({
                url: SRV + "bin/ajax.php",
                type: "POST",
                data: {
                    "function": "catalog.price.update",
                    "pg": PAGE,
                    "sort_by": SORT,
                    "min_price": params.from,
                    "max_price": params.to
                },
                success: function(html) {
                    location.replace(LINK + html);
                }
            });
        }
    });
    
    $(".more").on("click", function(e) {
        var MoreButton = $(this),
            MaxProducts = MoreButton.attr("data-max");
        e.preventDefault();
        $.ajax({
            url: SRV + "bin/ajax.php",
            type: "POST",
            data: {
                "function": "catalog.show.more",
                "lang_code": CODE,
                "last": $(".item").length,
                "url": RT2,
                "pg": PAGE,
                "sort_by": SORT,
                "min_price": MIN_PRICE,
                "max_price": MAX_PRICE
            },
            success: function(html) {
                $("html, body").animate({
                    scrollTop: MoreButton.offset().top
                }, 500);
                $(".catalog > .items").append(html);
                var length = $(".item").length;
                $(".pages .current").next().addClass("current");
                $(".pages a:last-child").removeClass("current");
                if (MaxProducts <= length) {
                    $(".pages a:last-child").addClass("current");
                    MoreButton.css("visibility", "hidden");
                }
            }
        })
    });
});