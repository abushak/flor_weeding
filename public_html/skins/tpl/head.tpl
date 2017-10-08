<!DOCTYPE html>
<html lang="<?php echo LANG; ?>">
<head>
    <meta charset="utf-8">
    <title><?php echo $title; ?> &mdash; <?php echo config('sitename_'.$lang_id); ?></title>

    <meta name="description" content="<?php echo $description; ?>">
    <meta name="keywords" content="<?php echo $keywords; ?>">

    <link href="http://florpeople.com/skins/image/icon.png" rel="icon" />

    <link rel="stylesheet" type="text/css" href="<?php echo SKIN; ?>css/style.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script defer="" type="text/javascript" src="<?php echo SKIN; ?>js/top.js"></script>
    <script src="https://api-maps.yandex.ru/2.0-stable/?load=package.map&lang=ru-RU"type="text/javascript"></script>
    <script defer="" type="text/javascript" src="<?php echo SKIN; ?>js/mask.js"></script>
    <script defer="" type="text/javascript" src="<?php echo SKIN; ?>js/custom.js"></script>
    <script>
		(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
		  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
		  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
		})(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

		ga('create', 'UA-69632960-1', 'auto');
		ga('send', 'pageview');
    </script>
<!-- Facebook Pixel Code -->
<script>
!function(f,b,e,v,n,t,s){if(f.fbq)return;n=f.fbq=function(){n.callMethod?
n.callMethod.apply(n,arguments):n.queue.push(arguments)};if(!f._fbq)f._fbq=n;
n.push=n;n.loaded=!0;n.version='2.0';n.queue=[];t=b.createElement(e);t.async=!0;
t.src=v;s=b.getElementsByTagName(e)[0];s.parentNode.insertBefore(t,s)}(window,
document,'script','https://connect.facebook.net/en_US/fbevents.js');
fbq('init', '1452953041405400'); // Insert your pixel ID here.
fbq('track', 'PageView');
</script>
<noscript><img height="1" width="1" style="display:none"
src="https://www.facebook.com/tr?id=1452953041405400&ev=PageView&noscript=1"
/></noscript>
<!-- DO NOT MODIFY -->
<!-- End Facebook Pixel Code -->
    <?php if ($dir == "main") { ?>
    <link rel="stylesheet" type="text/css" href="<?php echo SKIN; ?>css/index.css">
    <link rel="stylesheet" type="text/css" href="<?php echo SKIN; ?>css/catalog.css">
    <script defer="" type="text/javascript" src="<?php echo SKIN; ?>js/slider.js"></script>
    <?php };

    if ($dir == "vip") { ?>
    <link rel="stylesheet" type="text/css" href="<?php echo SKIN; ?>css/vip.css">
    <?php };

    if ($dir == "mydates") { ?>
    <link rel="stylesheet" type="text/css" href="<?php echo SKIN; ?>css/jquery-ui.css">
    <script defer="" type="text/javascript" src="<?php echo SKIN; ?>js/jquery-ui.js"></script>
    <script defer="" type="text/javascript" src="<?php echo SKIN; ?>js/jquery-ui-timepicker.js"></script>
    <script defer="" type="text/javascript" src="<?php echo SKIN; ?>js/jquery.ui.datepicker-ru.js"></script>
    <?php };

    if ($dir == "news") { ?>
    <link rel="stylesheet" type="text/css" href="<?php echo SKIN; ?>css/allnews.css">
    <script defer="" type="text/javascript" src="<?php echo SKIN; ?>js/news.js"></script>
    <?php };

    if ($dir == "about" || $dir == "gifts" || $dir == "pay_del" || ($dir == "news" && !empty($route[2]) && !$_GET)) { ?>
    <link rel="stylesheet" type="text/css" href="<?php echo SKIN; ?>css/about.css">
    <?php };

    if ($dir == "reviews") { ?>
    <link rel="stylesheet" type="text/css" href="<?php echo SKIN; ?>css/reviews.css">
    <?php };

    if ($dir == "shop") { ?>
    <link rel="stylesheet" type="text/css" href="<?php echo SKIN; ?>css/product.css">
    <script defer="" type="text/javascript" src="<?php echo SKIN; ?>js/product.js"></script>
    <?php if (empty($route[3]) || $_GET) { ?>
    <link rel="stylesheet" type="text/css" href="<?php echo SKIN; ?>css/catalog.css">
    <link rel="stylesheet" type="text/css" href="<?php echo SKIN; ?>css/ion.rangeSlider.css">
    <script defer="" type="text/javascript" src="<?php echo SKIN; ?>js/shop.js"></script>
    <script defer="" type="text/javascript" src="<?php echo SKIN; ?>js/ion.rangeSlider.js"></script>
    <?php }  else { ?>
    <link rel="stylesheet" type="text/css" href="<?php echo SKIN; ?>css/additional.css">
    <link rel="stylesheet" type="text/css" href="<?php echo SKIN; ?>css/gifts.css">
    <?php } ?>
    <?php };

    if ($dir == "search") { ?>
    <link rel="stylesheet" type="text/css" href="<?php echo SKIN; ?>css/catalog.css">
    <link rel="stylesheet" type="text/css" href="<?php echo SKIN; ?>css/product.css">
    <script defer="" type="text/javascript" src="<?php echo SKIN; ?>js/shop.js"></script>
    <script defer="" type="text/javascript" src="<?php echo SKIN; ?>js/product.js"></script>
    <?php };

    if ($dir == "userorder" && empty($route[2])) { ?>
    <link rel="stylesheet" type="text/css" href="<?php echo SKIN; ?>css/order.css">
    <link rel="stylesheet" type="text/css" href="<?php echo SKIN; ?>css/jquery-ui.css">
    <script defer="" type="text/javascript" src="<?php echo SKIN; ?>js/jquery-ui.js"></script>
    <script defer="" type="text/javascript" src="<?php echo SKIN; ?>js/jquery-ui-timepicker.js"></script>
    <script defer="" type="text/javascript" src="<?php echo SKIN; ?>js/jquery.ui.datepicker-ru.js"></script>
    <?php };


    if ($dir == "userorder" && !empty($route[2])) { ?>
    <link rel="stylesheet" type="text/css" href="<?php echo SKIN; ?>css/done.css">
    <?php };

    if ($dir == "cart") { ?>
    <link rel="stylesheet" type="text/css" href="<?php echo SKIN; ?>css/additional.css">
    <link rel="stylesheet" type="text/css" href="<?php echo SKIN; ?>css/gifts.css">
    <link rel="stylesheet" type="text/css" href="<?php echo SKIN; ?>css/cart.css">
    <script defer="" type="text/javascript" src="<?php echo SKIN; ?>js/custom.additional.js"></script>
    <?php };

    if ($dir == "contacts") { ?>
    <link rel="stylesheet" type="text/css" href="<?php echo SKIN; ?>css/contacts.css">
    <?php };

    if ($dir == "partners") { ?>
    <link rel="stylesheet" type="text/css" href="<?php echo SKIN; ?>css/partners.css">
    <?php };

    if ($dir == "calendar") { ?>
    <link rel="stylesheet" type="text/css" href="<?php echo SKIN; ?>css/calendar.css">
    <?php };
    if ($dir == "for_companies" || $dir == "services") { ?>
    <link rel="stylesheet" type="text/css" href="<?php echo SKIN; ?>css/company.css">
    <?php };

    if ($dir == "order" && empty($route[2])) { ?>
    <link rel="stylesheet" type="text/css" href="<?php echo SKIN; ?>css/order.css">
    <link rel="stylesheet" type="text/css" href="<?php echo SKIN; ?>css/jquery-ui.css">
    <script defer="" type="text/javascript" src="<?php echo SKIN; ?>js/jquery-ui.js"></script>
    <script defer="" type="text/javascript" src="<?php echo SKIN; ?>js/jquery-ui-timepicker.js"></script>
    <script defer="" type="text/javascript" src="<?php echo SKIN; ?>js/jquery.ui.datepicker-ru.js"></script>
    <?php };

    if ($dir == "order" && !empty($route[2])) { ?>
    <link rel="stylesheet" type="text/css" href="<?php echo SKIN; ?>css/done.css">
    <?php };

    if ($dir == "auth") { ?>
    <link rel="stylesheet" type="text/css" href="<?php echo SKIN; ?>css/auth.css">
    <?php };

    if ($dir == "reg") { ?>
    <link rel="stylesheet" type="text/css" href="<?php echo SKIN; ?>css/reg.css">
    <?php };

    if ($dir == "forgot") { ?>
    <link rel="stylesheet" type="text/css" href="<?php echo SKIN; ?>css/auth.css">
    <?php };

    if ($dir == "accept") { ?>
    <link rel="stylesheet" type="text/css" href="<?php echo SKIN; ?>css/accept.css">
    <?php };

    if ($dir == "weddings") { ?>
    <link rel="stylesheet" type="text/css" href="<?php echo SKIN; ?>css/smartphoto.min.css">
    <script defer="" type="text/javascript" src="<?php echo SKIN; ?>js/jquery-smartphoto.min.js"></script>
    <?php };

    if ($dir == "404") { ?>
    <link rel="stylesheet" type="text/css" href="<?php echo SKIN; ?>css/404.css">
    <?php } ?>
    <link rel="stylesheet" type="text/css" href="<?php echo SKIN; ?>css/custom.css">
    <script defer="" type="text/javascript">
        var SRV = "<?php echo SRV; ?>";
        var HL = "<?php echo HREFLANG; ?>";
        var CODE = "<?php echo $_lang_code; ?>";
        var USER_ID = "<?php echo $_SESSION['USER_ID']; ?>";

        var PASS_NOT_MATCH = "<?php echo PASS_NOT_MATCH; ?>";
        var NOT_ALL_REQUIRED = "<?php echo NOT_ALL_REQUIRED; ?>";
        var CURRENCY_NAME = "<?php echo $site_currency['abbr']; ?>";

        <?php $_USD = config("usd"); ?>
        <?php $_EU = 20; ?>
        var USD = "<?php echo $_USD; ?>";
        var EU = "<?php echo $_EU; ?>";

        var PAGE = "<?php echo $_GET["pg"]; ?>";
        var SORT = "<?php echo $_GET["sort_by"]; ?>";
        var MIN_PRICE = "<?php echo $_GET["min_price"]; ?>";
        var MAX_PRICE = "<?php echo $_GET["max_price"]; ?>";
        var RT1 = "<?php echo $route[1]; ?>";
        var RT2 = "<?php echo (empty($route[2]) || (empty($route[3]) && $_GET)) ? "" : $route[2]; ?>";

        <?php $page_for_catalog = (empty($route[2]) || (empty($route[3]) && $_GET)) ? "" : "{$route[2]}/"; ?>
        var LINK = "<?php echo SRV_."shop/".$page_for_catalog?>";

        var WORD_1 = "<?php echo WORD_1; ?>";
    </script>
</head>
<body>
    <a name="top"></a>
    <input name="popup" id="popup_none" type="radio"/>

