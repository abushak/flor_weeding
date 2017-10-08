jQuery(function($) {
    //Коли додаеш - appendItems(items) визиваєш
    
    var container = $(".allnews .items");
    var width = 213 + 24; //ширина блока з відступами
    var padding = 24;
    
    function renderOne(item) {
        // шаблон позиції
        return $("<div></div>").append(
            $("<div></div>").append(
                $('<a href="' + item.url + '"><img class="img" style="height: ' + item.height + 'px; width: 213px" src="' + item.picture + '"/></a>'),
                $('<div class="desc"></div>').append(
                    $("<a>").attr({
                        "href": item.url
                    }).append($("<span></span>").text(item.title)),
                    $("<div></div>").html(item.description),
                    $("<span></span>").html(item.date)
                )
            )
        );
    }
    
    var all = [], social = false, socials = [], cols = [], timer, cc = (window.innerWidth < 1250) ? 4 : 5;
    
    function min() {
        var res = 0, l = cols.length;
        for (var i = 1; i < l; ++i) {
            if (cols[i] < cols[res]) {
                res = i;
            }
        }
        return res;
    }
    
    function appendItem(items, idx, social, socials) {
        if (idx >= items.length) {
            container.height(Math.max.apply(null, cols));
            return;
        }
        var col = min(), item, delay = true;
        //if (social && socials.length) {
        if (social && socials.length && col == cols.length - 1) {
            var s = socials.shift();
            idx--;
            if (s.item) {
                item = s.item;
            } else {
                item = $("<div></div>").html(s.html);
                s.item = item;
                container.append(item);
            }
        } else if (items[idx].item) {
            item = items[idx].item;
            delay = false;
        } else {
            item = renderOne(items[idx]);
            items[idx].item = item;
            container.append(item);
        }
        container.height(Math.max(cols[col], container.height()));
        var show = function () {
            item.css({
                left: col * width,
                top: cols[col]
            }).addClass("show");
            cols[col] += item.height() + padding;
            container.height(Math.max(cols[col], container.height()));
            appendItem(items, idx + 1, social, socials);
        };
        if (delay) {
            timer = setTimeout(show, 10);
        } else {
            //show();
            timer = setTimeout(show, 0);
        }

    }

    function appendItems(items) {
        all.push.apply(all, items);
        update();
    }

    function update() {
        clearTimeout(timer);
        cols = [];
        for (var i = 0; i < cc; ++i) {
            cols.push(0);
        }
        appendItem(all, 0, social, socials.slice(0));
    }

    $.ajax({
        url: SRV + "bin/ajax.php",
        type: "POST",
        data: {
            "function": "news.json",
            "lang_code": CODE
        },
        success: function (data) {
            data = $.parseJSON(data);
            if (data.social) socials = data.social;
            all = data.news;
            social = data.page == 1;
            update();
        }
    });
    
    $(".more").on("click", function() {
        $.ajax({
            url: SRV + "bin/ajax.php",
            type: "POST",
            data: {
                "function": "news.json",
                "lang_code": CODE
            },
            success: function (data) {
                data = $.parseJSON(data);
                appendItems(data.news);
            }
        });
    });
    
    $(window).on("resize", function () {
        var _cc = (window.innerWidth < 1250) ? 4 : 5;
        if (_cc != cc) {
            cc = _cc;
            update();
        }
    });
});
