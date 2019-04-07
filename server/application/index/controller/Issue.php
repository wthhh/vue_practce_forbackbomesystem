<?php

namespace app\index\controller;
use think\Request;
use think\Controller;

class Issue extends Controller
{
    public function _initialize()
    {
        parent::_initialize();
        $this->model = model('Issue');
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
        $ret = $this->model->getIssue($data);
        if ($ret) {
            return msg(200, $ret);
        } else {
            return msg(204, [], $this->model->getError());
        }
    }

    public function read()
    {
        $id = $this->param['id'];
        $ret = $this->model->getIssueById($id);
        if ($ret) {
            return msg(200, $ret);
        } else {
            return msg(100, null, $this->model->getError());
        }
    }
	
	public function readstui()
    {
        $id = $this->param['id'];
        $ret = $this->model->getIssuestuiById($id);
        if ($ret) {
            return msg(200, $ret);
        } else {
            return msg(100, null, $this->model->getError());
        }
    }

    public function save()
    {
        $ret = $this->model->saveIssue($this->param);
        if ($ret) {
            return msg(200, $this->model->getLastInsID(), '添加成功');
        } else {
            return msg(100, null, $this->model->getError());
        }
    }

    public function update()
    {
        if ($this->param['id']) {
            $id = $this->param['id'];
            unset($this->param['id']);
        } else {
            return msg(100, null, '参数错误');
        }
        $ret = $this->model->updateIssue($id, $this->param);
        if ($ret) {
            return msg(200, null, '更新成功');
        } else {
            return msg(100, null, $this->model->getError());
        }
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
        $ret = $this->model->updateIssue($id, $this->param, false);
        if ($ret) {
            return msg(200, null, '操作成功');
        } else {
            return msg(100, null, $this->model->getError());
        }
    }
}
