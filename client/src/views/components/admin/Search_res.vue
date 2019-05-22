<template>
   <div>    
    <v-card>
     <v-card-title class="accent white--text">
          <span class="font-weight-bold display-1">User Information</span>
         
      </v-card-title>
      <v-card-content class="ma-3 px-4" v-for="item1 in usr" :key="item1.uid">
      <v-list>
            <v-list-tile>
            <v-list-tile-title>{{item1.stu_id}}</v-list-tile-title>
              <v-list-tile-content>
              {{item1.username}}  
              </v-list-tile-content>
             
            </v-list-tile>
          </v-list>
        
          
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
import attributedata from '@/api/attributedata'
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
      show:false
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
    }
    
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