<?php 
if(isset($_POST['submit'])) { redirectTO(SRV_."profile"); }

?>

<div class="pathway wbody">
    <ul>
        <li><a href="<?php echo SRV_; ?>"><?php echo WORD_54; ?></a></li>
        <li><a href="<?php echo SRV_."auth"; ?>"><?php echo ("Вход"); ?></a></li>
    </ul>
</div>

<div class="auth wmin">

      <div class="form rhalf">
      
    	<p>Поздравляем!</p>
    	<p>Регистрация прошла успешно!</p>
        <p>На ваш E-mail отправлено письмо с данными регистрации</p>
         <a href="<?php echo SRV_."profile"; ?>">Войти в Личный кабинет</a>		
        
    	</div>
      
       </div>




</div>

<script type="text/javascript">
        $('#showf').click(function() {
        $('.form2').addClass('showf')
    })
</script>