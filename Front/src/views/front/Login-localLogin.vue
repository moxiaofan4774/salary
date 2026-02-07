<template>
  <div class="login-container">
    <div class="login-card">
      <div class="login-header">
        
        <h1 class="login-title">薪资查询系统</h1>
        <p class="login-subtitle">欢迎登录</p>
      </div>

      <div class="login-form">
        <el-form :model="formData" ref="formRef">
          <el-form-item prop="employeeId">
            <el-input
              v-model="formData.employeeId"
              placeholder="请输入工号"
              clearable
              class="custom-input"
            >
              <template #prefix>
                <el-icon><User /></el-icon>
              </template>
            </el-input>
          </el-form-item>

          <el-form-item prop="password">
            <el-input
              v-model="formData.password"
              type="password"
              placeholder="请输入密码"
              show-password
              clearable
              class="custom-input"
              @keyup.enter="handleLogin"
            >
              <template #prefix>
                <el-icon><Lock /></el-icon>
              </template>
            </el-input>
          </el-form-item>
        </el-form>

        <el-button
          type="primary"
          class="login-button"
          :loading="loading"
          @click="handleLogin"
          size="large"
          round
          block
        >
          登录
        </el-button>
      </div>

      <div class="login-footer">
        <p>© 2026 薪资查询系统</p>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, reactive,onMounted } from 'vue'
import { useRouter } from 'vue-router'
import { ElMessage } from 'element-plus'
import { User, Lock } from '@element-plus/icons-vue'
import loginApi from '@/api/login/loginApi'
import { useUserStore } from '@/stores/userStore'


const router = useRouter()
const userStore = useUserStore()
const loading = ref(false)
const formRef = ref(null)

const formData = reactive({
  employeeId: '',
  password: ''
})

const handleLogin = async () => {
  // 验证表单
  if (!formData.employeeId) {
    ElMessage.warning('请输入工号')
    return
  }
  if (!formData.password) {
    ElMessage.warning('请输入密码')
    return
  }

  loading.value = true

  try {
    const res = await loginApi.login({
      employeeId: formData.employeeId,
      password: formData.password
    })

    if (res.data && res.data.code === 200) {
      // 使用 userStore 保存用户信息和 token
      const { token, refresh, user } = res.data.data
      userStore.userLogin(user, token, refresh)

      ElMessage.success('登录成功')

      // 跳转到首页
      setTimeout(() => {
        router.push('/salaryList')
      }, 50)
    } else {
      ElMessage.error(res.data?.message || '登录失败')
    }
  } catch (error) {
    console.error('登录失败:', error)
    ElMessage.error(error.response?.data?.message || '登录失败，请检查网络连接')
  } finally {
    loading.value = false
  }
}




</script>

<style scoped>
.login-container {
  min-height: 100vh;
  display: flex;
  align-items: center;
  justify-content: center;
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  padding: 20px;
}

.login-card {
  width: 100%;
  max-width: 400px;
  background: #fff;
  border-radius: 16px;
  box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
  overflow: hidden;
  animation: slideUp 0.5s ease-out;
}

@keyframes slideUp {
  from {
    opacity: 0;
    transform: translateY(30px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

.login-header {
  text-align: center;
  padding: 40px 30px 30px;
  background: linear-gradient(135deg, #1989fa 0%, #0e6fd6 100%);
  color: #fff;
}

.logo-circle {
  width: 80px;
  height: 80px;
  margin: 0 auto 20px;
  background: rgba(255, 255, 255, 0.2);
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  backdrop-filter: blur(10px);
}

.login-title {
  font-size: 26px;
  font-weight: 600;
  margin: 0 0 8px;
  letter-spacing: 1px;
}

.login-subtitle {
  font-size: 14px;
  margin: 0;
  opacity: 0.9;
}

.login-form {
  padding: 40px 30px 30px;
}

.login-form :deep(.el-form-item) {
  margin-bottom: 24px;
}

.login-form :deep(.custom-input .el-input__wrapper) {
  padding: 12px 16px;
  border-radius: 12px;
  background: #f5f7fa;
  transition: all 0.3s ease;
}

.login-form :deep(.custom-input .el-input__wrapper.is-focus),
.login-form :deep(.custom-input .el-input__wrapper:hover) {
  background: #e8f4ff;
  box-shadow: 0 0 0 2px rgba(25, 137, 250, 0.2);
}

.login-form :deep(.el-input__inner) {
  font-size: 15px;
}

.login-form :deep(.el-input__prefix) {
  margin-right: 8px;
  color: #1989fa;
  font-size: 18px;
}

.login-button {
  width: 100%;
  margin-top: 32px;
  height: 48px;
  border-radius: 12px;
  font-size: 16px;
  font-weight: 500;
  letter-spacing: 1px;
  background: linear-gradient(135deg, #1989fa 0%, #0e6fd6 100%);
  border: none;
  box-shadow: 0 4px 12px rgba(25, 137, 250, 0.3);
  transition: all 0.3s;
}

.login-button:active {
  transform: translateY(1px);
  box-shadow: 0 2px 8px rgba(25, 137, 250, 0.3);
}

.login-footer {
  text-align: center;
  padding: 20px;
  background: #f8f9fa;
  color: #999;
  font-size: 13px;
}

.login-footer p {
  margin: 0;
}

/* 响应式设计 */
@media (max-width: 480px) {
  .login-card {
    border-radius: 0;
  }

  .login-header {
    padding: 30px 20px 20px;
  }

  .logo-circle {
    width: 70px;
    height: 70px;
  }

  .login-title {
    font-size: 22px;
  }

  .login-form {
    padding: 30px 20px 20px;
  }
}
</style>
