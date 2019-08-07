<template>
    <v-card>
        <v-card-text>
            <v-form class="px-3" ref="form">
                <span class="">create new user with stu_id</span>
                <v-text-field label="user stu_id" v-model="stu_id" prepend-icon="person"></v-text-field>
                <v-spacer></v-spacer>
                <v-btn flat center class="primary mt-0 mt-3" @click="new_stuid()">Create</v-btn>
            </v-form>
        </v-card-text>
        <router-view></router-view>
    </v-card>
    
</template>

<script>
import util from '@/utils'
import api from '@/api'
import userdata from '@/api/userdata'
export default {
  data () {
    return {
      data:[],
      stu_id:'',
      htmlTitle:'复旦大学骨干信息表'
    }
  },

  methods: {
   
     async getProject(v){
      let pres = await projectdata.readstu(v)
      return pres
     },
     async new_stuid(){
      if (this.stu_id) {
        let pres = await userdata.newuser(this.stu_id)
        if (pres.code==200){
          alert("创建用户成功，请登录用户账户以完整相关信息！")
        }
        else if(pres.code==403){
          alert("学号已存在")
        }
        else {
          alert("创建失败")
          console.log(pres)
        }
        //this.$router.push({name:'search_res',params:this.stu_id})
       }
       else{
         alert("请填写需要新建的学号")
       }
     },
  },
  
  mounted: function () {
    var vm = this
    
    // 用$on事件来接收参数
   
    
   /* Bus.$on('count', (dat) => {
      //console.log(data)
      vm.count = dat
      console.log(vm.count)
    }) 
    
    
   
    Bus.$on('val0',(data1)=> {
      vm.recval1.push(data1)
      console.log(vm.recval1)
    })
    Bus.$on('val1',(data1)=> {
      vm.recval1.push(data1)
      console.log(vm.recval1)
    })
    Bus.$on('val2',(data1)=> {
      vm.recval1.push(data1)
      console.log(vm.recval1)
    })
    Bus.$on('val3',(data1)=> {
      vm.recval1.push(data1)
      console.log(vm.recval1)
    })
    Bus.$on('val4',(data1)=> {
      vm.recval1.push(data1)
      console.log(vm.recval1)
    })*/
  
  },
  created: function () {
    console.log("thisis adisplay created")
  },
 
}
</script>