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
  { path: '/login', component: () => import('@/views/public/Login'), hidden: true },
  { path: '/adminlogin', component: () => import('@/views/public/AdminLogin'), hidden: true },
  { path: '/home', component: () => import('@/views/public/Home'), hidden: true,children: [{ path: '/home/dashboard', component: Dashboard},  { path: '/home/testdata', component: Testdata}] },
  //{ path: '/home', component: () => import('@/views/public/Home'), hidden: true },
  { path: '/404', component: () => import('@/views/public/404'), hidden: true },
  { path: '/submit', component: () =>import('@/views/public/submit'),hidden: true},
  { path: '*', component: () => import('@/views/public/Home'), hidden: true }
]



export const router = new Router({
  mode: 'history',
  routes: publicRouter,
  scrollBehavior: () => ({ y: 0 })
})

router.beforeEach((to,from, next) =>{
  console.log('now it comes to route.js brforeeach function')
  NProgress.start()
  if (sessionStorage.getItem('user')){
  // 如果有session 则判断session
    if (to.path === '/login') {
      console.log(to.path)
      next({path: '/home'})
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

  else{
    // 如果不是login 则跳转login
    if (to.path !== '/login') { 
      if (to.path =='/adminlogin'){
        next()
      }
      else{
        next({path: '/login'})
      }
    } 
    else {
      next()
    }
  }
    NProgress.done()

})

// router.afterEach(to => {
//   NProgress.done()
// })

export default router
