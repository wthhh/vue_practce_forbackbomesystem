<?php
namespace app\index\controller;
use think\Request;

class Base
{
	public function _initialize()
    {
        parent::_initialize();
        // header('Access-Control-Allow-Origin: '.$_SERVER['HTTP_ORIGIN']);
        header('Access-Control-Allow-Origin: *');
        header('Access-Control-Allow-Credentials: true');
        header('Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS');
        header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept, sessionId, X-Requested-Token");
        $this->request = Request::instance();
        $this->param = $this->request->param();
    }
    # init

    public function index()
    {
        return 'test';
    }
    # 这个index 控制器的调用是 server/public/index.php/Index/index
    # 这些都是在 router.php 里面定义的 

    public function login()
    {
    	$admin_name = $this->param['admin_name'];
        $password = $this->param['password'];
        // $admin_name = '';
        // $password = '';
        # param post data 
        
        $user = model('Admin');
        $data = [
          'admin_name' => $admin_name,
          'password' => $password,
        ];
        $ret  = $user->getUserLogin($data);
        if($ret){
        	return msg(1,$ret);
        }
        else{
        	return msg(404, null, $user->getError());
        }
    }
}
