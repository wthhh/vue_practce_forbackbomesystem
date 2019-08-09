<template lang="pug">
  <v-app>
    <v-navigation-drawer :mini-variant="miniVariant" :clipped="clipped" v-model="drawer" fixed app>
      //- div.pa-4.text-xs-center
      //-   div.display-1.py-4(style="color:#1565C0")
      //- <v-divider></v-divider>
      //- <div class="pa-4 text-xs-center">
      //-   <div class="py-4" style="color:#1565C0">

      //-     <v-btn dark href="https://github.com/LinYangLee" class="primary">
      //-       <v-icon left dark>star</v-icon>
      //-       <span>Github</span>
      //-     </v-btn>
      //-   </div>
      //- </div>
      <div class="text-sm-center text-md-center text-xs-center text-lg-center my-5">
          <v-avatar size="100" class="grey lighten-2">
              <img src="./vuetify-logo-300.png">
          </v-avatar>
      </div>
      //- <v-list>
      //-   <v-list-tile v-for="link in links" :key="link.text" router :to="link.route" class="primary">
      //-     <v-list-tile-action>
      //-       <v-icon class="white--text">{{link.icon}}</v-icon>
      //-     </v-list-tile-action>
      //-     <v-list-tile-content>
      //-       <v-list-tile-title class="white--text">{{link.text}}</v-list-tile-title>
      //-     </v-list-tile-content>
      //-   </v-list-tile>
      //- </v-list>

      <v-expansion-panel>
        <v-expansion-panel-content class="primary white--text" text-align-left>
          <template v-slot:header>
            <span class="font-weight-bold headline">Secssstion</span>
            <Ipopup/>
          </template>
          <v-list class="py-0">
            <v-list-tile v-for="item in data" :key="item.sid" class="primary" router to="/admin/home/pdisplay" @click="send(item)">
              <v-list-tile-content>
                    <v-list-tile-title class="white--text mx-3">{{item.classname}}</v-list-tile-title>
              </v-list-tile-content>
            </v-list-tile>
          </v-list>
        </v-expansion-panel-content>
    </v-expansion-panel>

    <v-expansion-panel>
        <v-expansion-panel-content class="primary white--text" text-align-left>
          <template v-slot:header>
            <span class="font-weight-bold headline">User Management</span>
           
          </template>
          <v-list class="py-0">
            <v-list-tile class="primary" router to="/admin/home/search">
              <v-list-tile-content>
                    <v-list-tile-title class="white--text mx-3">search user</v-list-tile-title>
              </v-list-tile-content>
            </v-list-tile>
            <v-list-tile class="primary" router to="/admin/home/newuser">
              <v-list-tile-content>
                    <v-list-tile-title class="white--text mx-3">new user</v-list-tile-title>
              </v-list-tile-content>
            </v-list-tile>
          </v-list>
        </v-expansion-panel-content>
    </v-expansion-panel>
    <v-expansion-panel>
        <v-expansion-panel-content class="primary white--text" text-align-left>
          <template v-slot:header>
            <span class="font-weight-bold headline">Statistics</span>
           
          </template>
          <v-list class="py-0">
            <v-list-tile class="primary" router to="/admin/home/chart">
              <v-list-tile-content>
                    <v-list-tile-title class="white--text mx-3">Chart</v-list-tile-title>
              </v-list-tile-content>
            </v-list-tile>
          </v-list>
        </v-expansion-panel-content>
    </v-expansion-panel>

    </v-navigation-drawer>
    <Header :clipped="clipped" :miniVariant="miniVariant" :drawer="drawer" @setDrawer="getDrawer" @setClipped="getClipped" @setFixed="getFixed" @setMiniVariant="getMiniVariant" />
      //- <transition name="fade-transform" mode="out-in" />
    <v-content>
        //- <Time />
        <router-view></router-view>
    </v-content>
    <Footer :fixed="fixed" />
  </v-app>
</template>
<script>
import Time from '@/views/components/admin/Time'
import Header from '@/views/components/admin/Header'
import Footer from '@/views/components/admin/Footer'
import Dashboard from '@/views/components/admin/Dashboard'
import Testdata from '@/views/components/admin/Testdata'
import util from '@/utils'
import api from '@/api'
import sectiondata from '@/api/sectiondata'
import projectdata from '@/api/projectdata'
import Ipopup from '@/views/components/admin/Ipopup'
import bus from '@/bus'
export default {
  name: 'App',
  components: {
    Time,
    Footer,
    Header,
    Ipopup
  },

  data () {
    return {
      clipped: false,
      drawer: false,
      fixed: false,
      miniVariant: false,
      links:[
            {icon:'dashboard',text:'Dashboard',route:'/admin/home/dashboard'},
            //{icon:'folder',text:'My Project',route:'/admin/home/testdata'},
        ],
      data:[],
      s_data:[],
      sid:0
    }
  },
  computed: {
   
  },
  methods: {
    // componentsAdd() {
    //   this.components.add('Dashboard')
    // },
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
      console.log("now is getdata")
      let res = await sectiondata.index()
      //console.log("asdasdas")
      //util.response(res, this)
      if (res.code === 200) {
        this.data = res.data
                console.log("this.data")

        console.log(this.data)
      }
      // console.log("now i wanttt project")
      // let pres = await projectdata.readstu(this.userInfo['uid'])
      // if (pres.code === 200){
      //   this.pdata = pres.data
      // }
      // console.log("now i wantttt iiiiiiiiiiiisssssssss")
      // let ires = await issuedata.read()
      // if(ires.code === 200){
      //   this.idata = ires.data
      // }
    },
    async getDataBylevel(v){
      let s_res = await sectiondata.getsectionbylevel(v)
      if (s_res.code === 200) {
        this.data = s_res.data
      };
    },
    async getProject(v)
    {
      let pres = await projectdata.readsec(v);
      return pres;
    },

    send (v){
        let iidaa = this.getProject(v.sid)
        let self = this
      
        iidaa .then(result => {
          console.log(result)
           let iform={
            sec:v,
            pj:result
          }
          console.log(iform)
          bus.$emit('val',iform)
        })
    }
  },
  created() {
console.log("now into home created")
      console.log(this.$route.params)
      this.sid = this.$route.params.sid
      
      if (this.sid) {
        this.getDataBylevel(this.sid)
      }
      else{      
        this.getData()
      }
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