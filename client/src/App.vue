<template lang="pug">
  v-app
    transition(name="fade-transform" mode="out-in")
      router-view
</template>

<script>
import Index from './views/components/public/Menu.vue'
export default {
  name: 'App',
  components: {
    Index
  }
}
</script>
