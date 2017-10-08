<?php 
 $url ="http://".$_SERVER['HTTP_HOST']."/adminside/catalog/filters";
if($_POST['group']!=null&&$_POST['categoryId']!=null){
    if($mysql->query("UPDATE `zet_category_description` SET `filter_category_id`='".$_POST['group']."' WHERE `category_id`='".$_POST['categoryId']."'")){
        $filters = $catalog_category->BackendGetFiltersByStatus(0, 0);
		 echo "<script> window.location.href ='".$url."'; </script>";
    };
}
if($_GET['delete']){
    if($mysql->query("DELETE FROM `zet_category_filters` WHERE `filter_id`='".$_GET['delete']."'")){
        $filters = $catalog_category->BackendGetFiltersByStatus(0, 0);
		 echo "<script> window.location.href ='".$url."'; </script>";
    };
}
?>
<style>
.visible {
    display: none;
}
</style>
<section class="brand row main_row" id="id_<?php echo $filters_row["category_id"]; ?>">
    <section class="span7">
        <section class="checkbox_list">
        </section>
        
        <a href="#" class="list_t"><span><img src="<?php echo ADM_SKIN; ?>image/list.jpg" /></span> <i><?php echo $filters_row["title"]; ?></i></a>
    </section>
    
    <section class="center_text span2"><?php echo count($filters_row["items"]); ?></section>
    <section class="center_text span2"><a class="table_link status_link <?php echo ($filters_row["status"] == 1) ? "active" : "disable";?>" data-id="<?php echo $filters_row["id"]; ?>" href="#"></a></section>
    <section class="center_text span2">
        <a <?php echo "onclick='show(".$filters_row[filter_id].")'" ?> class="admin_order_edit" title="Редагувати"></a>
        <a <?php echo "onclick='delet(".$filters_row[filter_id].")'" ?> class="admin_order_delete delete-catalog" title="Видалити"></a>
    </section>
    
    <section class="sub_rows_container">
        <form id='<?=$filters_row[filter_id]?>' class="visible" method="POST" enctype="multipart/form-data" >
                <input type="hidden" name="group" value="<?php 
                       echo $filters_row["filter_id"];?>"
                > 
                <select name="categoryId" style="width: 200px">
                    <?php 
                        $query = $catalog_category->getFilters('1');
                        while($category_rows = $mysql->assoc($query)) { 
                            echo "<option value='".$category_rows['category_id']."'>".$category_rows['title']."</option>";
                        }
                    ?>
                  </select>
            <input style="margin-right: 0" type="submit" value="Добавить"/> 
        </form>
    <?php 
    if(count($filters_row["items"])>0){
          foreach($filters_row["items"] as $key =>$fs) {
              include ADM_TPL."catalog/filters/level_2.row.tpl";
            }
    } ?>
    </section>
    <script>
        function show(id){
            $('#'+id).toggleClass("visible");
        }
        function delet(id){
            this.document.location.href = window.location.href + '?delete=' + id;
        }
    </script>
</section>