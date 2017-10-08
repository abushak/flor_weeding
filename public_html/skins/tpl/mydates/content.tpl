<?php 
   if (isset($_POST['image'])){ 
    redirectTO(SRV_."auth"); } else {
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
  padding: 10px 0 10px 10px;
}

.h-row > div.hidden-row2 {
  padding: 10px 0;
}

.h-row , .h-row-top , .add-row , .hidden-row , .hidden-row2 { float: left; width: 100%;}

.add-row {
    background: #fff !important;
    text-align: center;
}

.add-row img {
  margin: 30px 0;
  cursor: pointer;
}

.h-row-top > div:nth-child(1) { width: 30%; color: #fff; }
.h-row-top > div:nth-child(2) { width: 40%; color: #fff; }
.h-row-top > div:nth-child(3) { width: 25%; }

.hidden-row , .hidden-row2 { display: none; }

.hidden-row > div:nth-child(1) ,
.hidden-row2 > div:nth-child(1) { width: 30%;    }

.hidden-row > div:nth-child(2) ,
.hidden-row2 > div:nth-child(2) { width: 40%;      }

.hidden-row > div:nth-child(3) ,
.hidden-row2 > div:nth-child(3) { width: 25%; }

.hidden-row > div:nth-child(3) button ,
.hidden-row2 > div:nth-child(3) button { border: none; background: none; float: right; outline: none; padding: 10px 17px 0 0;}

.hidden-row > div , .hidden-row2 > div { float: left; padding-left: 10px;}

.form .hidden-row input[type="text"] ,
.form .hidden-row2 input[type="text"] {
  width: 70%;
  line-height: normal;
  font-weight: 100;
  font-size: 16px;
  padding: 5px 10px;
  margin: 5px 0;
}

.h-row > div:nth-child(1) { width: 30%; font-size: 14px; line-height: 31px;}
.h-row > div:nth-child(2) { width: 40%; line-height: 31px;}
.h-row > div:nth-child(3) { width: 25%;}
.h-row > div:nth-child(3) img { padding: 0 10px;}
.h-row > div:nth-child(3) button { border: none; background: none; float: right; outline: none;}

</style>
  
    <div class="login">
      
      <div class="titlein">
        <button class="enter" onclick="logout()">Выйти</button>
        <h2>Мои даты</h2>
      </div>

      <div class="psevdo-tabs">
        <p><a href="<?php echo SRV_."myorder"; ?>">Мои заказы</a><img src="skins/image/pink-arrow.png"></p>
        <p><a href="<?php echo SRV_."myhistory"; ?>">История заказов</a><img src="skins/image/pink-arrow.png"></p>
        <p class="active"><a href="<?php echo SRV_."mydates"; ?>">Мои даты</a><img src="skins/image/pink-arrow.png"></p>
        <p ><a href="<?php echo SRV_."profile"; ?>">Мой профиль</a><img src="skins/image/pink-arrow.png"></p>
      </div>
     <div class="form">

    <div class="history">
      <div class="h-row-top">
        <div>Дата</div>
        <div>Событие</div>
      </div>
<?php
 if(isset($_POST['delete'])) $mysql->query("DELETE FROM `zet_user_dates` WHERE `id`='".$_POST['delete']."'");
$query1 = $mysql->query("SELECT * FROM zet_user_dates WHERE userid='".mysql_real_escape_string($data['id'])."'"); 
if(isset($_POST['save'])) $mysql->query("UPDATE zet_user_dates SET `event`='".$_POST['event']."' WHERE `id`='".$_POST['id']."'");
if(isset($_POST['add'])) { 
$val=strtotime(date($_POST['date']));

$mysql->query("INSERT INTO `zet_user_dates` (`id`, `userid`, `event`, `day`, `mounth`,`year` ) VALUES ('',
'".$_SESSION['userid']."',
'".$_POST['event']."',
'".(int)date('d',$val)."',
'".(int)date('m',$val)."',
'".(int)date('Y',$val)."')"); 
redirectTO(SRV_."mydates");
}
while($data2=mysql_fetch_array($query1)){
echo '
        <div class="h-row" >
            <div>'.$data2[day].'/0'.$data2[mounth].'/'.$data2[year].' </div>
            <div>'.$data2[event].'</div>
            <div>
                <form  method="POST">
                        <button type="submit" name="delete" value="'.$data2[id].'" ><img src="/skins/image/del.png"></button></form>
                        <button id="editButton" name="editButton"   value="" ><img src="/skins/image/edit.png"></button>
                
            </div>
        </div>
       
 ';}?>
      <div class="hidden-row2"  id="editRow">
            <form method="POST">   
                <div>
                <input type="text" name="date" id="datepicker1" placeholder="ГГГГ-ММ-ДД" value="">  
                </div>
                <div>
                <input type="text" name="event" placeholder="Событие" value="">
                 </div>
                <div>
                 <button type="submit" name="save"  value="'.$data2[id].'" ><img src="/skins/image/sav.png"></button>
                </div>
                </form>
          </div>
     </div>

      <div class="hidden-row" >
          <form method="POST" >
        <div>
          <input type="text" name="date" id="datepicker"  placeholder="ГГГГ-ММ-ДД" value="">  
           
        </div>
        <div>
          <input type="text" name="event" placeholder="Событие" value="">
        </div>

        <div>
          <button type="submit" name="add" ><img src="/skins/image/sav.png"></button>
        </div> </form>
      </div>

      <div class="add-row">
        <img id="add-item" src="/skins/image/add.png">
      </div>
<script type="text/javascript">
  
$('#add-item').click (function(){
  $('.hidden-row').show();
});
$('#editButton').click (function(){
   $('.hidden-row2').show();
});

</script>
<script>
$(function() {
    $('#editButton').click (function(){
   $('.hidden-row2').show();
     });
   $("#datepicker").datetimepicker({
        minDate: 1,
        dateFormat: "yy-mm-dd",
        showHour: false,
        showMinute: false,
        showSecond: false,
        showMillisec: false,
        showMicrosec: false,
        showTimezone: false,
        showTime: false,
        showButtonPanel: false,
        altField: "#hiddentime"
    });
 })
</script>
<script>
$(function() {
   $("#datepicker1").datetimepicker({
        minDate: 1,
        dateFormat: "yy-mm-dd",
        showHour: false,
        showMinute: false,
        showSecond: false,
        showMillisec: false,
        showMicrosec: false,
        showTimezone: false,
        showTime: false,
        showButtonPanel: false,
        altField: "#hiddentime"
    });
 })
</script>
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