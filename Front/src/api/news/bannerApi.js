import publicHttp from '@/util/publicHttp'
import adminHttp from '@/util/adminHttp'
import { ref } from 'vue'

const bannerApi = {
  getList: (params = {}) => {
    return publicHttp({
      url: '/news/banners/',
      method: 'get',
      params: {
        ...params,
      },
    })
  },

  getOne: (id) => {
    return publicHttp({
      url: `/news/banners/${id}/`,
      method: 'get',
    })
  },
  create: (data) => {
    return adminHttp({
      url: '/news/banners/',
      method: 'post',
      data,
    })
  },

  update: (id, data) => {
    return adminHttp({
      url: `/news/banners/${id}/`,
      method: 'put',
      data,
    })
  },

  delete: (id) => {
    return adminHttp({
      url: `/news/banners/${id}/`,
      method: 'delete',
    })
  },
  // updateStatus: (id, value) => {
  //   console.log(id,value);
  //   return request({
  //     url: `/news/banners/${id}/`,
  //     method: 'patch',
  //     data: { 'is_show': !value }
  //   });
  // }
  updateStatus: (id, status, value) => {
    const bool = ref(false)

    if (value) {
      bool.value = true
    } else {
      bool.value = false
    }

    return adminHttp({
      url: `/news/banners/${id}/`,
      method: 'patch',
      data: { is_show: bool.value },
    })
  },
}

export default bannerApi
