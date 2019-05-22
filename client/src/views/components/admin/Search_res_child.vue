<template>
   <div>    
    <v-card>
      <v-card-title class="accent white--text">
          <span class="font-weight-bold display-0.6">SECTION: {{sec.classname}}</span>
         
      </v-card-title>
    </v-card>
    
    <v-card>
      <v-card-title class="accent white--text">
          <span class="font-weight-bold display-0.6">ATTRIBUTE: {{att.aname}}</span>
         
      </v-card-title>
    </v-card>
    <v-card>
      <v-card-title class="accent white--text">
          <span class="font-weight-bold display-0.6">ISSUE</span>
         
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
    
</div>

</template>

<script>
import util from '@/utils.js'
import attributedata from '@/api/attributedata'
import projectdata from '@/api/projectdata'
import issuedata from '@/api/issuedata'
import userdata from '@/api/userdata'
import sectiondata from '@/api/sectiondata'
export default {
  data () {
    return {
      data:[],
      isu:[],
      sec:[],
      att:[],
      sid:0
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
    async getSection(v){
      let secc = await sectiondata.read(v)
      if (secc.code === 200) {
        this.sec = secc.data
      }
    },
    async getAtt(v){
      let attt = await attributedata.read(v)
      return attt
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
      let attt=this.getAtt(this.data.aid)
      //console.log(this.sid)
      attt.then(result => {
        console.log(result)
          this.att = result.data
          this.sid = result.data.sid
          this.getSection(this.sid)
        })
     
      
      
    }
    
  },
  
}
</script>