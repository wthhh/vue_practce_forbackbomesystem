<template lang="pug">
  v-toolbar.primary(app :clipped-left="clipped" dark)
    v-toolbar-side-icon(@click.stop="setDrawer")

    v-toolbar-title Linkstudio-template
      v-tooltip(bottom)
      v-spacer
      span {{userInfo['admin_name']}}
    MyMessage(ref="message")
</template>
<script>
import api from '@/api'
import util from '@/utils'
export default {
  name: 'top',
  data () {
    return {
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
