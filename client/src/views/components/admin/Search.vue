<template>
    <v-card>
        <v-card-text>
            <v-form class="px-3" ref="form">
                <span class="">Search by stu_id</span>
                <v-text-field label="user stu_id" v-model="stu_id" prepend-icon="person"></v-text-field>
                
                <v-spacer></v-spacer>
                <v-btn flat center class="primary mt-0 mt-3" @click="search_stuid()">Search</v-btn>
            </v-form>
        </v-card-text>
        <router-view></router-view>
    </v-card>
    
</template>

<script>
import util from '@/utils'
import api from '@/api'
import sectiondata from '@/api/sectiondata'
import projectdata from '@/api/projectdata'
import userdata from '@/api/userdata'
export default {
  data () {
    return {
      data:[],
      stu_id:'',
    }
  },

  methods: {
   
     async getProject(v){
      let pres = await projectdata.readstu(v)
      return pres
     },
    search_stuid(){
       if (this.stu_id) {
        util.toRouter_search('search_res', this,{stu_id:this.stu_id})
        //this.$router.push({name:'search_res',params:this.stu_id})
       }
    }
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
}
</script>