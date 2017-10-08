<ul class="zakaz_nav">
    <li><a href="<?php echo ADM_SRV; ?>orders/new/" <?php echo ($route[3] == "new" || empty($route[3])) ? 'class="zakaz_active"' : false; ?>><?php echo WORD_308; ?></a> <span><?php echo $orders->CountOrders("new"); ?></span></li>
    <li><a href="<?php echo ADM_SRV; ?>orders/inprogress/" <?php echo ($route[3] == "inprogress") ? 'class="zakaz_active"' : false; ?>><?php echo WORD_309; ?></a> <span><?php echo $orders->CountOrders("inprogress"); ?></span></li>
    <li><a href="<?php echo ADM_SRV; ?>orders/submitted/" <?php echo ($route[3] == "submitted") ? 'class="zakaz_active"' : false; ?>><?php echo WORD_310; ?></a> <span><?php echo $orders->CountOrders("submitted"); ?></span></li>
    <li><a href="<?php echo ADM_SRV; ?>orders/completed/" <?php echo ($route[3] == "completed") ? 'class="zakaz_active"' : false; ?>><?php echo WORD_311; ?></a></li>
    <li><a href="<?php echo ADM_SRV; ?>orders/failed/" <?php echo ($route[3] == "failed") ? 'class="zakaz_active"' : false; ?>><?php echo WORD_312; ?></a></li>
    <li><a href="<?php echo ADM_SRV; ?>orders/cancelled/" <?php echo ($route[3] == "cancelled") ? 'class="zakaz_active"' : false; ?>><?php echo WORD_313; ?></a></li>
    <li><a href="<?php echo ADM_SRV; ?>orders/all/" <?php echo ($route[3] == "all") ? 'class="zakaz_active"' : false; ?>><?php echo WORD_314; ?></a></li>
    <li><a href="<?php echo ADM_SRV; ?>orders/fast/" <?php echo ($route[3] == "fast") ? 'class="zakaz_active"' : false; ?>><?php echo WORD_373; ?></a></li>
</ul>