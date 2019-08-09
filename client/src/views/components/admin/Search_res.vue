<template>
   <div>    
    <v-card>
      
     <v-card-title class="accent white--text">
          <span class="font-weight-bold display-1">User Information</span>
          <v-btn left id="exportToPdf" style="margin-left:45%;" @click="getPdf()">导出用户信息表</v-btn>

      </v-card-title>
      
      <v-card-content class="ma-3 px-4" v-for="item1 in usr" :key="item1.uid">
      <div>

        <div class="row" id="pdfDom">  
          <br>
          <br>
          <h1 style="text-align:center;">复旦大学研究生骨干信息表</h1>
          <table align="center" border="1" cellspacing="0" width="75%" style="margin-left:auto;margin-right:auto;">
            <tr align="center">
              <td width="30px" height="80px" align="center">姓名</td>
              <td width="70px" colspan="3">{{item1.realname}}</td>
              <td colspan="2" width="30px">性别</td>
              <td colspan="2" width="50px">{{item1.gender}}</td>
              <td colspan="2" width="50px">出生年月</td>
              <td colspan="2" width="70px">{{item1.date}}</td>
              <td rowspan="4" width="240px"><img :src="item1.image" width="95%" style="display:block;"></td>
            </tr>
            <tr align="center">
              <td width="30px" height="80px" align="center">民族</td>
              <td width="70px" colspan="3">{{item1.nation}}</td>
              <td colspan="2" width="30px">籍贯</td>
              <td colspan="2" width="50px">{{item1.nativeplace}}</td>
              <td colspan="2" width="50px">政治面貌</td>
              <td colspan="2" width="70px">{{item1.political}}</td>
            </tr>
            <tr align="center">
              <td width="30px" height="80px" align="center">学院</td>
              <td width="70px" colspan="3">{{item1.college}}</td>
              <td colspan="2" width="30px">年级</td>
              <td colspan="2" width="50px">{{item1.grade}}</td>
              <td colspan="2" width="50px">学制</td>
              <td colspan="2" width="70px">{{item1.majorset}}</td>
            </tr>
            <tr align="center">
              <td width="30px" height="80px" align="center">培养类别</td>
              <td width="70px" colspan="3">{{item1.eduset}}</td>
          
              <td colspan="2" width="30px">手机</td>
              <td colspan="2" width="50px">{{item1.phone}}</td>
          
              <td colspan="2" width="50px">电子邮件</td>
              <td colspan="2" width="70px">{{item1.email}}</td>
            </tr>
            <tr>
              <td width="10%" height="270;" align="center">教育背景（高中起）</td>
              <td colspan="16">{{item1.eduback}}</td>
            </tr>
            <tr>
              <td width="10%" height="270;" align="center">研究生学生工作经历</td>
              <td colspan="16">{{item1.ug_exp}}</td>
            </tr>
            <tr>
              <td width="10%" height="270;" align="center">其他阶段学生工作经历</td>
              <td colspan="16">{{item1.other_exp}}</td>
            </tr>
          </table>
        </div>

      </div>
        

      </v-card-content>
      
    </v-card>
    
    <v-card>
      <v-card-title class="accent white--text">
          <span class="font-weight-bold display-1">PROJECT</span>
         
      </v-card-title>
      <v-card-content class="ma-3 px-4">
      <!--<v-list>
            <v-list-tile>
            <v-list-tile-title>{{item.pname}}</v-list-tile-title>
              <v-list-tile-content>
              <v-p class="">{{item.content}}</v-p>
              <v-btn @click="check(item)">查看</v-btn>  
              </v-list-tile-content>
             
            </v-list-tile>
          </v-list>-->
          <table class="table15_1">
            <thead>
            <tr>
              <th>pname</th>
              <th>content</th>
              <th></th>
            </tr>
            </thead>
            <tbody>
              <tr v-for="item in pj" :key="item.pid">
                <td>{{item.pname}}</td>
              
              <td>{{item.content}}</td>
              <td><v-btn @click="check(item)">查看</v-btn></td>

              </tr>
              
            
          
            </tbody>
          </table>
        <router-view v-if="show"></router-view>
      </v-card-content>
    </v-card>
    
</div>

</template>


<script>

import util from '@/utils.js'
import projectdata from '@/api/projectdata'
import issuedata from '@/api/issuedata'
import userdata from '@/api/userdata'
export default {
  data () {
    return {
      data:[],
      pj:[],
      usr:[],
      stu_id:'',
      show:false,
      htmlTitle:'复旦大学骨干信息表'
      //htmlTitle: '页面导出PDF文件名'
      //adata:[],
    }
  },
 
  methods: {
    
     async getData () {
      console.log("now is diaplay getdata")
      let res = await issuedata.read()
      //console.log("asdasdas")
      //util.response(res, this)
      if (res.code === 200) {
        this.data = res.data
        //console.log("9999999999")
      }
    },
    async getUser(v){
      let user = await userdata.readbystuid(v)
      if (user.code === 200) {
        this.usr = user.data
      };
    },
    async getProject(v){
      let pro = await projectdata.readstu(v)
      if (pro.code === 200) {
        this.pj = pro.data
      };
    },

    check(v){
      util.toRouter_a('search_res_child',this,v)
      this.show = !this.show
    },
   
    }, 
 
  created: function () {
    console.log("thisis pdisplay created")

    this.stu_id = this.$route.params.stu_id
    console.log(this.usr)
    if (this.stu_id) {
      this.getProject(this.stu_id)
      this.getUser(this.stu_id)
      //console.log(this.usr)
    }
    
  },
  
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