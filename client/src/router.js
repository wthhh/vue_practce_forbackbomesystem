import Vue from 'vue'
import Router from 'vue-router'
import store from '@/store'
import NProgress from 'nprogress' // progress bar
import 'nprogress/nprogress.css'// progress bar style
import Testdata from '@/views/components/admin/Testdata'
import Display from '@/views/components/user/Display'
import Pdisplay from '@/views/components/user/Pdisplay'
import Profile from '@/views/components/user/Profile'
import Adisplay from '@/views/components/admin/Adisplay'
import comps from './components/admin'
import util from './utils'
Vue.use(Router)

export const publicRouter = [
    { path: '/admin/login', component: () => import('@/views/admin/Login'), hidden: true },
    { name:"admin_home",path: '/admin/home', component: () => import('@/views/admin/Home'), hidden: true, children:[
      {path:'/admin/home/dashboard',component: () =>import('@/views/components/admin/Dashboard')},
      {path:'/admin/home/testdata',component: Testdata},
      {path:'/admin/home/adisplay',component: Adisplay, hidden:true, children:[
         {path:'/admin/home/pdisplay',component: () =>import('@/views/components/admin/Pdisplay'),hidden:true,children:[
            {name:"Idisplay",path:'/admin/home/idisplay',component: () =>import('@/views/components/admin/Idisplay')},
         ]},
      ]},
    ]},
    { path: '/admin/404', component: () => import('@/views/admin/404'), hidden: true },
    { path: '/admin/submit', component: () =>import('@/views/admin/submit'),hidden: true},
    { path: '/user/welcome', component: () =>import('@/views/user/welcome'),hidden: true},
    { path: '/user/login', component: () => import('@/views/user/Login'), hidden: true },
    { path: '/user/home', component: () => import('@/views/user/Home'), hidden: true ,children:[
      {path:'/user/home/testdata',component: Testdata},
      {path:'/user/home/display',component: Display},
      {path:'/user/home/pdisplay',component: Pdisplay},
      {path:'/user/home/profile',component: Profile},
    ]},
    { path: '/user/404', component: () => import('@/views/user/404'), hidden: true },
    { path: '/user/submit', component: () =>import('@/views/user/submit'),hidden: true},
    { path: '*',component: () => import('@/views/user/404'),hidden: true}
  ]



export const router = new Router({
  mode: 'history',
  routes: publicRouter,
  scrollBehavior: () => ({ y: 0 })
})
var admin=/^\/admin/;
var user=/^\/user/;
router.beforeEach((to,from, next) =>{
  console.log(to.path)
  NProgress.start()
  if (admin.test(to.path))
  {
        
    if (sessionStorage.getItem('admin')){
  // 如果有session 则判断session
      if (to.path === '/admin/login') {
        next({path: '/admin/home'})
        //如果登录了那么直接跳主页
      } 
      else{
        // 其它页面
        if (!store.getters.getUserInfo.length) {
          let user = JSON.parse(sessionStorage.getItem('admin'))
          console.log(admin)
          store.dispatch('setAdminInfo', admin)
          // store 里面如果没有session 则将session存入store
        }
        next()
      // 因为已经登录所以跳到该页面
      }
    }
    else{
    // 如果不是login 则跳转login
      if (to.path !== '/admin/login') { 
          next({path: '/admin/login'})
      } 
      else {
        next()
      }
    }
  }
  else if (user.test(to.path)){  
    if (sessionStorage.getItem('user')){
  // 如果有session 则判断session
      if (to.path === '/user/login') {
        next({path: '/user/home'})
        //如果登录了那么直接跳主页
      } 
      else{
        // 其它页面
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
      if (to.path !== '/user/welcome') { 
        if (to.path =='/user/login'){
          next()
        }
        else{
          next({path: '/user/welcome'})
        }
      } 
      else {
        next()
      }
    }
  }
  else{
    next({path:'/user/404'})
  }

    NProgress.done()

})

// router.afterEach(to => {
//   NProgress.done()
// })

export default router
