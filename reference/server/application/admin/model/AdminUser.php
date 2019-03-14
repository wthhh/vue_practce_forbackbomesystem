<?php

namespace app\admin\model;

use think\Model;

class AdminUser extends Model
{
    public function getUserLogin($data)
    {
        $validate = Validate($this->name);

        if (!$validate->scene('login')->check($data)) {
            $this->error = $validate->getError();
            return false;
        }
        $res = $this->where($data)->find();
        if ($res) {
            if ($res['status']) {
                return $res;
            } else {
                $this->error = '该账户已被禁用';
                return false;
            }
        } else {
            $this->error = '账号或密码错误';
            return false;
        }
    }

    public function getUsers($data = [], $page, $len)
    {
        $res = $this->alias('u')
                    ->join('department d', 'u.d_id = d.id', 'LEFT')
                    ->join('position p', 'u.p_id = p.id', 'LEFT')
                    
                    ->field('u.id, u.username, u.nickname, u.last_login_at, u.last_logout_at, u.d_id, u.p_id,u.r_id, u.status, p.name as p_name, d.name as d_name')
                    ->page($page, $len)
                    ->where($data)
                    ->order('id asc')
                    ->select();
        if ($res) {
            $res = $res->toArray();
        }
        return $res;
    }

    public function getUserById($id = null)
    {
        $res = $this->getById($id);
        if ($res) {
            return $res;
        } else {
            $this->error = '当前查询用户不存在';
            return false;
        }
    }

    public function saveUser($param = [])
    {
        $validate = validate($this->name);
        if (!$validate->check($param)) {
            $this->error = $validate->getError();
            return false;
        }
        try {
            $this->data($param)->allowField(true)->save();
            return true;
        } catch (\Exception $e) {
            $this->error = '添加失败';
            return false;
        }
    }

    public function updateUser($id = null, $param = [], $flag = true)
    {
        if ($flag) {
            $validate = validate($this->name);
            if (!$validate->scene('update')->check($param)) {
                $this->error = $validate->getError();
                return false;
            }
        }
        try {
            $this->allowField(true)->save($param, [$this->getPk() => $id]);
            return true;
        } catch (\Exception $e) {
            $this->error = '更新失败';
            return false;
        }
    }

    public function count($data = [])
    {
        $ret = $this->where($data)->count();
        return $ret;
    }

    public function del($id = 0)
    {
      try {
          $res = $this->where('id',$id)->delete();
          if ($res) {
              return $res;
          } else {
              $this->error = '删除失败';
              return false;
          }
      } catch (\Exception $e) {
          $this->error = '删除失败';
          return false;
      }
    }
}
