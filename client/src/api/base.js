import http from '@/utils/http'
import md5 from 'js-md5'

let path = 'base'

let login = async (data) => {
  let url = path + '/login'
  let d = {
    'admin_name': data.admin_name,
    'password': data.password
  }
  let result = await http.post(url, d)
  return result
}

export default{
  login
}