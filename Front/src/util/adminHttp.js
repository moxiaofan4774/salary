import axios from 'axios'
import { ElMessage } from 'element-plus'

import { useAdminStore } from '@/stores/adminStore'
const adminStore = useAdminStore()

const serverUrl = import.meta.env.VITE_APP_SERVER_URL

const adminHttp = axios.create({
    baseURL: `${serverUrl}/`,
    timeout: 300000, // 增加到30秒，支持批量操作
    headers: {
      'Content-Type': 'application/json; charset=utf-8',
    }
})

// 最后活动时间
let lastActivityTime = Date.now()
// 超时时长（24小时，单位：毫秒）
const TIMEOUT_DURATION = 24 * 60 * 60 * 1000

// 更新最后活动时间
const updateActivity = () => {
  lastActivityTime = Date.now()
}

// 检查是否超时
const checkTimeout = () => {
  const now = Date.now()
  return (now - lastActivityTime) > TIMEOUT_DURATION
}


//请求拦截器
adminHttp.interceptors.request.use(config => {
    // 检查是否超时
    if (checkTimeout()) {
      ElMessage.warning('登录超时，请重新登录')
      adminStore.adminLogout()
      setTimeout(() => {
        window.location.href = '/login'
      }, 1000)
      return Promise.reject(new Error('登录超时'))
    }

    // 更新活动时间
    updateActivity()

    config.headers.Authorization = `Bearer ${adminStore.admin_access_token}`
    return config
}, error => {
    return Promise.reject(error)
})

//响应拦截器
adminHttp.interceptors.response.use(response => {
    // 请求成功，更新活动时间
    updateActivity()
    return response
},
async (error) => {
    const originalRequest = error.config
    const adminStore = useAdminStore()
    const refreshToken = adminStore.admin_refresh_token

    const status = error.response?.status

    // 处理401错误并尝试刷新Token
    if (status === 401 && refreshToken && !originalRequest._retry) {
      // 检查是否超过30分钟未操作
      if (checkTimeout()) {
        ElMessage.warning('长时间未操作，请重新登录')
        adminStore.adminLogout()
        setTimeout(() => {
          window.location.href = '/login'
        }, 1000)
        return Promise.reject(new Error('登录超时'))
      }

      originalRequest._retry = true

      try {
        console.log('管理员Token过期，尝试刷新...')
        const response = await axios.post(`${serverUrl}/user/token/refresh/`, {
          refresh: refreshToken,
        })

        // 更新token和活动时间
        adminStore.setAdminToken(response.data.access, response.data.refresh)
        updateActivity()

        // 重试原始请求
        originalRequest.headers.Authorization = `Bearer ${response.data.access}`
        return adminHttp(originalRequest)

      } catch (refreshError) {
        console.error('管理员Token刷新失败:', refreshError)
        // 刷新失败则登出
        adminStore.adminLogout()
        ElMessage.error('登录已过期，请重新登录')

        // 跳转到管理员登录页
        setTimeout(() => {
          window.location.href = '/login'
        }, 1000)

        return Promise.reject(refreshError)
      }
    }

    // 处理其他错误状态
    switch (status) {
      case 401:
        ElMessage.error('未登录或登录已过期，请重新登录')
        adminStore.adminLogout()
        setTimeout(() => {
          window.location.href = '/login'
        }, 1000)
        break
      case 403:
        ElMessage.error('权限不足，无法执行此操作')
        break
      case 404:
        ElMessage.error('请求的资源不存在')
        break
      case 500:
        ElMessage.error('服务器内部错误')
        break
      default:
        ElMessage.error('请求失败，请稍后再试')
    }

    return Promise.reject(error)
})

export default adminHttp