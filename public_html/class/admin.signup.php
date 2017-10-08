<?php
class admin {
    function check() {
        $res = $_SESSION['admin'] ? true : false;
        return $res;
	}
    
    function signup() {
        if($_POST['submit']) {
            $user = htmlspecialchars($_POST['user']);
            $pass = htmlspecialchars($_POST['pass']);
            if(!empty($user) and !empty($pass)) {
                $pass = md5($pass);
                if($user == config('admin_login') and $pass == config('admin_pass')) {
                    $_SESSION['admin'] = md5($user);
                    $uri = substr(SRV, 0, -1).$_SERVER['REQUEST_URI'];
                    header('Location: '.$uri);
                } else $this->form().$this->error(CHECK_FOR_TRUE);
			} else $this->form().$this->error(NOT_ALL);
		} else $this->form();
	}
    
    function form() {
        include ADM_TPL.'admin/login.form.tpl';
	}
    
    function error($errname) {
        include ADM_TPL.'admin/error.form.tpl';
    }
    
    function logout() {
        $_SESSION['admin'] = '';
        unset($_SESSION['admin']);
        redirectTo(SRV);
    }
}
