<?php 
  
  $month_names1=array("января","февраля","марта","апреля","мая","июня",
  "июля","августа","сентября","октября","ноября","декабря");
  $month_names=array("январь","февраль","март","апрель","май","июнь",
  "июль","август","сентябрь","октябрь","ноябрь","декабрь"); 
  if (isset($_GET['y'])) $y=$_GET['y'];
  if (isset($_GET['m'])) $m=$_GET['m']; 
  if (isset($_GET['date']) AND strstr($_GET['date'],"-")) list($y,$m)=explode("-",$_GET['date']);
  if (!isset($y) OR $y < 1970 OR $y > 2037) $y=date("Y");
  if (!isset($m) OR $m < 1 OR $m > 12) $m=date("m");
  $d1=date("d");
  
  $month_stamp=mktime(0,0,0,$m,1,$y);
  $month_stamp1=mktime(0,0,0,$m,$d1,$y);
  $day_count=date("t",$month_stamp);
  $weekday=date("w",$month_stamp);
  $novaday=date("j",$month_stamp1);
  $weeknum=(int)date("W")-2;
  if ($weekday==0) $weekday=7;
  $start=-($weekday-2);
  $last=($day_count+$weekday-1) % 7;
  if ($last==0) $end=$day_count; else $end=$day_count+7-$last;
  $today=date("Y-m-d");
  $prev=date('?\m=m&\y=Y',mktime (0,0,0,$m-1,1,$y));  
  $next=date('?\m=m&\y=Y',mktime (0,0,0,$m+1,1,$y));
  $prev1=date('?\m=m&\y=Y',mktime (0,0,0,$m,1,$y-1));  
  $next1=date('?\m=m&\y=Y',mktime (0,0,0,$m,1,$y+1));
  $next111=date('?\m=m&\y=Y',mktime (0,0,0,1,1,$y));
  $next2=date('?\m=m&\y=Y',mktime (0,0,0,2,1,$y));
  $next3=date('?\m=m&\y=Y',mktime (0,0,0,3,1,$y));
  $next4=date('?\m=m&\y=Y',mktime (0,0,0,4,1,$y));
  $next5=date('?\m=m&\y=Y',mktime (0,0,0,5,1,$y));
  $next6=date('?\m=m&\y=Y',mktime (0,0,0,6,1,$y));
  $next7=date('?\m=m&\y=Y',mktime (0,0,0,7,1,$y));
  $next8=date('?\m=m&\y=Y',mktime (0,0,0,8,1,$y));
  $next9=date('?\m=m&\y=Y',mktime (0,0,0,9,1,$y));
  $next10=date('?\m=m&\y=Y',mktime (0,0,0,10,1,$y));
  $next11=date('?\m=m&\y=Y',mktime (0,0,0,11,1,$y));
  $next12=date('?\m=m&\y=Y',mktime (0,0,0,12,1,$y));
  $i=0;
   if (isset($_POST['buy'])) {
   $val1=strtotime($_POST['buy']);
   $_SESSION['orderdate'] = DateTime::createFromFormat('Y-m-d', $_POST['buy'])->format('Y-m-d');
    redirectTO(SRV_."shop");
    }
   if (isset($_POST['accept'])) {
   $val=strtotime($_POST['accept']);
   $dateD = (int)date('d',$val);
  // $obY=(int)date('Y',$val);
  // $obM=(int)date('m',$val);
  // $obdate=$obY.$obM.$dateD;
    //echo $dateD;
   //$mysql->query(INSERT TO zet_user_dates WHERE 
   //echo $_SESSION['userid'];
   $mysql->query("INSERT INTO `zet_user_dates` (`id`, `userid`,  `event`, `day`, `mounth`,`year`) VALUES ('','".$_SESSION['userid']."','".$_POST['celebr']."','".(int)date('d',$val)."','".(int)date('m',$val)."','".(int)date('Y',$val)."')"); 
   redirectTO(SRV_."calendar");
   } 
  
 ?>
  <div class="pathway wbody">
    <ul>
        <li><a href="<?php echo SRV_; ?>"><?php echo WORD_54; ?></a></li>
        <li><a href="<?php echo SRV_."calendar"; ?>"><?php echo ("Календарь"); ?></a></li>
    </ul>
  </div>
    
    <div class="table-row">



     <div class="centr">
      


      <div class="img-month">
          <a href="<?php echo $next111?>"><img src="skins/image/month/01.jpg"></a>
          <a href="<?php echo $next2?>"><img src="skins/image/month/02.jpg"></a>
          <a href="<?php echo $next3?>"><img src="skins/image/month/03.jpg"></a>
          <a href="<?php echo $next4?>"><img src="skins/image/month/04.jpg"></a>
          <a href="<?php echo $next5?>"><img src="skins/image/month/05.jpg"></a>
          <a href="<?php echo $next6?>"><img src="skins/image/month/06.jpg"></a>
      </div>


        <div style="width: 600px; float:left">
      <div class="month-name">
        <?php echo $month_names[$m-1]," " ?>
      </div>
      
      <div class="month-name1"  style="display:none" >
        <?php echo $month_names1[$m-1]," " ?>
      </div>
      
      <div class="month-name2"  style="display:none" >
        <?php echo $m-1?>
      </div>

      <div class="week-block">

        <div class="week-empty">&nbsp;</div>

        <div class="week"><?php echo $weeknum ?></div>
        <div class="week"><?php echo $weeknum+1 ?></div>
        <div class="week"><?php echo $weeknum+2 ?></div>
        <div class="week"><?php echo $weeknum+3 ?></div>
        <div class="week"><?php echo $weeknum+4 ?></div>
        

      </div>

      <div class="month-block">

        <div class="week-day-row">

          <div class="week-day">Пн</div>
          <div class="week-day">Вт</div>
          <div class="week-day">Ср</div>
          <div class="week-day">Чт</div>
          <div class="week-day">Пт</div>
          <div class="week-day">Сб</div>
          <div class="week-day">Вс</div>

        </div>
