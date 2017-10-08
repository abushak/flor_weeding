<?php $_PagesStatic = new PagesStatic(); ?>
<?php $page = $_PagesStatic->GetPageData($dir); ?>

<div class="pathway wbody">
    <ul>
        <li><a href="<?php echo SRV_; ?>"><?php echo WORD_54; ?></a></li>
        <li><a href="<?php echo SRV_."vip"; ?>"><?php echo $page['title']; ?></a></li>
    </ul>
</div>

<div class="wmin slider">
    <div class="slide show wbody">
        <div class="wbody half">
            <h4 style="width: 510px;"><?php echo $page['meta_h1']; ?></h4>
            <p><?php echo $page['description']; ?></p>
            <a rel="vip"><?php echo WORD_65; ?></a>
        </div>
    </div>
</div>

<div class="content wbody">
    <div class="text">
        <h2><?php echo $page['meta_h1']; ?></h2>
        <p><?php echo $page['description']; ?></p>
    </div>
    <div class="form">
        <form class="formmini" action="<?php SRV_."{$route[1]}/"; ?>" method="POST">
            <h2><?php echo WORD_66; ?></h2>
            <input type="text" placeholder="<?php echo WORD_67; ?>" />
            <input type="password" placeholder="<?php echo WORD_68; ?>" />
            <!-- <a href=""><?php echo WORD_69; ?></a> -->
            <button type="submit"><?php echo WORD_70; ?></button>
        </form>
    </div>
</div>

<div class="zopa_s_ruchkoy">
    <form class="formmini vip-request show">
        <h2><?php echo WORD_120; ?></h2>
        <input type="text" name="name" class="vip-required" placeholder="<?php echo WORD_39; ?>" />
        <input type="text" name="email" class="vip-required" placeholder="<?php echo WORD_81; ?>" />
        <input type="text" name="phone" class="vip-required phone-mask" placeholder="<?php echo WORD_40; ?>" />
        
        <button type="submit"><?php echo WORD_22; ?></button>
        <a class="close-vip"><?php echo WORD_42; ?></a>
        <label class="close close-vip" style="cursor: pointer;"></label>
    </form>
    <div class="vip-success">
        <div class="img"></div>
        <span><?php echo WORD_121; ?></span>
        <p><?php echo WORD_123; ?></p>
        <a class="close-vip" rel="close" style="cursor: pointer;"><?php echo WORD_122; ?></a>
    </div>
</div>