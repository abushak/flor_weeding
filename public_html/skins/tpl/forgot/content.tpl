<?php
 if(isset($_POST['submit'])) {
    
    $query = $mysql->query("SELECT id,name,email,password,phone FROM zet_userlist WHERE email='".mysql_real_escape_string($_POST['email2'])."' LIMIT 1");
    $data = $mysql->assoc($query); 
    if(empty($data['id'])) {  
$notify1="Пользователя с таким E-mail несуществует";
unset($notify);
     } else    {     ob_start();
             include(TPL."mail1.tpl");
             $message = ob_get_contents();
                   ob_end_clean();
              $mess = $message;
             $headers .= 'Content-type: text/html; charset=utf-8'."\r\n";
               $headers .= 'To: '.$user['name'].''."\r\n";
               $headers .= 'From: '.config('sitename_'.$lang_id).' <'.config('notify_email').'>'."\r\n";
                 mail($data['email'],"Данные пользователя FLORPEOPLE", $mess, $headers);
                              $notify="Письмо c вашим паролем отправлено!";}}
                                                                          ?>



<div class="pathway wbody">
    <ul>
        <li><a href="<?php echo SRV_; ?>"><?php echo WORD_54; ?></a></li>
        <li><a href="<?php echo SRV_."auth"; ?>"><?php echo ("Вход"); ?></a></li>
    </ul>
</div>


<div class="auth wmin">
    <div class="right-fmb">
 <div class="form2">

       <form method="post">
        <p>Эл. почта:<?php echo $notify?></p><div class="alertval"><?php echo $notify1?></div>
        <input type="text" name="email2">
        <div class="lhalf">
        </div>
        <div class="rhalf">
            <button type="submit" name="submit">Отправить пароль</button>
        </div>



        

       </form>

       </div>
       </div>

       </div></div>