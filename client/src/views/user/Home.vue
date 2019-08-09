<template lang="pug">
  <v-app>
    <v-navigation-drawer class="primary" :mini-variant="miniVariant" :clipped="clipped" v-model="drawer" fixed app >
      //- div.pa-4.text-xs-center
      //-   div.display-1.py-4(style="color:#1565C0")
      //- <v-divider></v-divider>
      <div class="text-sm-center text-md-center text-xs-center text-lg-center my-5">
          <v-avatar size="100" class="grey lighten-2">
              <img src="./vuetify-logo-300.png">
          </v-avatar>
      </div>

      <v-expansion-panel>
          <v-expansion-panel-content class="primary white--text" text-align-left>
            <template v-slot:header>
              //- <v-icon class="white--text" lg left>dashboard</v-icon>
              <span class="font-weight-bold headline">Profile</span>
            </template>
            <v-list class="py-0">
              <v-list-tile class="primary" router to="/user/home/profile">
                <v-list-tile-content>
                      <v-list-tile-title class="white--text mx-3">User Profile</v-list-tile-title>
                </v-list-tile-content>
              </v-list-tile>
              <v-list-tile class="primary" router to="/user/home/EditProfile">
                <v-list-tile-content>
                      <v-list-tile-title class="white--text mx-3">Modify Personal Information</v-list-tile-title>
                </v-list-tile-content>
              </v-list-tile>
            </v-list>
          </v-expansion-panel-content>
      </v-expansion-panel>

      <v-expansion-panel>
        <v-expansion-panel-content class="primary white--text" text-align-left>
          <template v-slot:header>
            //- <v-icon class="white--text" lg left>dashboard</v-icon>
            <span class="font-weight-bold headline">Section</span>
          </template>
          <v-list class="py-0">
            <v-list-tile v-for="item in data" :key="item.sid" class="primary" router to="/user/home/display" @click="send(item)">
              //- <v-list-tile-action>
              //-   <v-icon class="white--text">dashboard</v-icon>
              //- </v-list-tile-action>
              <v-list-tile-content>
                    <v-list-tile-title class="white--text mx-3">{{item.classname}}</v-list-tile-title>
              </v-list-tile-content>
            </v-list-tile>
          </v-list>
        </v-expansion-panel-content>
    </v-expansion-panel>

    <v-expansion-panel class="py-0">
      <v-expansion-panel-content class="primary white--text" text-align-left>
        <template v-slot:header>
          //- <v-icon class="white--text" lg left>dashboard</v-icon>
          <span class="font-weight-bold headline">My Project</span>
        </template>
        <v-list class="py-0">
          <v-list-tile v-for="item in pdata" :key="item.pid" class="primary" router to="/user/home/pdisplay" @click="isend(item)">
              //-  <v-list-tile-action>
              //-   <v-icon class="white--text">dashboard</v-icon>
              //- </v-list-tile-action> 
          <v-list-tile-content>
                <v-list-tile-title class="white--text mx-3">{{item.pname}}</v-list-tile-title>
          </v-list-tile-content>
          </v-list-tile>
        </v-list>
      </v-expansion-panel-content>
    </v-expansion-panel>

      //-  <v-list class="py-0">
      //-   <v-list-tile v-for="link in links" :key="link.text" router :to="link.route" class="primary">
      //-     <v-list-tile-action>
      //-       <v-icon class="white--text">{{link.icon}}</v-icon>
      //-     </v-list-tile-action>
      //-     <v-list-tile-content>
      //-       <v-list-tile-title class="white--text mx-2">{{link.text}}</v-list-tile-title>
      //-     </v-list-tile-content>
      //-   </v-list-tile>
      //- </v-list> 
    </v-navigation-drawer>
    <Header :clipped="clipped" :miniVariant="miniVariant" :drawer="drawer" @setDrawer="getDrawer" @setClipped="getClipped" @setFixed="getFixed" @setMiniVariant="getMiniVariant" />
      //- <transition name="fade-transform" mode="out-in" />
    <v-content>
        //- <Time />
        <span class="font-weight-medium font-italic title" hidden>{{userInfo['username']}}</span>
        <router-view></router-view>
    </v-content>
    <Footer :fixed="fixed" />
  </v-app>
</template>
<script>
import Time from '@/views/components/user/Time'
import Header from '@/views/components/user/Header'
import Footer from '@/views/components/user/Footer'
import util from '@/utils'
import api from '@/api'
import sectiondata from '@/api/sectiondata'
import projectdata from '@/api/projectdata'
import issuedata from '@/api/issuedata'
import bus from '@/bus'
export default {
  name: 'App',
  components: {
    Time,
    Footer,
    Header
  },

  data () {
    return {
      clipped: false,
      drawer: false,
      fixed: false,
      miniVariant: false,
      links:[
            {icon:'dashboard',text:'Section Enroll',route:'/home/dashboard'},
            {icon:'folder',text:'Adding Log',route:'/home/testdata'},
            {icon:'folder',text:'Adding Log',route:'/home/testdata'},
        ],
      data:[],
      pdata:[],
      idata:[]
    }
  },
  computed: {
    userInfo () {
      //console.log("now is into homeeeeeeeeeeeee  userinfo")
      //console.log(this.$store.getters.getUserInfo)
      return this.$store.getters.getUserInfo
    }
  },
  methods: {
    
    getClipped (v) {
      this.clipped = v
    },
    getFixed (v) {
      this.fixed = v
    },
    getMiniVariant (v) {
      this.miniVariant = v
    },
    getDrawer (v) {
      this.drawer = v
    },
    async getData () {
      //console.log("now is getdata")
      let res = await sectiondata.index()
      //console.log("asdasdas")
      //util.response(res, this)
      if (res.code === 200) {
        this.data = res.data
      }
      console.log("now i wanttt project"+this.userInfo['stu_id'])
      let pres = await projectdata.readstu(this.userInfo['stu_id'])
      if (pres.code === 200){
        this.pdata = pres.data
      }
      // console.log("now i wantttt iiiiiiiiiiiisssssssss")
      // let ires = await issuedata.read()
      // if(ires.code === 200){
      //   this.idata = ires.data
      // }
    },
    async getIssue (v){
        let ires=await issuedata.read(v)
        return ires
    },
    send (v){
        //console.log("this is home sned")
        bus.$emit('val',v)
        //console.log("this is home send the data val")
    },
    async gette(v){
        this.idata = await this.getIssue(v)
    },
    isend (v){
        //console.log("this is home iiiiiiisned")
        //console.log(v)
        //this.gette(v.pid)
        let re=null
        let iidaa = this.getIssue(v.pid)
        iidaa .then(function(result){
          //console.log("TTTTTTTTTTTTTTTTTTTTTHHHHHHHHHHHHH")
          //console.log(result)
          let iform={
            pj:v,
            isu:result
          }
          //console.log(iform)
          bus.$emit('val',iform)
          //console.log("eeeeeeeeeeeeeeeeeennnnnnnnnnnnnnnn")
        })
        //console.log("iiiiiiiirrrrrrrrrrrreeeeeeeeeeeeesssssssssss")
        //console.log(re)

        //console.log("this is home send the data val")
    }
  },
  created() {
      //console.log("now into home created")
      this.getData()
  },

}
</script>
<style>
.fade-transform-leave-active,
.fade-transform-enter-active {
  transition: all .5s;
}
.fade-transform-enter {
  opacity: 0;
  transform: translateX(-30px);
}
.fade-transform-leave-to {
  opacity: 0;
  transform: translateX(30px);
}
.v-navigation-drawer__border{
  left:299px;
}
</style>
