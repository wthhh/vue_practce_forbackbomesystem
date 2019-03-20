import Vue from 'vue'
import Router from 'vue-router'
import vuex from '@/vuex'
import NProgress from 'nprogress' // progress bar
import 'nprogress/nprogress.css'// progress bar style
import comps from './components'
import util from './utils'
Vue.use(Router)

export const publicRouter = [
  { path: '/login', component: () => import('@/views/public/Login'), hidden: true },
  { path: '/home', component: () => import('@/views/public/Home'), hidden: true },
  { path: '/404', component: () => import('@/views/public/404'), hidden: true },
  { path: '*', component: () => import('@/views/public/404'), hidden: true }
]

export const currentRouter = [
  {
    path: '',
    component: comps['home'],
    meta: {
      title: 'Home',
      icon: 'mdi-home'
    },
    redirect: 'index',
    children: [{
      path: 'index',
      component: () => import('@/views/public/Index'),
      name: 'index',
      meta: { title: 'Home', icon: 'mdi-home' }
    }]
  }
  
]

export const router = new Router({
  mode: 'history',
  routes: publicRouter,
  scrollBehavior: () => ({ y: 0 })
})

// router.beforeEach((to, from, next) => {
//   NProgress.start()
//   if(to.path !== '/login'){
//     if(to.path === '/front')
//       next()
//     else{
//       next({path: '/front'})
//     }
//   }
//   else{
//       if (sessionStorage.getItem('token')) {
//     if (to.path === '/login') {
//       next({path: '/'})
//     } else {
//       if (!store.getters.getUserInfo.length) {
//         let user = JSON.parse(sessionStorage.getItem('user'))
//         store.dispatch('setUserInfo', user)
//       }
//       if (!store.getters.getSetting.length) {
//         let setting = JSON.parse(sessionStorage.getItem('setting'))
//         store.dispatch('setSetting', setting)
//       }
//       if (!store.getters.getPrivateRouter.length) {
//         let r = util.setMenus()
//         if (r) {
//           store.dispatch('setPrivateRouter', r).then(() => {
//             router.addRoutes(store.getters.getPrivateRouter)
//             next({ ...to, replace: true })
//           })
//         } else {
//           sessionStorage.removeItem('token')
//           sessionStorage.removeItem('menus')
//           store.dispatch('setPrivateRouter', null)
//           next({path: '/login'})
//         }
//       } else {
//         if (JSON.stringify(to.meta) === '{}' && to.name) {
//           next({path: '/404'})
//         } else {
//           next()
//         }
//       }
//     }
//   } else {
//     if (to.path !== '/login') {
//       next({path: '/login'})
//     } else {
//       next()
//     }
//   }
//   }
//   NProgress.done()
// })

// router.afterEach(to => {
//   NProgress.done()
// })

export default router
