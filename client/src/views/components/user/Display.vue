<template>
    <v-card>
      <v-card-title class="accent white--text">
          <span class="font-weight-bold display-1">Section Name:{{recval.classname}}</span>
          <v-spacer></v-spacer>
          <Popup :psid="recval.sid" :sname="recval.classname" :pstuid="userInfo.stu_id" />
      </v-card-title>
      <v-card-content class="ma-3">
          <p style="margin:18px;" v-html="recval.content"></p>
      </v-card-content>
    </v-card>
</template>
<script>
import Bus from '@/bus.js'
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
  },
  mounted: function () {
    var vm = this
    // 用$on事件来接收参数
    Bus.$on('val', (data) => {
      console.log(data)
      vm.recval = data
    })
    
  },
  created: function () {
    //console.log("thisis display created")
  },
  computed: {
    userInfo () {
      //console.log("now is STTTTTTORE")
      //console.log(this.$store.getters.getUserInfo)
      return this.$store.getters.getUserInfo
    }
  },

}
</script>
    