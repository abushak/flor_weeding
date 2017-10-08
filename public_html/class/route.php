<?php
class route{
    protected $db;
    protected $route;
    
    public function __construct() {
        $this->db = new mysql();
        $this->route = explode('/', $_SERVER['REQUEST_URI']);
    }
    
    public function languageRewrite(){
        $query = $this->db->query("SELECT `code` FROM `zet_language`");
        while($row = $this->db->assoc($query)){
            if($this->route[1] == $row["code"]){
                $routs = array(); $i = 0;
                foreach($this->route as $key=>$value){
                    $routs[$i] = $this->route[$i + 1];
                    $i++;
                }
                break;
            } else $routs = $this->route;
        }
        return $routs;
    }
}
