<template lang="pug">
  <v-toolbar class="primary" app :clipped-left="clipped" dark>
    <v-toolbar-side-icon @click.stop="setDrawer"></v-toolbar-side-icon>
      <v-toolbar-title>Linkstudio-template</v-toolbar-title>
      <v-spacer></v-spacer>
      <span class="title">{{userInfo['admin_name']}}</span>
      <v-btn  @click="signOut" flat dark>
        <span>Sign Out</span>
          <v-icon right>exit_to_app</v-icon>
      </v-btn>
    //- MyMessage(ref="message")
  </v-toolbar>
</template>
<script>
import api from '@/api'
import util from '@/utils'
export default {
  name: 'top',
  data () {
    return {
      end:'/user/welcome',
      self: this,
      items: null,
      
    }
  },
  computed: {
    userInfo () {
      // console.log(this.$store.getters.getUserInfo)
      return this.$store.getters.getUserInfo
    }
  },
  props: ['clipped', 'miniVariant', 'drawer'],
  methods: {
    setDrawer () {
      this.$emit('setDrawer', !this.drawer)
    },
    async signOut (){
      console.log("now is signOut")
      sessionStorage.removeItem('admin')
      util.toRouter(this.end, this)

      console.log("now is signOut")

    }
  }
}
</script>
<style lang="less" scoped>
.bcb {
  &>li {
    a.v-breadcrumbs__item a{
      color: #EEEEEE !important;
      font-weight: 400;
    }
    a.v-breadcrumbs__item--disabled a{
      color: #BDBDBD !important;
      font-weight: 300;
    }
  }
}
</style>
