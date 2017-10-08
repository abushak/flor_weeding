<?php $_PagesMain = new PagesMain(); ?>
<?php $page = $_PagesMain->GetPageData($dir); ?>
<style>
    table, tr, td {
        border-color: #ddd;
    }
    #tabs {
    }
    div.tab {
        /*border: 1px solid #555;*/

    }
    .tab-list {
        float: left;
        padding: 0;
    }
    .tab-list li {
        display: inline;
        float: left;
        margin-left: 8px;
        list-style: none;
    }
    .tab-list li a {
        float: left;
        text-decoration: none;
        padding: 8px;
        /*color: #000;*/
        font-weight: 500;
        border: none;
    }
    .tab-list li.active {
        border-bottom: 1px solid #d080a3;
    }
    .tab-list li.active a {
        color: #d080a3;
    }
    #tabs div {
        clear: both;
        padding: 15px;
        min-height: 200px;
    }
    #tabs div h3 {
        margin-bottom: 12px;
    }
    #tabs div p {
        line-height: 150%;
    }
    .order-form {
        width: 600px;
        margin: 0 auto;
        text-align: center;
    }
    .order-form h3 {
        color: #d080a3;
    }
    .order-form input, .order-form textarea {
        border: 1px solid #cbc8d1;
        box-shadow: inset 0 2px 2px rgba(38, 11, 29, 0.2);
        border-radius: 4px;
        padding: 5px 10px;
        color: #3e3f44;
        width: 238px;
        box-sizing: border-box;
        margin: 0 5px 5px 0;
    }
    .order-form textarea {
        height: 106px;
    }
    .order-form-container {
        display: flex;
        justify-content: center;
    }
    .order-form-buttons {
        text-align: center;
        margin: 8px 0 0 0;
    }
    button[type='submit'] {
        width: 135px;
        height: 51px;
        font-size: 20px;
        line-height: 50px;
        text-align: center;
        background-color: #f63571;
        background-image: -webkit-linear-gradient(#f63571, #f85d3a);
        background-image: linear-gradient(#f63571, #f85d3a);
        border-radius: 3px;
        text-decoration: none;
        color: white;
        border: none;
    }
    #order-form-errors {
        color: #f63571;
        margin-bottom: 10px;
    }
</style>
<div class="pathway wbody">
    <ul>
        <li><a href="<?php echo SRV_; ?>"><?php echo WORD_54; ?></a></li>
        <li><a href="<?php echo SRV_."services"; ?>">Услуги</a></li>
        <li><a href="<?php echo SRV_."weddings"; ?>">Свадьбы</a></li>
    </ul>
</div>

<div class="about wmin">
    <div class="wbody content">
    <br><br><br>
        <h2>Оформление свадьбы Киев цены на сезон 2017</h2>
        <div id="tabs">
            <ul class="tab-list">
                <li><a href="#tab-1">STANDART</a></li>
                <li><a href="#tab-2">PREMIUM</a></li>
                <li><a href="#tab-3">D'LUX</a></li>
            </ul>
            <div class="tab" id="tab-1">
                <h3>Включено</h3>
                <ol>
                    <li>Cезонные, недорогие цветы</li>
                    <li>Небльшие композиции</li>
                    <li>Оформление различным декором, тканями, свечами с использованием конструкций</li>
                </ol>
                <p>Стоимость пакета «Standart» 16000-35000грн.
                <br>
                (учитывается закупочная стоимость цветов, декоративного материала; количество гостевых столов, конструкций; декор 2-х зон на минимальный бюджет)</p>

                <h3>Наглядность общей визуализации</h3>
                <a href="/files/floristics_decor/bAxHSuhZ.jpg" class="js-sp1" data-caption="Общая визуализация">
                    <img src="/files/floristics_decor/bAxHSuhZ.jpg" width="200" height="200" data-group="weddings-standart"/>
                </a>
                <a href="/files/floristics_decor/x-0K6bR0.jpg" class="js-sp1" data-caption="Общая визуализация">
                    <img src="/files/floristics_decor/x-0K6bR0.jpg" width="200" height="200" data-group="weddings-standart"/>
                </a>

                <h3>Визуализация зон</h3>

                <h4>Букет невесты</h4>
                <a href="/files/floristics_decor/rXbAwY0l.jpg" class="js-sp1" data-caption="Букет невесты">
                    <img src="/files/floristics_decor/rXbAwY0l.jpg" width="200" height="200" data-group="weddings-standart"/>
                </a>

                <h4>Оформление выездной церемонии</h4>
                <a href="/files/floristics_decor/ndXs8KZs.jpg" class="js-sp1" data-caption="Оформление выездной церемонии">
                    <img src="/files/floristics_decor/ndXs8KZs.jpg" width="200" height="200" data-group="weddings-standart"/>
                </a>

                <h4>Оформление зоны молодоженов</h4>
                <a href="/files/floristics_decor/MlOMgNO6.jpg" class="js-sp1" data-caption="Оформление зоны молодоженов">
                    <img src="/files/floristics_decor/MlOMgNO6.jpg" width="200" height="200" data-group="weddings-standart"/>
                </a>

                <h4>Оформление гостевых столов (стоимость за 1 стол)</h4>
                <a href="/files/floristics_decor/1jYwq2FO.jpg" class="js-sp1" data-caption="Оформление гостевых столов">
                    <img src="/files/floristics_decor/1jYwq2FO.jpg" width="200" height="200" data-group="weddings-standart"/>
                </a>

                <h4>Декор фотозоны</h4>
                <a href="/files/floristics_decor/_UERrP2M.jpg" class="js-sp1" data-caption="Декор фотозоны">
                    <img src="/files/floristics_decor/_UERrP2M.jpg" width="200" height="200" data-group="weddings-standart"/>
                </a>

                <h4>Доставка, работа команды (монтаж-демонтаж)</h4>
                <p>Пример свадебных расходов<br>
                Пакет "Standart".<br>
                Зона выездной церемонии (частичное заполнение): дорожка, зона молодых (задний фон), столик (композиции из живых цветов, лепестки роз);  Гостевые столы (2-4 композиции из живых цветов, мелкий декор и свечи). Букет невесты (живые цветы, аксессуары). Стартовая цена пакета - от 20000 грн (цветы недорогие, сезонные, композиции небольшие) - до 35000 грн (цветочный микс, композиции средние). Средняя тоимость за 1 человека - 450 грн. При бюджете 15000 грн. - можно оформить: 2 зоны, стол молодых и церемонию.</p>
            </div>
            <div class="tab" id="tab-2">
                <h3>Включено</h3>
                <ol>
                    <li>Микс сезонных и экзотических цветов средней и высокой ценовой категории</li>
                    <li>Средние по размерам цветочные композиции</li>
                    <li>Количество оформляемых зон - больше 2-х</li>
                    <li>Эскизы и визуализация основных зон</li>
                </ol>

                <p>Стоимость пакета «Premium» 35000-70000грн.
                <br>
                (учитывается закупочная стоимость цветов, декоративного материала; количество гостевых столов, конструкций; декорация зон - больше 2-х, и т.д.)</p>

                <h3>Наглядность общей визуализации</h3>
                <a href="/files/floristics_decor/sQVEVEpq.jpg" class="js-sp2" data-caption="Общая визуализация">
                    <img src="/files/floristics_decor/sQVEVEpq.jpg" width="200" height="200" data-group="weddings-premium"/>
                </a>
                <a href="/files/floristics_decor/kPx4kiP5.jpg" class="js-sp2" data-caption="Общая визуализация">
                    <img src="/files/floristics_decor/kPx4kiP5.jpg" width="200" height="200" data-group="weddings-premium"/>
                </a>
                <a href="/files/floristics_decor/Lt9W7meo.jpg" class="js-sp2" data-caption="Общая визуализация">
                    <img src="/files/floristics_decor/Lt9W7meo.jpg" width="200" height="200" data-group="weddings-premium"/>
                </a>

                <h3>Визуализация зон</h3>

                <h4>Букет невесты</h4>
                <a href="/files/floristics_decor/IWO2UIlG.jpg" class="js-sp2" data-caption="Букет невесты">
                    <img src="/files/floristics_decor/IWO2UIlG.jpg" width="200" height="200" data-group="weddings-premium"/>
                </a>

                <h4>Оформление выездной церемонии</h4>
                <a href="/files/floristics_decor/i01JOIq1.jpg" class="js-sp2" data-caption="Оформление выездной церемонии">
                    <img src="/files/floristics_decor/i01JOIq1.jpg" width="200" height="200" data-group="weddings-premium"/>
                </a>

                <h4>Оформление зоны молодоженов</h4>
                <a href="/files/floristics_decor/9ZIfYS-O.jpg" class="js-sp2" data-caption="Оформление зоны молодоженов">
                    <img src="/files/floristics_decor/9ZIfYS-O.jpg" width="200" height="200" data-group="weddings-premium"/>
                </a>

                <h4>Оформление гостевых столов (стоимость за 1 стол)</h4>
                <a href="/files/floristics_decor/HEfNVYDF.jpg" class="js-sp2" data-caption="Оформление гостевых столов">
                    <img src="/files/floristics_decor/HEfNVYDF.jpg" width="200" height="200" data-group="weddings-premium"/>
                </a>

                <h4>Декор фотозоны</h4>
                <a href="/files/floristics_decor/ZRcYDz0t.jpg" class="js-sp2" data-caption="Декор фотозоны">
                    <img src="/files/floristics_decor/ZRcYDz0t.jpg" width="200" height="200" data-group="weddings-premium"/>
                </a>

                <h4>Доставка, работа команды (монтаж-демонтаж)</h4>
                <p>Пример свадебных расходов<br>
                Пакет "Premium".<br>
                Зона выездной церемонии (частичное заполнение): дорожка, зона молодых (задний фон), столик (композиции из живых цветов, лепестки роз);  Гостевые столы (2-4 композиции из живых цветов, мелкий декор и свечи). Букет невесты (живые цветы, аксессуары). Стартовая цена пакета - от 20000 грн (цветы недорогие, сезонные, композиции небольшие) - до 35000 грн (цветочный микс, композиции средние). Средняя тоимость за 1 человека - 450 грн. При бюджете 15000 грн. - можно оформить: 2 зоны, стол молодых и церемонию.</p>
            </div>
            <div class="tab" id="tab-3">
                <h3>Включено</h3>
                <ol>
                    <li>Микс сезонных и экзотических цветов средней и высокой ценовой категории</li>
                    <li>Большие цветочные композиции</li>
                    <li>Использование дорогих декораций</li>
                    <li>Оформление всех уровней пространства</li>
                    <li>Художественное освещение зала</li>
                    <li>Эскизы и визуализация всех зон</li>
                    <li>Для молодоженов - подарок на выбор</li>
                </ol>

                <p>Стоимость пакета «D'lux» от 120000грн.
                <br>
                (учитывается закупочная стоимость цветов, декоративного материала; количество гостевых столов, конструкций; декорация зон - больше 2-х; величина площадей и т.д.)</p>

                <h3>Наглядность общей визуализации</h3>
                <a href="/files/floristics_decor/XoUvn67M.jpg" class="js-sp3" data-caption="Общая визуализация">
                    <img src="/files/floristics_decor/XoUvn67M.jpg" width="200" height="200" data-group="weddings-dlux"/>
                </a>
                <a href="/files/floristics_decor/cy2QJW5c.jpg" class="js-sp3" data-caption="Общая визуализация">
                    <img src="/files/floristics_decor/cy2QJW5c.jpg" width="200" height="200" data-group="weddings-dlux"/>
                </a>
                <a href="/files/floristics_decor/ouXpjzBI.jpg" class="js-sp3" data-caption="Общая визуализация">
                    <img src="/files/floristics_decor/ouXpjzBI.jpg" width="200" height="200" data-group="weddings-dlux"/>
                </a>

                <h3>Визуализация зон</h3>

                <h4>Букет невесты</h4>
                <a href="/files/floristics_decor/lqW6vW2e.jpg" class="js-sp3" data-caption="Букет невесты">
                    <img src="/files/floristics_decor/lqW6vW2e.jpg" width="200" height="200" data-group="weddings-dlux"/>
                </a>

                <h4>Оформление выездной церемонии</h4>
                <a href="/files/floristics_decor/X8lPjdsK.jpg" class="js-sp3" data-caption="Оформление выездной церемонии">
                    <img src="/files/floristics_decor/X8lPjdsK.jpg" width="200" height="200" data-group="weddings-dlux"/>
                </a>

                <h4>Оформление зоны молодоженов</h4>
                <a href="/files/floristics_decor/7VLO-UvZ.jpg" class="js-sp3" data-caption="Оформление зоны молодоженов">
                    <img src="/files/floristics_decor/7VLO-UvZ.jpg" width="200" height="200" data-group="weddings-dlux"/>
                </a>

                <h4>Оформление гостевых столов (стоимость за 1 стол)</h4>
                <a href="/files/floristics_decor/8L75MEhb.jpg" class="js-sp3" data-caption="Оформление гостевых столов">
                    <img src="/files/floristics_decor/8L75MEhb.jpg" width="200" height="200" data-group="weddings-dlux"/>
                </a>

                <h4>Декор фотозоны</h4>
                <a href="/files/floristics_decor/GNjK6YdQ.jpg" class="js-sp3" data-caption="Декор фотозоны">
                    <img src="/files/floristics_decor/GNjK6YdQ.jpg" width="200" height="200" data-group="weddings-dlux"/>
                </a>

                <h4>Доставка, работа команды (монтаж-демонтаж)</h4>
                <p>Пример свадебных расходов<br>
                Пакет "D'lux".<br>
                Зона выездной церемонии (частичное заполнение): дорожка, зона молодых (задний фон), столик (композиции из живых цветов, лепестки роз);  Гостевые столы (2-4 композиции из живых цветов, мелкий декор и свечи). Букет невесты (живые цветы, аксессуары). Стартовая цена пакета - от 20000 грн (цветы недорогие, сезонные, композиции небольшие) - до 35000 грн (цветочный микс, композиции средние). Средняя тоимость за 1 человека - 450 грн. При бюджете 15000 грн. - можно оформить: 2 зоны, стол молодых и церемонию.</p>
            </div>
        </div>
        <div class="order-form">
            <h3>Заказать оформление свадьбы</h3>
            <form>
                <div class="order-form-container">
                    <div>
                        <input name="name" placeholder="Ваше имя"><br>
                        <input name="tphone" placeholder="Телефон" class="phone-mask"><br>
                        <input name="email" placeholder="Почта"><br>
                    </div>
                    <div>
                        <textarea name="message" placeholder="Текст:"></textarea>
                    </div>
                </div>
                <div class="order-form-buttons">
                    <div id="order-form-errors"></div>
                    <button id="order-form-submit" type="submit">Отправить</button>
                </div>
            </form>
        </div>

    </div>
</div>

<script>
$(document).ready(function(){
    $('#tabs div').hide();
    $('#tabs div:first').show();
    $('#tabs ul li:first').addClass('active');

    $('#tabs ul li a').click(function(){
        $('#tabs ul li').removeClass('active');
        $(this).parent().addClass('active');
        var currentTab = $(this).attr('href');
        $('#tabs div').hide();
        $(currentTab).show();
        return false;
    });

    $(".js-sp1").smartPhoto();
    $(".js-sp2").smartPhoto();
    $(".js-sp3").smartPhoto();

    $('#order-form-submit').click(function(){
        var post = {
            name:    $('input[name="name"]').val(),
            phone:   $('input[name="tphone"]').val(),
            email:   $('input[name="email"]').val(),
            message: $('textarea[name="message"]').val()
        };
        if (post.name === "") {
            $('#order-form-errors').text('Укажите пожалуйста имя');
            $('input[name="name"]').focus();
            return false;
        }
        if (post.phone === "" && post.email === "") {
            $('#order-form-errors').text('Укажите пожалуйста контактный телефон или почту');
            $('input[name="tphone"]').focus();
            return false;
        }
        $.post("/ajax/wedding.order.php", post)
        .done(function(data){
            alert("Заказ отправлен.\nНаш менеджер свяжется с Вами в ближайшее время.");
        });
        $('input[name="name"]').val('');
        $('input[name="tphone"]').val('');
        $('input[name="email"]').val('');
        $('textarea[name="message"]').val('');
        $('#order-form-errors').text('');

        return false;
    });

    setInterval(function(){ moveRight(); }, 3000);

    var slideCount = $('#slider ul li').length;
    var slideWidth = $('#slider ul li').width();
    var slideHeight = $('#slider ul li').height();
    var sliderUlWidth = slideCount * slideWidth;

    $('#slider').css({width: slideWidth, height: slideHeight});
    $('#slider ul').css({width: sliderUlWidth, marginLeft: - slideWidth});
    $('#slider ul li:last-child').prependTo('#slider ul');
    $('#slider').css({display:'block'});
    $('a.control_prev').click(function(){ moveLeft(); });
    $('a.control_next').click(function(){ moveRight(); });

    function moveLeft() {
        $('#slider ul').animate({
            left: + slideWidth
        }, 200, function () {
            $('#slider ul li:last-child').prependTo('#slider ul');
            $('#slider ul').css('left', '');
        });
    };

    function moveRight() {
        $('#slider ul').animate({
            left: - slideWidth
        }, 200, function () {
            $('#slider ul li:first-child').appendTo('#slider ul');
            $('#slider ul').css('left', '');
        });
    };

});
</script>
