import http from '@/http'
let path = 'project'

let index = async (data = {}) => {
  let url = path
  let result = await http.get(url, data)
  return result
}

let save = async (data) => {
  let url = path + '/save'
  let result = await http.post(url, data)
  return result
}

let read = async (id) => {
  let url = path + '/read?' + id
  let result = await http.get(url, {})
  return result
}
let readatt = async (id) => {
  let url = path + '/readatt?id=' + id
  let result = await http.get(url, {})
  // console.log("a"+result)
  return result
}

let readstu = async (id) => {
    let url = path + '/readstu?id=' + id
    let result = await http.get(url, {})
    // console.log("u"+result)

    return result
  }

let update = async (data) => {
  let url = path + '/update?id=' + data.id
  let result = await http.put(url, data)
  return result
}

let enable = async (data) => {
  let url = path + '/enable'
  let result = await http.post(url, data)
  return result
}

let del = async (id) => {
  let url = path + '/delete?id=' + id
  let result = await http.del(url, {})
  return result
}

export default{
  index,
  save,
  read,
  readatt,
  readstu,
  update,
  enable,
  del
}
