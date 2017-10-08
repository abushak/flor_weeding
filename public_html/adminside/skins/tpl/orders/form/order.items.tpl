<table class="admin_order_table">
    <tr>
        <td><?php echo WORD_317; ?></td>
        <td><?php echo WORD_11; ?></td>
        <td><?php echo WORD_240; ?></td>
        <td></td>
        <td><?php echo WORD_241; ?></td>
        <td><?php echo WORD_243; ?></td>
        <td><?php echo WORD_324; ?> <?php echo $site_currency['abbr']; ?></td>
    </tr>
    
    <tbody id="order_items">
        <?php if ($_GET['act'] == 'edit') { ?>
        <?php $_product_list = ""; ?>
        <?php $_products_in = $orders_order->GetOrderProducts($route[4]); ?>
        <?php foreach ($_products_in as $key => $val) { ?>
        <?php $_product_list .= $_products_in[$key]['id'].","; ?>
        <?php include ADM_TPL.'orders/form/order.items.row.tpl'; ?>
        <?php } ?><?php } ?>
        <?php $_product_list = substr($_product_list, 0, -1); ?>
    </tbody>
    <tr>
        <td colspan="6" class="add_item">
            <section>
                <label><?php echo WORD_345; ?>:</label>
                <select id="product_name">
                    <option></option>
                    <?php $query = $mysql->query("SELECT `id`,`title` FROM `zet_product`,`zet_product_description` WHERE `zet_product_description`.`product_id`=`zet_product`.`id` AND `zet_product_description`.`language_id`='".$lang_id."' ORDER BY `creation_date` DESC"); ?>
                    <?php while ($row = $mysql->assoc($query)) { ?>
                    <option value="<?php echo $row['id']; ?>"><?php echo $row['title']; ?></option>
                    <?php } ?>
                </select>
                <input type="hidden" name="products" id="products_" value="<?php echo $_product_list; ?>" />
            </section>
        </td>
        <td></td>
    </tr>
    
    <tr>
        <td class="padding_left" colspan="6"><span><?php echo WORD_337; ?>:</span> <span><?php echo WORD_349; ?>:</span> <span><?php echo WORD_338; ?>:</span></td> 
        <td><span id="total_price"><?php echo $params['real_price']; ?></span> <span id="discount"><?php echo $params['discount']; ?></span> <span id="delivery_price"><?php echo $params['del_price']; ?></span></td>
    </tr>
</table>

<p class="after_admin_table">
    <b><?php echo WORD_346; ?>:</b>
    <span class="admin_caption">
        <input type="button" value="Перерахувати" id="update_sum" />
        <span id="final_price"><?php echo $params['final_price']; ?></span> <?php echo $site_currency['abbr']; ?>
    </span>
</p>

<script type="text/javascript">
jQuery(function($) {
    $("#product_name").select2({
        "width": "element"
    });
    
    $("#product_name").change(function() {
        var products = $("option:selected:last", this).val();
        var regex = new RegExp(products, "g");
        if (!$("#products_").val().match(regex)) {
            $.post(ADM_SRV + "bin/jquery.php", {
                func: "get.order.items",
                products: products
            }).done(function(data) {
                $("#order_items").append(data);
            });
            
            var products_list = $("#products_").val();
            $("#products_").val((products_list == "") ? $("#products_").val() + $(this).val() : $("#products_").val() + "," + $(this).val());
        }
    });
    
    $("#order_items").on("click", ".delete_order_item_", function() {
        var id = $(this).attr("data-id");
        $(this).parents("tr").remove();
        $("#products_").val("");
        $("#order_items tr").each(function() {
            var products_list = $("#products_").val();
            $("#products_").val((products_list == "") ? $("#products_").val() + $(this).attr("data-id") : $("#products_").val() + "," + $(this).attr("data-id"));
        });
        return false;
    });
    
    $("#order_items").on("change", "#selected_option", function() {
        var option = $("option:selected", this),
            product_id = option.attr("data-product-id"),
            product_article = option.attr("data-article"),
            product_price = option.attr("data-price");
        
        $("#item_article_" + product_id).html(product_article);
        $("#item_price_" + product_id).html(product_price);
        $("#hidden_item_price_" + product_id).val(product_price);
        itemPrice(product_id);
    });
    
    $("#order_items").on("keyup", ".item_qty_", function() {
        var qty = $(this).val(),
            id = $(this).attr("data-id"),
            item_price = $("#item_price_" + id).html();
        $("#item_total_price_" + id).html(qty * item_price);
    });
    
    $("#update_sum").on("click", function() {
        var products = "",
            variants = "",
            variants_price = "",
            variants_qty = "",
            user_id = "",
            delivry_method = "";
        
        $('select[name^="product_variant"]').each(function() {
            variants = (variants == '') ? variants + $(this).val() : variants + ',' + $(this).val();
            products = (products == '') ? products + $('option:selected', this).attr('data-product-id') : products + ',' + $('option:selected', this).attr('data-product-id');
        });
        
        $('input[name^="item_price"]').each(function(){
            variants_price = (variants_price == '') ? variants_price + $(this).val() : variants_price + ',' + $(this).val();
        });
        
        $('input[name^="product_qty"]').each(function(){
            variants_qty = (variants_qty == '') ? variants_qty + $(this).val() : variants_qty + ',' + $(this).val();
        });
        
        user_id = $('#user_id').val();
        delivry_method = $('#delivery_metnod').val();
        
        $.post(ADM_SRV + "bin/jquery.php", {
            func: 'get.order.price',
            products: products,
            variants: variants,
            variants_price: variants_price,
            variants_qty: variants_qty,
            user_id: user_id,
            delivry_method: delivry_method
        }).done(function(data) {
            var result = $.parseJSON(data);
            $('#total_price').html(result.real_price);
            $('#discount').html(result.discount);
            $('#delivery_price').html(result.del_price);
            $('#final_price').html(result.final_price);
        });
    });
    
    function itemPrice(item_id) {
        $("#item_total_price_" + item_id).html($("#item_price_" + item_id).html() * $("#item_qty_" + item_id).val());
    }
})
</script>