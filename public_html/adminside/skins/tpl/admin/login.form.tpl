<title><?php echo ADM_ENTER; ?></title> 
<link rel="stylesheet" href="<?php echo ADM_SKIN; ?>css/style.css" />
<link rel="stylesheet" href="<?php echo ADM_SKIN; ?>css/admin_style.css" />
<link rel="stylesheet" href="<?php echo ADM_SKIN; ?>css/icon-font.css" />
<link rel="stylesheet" href="<?php echo ADM_SKIN; ?>css/font-awesome.css" />

<section class="enter_block">
    <p class="title_enter"><?php echo ADM_ENTER; ?></p>
    <form method="POST">
        <input type="text" name="user" placeholder="<?php echo LOGIN; ?>" />
        <input type="password" name="pass" placeholder="<?php echo PASS; ?>" />
        <input type="submit" name="submit" value="<?php echo ENTER; ?>" />
    </form>
</section>
