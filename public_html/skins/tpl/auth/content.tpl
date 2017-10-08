<?php
 if(isset($_POST['submit'])) {
    
    $query = $mysql->query("SELECT id,name,email,password FROM zet_userlist WHERE email='".mysql_real_escape_string($_POST['email'])."' LIMIT 1");
    $data = $mysql->assoc($query); 
     if(($data['password']) === ($_POST['password'])) {
        $_SESSION['username']=$data['name'] ; 
        $_SESSION['userid']=$data['id'] ;
        $_SESSION['useremail']=$data['email'];
     redirectTO(SRV_."profile");
     }else  $canel="Пароль или E-mail позльзователя введено не верно";    
    } 
                       ?>

<div class="pathway wbody">
    <ul>
        <li><a href="<?php echo SRV_; ?>"><?php echo WORD_54; ?></a></li>
        <li><a href="<?php echo SRV_."auth"; ?>"><?php echo ("Вход"); ?></a></li>
    </ul>
</div>

<div class="auth wmin">
    <div class="right-fmb">
      <div class="form">
       <form method="post">
    	<p>Эл. почта:</p><div class="alertval"><?php echo $canel;?></div>
    	<input type="text" name="email"> 
    	<p class="shad"><a href="<?php echo SRV_."reg"; ?>">Регистрация</a></p>
		<p>Пароль:</p>
    	<input type="password" name="password">
    	
       
       <p class="shad"><a href="<?php echo SRV_."forgot"; ?>">Забыли Пароль?</a></p>
        

    	<div class="lhalf">
    		
    	</div>
    	<div class="rhalf">
			<button type="submit" name="submit">Войти</button>
    	</div>
       </form>
       </div>




     



    </div>




    <div class="left-fmimg">
    	<h2>Вход в личный кабинет</h2>
    	<div class="image"><img src="<?php echo SKIN."image/auth_bg.jpg"; ?>" alt=""/></div>
    </div> 
</div>

<script type="text/javascript">
        $('#showf').click(function() {
        $('.form2').addClass('showf')
    })
</script>