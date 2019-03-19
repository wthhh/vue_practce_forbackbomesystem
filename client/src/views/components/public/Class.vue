<template lang="pug">
  
</template>
<script>
//此页面表示侧边栏的具体显示，暂定为Class
import { mapGetters } from 'vuex'
import path from 'path'
export default {
  name: 'top',
  data () {
    return {
      self: this
    }
  },
  methods: {
    combinePath (a, b = '', c = '') {
      return path.resolve(a, b, c)
    }
  },
  computed: {
    ...mapGetters([
      'getPrivateRouter'
    ])
  }
}
</script>
<style lang="less" scoped>
.v-list__tile--active .v-list__tile__action i{
  color:#1976d2 !important;
}
</style>
