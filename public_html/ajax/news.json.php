<?php
$_News = new PublicationsNews();
$news = $_News->GetNewsList();

$data["page"] = 1;
#$data["social"][]["html"] = '<iframe name="f2907800c" frameborder="0" scrolling="no" title="fb:like_box Facebook Social Plugin" src="http://www.facebook.com/plugins/like_box.php?app_id=379671895415433&amp;channel=http%3A%2F%2Fstatic.ak.facebook.com%2Fconnect%2Fxd_arbiter.php%3Fversion%3D28%23cb%3Df1c7206f38%26domain%3Dnews.kulik.dtkt.com.ua%26origin%3Dhttp%253A%252F%252Fnews.kulik.dtkt.com.ua%252Ff1bf1cb9f%26relation%3Dparent.parent&amp;color_scheme=light&amp;header=false&amp;height=300&amp;href=https%3A%2F%2Fwww.facebook.com%2Fdtkt.com.ua&amp;locale=ru_RU&amp;sdk=joey&amp;show_border=true&amp;show_faces=true&amp;stream=false&amp;width=300" style="border: none; visibility: visible; width: 213px; height: 300px; background: white"></iframe>';
/*
$data["social"][]["html"] = <<<EOF
<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/uk_UA/sdk.js#xfbml=1&version=v2.3&appId=1435014963437430";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
<div class="fb-page" data-href="https://www.facebook.com/FlorPeople" data-width="280" data-height="300" data-hide-cover="false" data-show-facepile="true" data-show-posts="false"><div class="fb-xfbml-parse-ignore"><blockquote cite="https://www.facebook.com/FlorPeople"><a href="https://www.facebook.com/FlorPeople">FLOR People</a></blockquote></div></div>
EOF;
$data["social"][]["html"] = <<<EOF
<script type="text/javascript" src="//vk.com/js/api/openapi.js?116"></script>
<div id="vk_groups"></div>
<script type="text/javascript">
VK.Widgets.Group("vk_groups", {mode: 0, width: "213", height: "300", color1: 'FFFFFF', color2: '2B587A', color3: '5B7FA6'}, 71334695);
</script>
EOF;
#'<iframe frameborder="0" src="https://vk.com/widget_community.php?app=1936057&amp;width=213px&amp;_ver=1&amp;gid=20003922&amp;mode=0&amp;color1=FFFFFF&amp;color2=2B587A&amp;color3=5B7FA6&amp;class_name=&amp;height=300&amp;url=https%3A%2F%2Fvk.com%2Fdev%2FCommunity%3Fheight%3D400%26link%3Dhttp%253A%252F%252Fvk.com%252Fpublic20003922%26mode%3D0%26oid%3D-20003922%26wide%3D%26width%3D220&amp;14a463a27af" width="213" height="300" scrolling="no" id="vkwidget15" style="overflow: hidden; height: 300px;"></iframe>';
*/
$data["social"][]["html"] = '<iframe frameborder="0" src="https://vk.com/widget_community.php?gid=71334695&width=213&height=300" width="213" height="300" scrolling="no" id="vkwidget15" style="overflow: hidden; height: 300px;"></iframe>';
$data["news"] = $news;
$json = json_encode($data);
echo $json;