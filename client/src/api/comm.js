import http from '@/http'
let path = 'comm'

let logout = async (data) => {
  let url = path+'logout'
  console.log("comm")
  let result = await http.post(url, {})
  return result
}

export default{
  logout
}
