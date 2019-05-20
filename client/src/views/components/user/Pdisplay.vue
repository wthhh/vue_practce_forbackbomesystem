<template>
    <div>
    <v-card>
      <v-card-title class="accent white--text">
          <span class="font-weight-bold display-1">Project Name:{{recval.pj.pname}}</span>
          <v-spacer></v-spacer>
          <Ipopup :ipid="recval.pj.pid" :pname="recval.pj.pname"/>
      </v-card-title>
      <v-card-content class="ma-3 px-4">
          <!-- <p>{{recval.pj.content}}</p> -->
          <p v-html="recval.pj.content"></p>
      </v-card-content>
    </v-card>
    <v-expansion-panel>
        <v-expansion-panel-content v-for="item in recval.isu.data" :key="item.issue_id">
            <template v-slot:header>
                <div>{{item.title}}</div>
            </template>
            <v-card>
                <v-card-text>{{item.content}}</v-card-text>
            </v-card>
        </v-expansion-panel-content>
    </v-expansion-panel>
    </div>
</template>
<script>
import Bus from '@/bus.js'
import issuedata from '@/api/issuedata'
import Ipopup from './Ipopup'
export default {
  data () {
    return {
      recval: [],
    }
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
  },
  mounted: function () {
    var vm = this
    // 用$on事件来接收参数
    Bus.$on('val', (data) => {
      //console.log(data)
      vm.recval = data
    })
  },
  created: function () {
    console.log("thisis display created")
  },
  components:{
      Ipopup
  }

}
</script>
        