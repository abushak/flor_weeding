<?php 
   if (isset($_POST['image'])){ 
    redirectTO(SRV_."auth"); } else {
   if (isset($_SESSION['useremail'])) {
         
  $query1 = $mysql->query("SELECT `zet_orders_user`.`order_id`,`zet_orders_user`.`name`,`zet_orders_user`.`phone`,`zet_orders_user`.`adress`,`zet_orders_user`.`receiver`,
  (SELECT `zet_orders`.`date` FROM `zet_orders` WHERE `zet_orders_user`.`order_id`=`zet_orders`.`id`  AND zet_orders_user.email='".mysql_real_escape_string($_SESSION['useremail'])."') AS `date`,
  (SELECT `zet_orders`.`rdate` FROM `zet_orders` WHERE `zet_orders_user`.`order_id`=`zet_orders`.`id`  AND zet_orders_user.email='".mysql_real_escape_string($_SESSION['useremail'])."') AS `rdate`,
  (SELECT `zet_orders`.`final_price` FROM `zet_orders` WHERE `zet_orders`.`id`=`order_id`) AS `fp`,
  (SELECT `zet_orders`.`payment_status` FROM `zet_orders` WHERE `zet_orders`.`id`=`order_id`) AS `status`
  
  
  
  
   FROM `zet_orders_user` 
   WHERE `zet_orders_user`.`email`='".mysql_real_escape_string($_SESSION['useremail'])."' "); 
 
   
   
    
     if (isset($_POST['submit'])){ 
     
     $mysql->query("UPDATE `zet_userlist` SET `name`='".$_POST['name']."',`email`='".$_POST['email']."',`password`='".$_POST['password']."',`phone`='".$_POST['phone']."' WHERE `id`='".$_SESSION['userid']."'");
     $view = $mysql->query("SELECT name,email,password,phone FROM zet_userlist WHERE id='".mysql_real_escape_string($_SESSION['userid'])."' LIMIT 1");
     $data = $mysql->assoc($view);
     }
        
    if (isset($_POST['pay'])) {
        
        $ids = $mysql->query("
        SELECT product_id, product_option_id, qty 
        FROM zet_orders_products 
        WHERE order_id='".$_POST['pay']."'
        "); 
        
        $price = $mysql->query("
        SELECT final_price
        FROM zet_orders 
        WHERE id='".$_POST['pay']."'
        "); 
        
        
        
        $dataIds=mysql_fetch_assoc($ids);
        $dataPrice=mysql_fetch_assoc($price);
        $_SESSION['orderid']=$_POST['pay'];
        $_SESSION['option']=$dataIds[product_option_id];
        $_SESSION['productid']=$dataIds[product_id];
        $_SESSION['qty']=$dataIds[qty];
        $_SESSION['price']=$dataPrice[final_price];
        redirectTO(SRV_."userorder");
    } 
   } }
    
        
  // zet_orders_user.email='".mysql_real_escape_string($_SESSION['useremail'])."'
     
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
  background: linear-gradient(to top, #b165c3, #6a3b75);
  color: #fff;
  cursor: pointer;
  font-size: 18px;
}

.butns button:hover,.butns button:active {
   background: linear-gradient(to top, #ee73c1, #8d43bb);
}
.grad {
    background: #fff;
    background: -webkit-linear-gradient(left, #f4f4f4, #fff);
    background: -o-linear-gradient(right, #f4f4f4, #fff);
    background: -moz-linear-gradient(right, #f4f4f4, #fff);
    background: linear-gradient(to right,#f4f4f4, #fff);
    width: 96%;
    float: left;
    padding: 2%;
}

.history > div:first-child {
  background: #fff!important;
}

.h-row > div , .h-row-top > div {
  float: left;
  padding: 10px 0 10px 10px;
}

.h-row > div {

}

.h-row , .h-row-top { float: left; width: 100%;}

.h-row-top > div:nth-child(1) { width: 30%; }
.h-row-top > div:nth-child(2) { width: 40%; }
.h-row-top > div:nth-child(3) { width: 25%; }

.h-row > div:nth-child(1) { width: 30%; font-size: 14px;}
.h-row > div:nth-child(2) { width: 40%;}
.h-row > div:nth-child(3) { width: 25%;}
.h-row > div:nth-child(3) img { float: right; padding: 0 10px;}

.order {
  width: 100%;
}

.number {width: 10%; float: left;}
.number a { text-decoration: underline; margin: 5px 2px 10px; float: left; width: 100%;}
.number p { color: #ccc; font-size: 12px;}

.order-det {
  width: 89%;
  float: left;
  border: 1px solid #eee;
}

.grad > div  {
  width: 46%;
  float: left;
}

.order-det > div b {
    font-weight: 100;
    color: #000;
    background: #fff;
    padding: 1px 6px;
    margin-left: 5px;
}

.order-det > div b.active {
    background: pink;
    color: #fff;
}

.price {
  text-align: right;
}

.price b {
  font-size: 30px;
  color: #f93a6e!important;
  background: none!important;
  margin: 0!important;
  padding: 0!important;
}

.price p {
  font-size: 12px;
}






</style>
  
    <div class="login">
      
      <div class="titlein">
        <button class="enter" onclick="logout()">Выйти</button>
        <h2>Мои заказы</h2>
      </div>

      <div class="psevdo-tabs">
        <p class="active"><a href="<?php echo SRV_."myorder"; ?>">Мои заказы</a><img src="skins/image/pink-arrow.png"></p>
        <p><a href="<?php echo SRV_."myhistory"; ?>">История заказов</a><img src="skins/image/pink-arrow.png"></p>
        <p><a href="<?php echo SRV_."mydates"; ?>">Мои даты</a><img src="skins/image/pink-arrow.png"></p>
        <p ><a href="<?php echo SRV_."profile"; ?>">Мой профиль</a><img src="skins/image/pink-arrow.png"></p>
      </div>
    <div class="form">
  
     
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
        
        $qimg=$mysql->query("SELECT `picture` FROM `zet_product` WHERE `id`='".$pC[product_id]."'");
        $data4=mysql_fetch_assoc($qimg);
        
       echo 
         '<form  method="POST">
         <div class="order">
         <div class="number">
            <a>'.$data1[order_id].'</a>
            <p>'.$data1[date].'<br></p>
         </div>
    
        <div class="order-det">
            <div class="grad">
                <div>
                     <p>'.$data2['title'].'</p>
                     <b class="active">'.$data3[name].'</b>            
                </div>
           
            <div class="price">
                <b>'.$data1[fp].' грн</b>';
                if ($data1['status']==1) echo '<p>Оплачен</p>'; else echo '<p>Ожидается оплата</p>
           </div>
        </div>

        <div>
            <div style="width:40%; display:inline-block; vertical-align:middle; text-align: center">
                <img style=" padding: 5px; border: 1px solid #eeedee;" src="'.FILES.'/products/'.$data4[picture].'";">
           </div>

            <div style="width:55%; display:inline-block; vertical-align:middle;">
                <p>Событие:</p>
                <input type="text" placeholder="Событие" value="">
                <p>Адресат (имя/номер телефона):</p>
                <input type="text" placeholder="имя/номер" value="'.$data1[name].' '.$data1[phone].'">
                <p>Адрес доставки:</p>
                <input type="text" placeholder="Адрес" value="'.$data1[adress].'">
                <p>Дата и Время доставки:</p>
                <input type="text" placeholder="Дата и Время" value="'.$data1[rdate].'">
            </div>
        </div>

        <div class="butns">
          <button type="submit" name="edit" value="'.$data1[order_id].'" >Изменить</button>
          <button type="submit" name="pay"  value="'.$data1[order_id].'">Оплатить</button></form>
        </div>


        </div>
        
      </div>'; }
      else {
         $pss='';
         $arr = array();
         while($pC=mysql_fetch_array($products)) {
            $qtitle=$mysql->query("SELECT `zet_product_description`.`title` FROM `zet_product_description` WHERE `zet_product_description`.`product_id`='".$pC[product_id]."' AND `language_id`='1' ");
            $data2=mysql_fetch_assoc($qtitle);
            $pss=$data2['title'].'<br>'.$pss;
         }
         
         //mysql_data_seek($products, 0);
         //while($pCC=mysql_fetch_array($products)) {
          //echo $pss;
         //}
         
        $qsize=$mysql->query("SELECT `zet_product_option_description`.`name` FROM `zet_product_option_description` WHERE `zet_product_option_description`.`product_id` ='".$pC[product_id]."' AND `zet_product_option_description`.`option_id` ='".$pC[product_option_id]."' AND  `language_id`='1'");
        $data3=mysql_fetch_assoc($qsize);
         
         echo 
         '<form  method="POST">
         <div class="order">
         <div class="number">
            <a>'.$data1[order_id].'</a>
            <p>'.$data1[date].'<br></p>
         </div>
    
        <div class="order-det">
            <div class="grad">
                <div>
                     <p>Цена Вашего заказа:</p>            
                </div>
           
            <div class="price">
                <b>'.$data1[fp].' грн</b>';
                if ($data1['status']==1) echo '<p>Оплачен</p>'; else echo '<p>Ожидается оплата</p>
           </div>
        </div>

        <div>
            <div style="width:40%; display:inline-block; vertical-align:middle; text-align: center">
                <p>'.$pss.'</p>
           </div>

            <div style="width:55%; display:inline-block; vertical-align:middle;">
                <p>Событие:</p>
                <input type="text" placeholder="Событие" value="">
                <p>Адресат (имя/номер телефона):</p>
                <input type="text" placeholder="имя/номер" value="'.$data1[name].' '.$data1[phone].'">
                <p>Адрес доставки:</p>
                <input type="text" placeholder="Адрес" value="'.$data1[adress].'">
                <p>Дата и Время доставки:</p>
                <input type="text" placeholder="Дата и Время" value="'.$data1[rdate].'">
            </div>
        </div>

        <div class="butns">
          <button type="submit" name="edit" value="'.$data1[order_id].'" >Изменить</button>
          <button type="submit" name="pay"  value="'.$data1[order_id].'">Оплатить</button></form>
        </div>


        </div>
        
      </div>';
         
      }
      
}
      ?>

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