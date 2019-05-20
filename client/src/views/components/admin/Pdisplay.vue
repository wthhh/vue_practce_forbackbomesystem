<template>
    <div>
    <v-card>
      <Ppopup :paid="recval.att.aid"/>
      <v-list>
            <v-list-tile v-for="item in recval.pj.data" :key="item.pid" class="primary">
              <v-list-tile-content >
                    <v-list-tile-title class="white--text mx-3">{{item.pname}}<button class="btn" @click="send(item)">查看</button></v-list-tile-title>
              </v-list-tile-content>
             
            </v-list-tile>
          </v-list>
    <router-view v-if="show"></router-view>
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
    </v-card>
    </div>
</template>
<script>
import Bus from '@/bus.js'
import attributedata from '@/api/attributedata'
import projectdata from '@/api/projectdata'
import issuedata from '@/api/issuedata'
import Ppopup from './Ppopup'
import Ipopup from './Ipopup'
import util from '@/utils'
export default {
  data () {
    return {
      recval: [],
      show:false,
      //adata:[],
    }
  },
  components:{
    Ppopup,
    Ipopup
  },
  methods: {
    // async getAttrData(v) {
    //   console.log("now is diaplay get AAAATTTTRRR data")
    //   let res = await attributedata.readatt(v)
    //   //console.log("asdasdas")
    //   //util.response(res, this)
    //   if (res.code === 200) {
    //     this.adata = res.data
    //     console.log("GGGGG is entered")
    //     console.log(res.data)
    //     //console.log("9999999999")
    //   }
    // },
     async getData () {
      console.log("now is diaplay getdata")
      let res = await projectdata.read()
      //console.log("asdasdas")
      //util.response(res, this)
      if (res.code === 200) {
        this.data = res.data
        //console.log("9999999999")
      }
    },
    async getIssue(v){
      let ires = await issuedata.readproject(v)
      return ires
    },
    send(v){
      console.log(v)
      //this.$router.push({name:'Idisplay',params:v})
      util.toRouter_a('Idisplay', this,v)
      this.show = !this.show
      /*let issue = this.getIssue(v.pid)
        issue .then(function(result){
          console.log("TTTTTTTTTTTTTTTTTTTTTHHHHHHHHHHHHH")
          console.log(result)
          let iform={
            pj:v,
            issue:result
          }
          console.log(iform)
          Bus.$emit('val',iform)
          console.log('asdasadasdsada')

        })*/
    }
  },
  // mounted: function () {
  //   var vm = this
  //   // 用$on事件来接收参数
  //   Bus.$on('val', (data) => {
  //     //console.log(data)
  //     vm.recval = data
  //     this.getAttrData(this.recval.sid)
  //   })
  //   console.log("now is into get ATTTTTTTRR data siddddddddddd")
  //   console.log(this.recval)
  //   console.log("enddddddddddddddddd")
    
  // },
  // created: function () {
  //   console.log("thisis display created")
  // },
  // computed: {
  //   userInfo () {
  //     console.log("now is into userinfo")
  //     console.log(this.$store.getters.getUserInfo)
  //     return this.$store.getters.getUserInfo
  //   }
  // },
  mounted: function () {
    var vm = this
    console.log('this is mounted')
    // 用$on事件来接收参数
    Bus.$on('val1', (data) => {
      //console.log(data)
      vm.recval = data
    })
  },
  created: function () {
    console.log("thisis pdisplay created")
  },
  
}
</script>
<style>
.btn{
  color:black;
  display: block;
  text-align: center;
  width: 100px;
  height: 25px;
  border: 1.5px solid black;
  box-shadow: 0px 0px 10px white;
  float: right;
  margin-right:5%;
}


</style>
