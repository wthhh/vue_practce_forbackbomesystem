<template>
    <div>
    <v-card>
      <v-card-title class="accent white--text">
          <span class="font-weight-bold display-1">Section Name:{{recval.sec.classname}}</span>
          <v-spacer></v-spacer>
          <Popup :asid="recval.sec.sid" :classname="recval.sec.classname"/>
      </v-card-title>
      
        <v-list class="py-0">
            <v-list-tile v-for="item in recval.att.data" :key="item.aid" class="primary" router to="/admin/home/pdisplay" @click="send(item)">
              <v-list-tile-content>
                    <v-list-tile-title class="white--text mx-3">{{item.aname}}</v-list-tile-title>
              </v-list-tile-content>
            </v-list-tile>
          </v-list>
    
      <router-view v-if="show"></router-view>
          
    </v-card>
    <!-- <v-expansion-panel>
        <v-expansion-panel-content v-for="item in recval.att.data" :key="item.aid">
            <template v-slot:header>
                <div>{{item.aname}}</div>
            </template>
            <v-card>
                <v-card-text>{{item.aname}}</v-card-text>
            </v-card>
        </v-expansion-panel-content>
    </v-expansion-panel> -->
    </div>
</template>
<script>
import Bus from '@/bus.js'
import attributedata from '@/api/attributedata'
import projectdata from '@/api/projectdata'
import sectiondata from '@/api/sectiondata'
import Popup from './Popup'
import Ppopup from './Ppopup'
export default {
  data () {
    return {
      recval: [],
      recval1: [],
      count:0,
      show:false,
      //adata:[],
    }
  },

  components:{  
    Popup,
    Ppopup
  },
  methods: {
   
     async getData () {
      console.log("now is diaplay getdata")
      let res = await attributedata.read()
      //console.log("asdasdas")
      //util.response(res, this)
      if (res.code === 200) {
        this.data = res.data
        //console.log("9999999999")
      }
    },
     async getProject(v){
      let pres = await projectdata.readatt(v)
      return pres
     },
    send(v){
        this.show = !this.show
        let iidaa = this.getProject(v.aid)
        iidaa .then(function(result){
          console.log("TTTTTTTTTTTTTTTTTTTTTHHHHHHHHHHHHH")
          console.log(result)
          let iform={
            att:v,
            pj:result
          }
          console.log(iform)
          Bus.$emit('val1',iform)
          console.log('asdasadasdsada')

        })
        console.log("iiiiiiiirrrrrrrrrrrreeeeeeeeeeeeesssssssssss")

        console.log("this is home send the data val")
    }
  },
  
  mounted: function () {
    var vm = this
    
    // 用$on事件来接收参数
    Bus.$on('val', (data) => {
      
      vm.recval = data
      console.log(vm.recval)
    })
    
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