import _ from 'lodash'
import http from './http'
import comps from './components/admin'
import moment from 'moment'




let sleep = (d = 800) => {
  return new Promise((resolve) => {
    setTimeout(resolve, d)
  })
}

let toRouter = (name, vm, data = {}, type = 'params') => {
  if (!name) name = vm.$route.name

  if (name === vm.$route.name) {
    vm.$router.push({name: 'refresh', query: { name: name }})
  } else {
    if (type === 'params') {
      // console.log(vm.$router)
      vm.$router.push({path: name, params: data})
      // console.log(vm.$router)
    } else {
      vm.$router.push({path: name, query: data})
    }
  }
}

let toRouter_a = (name, vm, data = {}, type = 'params') => {
  if (!name) name = vm.$route.name

  if (name === vm.$route.name) {
    vm.$router.go(-1)
  } else {
    if (type === 'params') {
      // console.log(vm.$router)
      vm.$router.push({name: name, params: data})
      // console.log(vm.$router)
    } else {
      vm.$router.push({name: name, query: data})
    }
  }
}

let toRouter_search = (name, vm, data = {}, type = 'params') => {
  if (!name) name = vm.$route.name

  if (name === vm.$route.name || vm.$route.name ==='search_res_child') {
    vm.$router.push({name:'admin_search'})
   
  } else {
    if (type === 'params') {
      // console.log(vm.$router)
      vm.$router.push({name: name, params: data})
      // console.log(vm.$router)
    } else {
      vm.$router.push({name: name, query: data})
    }
  }
}

// 全局过滤中也有相同方法，看方便
let i18nName = (key = null, title = null, vm) => {
  let name = key + '.' + title
  if (vm.$te(name)) {
    return vm.$t(name)
  }
  return title
}

let returnName = (key, data = {}) => {
  let name = ''
  _.forEach(data, function (v, k) {
    if (v.id === key) {
      name = v.name
    }
  })
  return name
}

// 深拷贝
let cloneDeep = (val) => {
  return _.cloneDeep(val)
  // return Object.assign({}, val)
}
let timeFilter = (value, format = 'YYYY-MM-DD HH:mm:ss') => {
  if (!value) return ''
  let day = moment.unix(value)
  let date = moment(day).format(format)
  return date
}

export default {
  sleep,
  toRouter,
  toRouter_a,
  toRouter_search,
  i18nName,
  cloneDeep,
  returnName,
  timeFilter
}
