<?php $_PagesMain = new PagesMain(); ?>
<?php $page = $_PagesMain->GetPageData($dir); ?>

<?php $_Comments = new Comment(); ?>
<?php $reviews = $_Comments->GetReviewsStore(); ?>

<?php $query = $mysql->query("SELECT `text`,`photo` FROM `zet_chief` WHERE `id`='1'"); ?>
<?php $row = $mysql->assoc($query); ?>
<?php $chief = json_decode($row["text"], true); ?>
<?php $chief = explode("|", $chief[LANG]); ?>

<div class="pathway wbody">
    <ul>
        <li><a href="<?php echo SRV_; ?>"><?php echo WORD_54; ?></a></li>
        <li><a href="<?php echo SRV_."reviews"; ?>"><?php echo $page["title"]; ?></a></li>
    </ul>
</div>

<div class="reviews">
    <div class="bg wmin"></div>
    <div class="review wbody">
        <div>
            <div class="left">
                <div class="img" style="background-image: url(<?php echo FILES."{$row["photo"]}"; ?>);"></div>
                <span class="name"><?php echo $chief[0]; ?><br />
                    <span style="font-size: 12px;"><?php echo $chief[1]; ?></span>
                </span>
                <!-- <span class="nac"><?php echo WORD_24; ?></span> -->
                <p style="text-align: center;"><?php echo WORD_110; ?></p>
            </div>
            
            <div class="right"><?php include TPL."common/review.form.tpl"; ?></div>
        </div>
    </div>
    
    <div class="content wbody">
        <div>
            <h2><?php echo $page["meta_h1"]; ?></h2>
            <?php foreach ($reviews as $key => $val) { ?>
            <div class="review">
                <div><span><?php echo $val["date"]; ?></span><span><?php echo $val["name"]; ?></span></div>
                <p><?php echo $val["text"]; ?></p>
            </div>
            <?php } ?>
        </div>
    </div>
</div>