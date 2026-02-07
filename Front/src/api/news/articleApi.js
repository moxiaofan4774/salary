import publicHttp from '@/util/publicHttp'
import adminHttp from '@/util/adminHttp'


const articleApi = {

  getList: (params = {}) => {
    return publicHttp({
      url: '/news/articles/',
      method: 'get',
      params: {
        ...params
      }
    });
  },

  getOne: (id) => {
    return publicHttp({
      url: `/news/articles/${id}/`,
      method: 'get',

    });
  },
  create: (data) => {
    return adminHttp({
      url: '/news/articles/',
      method: 'post',
      data
    });
  },

  update: (id, data) => {
    return adminHttp({
      url: `/news/articles/${id}/`,
      method: 'put',
      data
    });
  },

  delete: (id) => {
    return adminHttp({
      url: `/news/articles/${id}/`,
      method: 'delete'
    });
  },

  deleteChecked: (ids) => {
    return adminHttp({
      url: `/news/articles/deleteChecked/`,
      method: 'post',
      data:{'ids':ids}
    });
  },
};

export default articleApi;