<section id="wrapper_admin">
    <header>
        <section class="row-fluid">
            <section class="admin_logo span2">
                <a href="<?php echo ADM_SRV; ?>">My Zetadmin</a>
            </section>
            
            <section class="admin_point">
                <ul class="span3">
                    <li><a href="<?php echo ADM_SRV; ?>orders/new/"><span class="point_count"><?php echo $orders->CountOrders("new"); ?></span></a></li>
                    <li><a href="<?php echo ADM_SRV; ?>userlist/users/"><span class="point_count"><?php echo $users->countUsers(true); ?></span></a></li>
                    <li><a href="<?php echo ADM_SRV; ?>comments/reviews/"><span class="point_count"><?php echo $comments_products->countCom() + $comments_rew->countCom(); ?></span></a></li>
                    <li><a href="<?php echo ADM_SRV; ?>callback/new_callback/"><span class="point_count"><?php echo $callback->countCallback(1); ?></span></a></li>
                </ul>
                
                <section class="admin_link">
                    <a target="_blank" href="<?php echo SRV; ?>"><?php echo BACKTOSITE; ?></a>
                    <span>|</span>
                    <a href="<?php ADM_SRV; ?>?act=logout"><?php echo EXITFROMADM; ?></a>
                </section>
            </section>
        </section>
    </header>
    
    <content>
        <section class="wrap_admin">
            <section class="row-fluid">
                <section class="admin_left span2">
                    <?php include ADM_TPL."navigation.tpl"; ?>
                    
                    <p class="admin_copyright">© <?php echo date("Y"); ?> ZetDesign</p>
                </section>
                
                <section class="admin_right">
                    <?php include ADM_TPL.$dir."/main.tpl"; ?>
                </section>
            </section>
        </section>
    </content>
</section>

<?php if(empty($route[2]) || $route[2] == 'main' || ($route[2] == 'orders' && !$_GET['act']) || ($route[3] == 'users' && $_GET['act'] == 'view')){ ?>
<section id="admin_order_box" class="box" style="display: none; overflow: auto;">
    <section class="wrap_box" id="order-box-content">
        <section class="wrap_order_box">
            <section class="admin_order_history">
                <p class="history_title">История выполнения заказа</p>
                <a href="#null" class="admin_order_comment"><span>Добавить комментарий</span></a>
                <form id="admin_comment"><textarea></textarea></form>
                <p class="admin_order_date"><span>Сегодня 01:09</span> Заказ подтвержден и принят в обработку</p>
            </section>
        </section>
    </section>
</section>
<?php }?>