import http from '@/utils/http'
let path = 'comm'

let logout = async (data) => {
  let url = path + '/logout'
  let result = await http.post(url, {})
  return result
}
let login = async (data) => {
  let url = path + '/login'
  let result = await http.post(url, {})
  return result
}

export default{
  logout
}
