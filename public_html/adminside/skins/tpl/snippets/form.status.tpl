<section class="description">
    <label><?php echo WORD_34; ?>:</label>
    <ul class="checkbox_list">
        <li>
            <input type="checkbox" id="box" name="status" <?php echo ($params["status"] == "1") ? "checked='checked'" : ($_GET["act"] == "add") ? "checked='checked'" : false; ?>/>
            <label for="box"><span></span><?php echo WORD_35; ?></label>
        </li>
    </ul>				
</section>