<?php if ($_POST) { ?>
<?php $_Orders = new Orders(); 
//"INSERT INTO `zet_orders` (`status`,`delivery_metnod`,`payment_method`,`date`,`rdate`,`ftime`,`ttime`,`photos`,`card`,`card_text`)
         
$query = $mysql->query("SELECT `status`,`delivery_metnod`,`payment_method`,`date`,`rdate`,`ftime`,`ttime`,`photos`,`card`,`card_text`
                         FROM `zet_orders` 
                         WHERE `id`='".$_SESSION['orderid']."'
                         ");
$data = $mysql->assoc($query); 
$order = $_SESSION['orderid'];
 ?>
<?php $public_key = "i69841769747"; ?>
<?php $private_key = "vsnoAl1UPhsX2wKbJaua1iPWmt742QX2TnFl0JSZ"; ?>
<?php $liqpay = new LiqPay($public_key, $private_key); ?>
<?php $html = $liqpay->cnb_form(array("version" => "3", "amount" => $_Orders->GetFinalPrice($order), "currency" => "UAH", "description" => WORD_59." №{$order}", "order_id" => "order_{$order}", "pay_way" => "card,liqpay", "result_url" => SRV_."userorder/success", "server_url" => SRV."adminside/bin/ajax.php?function=liqpay")); ?>

<div class="pathway wbody">
    <ul>
        <li><a href="<?php echo SRV_; ?>"><?php echo WORD_54; ?></a></li>
        <li><a href="<?php echo SRV_."shop"; ?>"><?php echo WORD_55; ?></a></li>
        <li><a href="<?php echo SRV_."cart"; ?>"><?php echo WORD_46; ?></a></li>
        <li><a href="<?php echo SRV_."order"; ?>"><?php echo WORD_72; ?></a></li>
    </ul>
</div>

<div class="wbody done">
    <div class="img"></div>
    <h3><?php echo WORD_100; ?></h3>
    <p><?php echo WORD_101; ?></p>
    <p><?php echo GetPaymentMethodDescription($data["payment_method"]); ?></p>
    <?php if ($data["payment_method"] == 1) { ?>
    <div style="margin: 10px; padding: 0px; width: 100%;">
        <div class="lp"><a href="<?php echo $html; ?>"><?php echo WORD_109; ?></a></div>
    </div>
    <?php } ?>
    <p><a href="<?php echo SRV_; ?>"><?php echo WORD_102; ?></a></p>

    <div style="width: <?php echo ($data["payment_method"] == 1) ? "540px" : "540px"; ?>;">
        <div class="o"><?php echo WORD_59.' №'.$order; ?><br /><?php echo WORD_103; ?></div>
        <div class="p"><span><?php echo $_Orders->GetFinalPrice($order); ?></span> <?php echo $site_currency['abbr']; ?></div>
        <div class="pr"><a target="_blank" class="print-order" href="<?php echo SRV."print.php?type=".md5("|confirm|confirm|".date("Y-m-d H"))."&order={$order}"; ?>"><?php echo WORD_104; ?></a></div>
        <div class="d"><a href="#"></a></div>

    </div>
</div>
<script>
jQuery(function($) {
    $("body").on("click", ".print-order", function() {
        var _url = $(this).attr("href");
        
        var w = window.open(_url, "_blank");
        w.print();
        return false;
    });
    
    $("#header .cart .count").text("0");
    $("#header .cart .caption").css("text-decoration", "");
})
</script>
<?php } else redirectTo(SRV_); ?>