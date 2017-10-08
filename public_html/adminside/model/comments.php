<?php
class Comment extends Model {
    public function AddReview($data) {
        $date = date("Y-m-d");
        $status = 0;
        
        foreach ($data as $key => $val) {
            $data[$key] = $this->db->escape($val);
        }
        
        $this->db->query("INSERT INTO `zet_comments_reviews` (`status`,`date`,`name`,`text`) VALUES ('".$status."','".$date."','".$data["name"]."','".$data["review"]."')");
    }
    
    public function GetReviews($num = 0) {
        $data = array();
        $limit = ($num == 0) ? "" : "LIMIT 1" ;
        $query = $this->db->query("SELECT `date`,`name`,`text` FROM `zet_comments_reviews` ORDER BY `date` DESC, `id` DESC {$limit}");
        while ($row = $this->db->assoc($query)) {
            $data[] = $row;
        }
        return $data;
    }
    
    public function GetReviewsStore($num = 0) {
        $data = array();
        $limit = ($num == 0) ? "" : "LIMIT 1" ;
        $query = $this->db->query("SELECT `date`,`name`,`text` FROM `zet_comments_reviews` WHERE `status`='1' ORDER BY `date` DESC, `id` DESC {$limit}");
        while ($row = $this->db->assoc($query)) {
            $data[] = $row;
        }
        return $data;
    }
    
    public function addCom($data){
        $_date = $this->db->escape($data["date"])." ".date("H:i:s");
        $this->db->query("INSERT INTO `zet_comments_reviews` (`id`, `status`, `date`, `name`, `text`) VALUES ('','1','".$_date."','".$this->db->escape($data["name"])."','".$this->db->escape($data["text"])."')");
    }
    
    public function editCom($com_id, $data){
        $_date = $this->db->escape(reset(explode(" ", $data["date"])))." ".date("H:i:s");
        $this->db->query("UPDATE `zet_comments_reviews` SET `date`='".$_date."', `name`='".$this->db->escape($data["name"])."', `text`='".$this->db->escape($data["text"])."' WHERE `id`='".(int)$com_id."'");
    }
    
    public function deleteCom($com_id){
        $this->db->query("DELETE FROM `zet_comments_reviews` WHERE `id`='".(int)$com_id."'");
    }
    
    public function getCom($com_id){
        $query = $this->db->query("SELECT * FROM `zet_comments_reviews` WHERE `id`='".(int)$com_id."'");
        $result = $this->db->assoc($query);
        return $result;
    }
    
    public function getComments($data){
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
        
        $query = $this->db->query("SELECT `id`, `status`, `date`, `name`, `text` FROM `zet_comments_reviews`{$where}{$order}");
        return $query;
    }
    
    public function countCom(){
        $query = $this->db->query("SELECT COUNT(*) AS `total` FROM `zet_comments_reviews` WHERE `status`='0'");
        $res = $this->db->assoc($query);
        return $res['total'];
    }
    
    public function check($com_id) {
        $query = $this->db->query("SELECT * FROM `zet_comments_reviews` WHERE `id`='".(int)$com_id."'");
        $result = $this->db->assoc($query);
        return ($result) ? true : false;
    }
    
    public function redirect(){
        redirectTo(ADM_SRV."comments/reviews/");
    }
}