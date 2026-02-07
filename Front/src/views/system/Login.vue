<template>
  <div class="container">
    <el-form
      ref="loginForm"
      style="max-width: 600px"
      :model="formData"
      :rules="rules"
      label-width="auto"
      hide-required-asterisk
    >
      <h2>薪资管理系统</h2>
      <el-form-item label="账号" prop="username">
        <el-input v-model="formData.username" placeholder="请输入账号" :prefix-icon="Avatar" />
      </el-form-item>
      <el-form-item label="密码" prop="password">
        <el-input
          v-model="formData.password"
          type="password"
          placeholder="请输入密码"
          :prefix-icon="Lock"
        />
      </el-form-item>
      <el-form-item label="验证">
        <div class="verify-trigger">
          <el-button class="verify-button" type="primary" plain @click="openPuzzleDialog">
            <span>{{ isSliderPassed ? '验证已通过' : '点击按钮开始验证（待验证）' }}</span>
            <el-icon v-if="isSliderPassed" class="verify-icon">
              <CircleCheckFilled />
            </el-icon>
          </el-button>
        </div>
      </el-form-item>
      <el-form-item class="button-container">
        <el-button type="primary" @click="login">
          登录
        </el-button>
      </el-form-item>
    </el-form>

    <el-dialog
      v-model="puzzleDialogVisible"
      width="420px"
      top="20vh"
      class="puzzle-dialog"
      :close-on-click-modal="false"
      @close="closePuzzleDialog"
    >
      <template #header>
        <div class="puzzle-header">请拖动滑块完成拼图</div>
      </template>
      <div class="puzzle-content">
        <div class="puzzle-stage">
          <img :src="puzzleImage" alt="puzzle" />
          <div class="puzzle-hole" :style="{ left: holeLeft }"></div>
          <div
            class="puzzle-piece"
            :style="{
              left: pieceLeft,
              backgroundImage: `url(${puzzleImage})`,
              backgroundPosition: pieceBackgroundPosition
            }"
          ></div>
        </div>
        <div class="puzzle-slider">
          <div class="slider-tip">向右拖动拼图块完成验证</div>
          <div class="slider-input">
            <div class="slider-arrow">→</div>
            <input
              class="slider-range"
              type="range"
              min="0"
              max="100"
              v-model.number="sliderValue"
              @change="handleSliderCheck"
            />
          </div>
        </div>
      </div>
      <template #footer>
        <el-button @click="resetPuzzle">重置拼图</el-button>
        <el-button type="primary" @click="closePuzzleDialog">关闭</el-button>
      </template>
    </el-dialog>
  </div>
</template>

<script setup>
import { computed, ref } from 'vue'
import { Avatar, Lock, CircleCheckFilled } from '@element-plus/icons-vue'
import { ElMessage } from 'element-plus'
import adminHttp from '@/util/adminHttp'
import { useRouter } from 'vue-router'
import { useAdminStore } from '@/stores/adminStore'
import puzzleImg from '@/assets/login_bg.jpg'

const adminStore = useAdminStore()
const router = useRouter()

const formData = ref({
  username: '',
  password: '',
})

const rules = ref({
  username: [{ required: true, message: '请输入账号', trigger: 'blur' }],
  password: [{ required: true, message: '请输入密码', trigger: 'blur' }],
})

const puzzleDialogVisible = ref(false)
const sliderValue = ref(0)
const isSliderPassed = ref(false)
const targetPosition = ref(0)
const puzzleImage = puzzleImg

const puzzleConfig = {
  width: 320,
  piece: 48,
  holeTop: 70,
}
const availableWidth = puzzleConfig.width - puzzleConfig.piece

const holeLeft = computed(() => `${targetPosition.value}px`)
const pieceLeft = computed(() => `${(sliderValue.value / 100) * availableWidth}px`)
const pieceBackgroundPosition = computed(() => `-${targetPosition.value}px -${puzzleConfig.holeTop}px`)

const resetPuzzle = () => {
  sliderValue.value = 0
  if (!isSliderPassed.value) {
    const min = 20
    const max = Math.max(min + 1, availableWidth - 20)
    targetPosition.value = Math.floor(Math.random() * (max - min + 1)) + min
  }
}

const openPuzzleDialog = () => {
  puzzleDialogVisible.value = true
  resetPuzzle()
}

