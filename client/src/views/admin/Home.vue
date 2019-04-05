<template lang="pug">
  <v-app>
    <v-navigation-drawer :mini-variant="miniVariant" :clipped="clipped" v-model="drawer" fixed app>
      //- div.pa-4.text-xs-center
      //-   div.display-1.py-4(style="color:#1565C0")
      //- <v-divider></v-divider>
      <div class="pa-4 text-xs-center">
        <div class="py-4" style="color:#1565C0">

          <v-btn dark href="https://github.com/LinYangLee" class="primary">
            <v-icon left dark>star</v-icon>
            <span>Github</span>
          </v-btn>
        </div>
      </div>
      <v-list>
        <v-list-tile v-for="link in links" :key="link.text" router :to="link.route" class="primary">
          <v-list-tile-action>
            <v-icon class="white--text">{{link.icon}}</v-icon>
          </v-list-tile-action>
          <v-list-tile-content>
            <v-list-tile-title class="white--text">{{link.text}}</v-list-tile-title>
          </v-list-tile-content>
        </v-list-tile>
      </v-list>
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
            {icon:'dashboard',text:'Dashboard',route:'/admin/home/dashboard'},
            {icon:'folder',text:'My Project',route:'/admin/home/testdata'},
        ]
    }
  },
  computed: {
   
  },
  methods: {
    componentsAdd() {
      this.components.add('Dashboard')
    },
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
    }
  }
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
