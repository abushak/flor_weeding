<tr>
    <td class="padding_left w4">
        <section class="checkbox_list">
            <input type="checkbox" name="" id="t_check_all" />
            <label for="t_check_all"><span></span></label>
        </section>
    </td>
    <td class="padding_left w4"><?php echo WORD_55; ?></td>
    <td><?php echo WORD_56; ?></td>
    <td><a href="<?php echo lRequest("sort", ($_GET["sort"] == "date_old") ? "date_new" : "date_old"); ?>"><?php echo WORD_57; ?></a>&nbsp;<?php echo ($_GET["sort"] == "date_old") ? "&uarr;" : "&darr;"; ?></td>
    <td class="center_text"><?php echo WORD_58; ?></td>
    <td class="center_text"><?php echo WORD_59; ?></td>
</tr>