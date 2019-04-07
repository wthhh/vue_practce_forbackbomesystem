<?php

namespace app\index\model;

use think\Model;

class Attribute extends Model
{
    public function getAttribute($data = [])
    {
        $res = $this->where($data)->select();
        // if ($res) {
            // $res = $res->toArray();
        // }
        return $res;
    }

    public function getAttributeById($id = null)
    {
        $res = $this->get($id);
        if ($res) {
            return $res;
        } else {
            $this->error = '当前查询不存在';
            return false;
        }
    }
	
	public function getAttributeproById($id = null)
    {
	$res = $this->get(['sid' => $id]);
        if ($res) {
            return $res;
        } else {
            $this->error = '当前查询不存在';
            return false;
        }
    }

    public function saveAttribute($param = [])
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

    public function updateAttribute($id = null, $param = [], $flag = true)
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

}
