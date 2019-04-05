<template lang='pug'>
  v-footer(:fixed="fixed" app)
    v-flex(primary lighten-2 py-3 text-xs-center white--text xs12)
      slot &copy;2019 —
      strong  Linkstudio
      slot &nbsp;&nbsp;&nbsp;&nbsp;Email —
      strong  15307130***@fudan.edu.cn
</template>
<script>

export default {
  name: 'foot',
  props: ['fixed']
}
</script>
