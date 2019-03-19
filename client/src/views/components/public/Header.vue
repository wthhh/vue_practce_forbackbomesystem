<template lang="pug">
  v-toolbar.primary(app :clipped-left="clipped" dark)
    v-toolbar-side-icon(@click.stop="setDrawer")

    v-toolbar-title Linkstudio-template
    v-breadcrumbs.bcb(divider="/")
      v-breadcrumbs-item(v-for="(item,index) in items" :key="item.text" :disabled='item.redirect===""||index==items.length-1')
        span(v-if='item.redirect===""||index==items.length-1') {{item.meta.title|i18nName('Menu',self)}}
        router-link(v-else :to="item.redirect||item.path") {{item.meta.title|i18nName('Menu',self)}}
    v-spacer
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
  
  props: ['clipped', 'miniVariant', 'drawer'],
  methods: {
    setDrawer () {
      this.$emit('setDrawer', !this.drawer)
    },
    setMiniVariant () {
      this.$emit('setMiniVariant', !this.miniVariant)
    },
    setClipped () {
      this.$emit('setClipped', !this.clipped)
    },
    getBreadcrumb () {
      let matched = this.$route.matched.filter(item => item.name)
      const first = matched[0]
      if (first && first.name !== 'index') {
        matched = [{ path: '/index', meta: { title: 'Home' } }].concat(matched)
      }
      this.items = matched
    }
  },
  created () {
    this.getBreadcrumb()
  },
  watch: {
    '$route' () {
      this.getBreadcrumb()
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