<?php
for($d=$start;$d<=$end;$d++) { 
    if (!($i++ % 7)) echo '<div class="day-row">';
    

    echo '<div class="day';
    if ($d==$novaday) {
          echo ' select'; 
    }
    echo '" id="'.$d.'">';
    

    if ($d < 1 OR $d > $day_count) {
      echo "&nbsp";
    } 

      else {
        $now="$y-$m-".sprintf("%02d",$d);
        
        if ($d==$novaday) {
          echo $novaday; 
        }

        else {
          echo $d;
        }
    } 
    echo '</div>';
    if (!($i % 7))  echo '</div>';
  }
   
 $query1=$mysql->query("SELECT event, day, mounth  FROM zet_user_dates WHERE userid='".$_SESSION['userid']."'");
 while($data=mysql_fetch_array($query1)){
     if ($data['mounth']==$m) {
        for($d1=$start;$d1<=$end;$d1++) {
            if ($data['day']==$d1) {
                echo "
                            <script type=\"text/javascript\">
                            var day = $d1;
                            var eventday = document.getElementById(day);
                            $(eventday).toggleClass('event'); 
                            </script>
                ";
            }       
        }   
    }   
}
?>
   

<div id="popup2" >
 
  <div class="bgp"></div>
  <div class="popup">
    <div class="cross">X</div>

    <form method="POST" action="">
    <h2 id="edate">дата тут должна быть</h2>
    
    <table>
      <tbody>
        <tr>
          <td>Событие</td>
          <td>Заказ</td>
          <td>Оплата</td>
        </tr>

        <tr>
          <td>Гадя Петрович</td>
          <td>Гладиолус</td>
          <td>Оплатить!</td>
        </tr>

        <tr>
          <td></td>
          <td></td>
          <td></td>
        </tr>

      </tbody>
    </table>

<!--     <div class="lip">
      <h3 class="c-name">Мой ДР</h3>
      <img src="http://www.fotoava.ru/images/78462.jpg">
    </div>

    <div class="rip">
      <p class="sizep">Размер: <b>S</b></p>
      <p class="pricep"> 1200 грн.</p>
      <p class="status">Статус: <b>Оплачен</b></p>
    </div>

   <button  id="" type="submit" name="buy" value="">Сделать заказ</button> -->
   </form>
  </div>
