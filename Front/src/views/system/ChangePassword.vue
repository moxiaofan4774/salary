<template>
  <div class="change-password-container">
    <div class="panel change-password-card">
      <div class="card-header">
        <span>修改密码</span>
      </div>
      <el-form
        ref="passwordFormRef"
        :model="passwordForm"
        :rules="rules"
        label-width="120px"
        style="max-width: 600px"
      >
        <el-form-item label="旧密码" prop="old_password">
          <el-input
            v-model="passwordForm.old_password"
            type="password"
            placeholder="请输入旧密码"
            show-password
            clearable
          />
        </el-form-item>
        <el-form-item label="新密码" prop="new_password">
          <el-input
            v-model="passwordForm.new_password"
            type="password"
            placeholder="请输入新密码（至少6个字符）"
            show-password
            clearable
          />
        </el-form-item>
        <el-form-item label="确认新密码" prop="confirm_password">
          <el-input
            v-model="passwordForm.confirm_password"
            type="password"
            placeholder="请再次输入新密码"
            show-password
            clearable
          />
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="submitForm">确认修改</el-button>
          <el-button @click="resetForm">重置</el-button>
        </el-form-item>
      </el-form>
    </div>
  </div>
</template>

<script setup>
import { ref, reactive } from 'vue'
import { ElMessage } from 'element-plus'
import adminHttp from '@/util/adminHttp'
import { useRouter } from 'vue-router'
import { useAdminStore } from '@/stores/adminStore'

const router = useRouter()
const adminStore = useAdminStore()
const passwordFormRef = ref()

const passwordForm = reactive({
  old_password: '',
  new_password: '',
  confirm_password: ''
})

// 自定义验证规则：确认密码
const validateConfirmPassword = (rule, value, callback) => {
  if (value === '') {
    callback(new Error('请再次输入新密码'))
  } else if (value !== passwordForm.new_password) {
    callback(new Error('两次输入的密码不一致'))
  } else {
    callback()
  }
}

const rules = {
  old_password: [
    { required: true, message: '请输入旧密码', trigger: 'blur' }
  ],
  new_password: [
    { required: true, message: '请输入新密码', trigger: 'blur' },
    { min: 6, message: '密码长度至少6个字符', trigger: 'blur' }
  ],
  confirm_password: [
    { required: true, message: '请再次输入新密码', trigger: 'blur' },
    { validator: validateConfirmPassword, trigger: 'blur' }
  ]
}

const submitForm = async () => {
  if (!passwordFormRef.value) return

  await passwordFormRef.value.validate((valid) => {
    if (valid) {
      adminHttp.post('user/change-password/', passwordForm)
        .then(res => {
          if (res.data.code === 200) {
            ElMessage.success(res.data.message)
            // 清空表单
            resetForm()
            // 延迟1秒后退出登录
            setTimeout(() => {
              adminStore.adminLogout()
              router.replace('/login')
            }, 1000)
          } else {
            ElMessage.error(res.data.message)
          }
        })
        .catch(err => {
          ElMessage.error(err.message || '修改密码失败')
        })
    } else {
      ElMessage.warning('请填写完整的表单信息')
      return false
    }
  })
}

const resetForm = () => {
  if (!passwordFormRef.value) return
  passwordFormRef.value.resetFields()
}
</script>

<style scoped>
.change-password-container {
  padding: 20px 0;
  display: flex;
  justify-content: center;
}

.change-password-card {
  width: 100%;
  max-width: 800px;
}

.card-header {
  font-size: 18px;
  font-weight: bold;
  margin-bottom: 16px;
  padding-bottom: 8px;
  border-bottom: 1px solid #ebeef5;
}

.el-button {
  margin-right: 10px;
}
</style>
