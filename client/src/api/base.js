import http from '../http'
import md5 from 'js-md5'
import store from '@/store'

let path = 'base'

let login = async (data) => {
  let url = path + '/login'
  let d = {
    'stu_id': data.stu_id
  }
  let result = await http.post(url, d)
  // console.log(result)
  return result
}

let adminlogin = async (data) => {
  let url = path + '/adminlogin'
  let d = {
    'admin_name': data.admin_name,
    'password': data.password
  }
  //console.log(d)
  let result = await http.post(url, d)
  return result
}
//submit没做好
let submit = async (data) => {
	let url = path+'/submit'
  if (sessionStorage.getItem('user')){
	   let d = {
		  'user_name': data.user_name,
		  'class':data.class,
		  'detail':data.detail
    }
  }
	let result = await http.post(url, d)
  // console.log(result)
  return result
}

export default{
  login,
  adminlogin,
  submit
}