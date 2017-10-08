<?php
$query = $comments_rew->getComments($_GET);
while($com_row = $mysql->assoc($query)){
    include ADM_TPL."comments/reviews/row.tpl";
}
