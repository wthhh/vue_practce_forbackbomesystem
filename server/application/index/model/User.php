<?php

namespace app\index\model;

use think\Model;

class User extends Model
{
    public function getProfile($data = [])
    {
        $res = $this->where($data)->select();
        // if ($res) {
            // $res = $res->toArray();
        // }
        return $res;
    }

    public function getProfileById($id = null)
    {
        $res = $this->get($id);
        if ($res) {
            return $res;
        } else {
            $this->error = '当前查询不存在';
            return false;
        }
    }
	
    public function getProfileattById($id = null)
    {
    $res = $this->all(['aid' => $id]);
        if ($res) {
            return $res;
        } else {
            $this->error = '当前查询不存在';
            return false;
        }
    }

	public function getProfilestuById($id = null)
    {
	$res = $this->all(['uid' => $id]);
        if ($res) {
            return $res;
        } else {
            $this->error = '当前查询不存在';
            return false;
        }
    }

    public function saveProfile($param = [])
    {
        // $validate = validate($this->name);
        // if (!$validate->check($param)) {
            // $this->error = $validate->getError();
            // return false;
        // }
        try {
            $this->data($param)->allowField(true)->save();
            return true;
        } catch (\Exception $e) {
            $this->error = '添加失败';
            return false;
        }
    }

    public function updateProfile($id = null, $param = [], $flag = true)
    {
        // if ($flag) {
            // $validate = validate($this->name);
            // if (!$validate->check($param)) {
                // $this->error = $validate->getError();
                // return false;
            // }
        // }
        try {
            $this->allowField(true)->save($param, [$this->getPk() => $id]);
            return true;
        } catch (\Exception $e) {
            $this->error = '更新失败';
            return false;
        }
    }

    public function del($id = 0)
    {
      try {
          $res = $this->destroy($id);
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

    public function getUserBystuId($stuId = null)
    {
        $res = $this->all(['stu_id' =>$stuId]);
        if ($res) {
            return $res;
        } else {
            $this->error = '当前查询不存在';
            return false;
        }
    }

    public function addNewUserWithstuId($stuId)
    {
        $data=[
            'stu_id'=> $stuId,
        ];
        if (!$this->where("stu_id",$stuId)->find()){
            try {
                $this->insert($data);
                return 200;
            } catch (\Exception $e) {
                $this->error = '添加失败';
                return 100;
            }
        }
        else{
            $this->error = '该学号已存在';
            return 403;

        }
    }
    public function getNationNumber($nation)
    {
        $data=[
            'nation'=> $nation,
        ];
        # no valid here , consider data accurate 
        $res = $this->where($data)->count();        
        return $res;

        
    }
    public function getGenderNumber($gender)
    {
        $data=[
            'gender'=> $gender,
        ];
        # no valid here , consider data accurate 
        $res = $this->where($data)->count();       
         return $res;

        
    }
    public function getPoliticalNumber($political)
    {
        $data=[
            'political'=> $political,
        ];
        # no valid here , consider data accurate 
        $res = $this->where($data)->count();        
        return $res;

        
    }
    
}