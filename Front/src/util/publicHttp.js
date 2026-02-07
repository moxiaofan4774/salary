import axios from 'axios'
import { ElMessage } from 'element-plus'

const serverUrl = import.meta.env.VITE_APP_SERVER_URL

/**
 * 公共HTTP客户端
 * 用于不需要身份验证的公开API请求
 * 例如：获取文章列表、医院信息、新闻等公开内容
 */
const publicHttp = axios.create({
  baseURL: `${serverUrl}/`,
  timeout: 5000,
  headers: {
    'Content-Type': 'application/json; charset=utf-8',
  },
})

// 请求拦截器
publicHttp.interceptors.request.use(
  (config) => {
    
    return config
  },
  (error) => {
    
    return Promise.reject(error)
  }
)

// 响应拦截器
publicHttp.interceptors.response.use(
  (response) => {
    return response
  },
  (error) => {
    const status = error.response?.status
    
    // 处理各种错误状态
    switch (status) {
      case 400:
        ElMessage.error('请求参数错误')
        break
      case 404:
        ElMessage.error('请求的资源不存在')
        break
      case 429:
        ElMessage.error('请求过于频繁，请稍后再试')
        break
      case 500:
        ElMessage.error('服务器内部错误')
        break
      case 502:
        ElMessage.error('网关错误')
        break
      case 503:
        ElMessage.error('服务暂时不可用')
        break
      default:
        if (status >= 500) {
          ElMessage.error('服务器错误，请稍后再试')
        } else if (status >= 400) {
          ElMessage.error('请求失败，请检查参数')
        } else {
          ElMessage.error('网络错误，请检查网络连接')
        }
    }

    return Promise.reject(error)
  }
)

export default publicHttp 