import http from '@/http'
let path = 'user'

let index = async (data = {}) => {
  let url = path
  let result = await http.get(url, data)
  return result
}

let readbystuid = async (id) => {
  let url = path + '/readbystuid?id=' + id
  let result = await http.get(url, {})
  return result
}
let newuser = async (id) => {
  let url = path + '/newuser?id=' + id
  let result = await http.get(url, {})
  return result
}
export default{
  index,
  readbystuid,
  newuser
}
