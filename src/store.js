import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    recentSearches: [],
  },
  mutations: {
    addSearch(state, payload){
      state.recentSearches.push(payload)
    },
    removeSearch(state, id){
      console.log("In store to delete", id)
      state.recentSearches.splice(id, 1)
    }
  },
  actions: {

  }
})
