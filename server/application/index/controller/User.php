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


    
    public function index()
    {

        $status = isset($this->param['status']) ? $this->param['status'] : null;
        $data = [];
        if ($status) {
            $data['status'] = $status;
        }
        $ret = $this->model->getProfile($data);
        if ($ret) {
            return msg(200, $ret);
        } else {
            return msg(204, [], $this->model->getError());
        }
    }

    public function read()
    {
        $id = $this->param['uid'];
        $ret = $this->model->getProfileById($id);
        if ($ret) {
            return msg(200, $ret);
        } else {
            return msg(100, null, $this->model->getError());
        }
    }
	
    public function readatt()
    {
        $id = $this->param['id'];
        $ret = $this->model->getProjectattById($id);
        if ($ret) {
            return msg(200, $ret);
        } else {
            return msg(100, null, $this->model->getError());
        }
    }

	public function readstu()
    {
        $id = $this->param['id'];
        $ret = $this->model->getProjectstuById($id);
        if ($ret) {
            return msg(200, $ret);
        } else {
            return msg(100, null, $this->model->getError());
        }
    }

    public function save()
    {
        $ret = $this->model->saveProfile($this->param);
        if ($ret) {
            return msg(200, $this->model->getLastInsID(), '添加成功');
        } else {
            return msg(100, null, $this->model->getError());
        }
    }

    public function update()
    {
        // return msg(22222222, null, $this);

        if ($this->param['uid']) {
            $id = $this->param['uid'];
            unset($this->param['uid']);       

        } else {
            return msg(100, null, '参数错误');
        }
        // return msg(11100, null, $this);
        $ret = $this->model->updateProfile($id, $this->param); 
        if ($ret) {
            return msg(200, null, '更新成功');
        } else {
            return msg(100, null, $this->model->getError());
        }
        // if ($this->param['uid']) {

        //     $id = $this->param['uid'];
        //     unset($this->param['uid']);
        //     $file = request()->file('image');
        //     if($file){
        //         $info = $file->move(ROOT_PATH . 'public' . DS . 'uploads');
        //         if($info){
        //             // 成功上传后 获取上传信息
        //             // 输出 jpg
        //             echo $info->getExtension();
        //             // 输出 20160820/42a79759f284b767dfcb2a0197904287.jpg
        //             echo $info->getSaveName();
        //             // 输出 42a79759f284b767dfcb2a0197904287.jpg
        //             echo $info->getFilename(); 
        //         }else{
        //             // 上传失败获取错误信息
        //             echo $file->getError();
        //         }
        //     }
        // } else {
        //     return msg(100, null, '参数错误');
        // }
        // $ret = $this->model->updateProfile($id, $this->param);
        // if ($ret) {
        //     return msg(200, null, '更新成功');
        // } else {
        //     return msg(100, null, $this->model->getError());
        // }
    }

    public function delete()
    {
        if ($this->param['id']) {
            $id = $this->param['id'];
        } else {
            return msg(100, null, '参数错误');
        }
        $ret = $this->model->del($id);
        if ($ret) {
            return msg(200, null, '删除成功');
        } else {
            return msg(100, null, $this->model->getError());
        }
    }

    public function enable()
    {
        if (isset($this->param['id'])) {
            $id = $this->param['id'];
            unset($this->param['id']);
        } else {
            return msg(100, null, '参数错误');
        }
        $ret = $this->model->updateProfile($id, $this->param, false);
        if ($ret) {
            return msg(200, null, '操作成功');
        } else {
            return msg(100, null, $this->model->getError());
        }
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
    
    public function newuser()
    {
        $id = $this->param['id'];

        $ret = $this->model->addNewUserWithstuId($id);
        if ($ret==200) {
            return msg(200, $ret);
        } else   {
            return msg($ret, null, $this->model->getError());
        }

    }

   
  

   
}
