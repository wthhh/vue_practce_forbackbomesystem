<template>
   <div>    
    <v-card>
      
     <v-card-title class="accent white--text">
          <span class="font-weight-bold display-1">User Information</span>
          <v-btn left id="exportToPdf" style="margin-left:45%;" @click="getPdf()">导出用户信息表</v-btn>

      </v-card-title>
      
      <v-card-content class="ma-3 px-4">
      <div>

        <div class="row" id="pdfDom">  
        
            <br><br>
          <h1 style="text-align:center">复旦大学研究生骨干信息表</h1>
          <table align="center" border="1" cellspacing="0" width="75%" style="margin-left:auto;margin-right:auto;">
            <tr align="center">
              <td width="30px" height="80px" align="center">姓名</td>
              <td width="70px" colspan="3">{{userInfo['username']}}</td>
              <td colspan="2" width="30px">性别</td>
              <td colspan="2" width="50px">{{userInfo['gender']}}</td>
              <td colspan="2" width="50px">出生年月</td>
              <td colspan="2" width="70px">{{userInfo['date']}}</td>
              <td rowspan="4" width="240px"><img :src="userInfo['image']" width="95%" style="display:block;"></td>
            </tr>
            <tr align="center">
              <td width="30px" height="80px" align="center">民族</td>
              <td width="70px" colspan="3">{{userInfo['nation']}}</td>
              <td colspan="2" width="30px">籍贯</td>
              <td colspan="2" width="50px">{{userInfo['nativeplace']}}</td>
              <td colspan="2" width="50px">政治面貌</td>
              <td colspan="2" width="70px">{{userInfo['political']}}</td>
            </tr>
            <tr align="center">
              <td width="30px" height="80px" align="center">学院</td>
              <td width="70px" colspan="3">{{userInfo['college']}}</td>
              <td colspan="2" width="30px">年级</td>
              <td colspan="2" width="50px">{{userInfo['grade']}}</td>
              <td colspan="2" width="50px">学制</td>
              <td colspan="2" width="70px">{{userInfo['majorset']}}</td>
            </tr>
            <tr align="center">
              <td width="30px" height="80px" align="center">培养类别</td>
              <td width="70px" colspan="3">{{userInfo['eduset']}}</td>
          
              <td colspan="2" width="30px">手机</td>
              <td colspan="2" width="50px">{{userInfo['phone']}}</td>
          
              <td colspan="2" width="50px">电子邮件</td>
              <td colspan="2" width="70px">{{userInfo['email']}}</td>
            </tr>
            <tr>
              <td width="10%" height="270;" align="center">教育背景（高中起）</td>
              <td colspan="16">{{userInfo['eduback']}}</td>
            </tr>
            <tr>
              <td width="10%" height="270;" align="center">研究生学生工作经历</td>
              <td colspan="16">{{userInfo['ug_exp']}}</td>
            </tr>
            <tr>
              <td width="10%" height="270;" align="center">其他阶段学生工作经历</td>
              <td colspan="16">{{userInfo['other_exp']}}</td>
            </tr>
          </table>
        </div>

      </div>
      </v-card-content>
    </v-card>
</div>

</template>


<script>

import profiledata from '@/api/profiledata'
import util from '@/utils'
export default {
    props:['psid','sname','puid','paid'],
    data () {
        return {
            image:null,
            selectedfile:null,
            username:'',
            realname:'',
            nativeplace:'',
            due:null,
            show:false,
            inputRules:[
                v => v.length >= 3 || 'Minimum length is 3 characters'
            ],
            genderitems: ['Male', 'Female'],
            genderselect:'',
            politicalitems: ['中共党员','中共预备党员','共青团员','民革党员','民盟盟员','民建会员','民进会员','农工党党员','致公党党员','九三学社社员','台盟盟员','无党派人士','群众'],
            nationitems:['汉族','满族','蒙古族','回族','藏族','维吾尔族','苗族','彝族','壮族','布依族','侗族','瑶族','白族','土家族','哈尼族','哈萨克族','傣族','黎族','傈僳族','佤族','畲族','高山族','拉祜族','水族','东乡族','纳西族','景颇族','柯尔克孜 族','土族','达斡尔族','仫佬族','羌族','布朗族','撒拉族','毛南族','仡佬族','锡伯族','阿昌族','普米族','朝鲜族','塔吉克族','怒族','乌孜别克族','俄罗斯族','鄂温克族','德昂族','保安族','裕固族','京族','塔塔尔族','独龙族','鄂伦春族','赫哲族','门巴族','珞巴族','基诺族',],
            politicalselect:'',
            nationselect:'',
            college:'',
            grade:'',
            majorset:'',
            eduset:'',
            phone:'',
            email:'',
            eduback:'',
            ug_exp:'',
            other_exp:'',
            date:null,
            data: [],
            menu: false,
            pj:[],
            usr:[],
            stu_id:'',
            show:false,
            htmlTitle:'复旦大学骨干信息表'
            //htmlTitle: '页面导出PDF文件名'
            //adata:[],
        }
    },
    computed:{
        getPsid:function (){
            return this.psid
        },
        getPuid:function (){
            return this.puid
        },
        getPaid:function (){
            return this.paid
        },
        userInfo:function () {
             console.log("now is Profile STTTTTTORE")
            console.log(this.$store)
            return this.$store.getters.getUserInfo
        },
        
    },
    methods:{
        init(){
            this.username=this.userInfo.username,
            this.realname=this.userInfo.realname,
            this.selectedfile=this.userInfo.image,
            this.genderselect=this.userInfo.gender,
            this.date=this.userInfo.date,
            this.nationselect=this.userInfo.nation,
            this.nativeplace=this.userInfo.nativeplace,
            this.politicalselect=this.userInfo.political,
            this.college=this.userInfo.college,
            this.grade=this.userInfo.grade,
            this.majorset=this.userInfo.majorset,
            this.eduset=this.userInfo.eduset,
            this.phone=this.userInfo.phone,
            this.email=this.userInfo.email,
            this.eduback=this.userInfo.eduback,
            this.ug_exp=this.userInfo.ug_exp,
            this.other_exp=this.userInfo.other_exp
        },
        async test(){
            this.init();
        },
        async toProfile(){
            if (confirm("你确定要离开吗，已填写的信息可能丢失？是－选择确定，否-选择取消")){
            util.toRouter('/user/home/profile',this)
            }
        }
    
    }
}
</script>
<style>
.table15_1 table {
  width:100%;
  margin:15px 0;
  border:0;
}
.table15_1 th {
  font-weight:bold;
  background-color:#e7f6fe;
  color:#57c5fe
}
.table15_1,.table15_1 th,.table15_1 td {
  font-size:1.0em;
  text-align:center;
  padding:4px;
  border-collapse:collapse;
}
.table15_1 th {
  border: 1px solid #e7f6fe;
  border-width:1px
}
.table15_1 td {
  border: 1px solid #e7f6fe;
  border-width:1px
}
.table15_1 tr {
  border: 1px solid #ffffff;
}
.table15_1 tr:nth-child(odd){
  background-color:#f7f7f7;
}
.table15_1 tr:nth-child(even){
  background-color:#ffffff;
}
</style>