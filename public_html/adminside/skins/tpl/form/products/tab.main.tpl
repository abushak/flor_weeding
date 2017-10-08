<p class="inner_status">
    <?php echo WORD_255; ?>:
    <a href="#" class="admin_btn on <?php echo ($params['status'] == 1 || $_GET['act'] == 'add') ? 'active' : false; ?>"><?php echo WORD_256; ?></a>
    <input type="checkbox" name="status" id="check-status" <?php echo ($params['status'] == 1 || $_GET['act'] == 'add') ? 'checked="checked"' : false; ?> style="visibility:hidden;position:absolute;" />
    <a href="#" class="admin_btn new <?php echo ($params['new'] == 1) ? 'active' : false; ?>"><?php echo WORD_257; ?></a>
    <input type="checkbox" name="new" id="check-new" <?php echo ($params['new'] == 1) ? 'checked="checked"' : false; ?> style="visibility:hidden;position:absolute;" />
    <a href="#" class="admin_btn recom <?php echo ($params['recommended'] == 1) ? 'active' : false; ?>"><?php echo WORD_258; ?></a>
    <input type="checkbox" name="recommended" id="check-recommended" <?php echo ($params['recommended'] == 1) ? 'checked="checked"' : false; ?> style="visibility:hidden;position:absolute;" />
    <a href="#" class="admin_btn hit <?php echo ($params['hit'] == 1) ? 'active' : false; ?>"><?php echo WORD_259; ?></a>
    <input type="checkbox" name="hit" id="check-hit" <?php echo ($params['hit'] == 1) ? 'checked="checked"' : false; ?> style="visibility:hidden;position:absolute;" />
</p>

<section>
    <section>
        <div class="add_table">
            <?php include FORM."{$route[2]}/{$route[3]}/caption.row.tpl"; ?>
            <div class="product-variants">
                <?php if($_GET['act'] == 'add') { ?>
                <?php $name = "S"; ?><?php include FORM."{$route[2]}/{$route[3]}/variant.row.tpl"; ?>
                <?php $name = "M"; ?><?php include FORM."{$route[2]}/{$route[3]}/variant.row.tpl"; ?>
                <?php $name = "L"; ?><?php include FORM."{$route[2]}/{$route[3]}/variant.row.tpl"; ?>
                <?php } else { ?>
                <?php $op_query = $mysql->query("SELECT * FROM `zet_product_option` WHERE `product_id`='".(int)$route[4]."'"); ?>
                <?php while($op_row = $mysql->assoc($op_query)){ ?>
                <?php include FORM."{$route[2]}/{$route[3]}/variant.row.tpl"; ?>
                <?php } ?><?php } ?>
            </div>
        </div>
    </section>

    <section><?php $w9 = "w9"; ?><?php include ADM_TPL."snippets/form.picture.tpl"; ?></section>
</section>

<section>
    <section class="variant_table">
        <?php include INPUT."product.url.tpl"; ?>
        <?php include SELECT."product.category.select.tpl"; ?>
        <?php include INPUT."product.date.tpl"; ?>
        <?php include SELECT."product.noinstock.select.tpl"; ?>
    </section>

    <?php include CHECKBOX."product.category.tpl"; ?>
</section>