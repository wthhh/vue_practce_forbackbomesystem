<?php

namespace app\index\controller;
use think\Request;
use think\Controller;

class User extends Controller
{
    public function _initialize()
    {
        parent::_initialize();
        $this->model = model('User');
		header('Access-Control-Allow-Origin: *');
        header('Access-Control-Allow-Credentials: true');
        header('Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS');
        header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept, sessionId, X-Requested-Token");
        $this->request = Request::instance();
        $this->param = $this->request->param();
    }


    
 

	public function readbystuid()
    {
        $id = $this->param['id'];
        $ret = $this->model->getUserBystuId($id);
        if ($ret) {
            return msg(200, $ret);
        } else {
            return msg(100, null, $this->model->getError());
        }
    }

   
  

   
}
