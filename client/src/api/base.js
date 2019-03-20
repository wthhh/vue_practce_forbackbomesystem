import http from '../http'
import md5 from 'js-md5'

let path = 'base'

let login = async (data) => {
  let url = path + '/login'
  let d = {
    'admin_name': data.admin_name,
    'password': data.password
  }
  console.log(d)
  let result = await http.post(url, d)
  return result
}

export default{
  login
}