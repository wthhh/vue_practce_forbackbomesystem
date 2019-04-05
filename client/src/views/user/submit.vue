<template lang="pug">
    v-jumbotron(:gradient="gradient" height="100%")
      v-container(fluid fill-height)
        v-layout(align-center justify-center)
          v-flex(xs12 sm8 md4)
            div.pa-3.text-xs-center
              div.display-3.py-4(style="color:#1565C0") 
            v-card.elevation-12
              v-toolbar(dark color="primary")
                v-toolbar-title 提交申请
                v-spacer
              v-card-text
                v-form(ref="form")
                  v-text-field(prepend-icon="person" v-model="form.user_name" :rules="[v => !!v || 'Username is required']" type="text")
                  v-text-field(prepend-icon="lock" v-model="form.class"  :rules="[v => !!v || 'class is required']" type="text")
                  v-text-field(prepend-icon="lock" v-model="form.datail"  :rules="[v => !!v || 'detail is required']" type="text")
              v-card-actions
                v-spacer
                v-btn(color="primary" @click="submit") Submit
      Footer(:fixed="fixed")
      MyLoading(ref="loading")
      MyMessage(ref="message")
</template>
<script>
import Footer from '@/views/components/user/Footer'
import api from '@/api'
import util from '@/utils'
export default {
  data () {
    return {
      self: this,
      gradient: 'to top right, #1A237E, #BBDEFB',
      form: {
        admin_name: null,
        password: null
      },
      valid: false,
      fixed: false
      //name: null
    }
  },
  components: {
    Footer
  },
  methods: {

    async submit () {
      if (this.$refs.form.validate()) {
        this.$refs.loading.open()
        let res = await api.base.submit(this.form)
        // console.log(res.code)
        await util.sleep()
        this.$refs.loading.close()
        if (res.code === 1) {
          
          this.$refs.message.open('申请成功', 'success')
          util.toRouter('home', this)
        } else {
          // console.log(res.data)
          this.$refs.message.open(res.error, 'error')
        }
      }
    }

  }

}
</script>
