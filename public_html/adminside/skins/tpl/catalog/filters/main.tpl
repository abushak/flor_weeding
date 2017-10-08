<?php
$url ="http://".$_SERVER['HTTP_HOST']."/adminside/catalog/filters";
if($_POST['filterName']!=null){
    if($_POST['priority']==null){
      $p = 0;
    }else{
        $p = $_POST['priority'];
    }
    if($mysql->query("INSERT INTO `zet_category_filters`(`language_id`,`title`,`priority`, `status`) VALUES ('1', '".$_POST['filterName']."', '".$p."','1')")){
		$filters = $catalog_category->BackendGetFiltersByStatus(0, 0);
        echo "<script> window.location.href ='".$url."'; </script>";
	}
}
?>
<style>
#addFilter.visible {
    display: none;
}
</style>
<section class="admin_all_order">
    <section class="row">
        <section class="admin_count_order"><?php echo WORD_432; ?>: <?php echo $catalog_category->getTotalFilters(); ?></section>
        <section class="span3"><a onclick="addFilter()" class="add_order">+ <?php echo WORD_433; ?></a></section>
    </section>
    <script>
    function addFilter(){
        $('#addFilter').toggleClass("visible");
    }
    </script>
</section>

<section class="wrap_admin_table">
    <section class="admin_table brand">
        <?php include ADM_TPL."catalog/filters/caption.row.tpl"; ?>
            <form id="addFilter" class="visible" method="POST" enctype="multipart/form-data" >
                <input type="text" name="filterName" value=""> 
                <input type="hidden" name="filterId" value="<?php 
                       $filters = $catalog_category->BackendGetFiltersByStatus(0, 0); 
                       echo count($filters)+1;?>"
                > 
                Добавить после:
                <select name="priority" style="width: 200px">
                    <?php 
                        foreach($filters as $key => $val) { 
                            echo "<option value='".$key."'>".$filters[$key][title]."</option>";
                        }
                    ?>
                  </select>
            <input style="margin-right: 0" type="submit" value="Добавить"/> 
        </form>
        <?php foreach($filters as $key => $val) {  ?>
        <?php $filters_row = $filters[$key]; ?>
        <?php include ADM_TPL."catalog/filters/level_1.row.tpl"; ?>
        <?php } ?>
   </section>
</section>
