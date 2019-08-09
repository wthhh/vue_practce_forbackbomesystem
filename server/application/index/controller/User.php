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
    public function getNationData()
    {
        $nationitems=array('汉族','满族','蒙古族','回族','藏族','维吾尔族','苗族','彝族','壮族','布依族','侗族','瑶族','白族','土家族','哈尼族','哈萨克族','傣族','黎族','傈僳族','佤族','畲族','高山族','拉祜族','水族','东乡族','纳西族','景颇族','柯尔克孜族','土族','达斡尔族','仫佬族','羌族','布朗族','撒拉族','毛南族','仡佬族','锡伯族','阿昌族','普米族','朝鲜族','塔吉克族','怒族','乌孜别克族','俄罗斯族','鄂温克族','德昂族','保安族','裕固族','京族','塔塔尔族','独龙族','鄂伦春族','赫哲族','门巴族','珞巴族','基诺族');
        $number=array();       
        $ret;
        for ($i=0; $i<count($nationitems); $i++){
            

            $ret = $this->model->getNationNumber($nationitems[$i]); 
            if ($ret!==false) {
                $number[$i]=$ret;
            } else   {
                return msg($ret, null, $this->model->getError());
            }
        }
        return msg(200, $number);

    }
    public function getGenderData()
    {
        $genderitems=array('Male','Female');
        $number=array();       
        $ret;
        for ($i=0; $i<count($genderitems); $i++){
            $ret = $this->model->getGenderNumber($genderitems[$i]); 
            if ($ret!==false) {
                $number[$i]=$ret;
            } else   {
                return msg($ret, null, $this->model->getError());
            }
        }
        return msg(200, $number);

    }
    public function getPoliticalData()
    {
        $politicalitems=array('中共党员','中共预备党员','共青团员','民革党员','民盟盟员','民建会员','民进会员','农工党党员','致公党党员','九三学社社员','台盟盟员','无党派人士','群众');
        $number=array();       
        $ret;       

        for ($i=0; $i<count($politicalitems); $i++){ 
            $ret = $this->model->getPoliticalNumber($politicalitems[$i]); 
            if ($ret!==false) {
                $number[$i]=$ret;
            } else   {
                return msg($ret, null, $this->model->getError());
            }
        }
        return msg(200, $number);

    }
    

   
  

   
}
