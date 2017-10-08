<style type="text/css">
    .subrowvisible{
        display: none;
    }

    .rotate {
        -webkit-transform: rotate(180deg); /* Chrome y Safari */
        -moz-transform: rotate(180deg); /* Firefox */
        -o-transform: rotate(180deg); /* Opera */
    }

#menu {
  position: absolute;
  left: -310px;
  top: 212px;
  border: 1px #ccc solid;
  border-top-right-radius: 15px;
  border-bottom-right-radius: 15px;
  z-index: 999;
  background-color: rgba(255, 255, 255, 0.9);
  padding: 20px 20px 20px 40px;
}
#menu li {
 list-style-type: none;
 
 font-size: 18px;
 color: #808080;
}
#menu li input {
 margin-right: 10px;   
}
#menu ul { padding: 0; width: 250px;}

.title-men {
    color: #000 !important;
    font-size: 24px !important;
    margin: 4px 0 4px -20px;
    width: 100%;
}

.title-men div {
    display: inline-block;
}

#menu-button {
    -webkit-transform: rotate(-90deg);
    -moz-transform: rotate(-90deg);
    filter: progid:DXImageTransform.Microsoft.BasicImage(rotation=3);
    -o-transform: rotate(-90deg);
    position: absolute;
    top: 50px;
    left: 280px;
    padding: 10px;
    background: #FEACB9;
    color: #fff;
    font-size: 20px;
    cursor: pointer;
}

#menu-button:hover {
    background: #EA9FAB;
}

#menu.visible {
    left: 0;
}
.unvisible{
    display: none;
}
#more.visible{
    display: none;
}

.plus_1 {
    width: 30px;
    height: 30px;
    cursor: pointer;
    transition: 1s;
    font-weight: 900;
    position: absolute;
    right: 0;
    margin: -22px 30px 0 0;
    background: url(/skins/image/arrows.png);
    background-size: 100%;
  }

#menu , .plus_1 , .anim , .subrowvisible{
    transition: 1s;
}
</style>
<?php $_CatalogCategory = new CatalogCategory(); ?>
<?php if (!empty($route[2]) && !$_GET && $_CatalogCategory->checkCategoryByUrl($route[2]) == false) redirectTo(SRV_.'404'); ?>
<?php $products = $_CatalogCategory->GetProductsInCategory($route[2], $_GET); ?>

<?php $page = (empty($route[2]) || (empty($route[3]) && $_GET)) ? "" : "{$route[2]}/"; ?>

<?php $query = $mysql->query("SELECT MIN(`price`) AS `min`, MAX(`price`) AS `max` FROM `zet_product`,`zet_product_option` WHERE `zet_product_option`.`product_id`=`zet_product`.`id` AND `zet_product`.`status`='1' and `zet_product`.`additional` = '0'"); ?>
<?php $price = $mysql->assoc($query); ?>
    
    <div id="menu">
      <ul>
        <li class="title-men">
            <p>По цене</p>
        </li>

        <li>
        <input <?php echo ($_GET["sort_by"] == "cheap") ? 'checked' : ""; ?>  type="checkbox"  onclick="window.location='<?php echo SRV_."shop/{$page}".lRequest("sort_by", "cheap"); ?>'" >От дешевых к дорогим</li>
        <li><input <?php echo ($_GET["sort_by"] == "expensive") ? 'checked' : ""; ?>  type="checkbox"  onclick="window.location='<?php echo SRV_."shop/{$page}".lRequest("sort_by", "expensive"); ?>'" >От дорогих к дешевым</li>
<?php 
    $query = $mysql->query("SELECT `filter_id`, `title`, `priority`, `status` FROM `zet_category_filters` WHERE `language_id` = '1' ORDER BY `priority` ASC");
    while ($row = $mysql->assoc($query)) {
        echo '<li class="title-men" ><div>'.$row['title'].'</div><div><p onclick="sh('.$row['filter_id'].')" class="plus_1"></p></div></li>';
        $query2 = $mysql->query("SELECT  `category_id`, `title`, `filter_category_id`, `url`FROM `zet_category_description`, `zet_category` WHERE `zet_category_description`.`category_id`= `zet_category`.`id` AND `filter_category_id`='".$row['filter_id']."' AND `language_id` = '1'");
        echo '<li id="'.$row['filter_id'].'" class="subrowvisible anim"><ul>';
        while($subrow = $mysql->assoc($query2)){?>
            <li onclick="filters('<?php echo $subrow['url']; ?>')" id="<?php echo $subrow['url']; ?>"><input type="checkbox"> <?php echo $subrow['title']; ?></li>
<?php   } echo '</ul></li>';
    } 