const closePuzzleDialog = () => {
  puzzleDialogVisible.value = false
}

const handleSliderCheck = () => {
  const sliderOffset = (sliderValue.value / 100) * availableWidth
  if (Math.abs(sliderOffset - targetPosition.value) <= 6) {
    isSliderPassed.value = true
    puzzleDialogVisible.value = false
    ElMessage.success('拼图验证通过')
  } else {
    isSliderPassed.value = false
    ElMessage.error('验证失败，请重试')
    resetPuzzle()
  }
}

const login = () => {
  if (!isSliderPassed.value) {
    ElMessage.warning('请先完成拼图验证')
    return
  }

  adminHttp
    .post('user/login/', formData.value)
    .then((res) => {
      if (res.data.code === 400) {
        ElMessage.error(res.data.message)
        return
      }

      const currentUser = res.data.data.user
      if (!currentUser.is_staff) {
        ElMessage.error('您没有权限访问该系统')
        return
      }

      adminStore.setAdminData(currentUser)
      adminStore.setAdminToken(res.data.data.token, res.data.data.refresh)
      ElMessage.success(res.data.message)
      router.push('/adminIndex')
    })
    .catch((err) => {
      ElMessage.error(err.message)
    })
}
</script>

<style scoped>
.container {
  height: 100vh;
  width: 100vw;
  margin: 0;
  padding: 0;
  background: url('../../assets/login_bg.jpg') no-repeat center center;
  background-size: cover;
  position: fixed;
  top: 0;
  left: 0;
  display: flex;
  align-items: center;
  justify-content: center;
  overflow: hidden;
}

.el-form {
  position: relative;
  width: 500px;
  padding: 40px 50px;
  background: rgba(255, 255, 255, 0.85);
  border-radius: 10px;
  box-shadow:
    0 8px 16px rgba(0, 0, 0, 0.15),
    0 0 6px rgba(0, 0, 0, 0.05);
}

.el-form h2 {
  text-align: center;
  margin-bottom: 20px;
}

.button-container {
  display: flex;
  justify-content: center;
}

.button-container .el-button {
  width: 100%;
}

.verify-trigger {
  width: 100%;
}

.verify-button {
  width: 100%;
  display: inline-flex;
  justify-content: center;
  align-items: center;
  gap: 8px;
}

.verify-icon {
  color: #67c23a;
  font-size: 18px;
}

.puzzle-content {
  padding-top: 8px;
}

.puzzle-stage {
  position: relative;
  width: 320px;
  height: 180px;
  margin: 0 auto 16px;
  border-radius: 12px;
  overflow: hidden;
  background: #f5f7fa;
  box-shadow: inset 0 0 0 1px rgba(0, 0, 0, 0.05);
}

.puzzle-stage img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.puzzle-hole,
.puzzle-piece {
  position: absolute;
  top: 70px;
  width: 48px;
  height: 48px;
  border-radius: 10px;
}

.puzzle-hole {
  border: 2px dashed #409eff;
  background: rgba(255, 255, 255, 0.6);
}

.puzzle-piece {
  border: 1px solid #409eff;
  background-size: 320px 180px;
  box-shadow: 0 6px 18px rgba(64, 158, 255, 0.4);
  transition: left 0.1s;
}

.puzzle-slider {
  display: flex;
  flex-direction: column;
  gap: 10px;
}

.slider-tip {
  text-align: center;
  color: #606266;
  font-size: 13px;
}

.slider-input {
  display: flex;
  align-items: center;
  gap: 12px;
}

.slider-arrow {
  width: 48px;
  height: 48px;
  border-radius: 50%;
  background: linear-gradient(135deg, #7dbaff, #409eff);
  display: flex;
  align-items: center;
  justify-content: center;
  color: #fff;
  font-size: 22px;
}

.slider-range {
  flex: 1;
  appearance: none;
  height: 16px;
  border-radius: 8px;
  background: #ecf5ff;
  outline: none;
}

.slider-range::-webkit-slider-thumb,
.slider-range::-moz-range-thumb {
  width: 40px;
  height: 40px;
  border-radius: 50%;
  background: #409eff;
  border: 3px solid #fff;
  box-shadow: 0 4px 12px rgba(64, 158, 255, 0.6);
  cursor: pointer;
}
</style>

<style>
body,
html {
  margin: 0;
  padding: 0;
  overflow: hidden;
}
</style>
