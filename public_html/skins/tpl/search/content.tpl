<?php $_CatalogCategory = new CatalogCategory(); ?>
<?php $products = $_CatalogCategory->Search($_GET); ?>

<div class="catalog wbody simple">
    <div class="items">
        <?php foreach ($products as $key => $val) { ?>
        <?php $new = ($val['new'] == 1) ? " new" : false; ?>
        <?php $hit = ($val['hit'] == 1) ? " hit" : false; ?>
        <?php $sale = ($val['cross_price'] > $val['price']) ? " sale" : false; ?>
        <?php include TPL."common/catalog.item.tpl"; ?>
        <?php } ?>
    </div>
    
    <div class="actions"></div>
</div>