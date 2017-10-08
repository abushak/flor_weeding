<div class="wrap_cell">
    <div class="cell c_text"></div>
    <div class="cell"><?php echo WORD_244; ?></div>
    <div class="cell"><a href="<?php echo lRequest("sort", ($_GET["sort"] == "title_old") ? "title_new" : "title_old"); ?>"><?php echo WORD_22; ?></a></div>
    <div class="cell c_right">
        <span style="padding-right:19px;"><a href="<?php echo lRequest("sort", ($_GET["sort"] == "price_old") ? "price_new" : "price_old"); ?>"><?php echo WORD_241; ?></a></span>
        <span style="padding-right:15px;"><a href="<?php echo lRequest("sort", ($_GET["sort"] == "cross_old") ? "cross_new" : "cross_old"); ?>"><?php echo WORD_242; ?></a></span>
        <span style="padding-right:18px;"><a href="<?php echo lRequest("sort", ($_GET["sort"] == "quantity_old") ? "quantity_new" : "quantity_old"); ?>"><?php echo WORD_243; ?></a></span>
        <span style="padding-right:23px;"><a href="<?php echo lRequest("sort", ($_GET["sort"] == "article_old") ? "article_new" : "article_old"); ?>"><?php echo WORD_240; ?></a></span>
    </div>
    <div class="cell c_text"><?php echo WORD_24; ?></div>
    <div class="cell c_text"><?php echo WORD_19; ?></div>
</div>