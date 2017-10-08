<?php $_PagesMain = new PagesMain(); ?>
<?php $page = $_PagesMain->GetPageData($dir); ?>
<script defer="" type="text/javascript" src="<?php echo SKIN; ?>js/map.js"></script>
<div class="pathway wbody">
    <ul>
        <li><a href="<?php echo SRV_; ?>"><?php echo WORD_54; ?></a></li>
        <li><a href="<?php echo SRV_."contacts"; ?>"><?php echo WORD_61; ?></a></li>
    </ul>
</div>

<div class="contacts wmin">
    <div class="map" id="map"></div>
    <div class="wbody info">
        <div class="panel">
            <div class="base show">
                <h2><?php echo $page['meta_h1']; ?></h2>
                <p><?php echo $page['description']; ?></p>
                
                <a rel="mail">Написать письмо</a>
            </div>
            <div class="form">
                <h2>Обратная связь</h2>
                <form>
                    <input name="name" placeholder="Ваше имя" />
                    <input name="phone" placeholder="Телефон" />
                    <textarea name="message" placeholder="Текст:"></textarea>
                    <button type="submit">Отправить</button><a rel="cancel">Отменить</a>
                </form>
            </div>
            <div class="done"></div>
        </div>
    </div>
</div>