</div>
<!-- -------------------------------------------------- ПЕРВЫЙ ПОПАП -------------------------------------------------- -->

<!--        <div class="form">
        <form method="POST">

          <input type="text" name="celebr" value="" placeholder="Название мероприятия">
            
            <p>Напомнить в SMS за 5 дней до события</p>
              <div class="butns">
                <button class="pink-button" type="" name="submit">Изменить</button>
                <button class="pink-button" type="" name="submit">Добавить</button>
              </div>
        </form>
      </div> -->


<div id="popup">
 
  <div class="bgp"></div>
  <div class="popup">
    <div class="cross">X</div>
              


        <form method="POST">
          <h2 id="hdate">дата тут должна быть</h2>
          <input type="text" name="celebr" value="" placeholder="Название мероприятия">    
       

      <div class="left-check">
        <div class="row">
          <p>Дублировать</p>
        </div>

    <div class="checkbox">
      <input id="check1" type="checkbox" name="check" value="check1">
      <label for="check1">Раз в неделю</label>
      <br>
      <input id="check2" type="checkbox" name="check" value="check2">
      <label for="check2">Раз в месяц</label>

      <input id="check3" type="checkbox" name="check" value="check2">
      <label for="check3">Раз в год</label>
    </div>

      </div>

      <div class="right-check">
          <div class="row">
          <p>Напомнить</p>
        </div>
        <div class="checkbox">
          <input id="check4" type="checkbox" name="check" value="check1">
          <label for="check4">За 3 дня</label>
          <br>
          <input id="check5" type="checkbox" name="check" value="check2">
          <label for="check5">За 5 дней</label>

          <input id="check6" type="checkbox" name="check" value="check2">
          <label for="check6">За 7 дней</label>
        </div>
        
        
          <button id="" type="submit" name="accept" value="">Готово</button>
        </form>
      </div>



  </div>

</div>

<script type="text/javascript">
  
$('.day').click (function(){
    
  var d = this.innerHTML;
  var mname = document.getElementsByClassName("month-name1");
  var m = document.getElementsByClassName("month-name2");
  var y = document.getElementsByClassName("sran");
  var z=(y[0].innerHTML).trim()+"-"+(parseInt(m[0].innerHTML)+1)+"-"+(d).trim();
  var zz=(d).trim()+" "+(mname[0].innerHTML).trim()+" "+(y[0].innerHTML).trim();
  
  if (($(this).attr('class')=='day')||($(this).attr('class')=='day select')){
  $('#popup').show();
  $(this).toggleClass('edit'); 
  $("button:submit").val(z);
  var h = document.getElementById('hdate');
  h.innerHTML = zz;}
  else { 
  $('#popup2').show(); 
  var h = document.getElementById('edate');
  $("button:submit").val(z);
  h.innerHTML = zz;
  }
  
});


$('.bgp , .cross').click (function(){
  $('#popup').hide();
  $('#popup2').hide();
  $('.day').removeClass('edit'); 
});

</script>

      </div>

      <div class="year">
            <a href="<?php echo $prev1 ?>"><</a>
        <p class="sran" ><?php echo $y ?></p>
        <a href="<?php echo $next1 ?>">></a>
      </div>
        </div>

      <div class="img-month">
          <a href="<?php echo $next7?>"><img src="skins/image/month/07.jpg"></a>
          <a href="<?php echo $next8?>"><img src="skins/image/month/08.jpg"></a>
          <a href="<?php echo $next9?>"><img src="skins/image/month/09.jpg"></a>
          <a href="<?php echo $next10?>"><img src="skins/image/month/10.jpg"></a>
          <a href="<?php echo $next11?>"><img src="skins/image/month/11.jpg"></a>
          <a href="<?php echo $next12?>"><img src="skins/image/month/12.jpg"></a>
      </div>
      
     </div>

    </div>




