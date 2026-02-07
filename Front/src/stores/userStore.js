import { defineStore } from 'pinia'
import { ref, computed } from 'vue'

export const useUserStore = defineStore('userStore', () => {
  const userData = ref({})
  const token = ref('')
  const refresh_token = ref('')

  // 计算属性：判断用户是否已登录
  const isUserLogin = computed(() => {
    return token.value !== ''
  })

  // 计算属性：获取用户名
  const username = computed(() => {
    return userData.value.username || ''
  })

  // 计算属性：获取工号
  const employeeId = computed(() => {
    return userData.value.employeeId || ''
  })

  // 设置用户数据
  const setUserData = (data) => {
    userData.value = data
  }

  // 设置 token
  const setToken = (accessToken, refreshToken) => {
    token.value = accessToken
    refresh_token.value = refreshToken
  }

  // 用户登录（保存用户信息和 token）
  const userLogin = (user, accessToken, refreshToken) => {
    setUserData(user)
    setToken(accessToken, refreshToken)
  }

  // 用户登出
  const userLogout = () => {
    userData.value = {}
    token.value = ''
    refresh_token.value = ''
  }

  return {
    userData,
    token,
    refresh_token,
    isUserLogin,
    username,
    employeeId,
    setUserData,
    setToken,
    userLogin,
    userLogout
  }
}, {
  persist: {
    key: 'userStore',
    storage: localStorage,
    paths: ['userData', 'token', 'refresh_token']
  }
})
