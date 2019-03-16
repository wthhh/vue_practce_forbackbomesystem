<?php

namespace app\index\model;

use think\Model;

class Admin extends Model
{
	public function getUserLogin($data)
    {
        # no valid here , consider data accurate 
        $res = $this->where($data)->find();
        if ($res) {
            return $res;
            
        } 
        else {
            $this->error = '账号或密码错误(incorrect account or password)';
            return false;
        }
    }
}