<?php
class CommentsProducts extends Model{
    
    public function deleteComment($comment_id){
        $this->db->query("DELETE FROM `zet_comments_to_products` WHERE `id`='".(int)$comment_id."'");
    }
    
    public function getComments($data, $language_id){
        $order = " ORDER BY `date` DESC";
        if(!empty($data["sort"])){
            $sort = explode('_', $data["sort"]);
            $sort[1] = ($sort[1] == "old") ? "ASC" : "DESC";
            $order = " ORDER BY `{$sort[0]}` {$sort[1]}";
        }
        
        $where = "";
        if(!empty($data["q"])){
            $where = " WHERE `name` LIKE '%{$data["q"]}%' OR `text` LIKE '%{$data["q"]}%'";
        }
        $query = $this->db->query("SELECT `id`, `product_id`, `status`, `date`, `name`, `text`, `mark`, (SELECT `title` FROM `zet_product_description` WHERE `language_id`='".(int)$language_id."' AND `product_id`=`zet_comments_to_products`.`product_id`) AS `title` FROM `zet_comments_to_products`{$where}{$order}");
        return $query;
    }
    
    public function countCom(){
        $query = $this->db->query("SELECT COUNT(*) AS `total` FROM `zet_comments_to_products` WHERE `status`='0'");
        $res = $this->db->assoc($query);
        return $res['total'];
    }
    
    public function redirect(){
        redirectTo(ADM_SRV."comments/c_products/");
    }
}