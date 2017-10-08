<tr>
    <td class="w4">
        <section class="checkbox_list">
            <input type="checkbox" id="t_check<?php echo $news_row["id"]; ?>" data-id="<?php echo $news_row["id"]; ?>" />
            <label for="t_check<?php echo $news_row["id"]; ?>"><span></span></label>
        </section>
    </td>
    <td class="w4"><a href="#" class="admin_order_img"><img src="<?php echo getFile($news_row["picture"]); ?>" /></a></td>
    <td><a href="#" class="admin_news_title"><?php echo $news_row["title"]; ?></a></td>
    <td class="admin_news_date"><?php echo reset(explode(" ", $news_row["date"])); ?></td>
    <td class="center_text"><a href="#" class="table_link status_link <?php echo ($news_row["status"] == 1) ? "active" : "disable";?>" id="status_<?php echo $news_row["id"]; ?>" data-id="<?php echo $news_row["id"]; ?>"></a></td>
    <td class="center_text">
        <a title="<?php echo LIST_EDIT; ?>" class="admin_order_edit" href="<?php echo ADM_SRV."publications/news/".$news_row["id"]."/?act=edit" ?>"></a>
        <a title="<?php echo LIST_DEL; ?>" class="admin_order_delete delete-news" href="<?php echo ADM_SRV."publications/news/".$news_row["id"]."/?act=delete" ?>"></a>
    </td>
</tr>