?>      
      </ul>
      <div id="menu-button">Фильтры</div>
    </div>

<div class="catalog wbody simple">
    <?php $query = $mysql->query("SELECT `url`,`title` FROM `zet_category`,`zet_category_description` WHERE `category_id`=`id` AND `language_id`='".$lang_id."' AND `status`='1' AND `static`='0' ORDER BY `priority` ASC"); ?>
    <?php $a=array(); while($row = $mysql->assoc($query)){ array_push($a, $row);}?>
    <div class="items" id="items">
        <?php foreach ($products as $key => $val) { ;?>
        <?php $new = ($val["new"] == 1) ? " new" : false; ?>
        <?php $hit = ($val["hit"] == 1) ? " hit" : false; ?>
        <?php $sale = ($val["cross_price"] > $val["price"]) ? " sale" : false; ?>
        <?php include TPL."common/catalog.item.tpl"; ?>
        <?php } ?>
    </div>
    
    <div class="actions">
        <div class="pages">
            <?php 
               // $total = count($products); 
              //  $pages = ceil($_CatalogCategory->__get("_TotalProducts")/config("products_per_page")); 
                //echo $_CatalogCategory->Paginate($route[2], $_GET, $total); 
            ?>
        </div>
        <a id="more" class="more visible"><span><?php echo WORD_112; ?></span></a>
    </div>
</div>
          
<script>

function sh(id){
    $('#'+id).toggle();
}

    $('.plus_1').click(function() {
        $(this).toggleClass('rotate')
    })



    var a = 0;
    var b = 20;
    var clon;
    if($("#items").children().length < b){
        b = $("#items").children().length;
    }else{
        $("#more").toggleClass("visible");
    }
    while(a<b){
       $("#items").children()[a].className = $("#items").children()[a].className.replace('unvisible','');
       a++;
    }
    $("#more").click(function(e){
        if((b+20)>$("#items").children().length){
            b = $("#items").children().length;
            $("#more").toggleClass("visible");
        }else{
            b = b+20; 
        }
        while(a<b){
            //console.log(a)
            //clon = $("#items").children()[a].id;
           // console.log(clon);
            //console.log($("#"+clon);
            $("#items").children()[a].className = $("#items").children()[a].className.replace('unvisible','');
            a++;
            //console.log($("#items").find(clon));
         }
    })
    //$("#items").children()[0].className = $("#items").children()[0].className.replace('visible','')
    //console.log($("#items").children()[0].className)
    //var test = $("#items").children()[0];
    //test.toggleClass("visible")
    $(document).ready(function() {
        $("#menu-button").click(function() {
          $('#menu').toggleClass("visible");
        });
    });
    //console.log(window.location.href)
    var arr = document.getElementById("menu").getElementsByTagName('li');
    var url = window.location.href
    var slesh = new RegExp('shop/');
    var and = new RegExp('&');
    if(!slesh.test(url)){
        this.document.location.href = url + '/?sort_by=cheap';
    }
    var check;
    for(var i=0; i<arr.length; i++){
        if(arr[i].id){
            check = new RegExp(arr[i].id);
            if(check.test(url)){
                var d = document.getElementById("menu");
                d.className = d.className + " visible";
                arr[i].getElementsByTagName('input')[0].checked = true
            }
        }
    }
    if(url.split('//').length>2){
        this.document.location.href = url.split('//')[0] +'//'+ url.split('//')[1] + '/' +  url.split('//')[2];
    }
    function filters(fl){
       // console.log(fl);
        check = new RegExp(fl);
        if(check.test(url)){
            this.document.location.href = url.replace('&'+fl,"")
        }else{
            var sort = new RegExp('sort_by'); 
            if(sort.test(url)){
                var s = url.split('/?sort_by=');
                console.log(s)
                   if(and.test(url)){
                        this.document.location.href = s[0] +'&' + fl + '/?sort_by='+s[1];
                   }else{
                       this.document.location.href = s[0] +'/&' + fl + '/?sort_by='+s[1];
                   }
            }else{
                this.document.location.href = url + '&' +fl ;
            }
        }
    }
</script>