<section>
    <section class="admin_input_search">
        <form method="GET">
            <input type="text" name="q" value="<?php echo urldecode($_GET["q"]); ?>" />
            <input type="submit" value="<?php echo WORD_54; ?>" />
            <a href="#" class="more_search"><?php echo WORD_110; ?></a>
            
            <section class="st_search">
                <section class="st_r">
                    <section class="span5"><?php include ADM_TPL."orders/input/select.status.order.tpl"; ?></section>
                    <section class="span5"><?php include ADM_TPL."orders/input/select.status.payment.tpl"; ?></section>
                    <section class="span2"><a href="#" class="clear_form" id="order-clear"><?php echo WORD_321; ?></a></section>
                </section>
                
                <section class="st_r">
                    <section class="span5"><?php include ADM_TPL."orders/input/select.delivery.tpl"; ?></section>
                    <section class="span5"><?php include ADM_TPL."orders/input/select.payment.tpl"; ?></section>
                </section>
                
                <section class="st_r">
                    <section class="span5 st_search_price"><?php include ADM_TPL."orders/input/range.price.tpl"; ?></section>
                    <section class="span7 st_search_date"><?php include ADM_TPL."orders/input/range.date.tpl"; ?></section>
                </section>
            </section>
        </form>
    </section>
</section>
<script type="text/javascript">
jQuery(function($) {
    $("#order-clear").click(function() {
        $("#select-status-order").val("0");
        $("#select-status-payment").val("0");
        $("#select-delivery").val("0");
        $("#select-payment").val("0");
        $("#date_min").val("");
        $("#date_max").val("");
        $("#price_min").val("");
        $("#price_max").val("");
        return false;
    });
})
</script>