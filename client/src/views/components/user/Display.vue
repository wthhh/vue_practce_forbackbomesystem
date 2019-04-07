<template>
    <v-card>
      <v-card-title class="accent white--text">
          <span class="font-weight-bold display-1">Section Name:{{recval.classname}}</span>
          <v-spacer></v-spacer>
          <Popup :psid="recval.sid" :sname="recval.classname" :puid="userInfo.uid" :paid="adata.aid"/>
      </v-card-title>
      <v-card-content class="ma-3">
          <p>{{recval.content}}</p>
      </v-card-content>
    </v-card>
</template>
<script>
import Bus from '@/bus.js'
import attributedata from '@/api/attributedata'
import Popup from './Popup.vue'
export default {
  data () {
    return {
      recval: [],
      adata:[],
    }
  },
  components:{
    Popup
  },
  methods: {
    async getAttrData(v) {
      console.log("now is diaplay get AAAATTTTRRR data")
      let res = await attributedata.readatt(v)
      //console.log("asdasdas")
      //util.response(res, this)
      if (res.code === 200) {
        this.adata = res.data
        console.log("GGGGG is entered")
        console.log(res.data)
        //console.log("9999999999")
      }
    },
  },
  mounted: function () {
    var vm = this
    // 用$on事件来接收参数
    Bus.$on('val', (data) => {
      //console.log(data)
      vm.recval = data
      this.getAttrData(this.recval.sid)
    })
    console.log("now is into get ATTTTTTTRR data siddddddddddd")
    console.log(this.recval)
    console.log("enddddddddddddddddd")
    
  },
  created: function () {
    console.log("thisis display created")
  },
  computed: {
    userInfo () {
      console.log("now is into userinfo")
      console.log(this.$store.getters.getUserInfo)
      return this.$store.getters.getUserInfo
    }
  },

}
</script>
    