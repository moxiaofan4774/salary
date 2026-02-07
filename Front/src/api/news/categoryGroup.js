import publicHttp from '@/util/publicHttp.js'
import adminHttp from '@/util/adminHttp.js'

import {ref} from 'vue'

const categoryGroupAPI = {
  getList: (params = {}) => {
    return publicHttp({
      method: 'get',
      params: { ...params },
      url: '/news/categoryGroup/',
    })
  },

  getOne: (id) => {
    return publicHttp({
      method: 'get',
      url: `/news/categoryGroup/${id}/`,
    })
  },

  create: (data) => {
    return adminHttp({
      method: 'post',
      url: `/news/categoryGroup/`,
      data
    })
  },

  update: (id, data) => {
    return adminHttp({
      method: 'put',
      url: `/news/categoryGroup/${id}/`,
      data
    })
  },

  delete: (id) => {
    return adminHttp({
      method: 'delete',
      url: `/news/categoryGroup/${id}/`,
    })
  }
}

export default categoryGroupAPI