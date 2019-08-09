<template>
   <div>    
    <v-card>
      <v-card-title class="accent white--text">
          <span class="font-weight-bold display-1">ISSUE</span>
         
      </v-card-title>
      <v-card-content class="ma-3 px-4" v-for="item in isu" :key="item.issue_id">
      <v-list>
            <v-list-tile>
            <v-list-tile-title>{{item.title}}</v-list-tile-title>
              <v-list-tile-content>
              {{item.content}}  
              </v-list-tile-content>
             
            </v-list-tile>
          </v-list>
        
          
      </v-card-content>
    </v-card>
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
</div>

</template>

<script>
import Bus from '@/bus.js'
import projectdata from '@/api/projectdata'
import issuedata from '@/api/issuedata'
import userdata from '@/api/userdata'
export default {
  data () {
    return {
      data:[],
      isu:[],
      usr:[]
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
    async getIssue(v){
      let issu = await issuedata.readproject(v)
      if (issu.code === 200) {
        this.isu = issu.data
      };
    },
    /*async getIssue(v){
      let ires = await issuedata.readproject(v)
      return ires
    },
    send(v){
      let issue = this.getIssue(v.pid)
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

        })
    }*/
  },
 
  /*mounted: function () {
    var vm = this
    console.log('this is mounted')
    // 用$on事件来接收参数
    Bus.$on('val', (data) => {
      //console.log(data)
      vm.recval = data
    })
    console.log(recval)
  },*/
  created: function () {
    console.log("thisis pdisplay created")

    this.data = this.$route.params

    if (this.data) {
      this.getIssue(this.data.pid)
      this.getUser(this.data.stu_id)
      console.log(this.usr)
    }
    
  },
  
}
</script>