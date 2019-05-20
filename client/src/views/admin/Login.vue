<template lang="pug">
    v-jumbotron(:gradient="gradient" height="100%")
      v-container(fluid fill-height)
        v-layout(align-center justify-center)
          v-flex(xs12 sm8 md4)
            div.pa-3.text-xs-center
              div.display-3.py-4(style="color:#1565C0") 
            v-card.elevation-12
              v-toolbar(dark color="primary")
                v-toolbar-title AdminLogin
                v-spacer
              v-card-text
                v-form(ref="form")
                  v-text-field(prepend-icon="person" v-model="form.admin_name" :rules="[v => !!v || 'Admin name is required']" type="text")
                  v-text-field(prepend-icon="lock" v-model="form.password"  :rules="[v => !!v || 'Password is required']" type="password")
              v-card-actions
                v-spacer
                v-btn(color="primary" @click="submit") Submit
      Footer(:fixed="fixed")
      MyLoading(ref="loading")
      MyMessage(ref="message")
</template>
<script>
import Footer from '@/views/components/admin/Footer'
import api from '@/api'
import util from '@/utils'
export default {
  data () {
    return {
      self: this,
      gradient: 'to top right, #1A237E, #BBDEFB',
      form: {
        admin_name: 'admin',
        password: '111111'
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
        let res = await api.base.adminlogin(this.form)
        // console.log(res.code)
        await util.sleep()
        this.$refs.loading.close()
        if (res.code === 1) {
          
          this.$refs.message.open('登录成功', 'success')
          //sessionStorage.setItem('menus', JSON.stringify(res.data.menus))
          sessionStorage.setItem('admin', JSON.stringify(res.data))
          //sessionStorage.setItem('token', res.data.token)
           console.log(res.data)
          //util.toRouter('/admin/home', this,res.data)
          this.$router.push({name:'admin_home',params:res.data})
        } else {
          // console.log(res.data)
          this.$refs.message.open(res.error, 'error')
        }
      }
    }

  }

}
</script>
