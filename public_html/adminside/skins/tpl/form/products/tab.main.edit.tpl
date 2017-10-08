<p class="inner_status">
    <?php echo WORD_255; ?>:
    <a href="#" class="admin_btn on active"><?php echo WORD_256; ?></a>
    <input type="checkbox" name="status" id="check-status" checked="checked" style="visibility:hidden;position:absolute;" />
    <a href="#" class="admin_btn new"><?php echo WORD_257; ?></a>
    <input type="checkbox" name="new" id="check-new" style="visibility:hidden;position:absolute;" />
    <a href="#" class="admin_btn recom"><?php echo WORD_258; ?></a>
    <input type="checkbox" name="recommended" id="check-recommended" style="visibility:hidden;position:absolute;" />
    <a href="#" class="admin_btn hit"><?php echo WORD_259; ?></a>
    <input type="checkbox" name="hit" id="check-hit" style="visibility:hidden;position:absolute;" />
</p>

<section>
    <section>
        <table class="admin_table variant">
            <?php include FORM."{$route[2]}/{$route[3]}/caption.row.tpl"; ?>
            <tbody class="variants_list">
            <?php $op_query = $mysql->query("SELECT * FROM `zet_product_option` WHERE `product_id`='".(int)$route[4]."'"); ?>
            <?php while($op_row = $mysql->assoc($op_query)){ ?>
            <?php include FORM."{$route[2]}/{$route[3]}/variant.row.tpl"; ?>
            <?php } ?>
            </tbody>
            <tr></tr>
            <tr><td colspan="8"><a href="#" class="admin_order_comment add_product_variant"><span><?php echo WORD_264; ?></span></a></td></tr>
        </table>
    </section>
</section>

<section>
    <section class="variant_table">
        <?php include INPUT."product.url.tpl"; ?>
        <?php include SELECT."product.category.select.tpl"; ?>
        <?php include SELECT."product.brand.select.tpl"; ?>
        <?php include INPUT."product.date.tpl"; ?>
        <?php include SELECT."product.noinstock.select.tpl"; ?>
    </section>
    
    <!-- <?php include CHECKBOX."product.category.tpl"; ?> -->
</section>

<?php include ADM_TPL."snippets/form.items.tpl"; ?>