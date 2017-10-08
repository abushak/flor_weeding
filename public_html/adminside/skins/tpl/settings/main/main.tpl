<section class="admin_all_order color">
    <section class="row">
        <section class="admin_count_order"><?php echo WORD_135; ?></section>
        <section class="admin_btn_close"><a class="admin_save" href="#"><?php echo WORD_28; ?></a></section>
    </section>
</section>

<form method="POST" enctype="multipart/form-data" action="<?php echo ADM_SRV.$route[2].DS.$route[3].DS; ?>?act=edit">
<section class="wrap_admin_table">
    <section class="wrap_add">
        <p class="caption"><?php echo WORD_136; ?></p>
        <section class="description">
            <label><?php echo WORD_137; ?>:</label>
            <?php $query = $mysql->query("SELECT * FROM `zet_language`"); ?>
            <?php while($row = $mysql->assoc($query)){ ?>
            <input type="text" value="<?php echo config('sitename_'.$row['id']); ?>" name="sitename_<?php echo $row['id']; ?>" />
            <?php } ?>
            <?php include_once TIPS.'sitename.tpl'; ?>
        </section>
        
        <section class="description">
            <label><?php echo WORD_138; ?>:</label>
            <input type="text" value="<?php echo config('admin_email'); ?>" name="admin_email" />
            <?php include_once TIPS.'admin_email.tpl'; ?>
        </section>
        
        <section class="description">
            <label><?php echo WORD_139; ?>:</label>
            <input type="text" value="<?php echo config('notify_email'); ?>" name="notify_email" />
        </section>
        
        <section class="description">
            <label><?php echo WORD_140; ?>:</label>
            <input type="text" value="<?php echo config('phone'); ?>" name="phone" />
            <a class="sklad" href="#">?</a>			
        </section>
        
        <section class="description">
            <label><?php echo WORD_141; ?>:</label>
            <input type="text" value="<?php echo config('phone_2'); ?>" name="phone_2" />
            <a class="sklad" href="#">?</a>							
        </section>
        
        <section class="description">
            <label><?php echo WORD_142; ?>:</label>
            <input type="text" value="<?php echo config('skype'); ?>" name="skype" />
            <a class="sklad" href="#">?</a>							
        </section>
        
        <section class="description">
            <label><?php echo WORD_421; ?>:</label>
            <input type="text" value="<?php echo config('sale_plan'); ?>" name="sale_plan" />
        </section>
        
        <section class="description">
            <label><?php echo WORD_425; ?>:</label>
            <input type="text" value="<?php echo config("photo_price"); ?>" name="photo_price" />
        </section>
        
        <section class="description">
            <label><?php echo WORD_426; ?>:</label>
            <input type="text" value="<?php echo config("card_price"); ?>" name="card_price" />
        </section>
        
        <section class="description">
            <label><?php echo WORD_427; ?>:</label>
            <input type="text" value="<?php echo config("usd"); ?>" name="usd" />
        </section>
        
        <hr class="desc_line mrg_t" />
        
        <p class="caption"><?php echo WORD_143; ?>:</p>
        <section class="description">
            <label>facebook:</label>
            <input type="text" value="<?php echo config('social_fb'); ?>" name="social_fb" />
        </section>
        
        <section class="description">
            <label>Одноклассники:</label>
            <input type="text" value="<?php echo config('social_ok'); ?>" name="social_ok" />
        </section>
        
        <section class="description">
            <label>ВКонтакте:</label>
            <input type="text" value="<?php echo config('social_vk'); ?>" name="social_vk" />
        </section>
        
        <section class="description">
            <label>Google +:</label>
            <input type="text" value="<?php echo config('social_gp'); ?>" name="social_gp" />
        </section>
        
        <section class="description">
            <label>Twitter:</label>
            <input type="text" value="<?php echo config('social_tw'); ?>" name="social_tw" />
        </section>
        
        <section class="description">
            <label>Instagram:</label>
            <input type="text" value="<?php echo config('social_ins'); ?>" name="social_tw" />
        </section>
        
        <hr class="desc_line mrg_t" />
        
        <p class="caption"><?php echo WORD_144; ?>:</p>
        <section class="description">
            <label><?php echo WORD_145; ?>:</label>
            <input type="text" value="<?php echo config('products_per_page'); ?>" name="products_per_page" />
        </section>
        
        <section class="description">
            <label><?php echo WORD_146; ?>:</label>
            <input type="text" value="<?php echo config('products_per_main_page'); ?>" name="products_per_main_page" />
        </section>
        
        <section class="description">
            <label><?php echo WORD_147; ?>:</label>
            <input type="text" value="<?php echo config('products_per_admin_page'); ?>" name="products_per_admin_page" />
        </section>
        
        <section class="description">
            <label><?php echo WORD_148; ?>:</label>
            <input type="text" value="<?php echo config('max_order_items'); ?>" name="max_order_items" />
            <a class="sklad" href="#">?</a>											
        </section>
        
        <section class="description">
            <label><?php echo WORD_149; ?>:</label>
            <input type="text" value="<?php echo config('item_unit'); ?>" name="item_unit" />
        </section>
        
        <hr class="desc_line mrg_t" />
        
        <p class="caption"><?php echo WORD_150; ?>:</p>
        <section class="description">
            <label><?php echo WORD_151; ?>:</label>
            <select name="store_default">
                <?php $type = "store_default"; ?>
                <?php include ADM_ROOT."modules/settings/lang.list.php"; ?>
            </select>
        </section>
        
        <section class="description">
            <label><?php echo WORD_152; ?>:</label>
            <select name="admin_default">
                <?php $type = "admin_default"; ?>
                <?php include ADM_ROOT."modules/settings/lang.list.php"; ?>
            </select>
        </section>
        
        <hr class="desc_line mrg_t" />
        
        <p class="caption"><?php echo WORD_153; ?>:</p>
        <section class="upload w9">
            <input type="file" name="picture" style="display:none;" id="picture_box" />
            <section class="foto_item">
                <img src="<?php echo getFile(config("water_mark_img")); ?>" />
                <a class="admin_btn del_pic_water" href="#"><img src="<?php echo ADM_SKIN; ?>image/del.png" /> <?php echo WORD_38; ?></a>
            </section>
            
            <section class="choose_file">
                <p><?php echo WORD_39; ?>:</p> <span class="file_name"><?php echo WORD_40; ?> </span><br />
                <a class="admin_btn upload_pic" href="#"><img src="<?php echo ADM_SKIN; ?>image/upload.png" /> <?php echo WORD_41; ?></a>
            </section>
        </section>
        
        <section class="description">
            <label><?php echo WORD_174; ?>:</label>
            <select name="water_mark_position">
                <option <?php if(config("water_mark_position") == 1) echo "selected='selected'"; ?> value="1"><?php echo WORD_177; ?></option>
                <option <?php if(config("water_mark_position") == 2) echo "selected='selected'"; ?> value="2"><?php echo WORD_178; ?></option>
                <option <?php if(config("water_mark_position") == 3) echo "selected='selected'"; ?> value="3"><?php echo WORD_175; ?></option>
                <option <?php if(config("water_mark_position") == 4) echo "selected='selected'"; ?> value="4"><?php echo WORD_176; ?></option>                
                <option <?php if(config("water_mark_position") == 5) echo "selected='selected'"; ?> value="5"><?php echo WORD_179; ?></option>
            </select>
        </section>
        
        <section class="description">
            <label><?php echo WORD_156; ?>:</label>
            <input type="text" value="<?php echo config("water_mark_opacity"); ?>" name="water_mark_opacity" /> %
        </section>
    </section>
</section>
</form>