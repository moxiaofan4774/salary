import publicHttp from '@/util/publicHttp'

const loginApi = {
  // 用户登录
  login: (data) => {
    return publicHttp({
      url: '/user/frontLogin/',
      method: 'post',
      data
    })
  }
}

export default loginApi
