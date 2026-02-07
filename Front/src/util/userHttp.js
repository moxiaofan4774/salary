import axios from 'axios'
import { showToast } from '@nutui/nutui'
import { useUserStore } from '@/stores/userStore'

const serverUrl = import.meta.env.VITE_APP_SERVER_URL

/**
 * 前台用户HTTP客户端
 * 用于需要前台用户身份验证的API请求
 * 自动添加用户token，处理token刷新和超时
 */
const userHttp = axios.create({
  baseURL: `${serverUrl}/`,
  timeout: 30000, // 30秒超时
  headers: {
    'Content-Type': 'application/json; charset=utf-8',
  }
})

// 最后活动时间
let lastActivityTime = Date.now()
// 超时时长（30分钟，单位：毫秒）
const TIMEOUT_DURATION = 30 * 60 * 1000

// 更新最后活动时间
const updateActivity = () => {
  lastActivityTime = Date.now()
}

// 检查是否超时
const checkTimeout = () => {
  const now = Date.now()
  return (now - lastActivityTime) > TIMEOUT_DURATION
}

// 请求拦截器
userHttp.interceptors.request.use(
  (config) => {
    const userStore = useUserStore()

    // 检查是否超时
    if (checkTimeout()) {
      showToast.text('登录超时，请重新登录')
      userStore.userLogout()
      setTimeout(() => {
        window.location.href = '/'
      }, 1000)
      return Promise.reject(new Error('登录超时'))
    }

    // 更新活动时间
    updateActivity()

    // 添加token到请求头
    if (userStore.token) {
      config.headers.Authorization = `Bearer ${userStore.token}`
    }

    return config
  },
  (error) => {
    return Promise.reject(error)
  }
)

// 响应拦截器
userHttp.interceptors.response.use(
  (response) => {
    // 请求成功，更新活动时间
    updateActivity()
    return response
  },
  async (error) => {
    const originalRequest = error.config
    const userStore = useUserStore()
    const refreshToken = userStore.refresh_token
    const status = error.response?.status

    // 处理401错误并尝试刷新Token
    if (status === 401 && refreshToken && !originalRequest._retry) {
      // 检查是否超过30分钟未操作
      if (checkTimeout()) {
        showToast.text('长时间未操作，请重新登录')
        userStore.userLogout()
        setTimeout(() => {
          window.location.href = '/'
        }, 1000)
        return Promise.reject(new Error('登录超时'))
      }

      originalRequest._retry = true

      try {
        console.log('用户Token过期，尝试刷新...')
        const response = await axios.post(`${serverUrl}/user/token/refresh/`, {
          refresh: refreshToken,
        })

        // 更新token和活动时间
        userStore.setToken(response.data.access, response.data.refresh)
        updateActivity()

        // 重试原始请求
        originalRequest.headers.Authorization = `Bearer ${response.data.access}`
        return userHttp(originalRequest)

      } catch (refreshError) {
        console.error('用户Token刷新失败:', refreshError)
        // 刷新失败则登出
        userStore.userLogout()
        showToast.fail('登录已过期，请重新登录')

        // 跳转到前台登录页
        setTimeout(() => {
          window.location.href = '/'
        }, 1000)

        return Promise.reject(refreshError)
      }
    }

    // 处理其他错误状态
    switch (status) {
      case 401:
        showToast.fail('未登录或登录已过期，请重新登录')
        userStore.userLogout()
        setTimeout(() => {
          window.location.href = '/'
        }, 1000)
        break
      case 403:
        showToast.fail('权限不足，无法执行此操作')
        break
      case 404:
        showToast.fail('请求的资源不存在')
        break
      case 500:
        showToast.fail('服务器内部错误')
        break
      default:
        if (status >= 500) {
          showToast.fail('服务器错误，请稍后再试')
        } else if (status >= 400) {
          showToast.fail('请求失败，请检查参数')
        } else {
          showToast.fail('网络错误，请检查网络连接')
        }
    }

    return Promise.reject(error)
  }
)

export default userHttp
