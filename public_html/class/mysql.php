<?php
class mysql {
    private $connect;
    private $host;
    private $database;
    private $user;
    private $password;
    
    public function __construct() {
        // $this->host = config('host');
        // $this->database = config('database');
        // $this->user = config('user');
        // $this->password = config('password');
        $this->host = '127.0.0.1';
        $this->database = 'fp_site1';
        $this->user = 'fp_site1';
        $this->password = '4QPxIBlym7';
        
        $this->connect = mysql_connect($this->host, $this->user, $this->password) or die(mysql_error());
        mysql_select_db($this->database, $this->connect) or die(mysql_error());
        mysql_query("SET NAMES 'utf8'", $this->connect);
        mysql_query("SET CHARACTER SET utf8", $this->connect);
        mysql_query("SET CHARACTER_SET_CONNECTION=utf8", $this->connect);
    }
    
    public function query($str) {
        $result = mysql_query($str, $this->connect) or die(mysql_error());
        return $result;
    }
    
    function assocAdmin($str) {
        $arRows = array();
        while ($row = mysql_fetch_assoc($str)) $arRows[] = $row;
        return ($arRows);
    }
    
    public function assoc($str) {
        $result = mysql_fetch_assoc($str);
        return $result;
    }
    
    function dbarray($str) {
        $result = mysql_fetch_array($str);
        return $result;
    }
    
    public function getLastId() {
        return mysql_insert_id($this->connect);
    }
    
    public function escape($value) {
        return mysql_real_escape_string($value);
	}

    public function __destruct() {
        @mysql_close($this->connect);
    }

}