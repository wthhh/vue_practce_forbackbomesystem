<template lang="pug">
  v-content
    v-navigation-drawer(:mini-variant="miniVariant" :clipped="clipped" v-model="drawer" fixed app)
      div.pa-4.text-xs-center
        div.display-1.py-4(style="color:#1565C0")
      v-divider
      
    Header(:clipped="clipped" :miniVariant="miniVariant" :drawer="drawer" @setDrawer="getDrawer" @setClipped="getClipped" @setFixed="getFixed" @setMiniVariant="getMiniVariant")
    v-layout
      transition(name="fade-transform" mode="out-in")
        Time
        router-view
    Footer(:fixed="fixed")
</template>
<script>
import Time from '@/views/components/public/Time'
import Header from '@/views/components/public/Header'
import Footer from '@/views/components/public/Footer'

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
      drawer: true,
      fixed: false,
      miniVariant: false
    }
  },
  computed: {
   
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
