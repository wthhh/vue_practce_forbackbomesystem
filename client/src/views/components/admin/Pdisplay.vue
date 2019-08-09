<template>
    <div>
    
      <v-list>
            <v-list-tile v-for="item in recval.pj.data" :key="item.pid" @click=""  class="">
              <v-list-tile-content >
                    <v-list-tile-title  class=" mx-3">{{item.pname}}<button class="btn" @click="send(item)"><v-icon>find_in_page</v-icon></button></v-list-tile-title>
              </v-list-tile-content>
             
            </v-list-tile>
          </v-list>
    <router-view v-if="show"></router-view>
        <Ppopup :psid="recval.sec.sid"/>

    </div>
</template>
<script>
import Bus from '@/bus.js'
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
  mounted: function () {
    var vm = this
    console.log('this is mountedsss')
    // 用$on事件来接收参数
    Bus.$on('val', (data) => {
      console.log(data)
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
  /* background-color: cornflowerblue;
  color:black;
  display: block;
  text-align: center;
  width: 100px;
  height: 25px; */
  float: right;
  margin-right:5%;
}


</style>
