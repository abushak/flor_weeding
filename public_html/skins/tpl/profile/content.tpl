<?php 
   if (isset($_POST['image'])){ 
    redirecTO(SRV_."auth"); } else {
   if (isset($_SESSION['useremail'])) {
     
   $query = $mysql->query("SELECT id,name,email,password,phone FROM zet_userlist WHERE email='".mysql_real_escape_string($_SESSION['useremail'])."' LIMIT 1");
    $data = $mysql->assoc($query);
     if (isset($_POST['submit'])){ 
    $mysql->query("UPDATE `zet_userlist` SET `name`='".$_POST['name']."',`email`='".$_POST['email']."',`password`='".$_POST['password']."',`phone`='".$_POST['phone']."' WHERE `id`='".$_SESSION['userid']."'");
     $view = $mysql->query("SELECT name,email,password,phone FROM zet_userlist WHERE id='".mysql_real_escape_string($_SESSION['userid'])."' LIMIT 1");
     $data = $mysql->assoc($view);
        }
   } }
    
        
   
     
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
	min-width: 1020px;
}

.form , .psevdo-tabs {
    width: 43.8%;
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
</style>
  
    <div class="login">
      
      <div class="titlein">
        <button class="enter" onclick="logout()">Выйти</button>
        <h2>Мой профиль</h2>
      </div>

      <div class="psevdo-tabs">
        <p><a href="<?php echo SRV_."myorder"; ?>">Мои заказы</a><img src="skins/image/pink-arrow.png"></p>
        <p><a href="<?php echo SRV_."myhistory"; ?>">История заказов</a><img src="skins/image/pink-arrow.png"></p>
        <p><a href="<?php echo SRV_."mydates"; ?>">Мои даты</a><img src="skins/image/pink-arrow.png"></p>
        <p class="active"><a href="profile">Мой профиль</a><img src="skins/image/pink-arrow.png"></p>
      </div>
     <div class="form">
          <form method="POST">
        <p>Имя</p>
        <input type="text" name="name"  value="<?php echo $data['name']?>">
        <p>Мобильный телефон</p>
        <input type="telephone" name="phone" value="<?php echo $data['phone']?>">
        <p>Эл. почта:</p>
        <input type="email" name="email" value="<?php echo $data['email']?>">
        <p>Изменить пароль</p>
        <input type="password" name="password" value="<?php echo $data['password']?>">

        
      </div>
      
      <div class="butns">
        <button type="sumit" name="submit">Изменить профиль</button>
      </div>
        </form>
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