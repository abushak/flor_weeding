<section class="admin_all_order color">
    <section class="row">
        <section class="admin_count_order"><?php echo WORD_132; ?></section>
        <section class="admin_btn_close"><a href="#" class="admin_save"><?php echo WORD_28; ?></a></section>
    </section>
</section>

<section class="wrap_admin_table">
    <section class="wrap_add">
        <form method="POST" action="<?php echo ADM_SRV.$route[2].DS.$route[3].DS; ?>?act=edit">
            <table class="admin_table valut">
                <tbody class="currency_list">
                    <?php include ADM_TPL."settings/currency/caption.row.tpl"; ?>
                    <?php include ADM_ROOT."modules/settings/currency/main.currency.php"; ?>
                    <?php include ADM_ROOT."modules/settings/currency/currency.php"; ?>
                </tbody>
                
                <tr>
                    <td colspan="5">
                        <span class="padding_left"></span>
                        <a class="admin_order_comment currency_add" href="#"><span><?php echo WORD_167; ?></span></a>
                    </td>
                    <td></td>
                </tr>
            </table>
        </form>
    </section>
</section>