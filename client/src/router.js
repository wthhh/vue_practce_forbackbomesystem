import Vue from 'vue'
import Router from 'vue-router'
import store from '@/store'
import NProgress from 'nprogress' // progress bar
import 'nprogress/nprogress.css'// progress bar style
import Dashboard from '@/views/components/Dashboard.vue'
import Testdata from '@/views/components/Testdata.vue'
import comps from './components'
import util from './utils'
Vue.use(Router)

export const publicRouter = [
    { path: '/admin/login', component: () => import('@/views/admin/Login'), hidden: true },
    { path: '/admin/home', component: () => import('@/views/admin/Home'), hidden: true },
    { path: '/admin/404', component: () => import('@/views/admin/404'), hidden: true },
    { path: '/admin/submit', component: () =>import('@/views/admin/submit'),hidden: true},
    { path: '/user/login', component: () => import('@/views/user/Login'), hidden: true },
    { path: '/user/home', component: () => import('@/views/user/Home'), hidden: true },
    { path: '/user/404', component: () => import('@/views/user/404'), hidden: true },
    { path: '/user/submit', component: () =>import('@/views/user/submit'),hidden: true},
    { path: '*',component: () => import('@/views/user/404'),hidden: true}
  ]



export const router = new Router({
  mode: 'history',
  routes: publicRouter,
  scrollBehavior: () => ({ y: 0 })
})

router.beforeEach((to,from, next) =>{
  console.log('now it comes to route.js brforeeach function')
  NProgress.start()
  next()
  if (sessionStorage.getItem('user')){
  // 如果有session 则判断session
    if (to.path === '/user/login') {
      console.log(to.path)
      next({path: '/admin/home'})
      //如果登录了那么直接跳主页
    } 
    else{
      // 其它页面
      console.log(to.path)
      if (!store.getters.getUserInfo.length) {
        let user = JSON.parse(sessionStorage.getItem('user'))
        console.log(user)
        store.dispatch('setUserInfo', user)
        // store 里面如果没有session 则将session存入store
      }
      next()
      // 因为已经登录所以跳到该页面
    }
   }

  // else{
  //   // 如果不是login 则跳转login
  //   if (to.path !== '/user/login') { 
  //     if (to.path =='/admin/login'){
  //       next()
  //     }
  //     else{
  //       next({path: '/user/login'})
  //     }
  //   } 
  //   else {
  //     next()
  //   }
  // }
    NProgress.done()

})

// router.afterEach(to => {
//   NProgress.done()
// })

export default router
