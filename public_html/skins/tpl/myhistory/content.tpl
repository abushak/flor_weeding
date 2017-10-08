<?php 
   if (isset($_POST['image'])){ 
    redirecTO(SRV_."auth"); } else {
   if (isset($_SESSION['useremail'])) {
     
  
         
  $query1 = $mysql->query("SELECT `zet_orders_user`.`order_id`,`zet_orders_user`.`name`,`zet_orders_user`.`phone`,`zet_orders_user`.`adress`,`zet_orders_user`.`receiver`,
  (SELECT `zet_orders`.`date` FROM `zet_orders` WHERE `zet_orders_user`.`order_id`=`zet_orders`.`id`  AND zet_orders_user.email='".mysql_real_escape_string($_SESSION['useremail'])."') AS `date`,
  (SELECT `zet_orders`.`rdate` FROM `zet_orders` WHERE `zet_orders_user`.`order_id`=`zet_orders`.`id`  AND zet_orders_user.email='".mysql_real_escape_string($_SESSION['useremail'])."') AS `rdate`,
  
  (SELECT `zet_orders`.`final_price` FROM `zet_orders` WHERE `zet_orders`.`id`=`order_id`) AS `fp`,
  (SELECT `zet_orders`.`status` FROM `zet_orders` WHERE `zet_orders`.`id`=`order_id`) AS `status`
  
  
  
  
  
  
   FROM `zet_orders_user` 
   WHERE `zet_orders_user`.`email`='".mysql_real_escape_string($_SESSION['useremail'])."' "); 
   
   $query2=$mysql->query("SELECT `zet_product_description`.`title` FROM `zet_product_description` WHERE `zet_product_description`.`product_id`='86' AND `language_id`='1' ");
 
        }
   } 
    
        
   
     
?>


<div class="pathway wbody">
    <ul>
        <li><a href="<?php echo SRV_; ?>"><?php echo WORD_54; ?></a></li>
        <li><a href="<?php echo SRV_."auth"; ?>"><?php echo ("Вход"); ?></a></li>
    </ul>
</div>

<style type="text/css">
  .login {
	width: 80%;
	margin: 60px auto;
	border: 1px solid #e7e7e7;
	
}

.form {
    width: 70%;
    display: inline-block;
    vertical-align: top;
}

.psevdo-tabs {
    width: 25%;
    display: inline-block;
    vertical-align: middle;
}


.form input[type="text"] , .form input[type="password"] , .form input[type="email"] , .form input[type="telephone"] {
	line-height: 46px;
	width: 80%;
	padding: 0 20px;
	font-size: 20px;
	border: 1px solid #dfdfdf;
	background: linear-gradient(to top, #edeced, #faf9f9);
	margin-bottom: 5px;
}

.form p {
	margin: 0 0 5px;
	font-size: 18px;
}

.psevdo-tabs {
	text-align: left;
  color: #b8b8b8;
  font-size: 22px;
  margin-left: 25px;
  font-family: geometria;
}

.psevdo-tabs a { text-decoration: none; color: #b8b8b8;  }

.psevdo-tabs p { padding: 5px 10px; width: 200px; margin: 10px 0; }

.psevdo-tabs img {
    float: right;
    margin: -5px -25px 0 0;
    height: 38px;
    display: none;
}

.psevdo-tabs p.active a { color: #fff; }
.psevdo-tabs p.active { background: #ab62bd; }
.psevdo-tabs p.active img { display: block; }

.titlein {
	width: 100%;
	float: left;
}

.titlein h2 {
    font-size: 26px;
    text-align: center;
    font-weight: normal;
    margin: 10px 0;
}

.enter {
	position: absolute;
	padding: 15px 35px 15px 15px;
	text-transform:uppercase; 
	background-image: url(http://images.vectorhq.com/images/thumbs/ace/exit-icon-106771.png);
	background-size: 35px 35px;
	background-position: 75px;
  background-repeat: no-repeat;
  color: #A7A9AC;
  background-color: #fff;
  border: none;
}

.butns {
	text-align: center;
	padding: 25px 0 30px;
}

.butns button {
	padding: 10px 20px;
	width: 25%;
	border:none;
	background: linear-gradient(to top, #f75233, #fb5382);
	color: #fff;
	cursor: pointer;
	font-size: 18px;
}

.history > div:nth-child(2n) {
    background: #fff;
    background: -webkit-linear-gradient(left, #f4f4f4, #fff);
    background: -o-linear-gradient(right, #f4f4f4, #fff);
    background: -moz-linear-gradient(right, #f4f4f4, #fff);
    background: linear-gradient(to right,#f4f4f4, #fff);
}

.history > div {
    background: #fff;
    background: -webkit-linear-gradient(left, #fff, #f4f4f4);
    background: -o-linear-gradient(right, #fff, #f4f4f4);
    background: -moz-linear-gradient(right, #fff, #f4f4f4);
    background: linear-gradient(to right,#fff, #f4f4f4);
}

.history > div:first-child {
	background: #7d3290!important;
}

.h-row > div , .h-row-top > div {
	float: left;
	text-align: center;
	padding: 10px 0;
}

.h-row > div {
	text-align: center;
}

.h-row , .h-row-top { float: left; width: 100%;}

.h-row-top > div:nth-child(1) { width: 10%; color:#fff; }
.h-row-top > div:nth-child(2) { width: 15%;color:#fff; }
.h-row-top > div:nth-child(3) { width: 20%;  color:#fff;}
.h-row-top > div:nth-child(4) { width: 15%;color:#fff; }
.h-row-top > div:nth-child(5) { width: 30%;color:#fff; }
.h-row-top > div:nth-child(6) { width: 10%; color:#fff;}

.h-row > div:nth-child(1) { width: 10%; font-size: 14px; line-height: 38px}
.h-row > div:nth-child(2) { width: 15%; line-height: 38px} .h-row > div:nth-child(2) b { font-size: 14px; font-weight: 100; }
.h-row > div:nth-child(3) { width: 20%; line-height: 38px}
.h-row > div:nth-child(3) b { font-weight: 100; background: pink; color: #fff; padding: 1px 6px; margin-left: 5px;}
.h-row > div:nth-child(4) { width: 15%;  color: #f93a6e; line-height: 38px} .h-row > div:nth-child(4) b { font-size: 22px; font-weight: 100;}
.h-row > div:nth-child(5) { width: 30%;  text-align: left;}
.h-row > div:nth-child(6) { width: 10%;  line-height: 38px}

</style>
  
    <div class="login">
      
      <div class="titlein">
        <button class="enter" onclick="logout()">Выйти</button>
        <h2>История заказов</h2>
      </div>

      <div class="psevdo-tabs">
        <p><a href="<?php echo SRV_."myorder"; ?>">Мои заказы</a><img src="skins/image/pink-arrow.png"></p>
        <p class="active"><a href="<?php echo SRV_."myhistory"; ?>">История заказов</a><img src="skins/image/pink-arrow.png"></p>
        <p><a href="<?php echo SRV_."mydates"; ?>">Мои даты</a><img src="skins/image/pink-arrow.png"></p>
        <p ><a href="<?php echo SRV_."profile"; ?>">Мой профиль</a><img src="skins/image/pink-arrow.png"></p>
      </div>
     <div class="form">

		<div class="history">
			<div class="h-row-top">
				<div>№ заказа</div>
				<div>Дата</div>
				<div>Заказ</div>
				<div>Стоимость</div>
				<div>Доставка</div>
				<div>Статус</div>
			</div>
        <?php 
    
    
    while($data1=mysql_fetch_array($query1)){
    $products=$mysql->query("SELECT * FROM `zet_orders_products` WHERE `order_id`=$data1[order_id]");
       $rows = mysql_num_rows($products);
       if ( $rows == 1) {
       
        $pC=mysql_fetch_assoc($products);
       
        $qtitle=$mysql->query("SELECT `zet_product_description`.`title` FROM `zet_product_description` WHERE `zet_product_description`.`product_id`='".$pC[product_id]."' AND `language_id`='1' ");
        $data2=mysql_fetch_assoc($qtitle);
        
        $qsize=$mysql->query("SELECT `zet_product_option_description`.`name` FROM `zet_product_option_description` WHERE `zet_product_option_description`.`product_id` ='".$pC[product_id]."' AND `zet_product_option_description`.`option_id` ='".$pC[product_option_id]."' AND  `language_id`='1'");
        $data3=mysql_fetch_assoc($qsize);
        
       if ($data1['status']==4) 
    echo 
      
			'<div class="h-row">
				<div>'.$data1[order_id].'</div>
				<div><b>'.$data1[date].'</b></div>
				<div>'.$data2[title].'<b>'.$data3[name].'</b></div>
				<div><b>'.$data1[fp].'</b> грн</div>
				<div>'.$data1[rdate].'     <br>'.$data1[adress].'</div>
				<div>Выполнен</div>
			</div>';}
                         else { $pss='';
                         $arr = array();
                     while($pC=mysql_fetch_array($products)) {
            $qtitle=$mysql->query("SELECT `zet_product_description`.`title` FROM `zet_product_description` WHERE `zet_product_description`.`product_id`='".$pC[product_id]."' AND `language_id`='1' ");
            $data4=mysql_fetch_assoc($qtitle);
            $qsize=$mysql->query("SELECT `zet_product_option_description`.`name` FROM `zet_product_option_description` WHERE `zet_product_option_description`.`product_id` ='".$pC[product_id]."' AND `zet_product_option_description`.`option_id` ='".$pC[product_option_id]."' AND  `language_id`='1'");
        $data3=mysql_fetch_assoc($qsize);
            $pss=$data4['title'].'<br>'.$pss;
              }
                    echo   
                       '<div class="h-row">
				<div>'.$data1[order_id].'</div>
				<div><b>'.$data1[date].'</b></div>
				<div>'.$pss.'<b>'.$data3[name].'</b></div>
				<div><b>'.$data1[fp].'</b> грн</div>
				<div>'.$data1[rdate].'     <br>'.$data1[adress].'</div>
				<div>Выполнен</div>
			</div>';
                   }  }   
                        ?>

			
		</div>

     </div>
</div>
  
<script>
function logout(){
	function delete_cookie( name ) {
	  document.cookie = name + '=; expires=Thu, 01 Jan 1970 00:00:01 GMT;';
	  this.document.location.href = '/auth';
	}
	delete_cookie('PHPSESSID');
}
</script>
</html>