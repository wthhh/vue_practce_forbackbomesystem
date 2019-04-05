const actions = {
  setUserInfo ({commit}, data) {
    return new Promise(resolve => {
      commit('setUserInfo', data)
      resolve()
    })
  },
  setAdminInfo ({commit}, data) {
    return new Promise(resolve => {
      commit('setAdminInfo', data)
      resolve()
    })
  }
}

export default actions
