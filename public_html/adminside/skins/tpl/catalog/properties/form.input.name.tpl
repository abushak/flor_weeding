<section class="description">
    <label><?php echo WORD_22; ?>*:</label>
    <?php $query = $mysql->query("SELECT * FROM `zet_language` ORDER BY `store_default`<>'0' DESC"); ?>
    <?php while($row = $mysql->assoc($query)) { ?>
    <input type="text" class="required_" value="<?php echo $language[$row['id']]["name"]; ?>" name="<?php echo "name[{$row['id']}]"; ?>" /> <span class="add_tl">(<?php echo $row['code']; ?>)</span>
    <?php } ?>
</section>