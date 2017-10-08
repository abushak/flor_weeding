<?php $query = $mysql->query("SELECT `category_id` FROM `zet_product_to_category` WHERE `product_id`='".(int)$route[4]."' AND `is_main_category`='1'"); ?>
<?php $category = $mysql->assoc($query); ?>
<section class="description">
    <label><?php echo WORD_274; ?></label>
    <select name="main_category" id="main-category">
        <?php $query = $mysql->query("SELECT `id`,(SELECT `title` FROM `zet_category_description` WHERE `language_id`='".$site_language['id']."' AND `category_id`=`zet_category`.`id`) AS `title` FROM `zet_category` WHERE `parent_category`='0' AND `static`='0' ORDER BY `priority` ASC"); ?>
        <?php while($row = $mysql->assoc($query)){ ?>
        <option <?php echo ($category['category_id'] == $row['id']) ? 'selected="selected"' : false; ?> value="<?php echo $row['id']; ?>"><?php echo $row['title']; ?></option>
        <?php } ?>
    </select>
</section>