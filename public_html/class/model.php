<?php
abstract class Model {
    protected $db;
    
    public function __construct() {
        $this->db = new mysql();
    }
    
    public function _linkTransliteration($_id, $_url, $_title, $_table) {
        $url = (empty($_url)) ? translite($_title) : translite($_url);
        $query = $this->db->query("SELECT `id`,`url` FROM `".$_table."` WHERE `url`='".$url."'");
        $res = $this->db->assoc($query);
        if ($res == false || $res["id"] = $_id) {
            $this->db->query("UPDATE `".$_table."` SET `url`='".$url."' WHERE `id`='".(int)$_id."'");
        } else {
            $this->db->query("UPDATE `".$_table."` SET `url`='".$_id."_".$url."' WHERE `id`='".(int)$_id."'");
        }
    }
    
    public function _redirect($_url) {
        redirectTo($_url);
    }
}