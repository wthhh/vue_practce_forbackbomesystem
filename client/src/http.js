import axios from 'axios'
import qs from 'qs'
import _ from 'lodash'

let baseURL = 'http://localhost/vue_practice/server/public/index.php/index/'

let request = async (requestMethod = 'get', requestConf) => {
  //console.log('this is requestConf')
  //console.log(requestConf)
  requestConf.headers = {}
  // requestConf.headers['X-Requested-Token'] = sessionStorage.getItem('token') ? sessionStorage.getItem('token') : null
  requestConf.timeout = 5000
  requestConf.method = requestMethod
  //console.log(requestMethod)
  //console.log(requestConf)
  let response = await axios.request(requestConf).catch(
    function (error) {
    let data = {
      code: 404,
      data: null,
      error: error + ''
    }
    //console.log('where is error')
    console.log(data)
    return {data: data}
  
    }
  )
   //console.log('re')
   //console.log('now is here')
   console.log(response)
  return response.data
}
// try catch ?

let get = (url = '', params = {}) => {
  let requestConf = {
    url,
    baseURL: baseURL,
    params
  }

  let response = request('get', requestConf)
  return response
}

let del = (url = '', params = {}) => {
  let requestConf = {
    url,
    baseURL: baseURL,
    params
  }
  //console.log(requestConf)
  let response = request('post', requestConf)
  return response
}

let post = async (url = '', params = {}) => {
  params = _.size(params) ? qs.stringify(params) : {}
  let requestConf = {
    url,
    baseURL: baseURL,
    data: params
  }
  //console.log(requestConf)
  let response = await request('post', requestConf)
  //console.log(response)
  return response
}

let put = async (url = '', params = {}) => {
  params = _.size(params) ? qs.stringify(params) : {}
  let requestConf = {
    url,
    baseURL: baseURL,
    data: params
  }

  let response = await request('put', requestConf)
  return response
}

export default{
  post,
  get,
  put,
  del,
  baseURL
}
