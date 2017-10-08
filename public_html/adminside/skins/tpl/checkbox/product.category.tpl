<?php $category = array(); ?>
<?php $query = $mysql->query("SELECT `category_id` FROM `zet_product_to_category` WHERE `product_id`='".(int)$route[4]."'"); ?>
<?php while ($row = $mysql->assoc($query)) { ?>
<?php $category[] = $row["category_id"]; ?>
<?php } ?>
<section class="show_type">
    <p class="caption"><?php echo WORD_271; ?>:</p>
    <section class="wrap_show_type">
        <ul class="checkbox_list" id="category-checkbox-list">
            <?php $query = $mysql->query("SELECT `id`,`title` FROM `zet_category`,`zet_category_description` WHERE `zet_category_description`.`category_id`=`zet_category`.`id` AND `zet_category_description`.`language_id`='".$lang_id."' AND `parent_category`='0' AND `static`='0' ORDER BY `priority` ASC"); ?>
            <?php while ($row = $mysql->assoc($query)) { ?>
            <li class="sub_category">
                <input type="checkbox" name="sub_category[]" id="category_<?php echo $row['id']; ?>" value="<?php echo $row['id']; ?>" <?php echo (in_array($row["id"], $category)) ? 'checked="checked"' : false; ?> />
                <label for="category_<?php echo $row['id']; ?>"><span></span> <?php echo $row['title']; ?></label>
            </li>
            <?php } ?>
        </ul>
    </section>
    <p class="select_all"><a href="#" class="check_all_categories"><?php echo WORD_272; ?></a> / <a href="#" class="uncheck_all_categories"><?php echo WORD_273; ?></a></p>
</section>

<script type="text/javascript">
jQuery(function($) {
    HideMainCategory();
    $("#main-category").change(function() {
        HideMainCategory();
    });
    
    $(".check_all_categories").click(function(e) {
        e.preventDefault();
        $("#category-checkbox-list input:checkbox").prop("checked", true);
    });
    
    $(".uncheck_all_categories").click(function(e) {
        e.preventDefault();
        $("#category-checkbox-list input:checkbox").prop("checked", false);
    });
    
    function HideMainCategory() {
        var id = $("#main-category").val();
        $(".sub_category").css("display", "block");
        $("#category_" + id).parent("li").css("display", "none");
    }
})
</script>