<?php
namespace app\index\controller;
use think\Request;
use think\Controller;

class Base extends Controller
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
        //dump($this->param);
    }
    # init

    public function index()
    {
        return view('index');
    }
    # 这个index 控制器的调用是 server/public/index.php/Index/index
    # 这些都是在 router.php 里面定义的 

    public function login()
    {
        $stu_id = $this->param['stu_id'];
        // $admin_name = '';
        // $password = '';
        # param post data 
        $user = model('user');
        $data = [
          'stu_id' => $stu_id,
        ];
        $ret  = $user->getUserLogin($data);
        if($ret){
            return msg(1,$ret);
        }
        else{
            return msg(404, null, $user->getError());
        }
    }
    public function adminlogin()
    {

		crossDomain:true;
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
        $ret  = $user->getAdminLogin($data);
        if($ret){
            return msg(1,$ret);
        }
        else{
            return msg(4040												, null, $user->getError());
        }
    }
}
