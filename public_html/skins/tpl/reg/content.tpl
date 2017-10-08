<?php

if(isset($_POST['submit'])) 
          
   {  
      $query = $mysql->query("SELECT id, email FROM zet_userlist WHERE email='".mysql_real_escape_string($_POST['user_email'])."' LIMIT 1");
            $data1 = $mysql->assoc($query);
            
            if(($_POST['user_password']) != ($_POST['user_password1'])) {
                 
              $not="Пароли не совпадают";
            } 
             else {
              if($data1['email'] != ($_POST['user_email']) && !empty($_POST['user_email'])){ 
                 
              $_date = date('Y-m-d'); 
                $mysql->query("INSERT INTO zet_userlist (`id`, `name`,  `email`, `password`, `phone`, `register_date` , `group_id`) VALUES ('','".$_POST['user_name']."','".$_POST['user_email']."','".$_POST['user_password']."','".$_POST['user_phone']."','".$_date."','1')"); 
                 $_SESSION['username']=$_POST['user_name'];
                 $_SESSION['useremail']=$_POST['user_email'];
                    ob_start();
                  include(TPL."mail2.tpl");
                   $message = ob_get_contents();
                       ob_end_clean();
                       $mess = $message;
             $headers .= 'Content-type: text/html; charset=utf-8'."\r\n";
               $headers .= 'To: '.$_POST['user_name'].''."\r\n";
               $headers .= 'From: '.config('sitename_'.$lang_id).' <'.config('notify_email').'>'."\r\n";
                 mail($_POST['user_email'],"Регистрация на сайте florpeople.com", $mess, $headers);
                 redirectTO(SRV_."accept"); }
              else $not1="Такой E-mail уже зарегистрирован"; } }
            ?>







<div class="pathway wbody">
    <ul>
        <li><a href="<?php echo SRV_; ?>"><?php echo WORD_54; ?></a></li>
        <li><a href="<?php echo SRV_."auth"; ?>"><?php echo ("Регистрация"); ?></a></li>
    </ul>
</div>

<div class="reg wmin">
    
    <div class="left-fmimg">
      <h2 style="text-align: right;">Регистрация на сайте</h2>
      <div class="image"><img src="<?php echo SKIN."image/reg-bg.png"; ?>"></div>
    </div>

    <div class="right-fmb">
      <form method="post">
        <div class="form">
        
      	<p>Как к Вам обращяться?:</p>
        <input  type="text" name="user_name">
    		<p>Пароль:</p>
      	<input  type="password" name="user_password">
        <p>Подтверждение пароля:</p>
        <input  type="password" name="user_password1">



        <div class="alertval"><?php echo $not; ?></div>



        
        <p>E-mail:</p>
        <input  type="text" name="user_email">
        <div class="alertval"><?php echo $not1; ?></div> 
        <p>Мобильный телефон:</p>
        <input  type="text" name="user_phone">
      	
      	<div class="lhalf">
      		<input type="checkbox" style="float:left; margin: 15px 10px 40px 0"><span>Согласие на хранение и обработку персональных данных</span>
      	</div>
      	<div class="rhalf" style="margin-top:20px;">
  			<button type="submit" name="submit"  style="border-radius: 5px;">Регистрация</button>
      	</div>
         </div>
      </form>
    </div>
</div>


