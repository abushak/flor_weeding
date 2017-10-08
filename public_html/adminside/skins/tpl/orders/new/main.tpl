<section class="admin_all_order">
    <section class="row">
        <section class="admin_count_order"><?php echo WORD_315; ?>: </section>
        <section class="span3"><a href="<?php echo ADM_SRV."orders/new/?act=add"; ?>" class="add_order">+ <?php echo WORD_316; ?></a></section>
        <section class="admin_btn_close"><a class="admin_btn" href="#">x <?php echo WORD_317; ?></a></section>
        <section class="admin_btn_close"><a class="admin_btn" href="#"><?php echo WORD_318; ?></a></section>
    </section>
</section>

<section class="admin_search"><?php include ADM_TPL."orders/search.row.tpl"; ?></section>

<?php if ($_SESSION["TABLE_VIEW"] == "block") { ?>
<section class="wrap_admin_table small_desc clearfix">
    <table class="admin_table last_order" id="orders_block">
        <?php include ADM_TPL."orders/table.caption.small.tpl"; ?>
        <?php $orders = $orders_order->getOrders($_GET, $route[3]); ?>
        <?php foreach ($orders as $key => $val) { ?>
        <?php include ADM_TPL."orders/table.item.small.tpl"; ?>
        <?php } ?>
    </table>
    <section class="admin_table_detal" id="order_info_block" style="z-index: 1;"></section>
</section>
<script type="text/javascript">
jQuery(function($) {
    var order_id = $(".order-item").first().attr("data-id");
    $(".order-item").first().addClass("active_order");
    if (order_id !== undefined) {
        $.post(ADM_SRV + "bin/jquery.php", {
            func: "get.order.info",
            order_id: order_id
        }).done(function(data) {
            $("#order_info_block").html(data);
        });
    }
    
    $("#order_info_block").on("click", ".order_status", function() {
        $(this).next(".wrap_action_list").find("ul").fadeIn();
        return false;
    });
    
    $(".admin_table").on("click", ".order-item", function() {
        var _order = $(this).attr("data-id"),
            _item = $(this);
        if (_order !== undefined) {
            $.post(ADM_SRV + "bin/jquery.php", {
                func: "get.order.info",
                order_id: _order
            }).done(function(data) {
                $("#order_info_block").html(data);
                $(".active_order").removeClass("active_order");
                _item.addClass("active_order");
            });
        }
    });
})
</script>
<?php } else if ($_SESSION["TABLE_VIEW"] == "list") { ?>
<section class="wrap_admin_table">
    <table class="admin_table last_order">
        <?php include ADM_TPL."orders/table.caption.tpl"; ?>
        <?php $orders = $orders_order->getOrders($_GET, $route[3]); ?>
        <?php foreach ($orders as $key => $val) { ?>
        <?php include ADM_TPL."orders/table.item.tpl"; ?>
        <?php } ?>
    </table>
</section>
<?php } ?>
<!--
<ul class="admin_page_nav">
    <li><a href="#"><span>Показать еще 10</span></a></li>
    <li><a href="#" class="current_page">1</a></li>
    <li><a href="#">2</a></li>
</ul>
-->