<?php $_op_num = (empty($_op_num)) ? 1 : $_op_num; ?>
<?php $_i = (empty($op_row['id'])) ? $_op_num : $op_row['id']; ?>
<div class="add_table_row sub-variant">
    <div class="add_table_cell">
        <?php $query = $mysql->query("SELECT * FROM `zet_language` ORDER BY `store_default`<>'0' DESC"); ?>
        <?php while($row = $mysql->assoc($query)){ ?>
        <?php $op_sub_query = $mysql->query("SELECT `name` FROM `zet_product_option_description` WHERE `product_id`='".(int)$route[4]."' AND `language_id`='".$row['id']."' AND `option_id`='".$_i."'"); ?>
        <?php $op_sub_row = $mysql->assoc($op_sub_query); ?>
        <input type="text" class="variant-name required_" readonly="readonly" value="<?php echo ($_GET['act'] == 'add') ? $name : $op_sub_row['name']; ?>" name="variant_name[<?php echo $row['id']; ?>][<?php echo $_i; ?>]" /> <span class="add_tl">(<?php echo $row['code']; ?>)</span>
        <?php } ?>
    </div>
    <div class="add_table_cell">
        <input type="text" value="<?php echo $op_row['article']; ?>" name="variant_article[<?php echo $_i; ?>]" />
    </div>
    <div class="add_table_cell">
        <input type="text" class="required_" value="<?php echo $op_row['price']; ?>" name="variant_price[<?php echo $_i; ?>]" />
    </div>
    <div class="add_table_cell">
        <input type="text" value="<?php echo $op_row['real_price']; ?>" name="variant_real_price[<?php echo $_i; ?>]" />
    </div>
    <div class="add_table_cell">
        <input type="text" value="<?php echo $op_row['cross_price']; ?>" name="variant_cross_price[<?php echo $_i; ?>]" />
    </div>
    <div class="add_table_cell">
        <input type="text" value="<?php echo $op_row['quantity']; ?>" class="required_" name="variant_quantity[<?php echo $_i; ?>]" />
    </div>
</div>
<?php $_op_num++; ?>