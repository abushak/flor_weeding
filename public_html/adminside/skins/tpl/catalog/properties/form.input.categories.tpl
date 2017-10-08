<?php $categories = $catalog_prop->GetFiltersToCategory($route[4]); ?>
<section class="show_type" id="categories-list" style="border:1px solid #ecf2f6;width:38%;margin:30px 0 0 285px;float:none;">
    <p class="caption"><?php echo WORD_362; ?></p>
    <section class="wrap_show_type" style="height:160px;">
        <ul class="checkbox_list" id="category-check">
            <?php foreach($_cl as $key => $val) { ?>
            <li><?php echo $_cl[$key]['title']; ?></li>
            <?php $_scl = $_cc->GetCategoriesList($_cl[$key]['id']); ?>
            <?php foreach($_scl as $k => $v) { ?>
            <li style="padding-left:40px;">
                <input <?php echo (array_key_exists($_scl[$k]['id'], $categories)) ? 'checked="checked"' : false; ?> type="checkbox" name="category_id[]" id="box<?php echo $_scl[$k]['id']; ?>" value="<?php echo $_scl[$k]['id']; ?>" />
                <label for="box<?php echo $_scl[$k]['id']; ?>"><span></span><?php echo $_scl[$k]['title']; ?></label>
            </li>
            <?php } ?><?php } ?>
        </ul>
    </section>
    <p class="select_all"><a href="#" class="check-all"><?php echo WORD_363; ?></a> / <a href="#" class="uncheck-all"><?php echo WORD_364; ?></a></p>
</section>