<template lang="pug">
  v-content      
    Header(:clipped="clipped" :miniVariant="miniVariant" :drawer="drawer" @setDrawer="getDrawer" @setClipped="getClipped" @setFixed="getFixed" @setMiniVariant="getMiniVariant")
    v-layout
      transition(name="fade-transform" mode="out-in")
        router-view
    v-list
        v-btn( href="/front")
          v-list-tile-title front
        v-btn( href="/login")
          v-list-tile-title 登陆

    Footer(:fixed="fixed")
</template>
<script>
import Menu from '@/views/components/public/Menu'
import Header from '@/views/components/public/Header'
import Footer from '@/views/components/public/Footer'
import util from '@/utils'
export default {
  name: 'App',
  components: {
    Footer,
    Header,
    Menu
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
    setting () {
      return this.$store.getters.getSetting
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
    async handleCommand (e) {
      switch (e) {
        case 'login':
          util.toRouter('hh', this)
          break
        case 'front':
          util.toRouter('login', this)

          break
        default:
          console.log(e)
      }
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
