<?php
class CallBack extends Model {
    public function AddCallback($data) {
        $phone = $data["phone"];
        $date = date("Y-m-d");
        $status = 1;
        $user_id = 0;
        $this->db->query("INSERT INTO `zet_callback` (`user_id`,`status`,`date`,`phone`) VALUES ('".$user_id."','".$status."','".$date."','".$phone."')");
    }
    
    public function getCallbacks($data, $status = 0){
        $_status = ($status == 1) ? " `status`='1'" : (($status == 2) ? " `status`='2'" : "");
        
        $order = " ORDER BY `id` DESC";
        if(!empty($data["sort"])){
            $sort = explode('_', $data["sort"]);
            $sort[1] = ($sort[1] == "old") ? "ASC" : "DESC";
            $order = " ORDER BY `{$sort[0]}` {$sort[1]}";
        }
        
        $where = ($_status == "") ? "" : " WHERE{$_status}";
        if(!empty($data["q"])){
            $_status = ($_status == "") ? "" : " AND{$_status}";
            $where = " WHERE `phone` LIKE '%{$data["q"]}%'".$_status;
        }
        
        $query = $this->db->query("SELECT `id`, `user_id`, `status`, `date`, `phone`, (SELECT `name` FROM `zet_userlist` WHERE `id`=`zet_callback`.`user_id`) AS `user_name` FROM `zet_callback`{$where}{$order}");
        return $query;
    }
    
    public function countCallback($status = 0){
        $where = ($status == 1) ? " WHERE `status`='1'" : (($status == 2) ? " WHERE `status`='2'" : "");
        $query = $this->db->query("SELECT COUNT(*) AS `total` FROM `zet_callback`{$where}");
        $res = $this->db->assoc($query);
        return $res['total'];
    }
    
    public function deleteCallback($callback_id){
        $this->db->query("DELETE FROM `zet_callback` WHERE `id`='".(int)$callback_id."'");
    }
    
    public function redirect() {
        global $route;
        $link = $route[3]."/";
        redirectTo(ADM_SRV."callback/".$link);
    }
}