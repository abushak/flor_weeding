

<div style="background-color:#e8edf1;padding:20px;font-family: Arial, Helvetica, Verdana, Tahoma, sans-serif;">
    <div style="width:730px;margin:0 auto;background-color:white;border:1px solid rgba(12,36,56,.3);">
        <div style="padding:20px 25px;">
		 
            <img src="<?php echo SKIN."image/maillogo.png"; ?>";  alt="FlorPeople" style="float:none;display:block;width:117px;height:141px;margin-right:15px" />
             <p style="color:#ff1459;font-size:22px;display:block;text-align:center;">Напоминание Пароля</p>
            <p style="font-size:17px;display:block;text-align:justify;">Здравствуйте , <?php echo $data['name']; ?>. На сайте <a href="http://florpeople.com/"> http://florpeople.com/</a> был сделан запрос на напоминание пароля к Вашей учётной записи. </p>
			<p style="font-size:17px;display:block;text-align:justify;">Ваши данные:</p>
			<p style="font-size:17px;display:block;text-align:justify;">Логин: <?php echo $data['email']; ?></p>
			<p style="font-size:17px;display:block;text-align:justify;">Пароль: <?php echo $data['password']; ?></p>
			<p style="font-size:17px;display:block;text-align:center;">С любовью, FLOR People!</p>
			</p>
			
            
                
         
            
            
            
            <div style="border-top:1px solid #e7e8e9;margin-top:25px;padding:20px 0 10px;font-size:13px;text-align:center;line-height:150%">Интернет-магазин «FlorPeople»<br/>Телефон:(093) 000-88-03</div>
        </div>
    </div>
</div>