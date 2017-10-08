<tr>
    <td class="padding_left w4">
        <section class="checkbox_list">
            <input type="checkbox" id="t_check_all" />
            <label for="t_check_all"><span></span></label>
        </section>
    </td>
    <td class="padding_left w4"><a href="<?php echo lRequest("sort", ($_GET["sort"] == "id_old") ? "id_new" : "id_old"); ?>">ID</a>&nbsp;<?php echo ($_GET["sort"] == "id_old") ? "&uarr;" : (($_GET["sort"] == "id_new" || !$_GET["sort"]) ? "&darr;" : false); ?></td>
    <td><a href="<?php echo lRequest("sort", ($_GET["sort"] == "date_old") ? "date_new" : "date_old"); ?>"><?php echo WORD_184; ?></a>&nbsp;<?php echo ($_GET["sort"] == "date_old") ? "&uarr;" : (($_GET["sort"] == "date_new") ? "&darr;" : false); ?></td>
    <td><?php echo WORD_185; ?></td>
    <td><?php echo WORD_186; ?></td>
    <td><?php echo WORD_187; ?></td>
    <td></td>
</tr>