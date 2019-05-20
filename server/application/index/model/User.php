<?php

namespace app\index\model;

use think\Model;

class User extends Model
{
	public function getUserLogin($data)
    {
        # no valid here , consider data accurate 
        $res = $this->where($data)->find();
        if ($res) {
            return $res;
            
        } 
        else {
            $this->error = 'incorrect account or password';
            return false;
        }
    }

    public function getUserBystuId($id = null)
    {
        $res = $this->all(['stu_id' =>$id]);
        if ($res) {
            return $res;
        } else {
            $this->error = '当前查询不存在';
            return false;
        }
    }
}