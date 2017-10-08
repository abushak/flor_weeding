<section class="admin_all_order color">
    <section class="row">
        <section class="admin_count_order"><?php echo ($_GET["act"] == "add") ? WORD_287 : WORD_288; ?></section>
        <section class="admin_btn_close"><a href="#" class="admin_save"><?php echo WORD_28; ?></a></section>
        <section class="admin_btn_close"><a href="<?php echo ADM_SRV.routesToLink(3, 2); ?>" class="admin_btn"><?php echo WORD_29; ?></a></section>
    </section>
</section>

<section class="wrap_admin_table">
    <section class="wrap_add">
        <form method="POST" enctype="multipart/form-data" >
            <section class="description">
                <label><?php echo WORD_22; ?>*:</label>
                <?php
                    $query = $mysql->query("SELECT * FROM `zet_language` ORDER BY `store_default`<>'0' DESC");
                    while($row = $mysql->assoc($query)) {
                        echo '<input type="text" class="required_" value="'.$language[$row['id']]["name"].'" name="name['.$row['id'].']" /> <span class="add_tl">('.$row['code'].')</span> ';
                    }
                ?>
        </section>
        </form>
    </section>
</section>