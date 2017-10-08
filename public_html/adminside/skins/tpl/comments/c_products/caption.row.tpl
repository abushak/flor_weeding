<tr>
    <td class="padding_left w4">
        <section class="checkbox_list">
            <input type="checkbox" id="t_check_all" />
            <label for="t_check_all"><span></span></label>
        </section>
    </td>
    <td class="padding_left w4"><a href="<?php echo lRequest($_REQUEST, "sort", ($_GET["sort"] == "name_old") ? "name_new" : "name_old"); ?>"><?php echo WORD_185; ?></a>&nbsp;<?php echo ($_GET["sort"] == "name_old") ? "&uarr;" : (($_GET["sort"] == "name_new") ? "&darr;" : false); ?></td>
    <td><a href="<?php echo lRequest($_REQUEST, "sort", ($_GET["sort"] == "date_old") ? "date_new" : "date_old"); ?>"><?php echo WORD_196; ?></a>&nbsp;<?php echo ($_GET["sort"] == "date_old") ? "&uarr;" : (($_GET["sort"] == "date_new" || !$_GET["sort"]) ? "&darr;" : false); ?></td>
    <td class="center_text"><a href="<?php echo lRequest($_REQUEST, "sort", ($_GET["sort"] == "mark_old") ? "mark_new" : "mark_old"); ?>"><?php echo WORD_197; ?></a>&nbsp;<?php echo ($_GET["sort"] == "mark_old") ? "&uarr;" : (($_GET["sort"] == "mark_new") ? "&darr;" : false); ?></td>
    <td class="center_text"><a href="<?php echo lRequest($_REQUEST, "sort", ($_GET["sort"] == "status_old") ? "status_new" : "status_old"); ?>"><?php echo WORD_24; ?></a>&nbsp;<?php echo ($_GET["sort"] == "status_old") ? "&uarr;" : (($_GET["sort"] == "status_new") ? "&darr;" : false); ?></td>
    <td class="center_text"><?php echo WORD_19; ?></td>
</tr>