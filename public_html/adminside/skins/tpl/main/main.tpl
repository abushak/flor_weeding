<section class="bg_caption">
    <p class="admin_caption"><?php echo WORD_374; ?></p>
</section>

<section class="admin_r">
    <section class="inner_left span8">
        <table class="admin_table">
            <tr>
                <td><?php echo WORD_375; ?></td>
                <td><?php echo WORD_376; ?></td>
                <td><?php echo WORD_377; ?></td>
                <td><?php echo WORD_378; ?></td>
                <td><?php echo WORD_379; ?></td>
                <td><?php echo WORD_380; ?></td>
            </tr>
            <tr>
                <td><?php echo WORD_381; ?></td>
                <td><?php echo CountOrdersByDate("today"); ?></td>
                <td><?php echo OrdersSumByStatus("today"); ?></td>
                <td><?php echo CountOrdersByDate("today", "failed"); ?></td>
                <td><?php echo CountOrdersByDate("today", "cancelled"); ?></td>
                <td><?php echo OrdersSumByStatus("today", true); ?></td>
            </tr>
            <tr>
                <td><?php echo WORD_382; ?></td>
                <td><?php echo CountOrdersByDate('yesterday'); ?></td>
                <td><?php echo OrdersSumByStatus('yesterday'); ?></td>
                <td><?php echo CountOrdersByDate('yesterday', 'failed'); ?></td>
                <td><?php echo CountOrdersByDate('yesterday', 'cancelled'); ?></td>
                <td><?php echo OrdersSumByStatus('yesterday', true); ?></td>
            </tr>
            <tr>
                <td><?php echo WORD_383; ?></td>
                <td><?php echo CountOrdersByDate('month'); ?></td>
                <td><?php echo OrdersSumByStatus('month'); ?></td>
                <td><?php echo CountOrdersByDate('month', 'failed'); ?></td>
                <td><?php echo CountOrdersByDate('month', 'cancelled'); ?></td>
                <td><?php echo OrdersSumByStatus('month', true); ?></td>
            </tr>
            <tr>
                <td><?php echo WORD_384; ?></td>
                <td><?php echo CountOrdersByDate('quarter'); ?></td>
                <td><?php echo OrdersSumByStatus('quarter'); ?></td>
                <td><?php echo CountOrdersByDate('quarter', 'failed'); ?></td>
                <td><?php echo CountOrdersByDate('quarter', 'cancelled'); ?></td>
                <td><?php echo OrdersSumByStatus('quarter', true); ?></td>
            </tr>
            <tr>
                <td><?php echo WORD_385; ?></td>
                <td><?php echo CountOrdersByDate('all'); ?></td>
                <td><?php echo OrdersSumByStatus('all'); ?></td>
                <td><?php echo CountOrdersByDate('all', 'failed'); ?></td>
                <td><?php echo CountOrdersByDate('all', 'cancelled'); ?></td>
                <td><?php echo OrdersSumByStatus('all', true); ?></td>
            </tr>
        </table>
    </section>
    
    <section class="inner_right">
        <p class="admin_caption"><?php echo WORD_421; ?></p>
        <section class="wrap_knob">
            <?php $sum = OrdersSumByStatus("month"); ?>
            <?php $plan = config("sale_plan"); ?>
            <?php $val = round(($sum * 100) / $plan, 1); ?>
            <input class="knob" data-fgColor="#c1ced9" data-thickness=".07" data-readOnly=true value="<?php echo $val; ?>" />
            <p class="realis"><span></span> <?php echo WORD_422; ?> (<?php echo $val; ?>%)</p>
            <p class="plan_realis"><span></span> <?php echo WORD_423; ?> (<?php echo "{$plan} {$site_currency["abbr"]}"; ?>)</p>
        </section>
    </section>
</section>

<section class="admin_r">
    <section class="inner_left span8">
        <p class="admin_caption"><?php echo WORD_386; ?></p>
        <ul class="admin_tab">
            <li><a class="active_admin_tab" href="#null"><span><?php echo WORD_388; ?></span></a></li>
            <li><a href="#null"><span><?php echo WORD_389; ?></span></a></li>
            <li><a href="#null"><span><?php echo WORD_390; ?></span></a></li>
            <!-- <li><a href="#null" class="active_admin_tab"><span><?php echo WORD_387; ?></span></a></li> -->
        </ul>
        
        <section class="admin_tab_content">
            <!-- <aside>
                <table class="admin_table last_order">
                    <?php include ADM_TPL."main/row.caption.tpl"; ?>
                    <?php $all = GetOrdersByStatus('all'); ?>
                    <?php foreach($all as $key => $val){ ?>
                    <?php $row = $all[$key]; ?>
                    <?php include ADM_TPL."main/row.tpl"; ?>
                    <?php } ?>
                </table>
            </aside> -->
            <aside>
                <table class="admin_table last_order">
                    <?php include ADM_TPL."main/row.caption.tpl"; ?>
                    <?php $new = GetOrdersByStatus('new'); ?>
                    <?php foreach($new as $key => $val){ ?>
                    <?php $row = $new[$key]; ?>
                    <?php include ADM_TPL."main/row.tpl"; ?>
                    <?php } ?>
                </table>
            </aside>
            <aside>
                <table class="admin_table last_order">
                    <?php include ADM_TPL."main/row.caption.tpl"; ?>
                    <?php $inprogress = GetOrdersByStatus('inprogress'); ?>
                    <?php foreach($inprogress as $key => $val){ ?>
                    <?php $row = $inprogress[$key]; ?>
                    <?php include ADM_TPL."main/row.tpl"; ?>
                    <?php } ?>
                </table>
            </aside>
            <aside>
                <table class="admin_table last_order">
                    <?php include ADM_TPL."main/row.caption.tpl"; ?>
                    <?php $completed = GetOrdersByStatus('completed'); ?>
                    <?php foreach($completed as $key => $val){ ?>
                    <?php $row = $completed[$key]; ?>
                    <?php include ADM_TPL."main/row.tpl"; ?>
                    <?php } ?>
                </table>
            </aside>
        </section>
    </section>
    
    <section class="inner_right products">
        <p class="admin_caption"><?php echo WORD_391; ?></p>
        <section class="admin_products">
            <p><?php echo WORD_392; ?> <b><?php echo CountProductsByStatus('all'); ?></b> <br /> <span class="admin_products_detal"><?php echo WORD_393; ?> <b><?php echo SumProductsByStatus('all'); ?> <?php echo $site_currency['abbr']; ?></b></span></p>
            <p><?php echo WORD_394; ?> <b><?php echo CountProductsByStatus('sale'); ?></b> <br /> <span class="admin_products_detal"><?php echo WORD_393; ?> <b><?php echo SumProductsByStatus('sale'); ?> <?php echo $site_currency['abbr']; ?></b></span></p>
            <p><?php echo WORD_395; ?> <b><?php echo CountProductsByStatus('hidden'); ?></b> <br /> <span class="admin_products_detal"><?php echo WORD_393; ?> <b><?php echo SumProductsByStatus('hidden'); ?> <?php echo $site_currency['abbr']; ?></b></span></p>
            <p><?php echo WORD_396; ?> <b><?php echo CountCategories(); ?></b></p>
        </section>
    </section>
</section>
