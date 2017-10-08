<?php $query = $mysql->query("SELECT * FROM `zet_product_to_property` WHERE `product_id`='".(int)$route[4]."'"); ?>
<?php while($row = $mysql->assoc($query)){ ?>
<?php $prop_array[$row['property_id']] = array(); ?>
<?php $sub_query = $mysql->query("SELECT * FROM `zet_product_to_property_values` WHERE `product_id`='".(int)$route[4]."' AND `property_id`='".$row['property_id']."'"); ?>
<?php while($sub_row = $mysql->assoc($sub_query)){ ?>
<?php array_push($prop_array[$row['property_id']], $sub_row['property_value']); ?>
<?php } ?><?php } ?>

<?php $query = $mysql->query("SELECT `id`, `type`, (SELECT `name` FROM `zet_product_properties_description` WHERE `language_id`='".$site_language['id']."' AND `property_id`=`zet_product_properties`.`id`) AS `title` FROM `zet_product_properties` WHERE `glob_type`='1' AND `status`='1' ORDER BY `priority` ASC"); ?>
<?php while($row = $mysql->assoc($query)){ ?>
<?php include ADM_TPL.'catalog/products/prop.select.item.tpl'; ?>
<?php } ?>

<hr class="desc_line" />

<section class="desc_filter row-fluid">
    <?php $query = $mysql->query("SELECT `id`,`type`, (SELECT `name` FROM `zet_product_properties_description` WHERE `language_id`='".$site_language['id']."' AND `property_id`=`zet_product_properties`.`id`) AS `title` FROM `zet_product_properties` WHERE `glob_type`='2' AND `status`='1' AND `id`='8'"); ?>
    <?php while($row = $mysql->assoc($query)){ ?>
    <?php include ADM_TPL.'catalog/products/prop.check.item.tpl'; ?>
    <?php } ?>
    
    <?php $query = $mysql->query("SELECT `id`,`type`,(SELECT `name` FROM `zet_product_properties_description` WHERE `language_id`='".$site_language['id']."' AND `property_id`=`zet_product_properties`.`id`) AS `title` FROM `zet_product_properties` WHERE `glob_type`='2' AND `status`='1' AND `id`<>'8' ORDER BY `priority` ASC"); ?>
    <?php while($row = $mysql->assoc($query)){ ?>
    <?php include ADM_TPL.'catalog/products/prop.check.item.tpl'; ?>
    <?php } ?>
</section>