import Vue from 'vue'
import App from './App'
import router from './router'
import store from '@/store'
import htmlToPdf from '@/components/htmlToPdf'
import ECharts from 'echarts'
import 'echarts/lib/chart/bar'
import 'echarts/lib/component/tooltip'
import 'echarts/lib/component/polar'
import 'echarts/lib/component/legend'
import 'echarts/lib/component/title.js'
Vue.component('v-chart', ECharts)



Vue.use(htmlToPdf)


// import './filters'

import 'babel-polyfill'
import '@mdi/font/css/materialdesignicons.min.css'

import Vuetify from 'vuetify'
import 'vuetify/dist/vuetify.min.css'

// import './assets/style/index.less'

import MyLoading from '@/views/components/user/Loading.vue'
import MyMessage from '@/views/components/user/Message.vue'


Vue.component('MyLoading', MyLoading)
Vue.component('MyMessage', MyMessage)


Vue.use(Vuetify, {
  iconfont: 'mdi' // 'md' || 'mdi' || 'fa' || 'fa4'
})

Vue.config.productionTip = false

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  store,
  components: { App },
  template: '<App/>'
})
