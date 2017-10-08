<?php $_op_num = (empty($_op_num)) ? 1 : $_op_num; ?>
<?php $_i = (empty($op_row['id'])) ? $_op_num : $op_row['id']; ?>
<div class="add_table_row sub-variant">
    <div class="add_table_cell" style="width: 19%;">
        <input type="text" value="<?php echo $op_row['article']; ?>" name="variant_article[<?php echo $_i; ?>]" />
    </div>
    <div class="add_table_cell" style="width: 19%;">
        <input type="text" class="required_" value="<?php echo $op_row['price']; ?>" name="variant_price[<?php echo $_i; ?>]" />
    </div>
    <div class="add_table_cell" style="width: 19%;">
        <input type="text" value="<?php echo $op_row['real_price']; ?>" name="variant_real_price[<?php echo $_i; ?>]" />
    </div>
    <div class="add_table_cell" style="width: 19%;">
        <input type="text" value="<?php echo $op_row['cross_price']; ?>" name="variant_cross_price[<?php echo $_i; ?>]" />
    </div>
    <div class="add_table_cell" style="width: 19%;">
        <input type="text" value="<?php echo $op_row['quantity']; ?>" class="required_" name="variant_quantity[<?php echo $_i; ?>]" />
    </div>
</div>