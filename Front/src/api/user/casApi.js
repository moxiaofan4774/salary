import publicHttp from '@/util/publicHttp'

const casApi = {

  getCasLoginUrl: () => {
    return publicHttp({
      url: '/user/get-cas-login-url/',
      method: 'get',

    })
  },

  getCasLoginInfo: (data) => {
    return publicHttp({
      url: '/user/cas-callback/',
      method: 'post',
      data
    })
  },

}

export default casApi
