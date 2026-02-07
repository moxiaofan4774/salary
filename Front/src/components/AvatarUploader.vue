
<template>
    <el-upload
      class="avatar-uploader"
      :action="actionApi"
      :show-file-list="showFileList"
      style="border: dashed #ccc 1px; border-radius: 10px"
      @success="handleAvatarSuccess"
      @before-upload="beforeAvatarUpload"
    >
      <!-- 已上传图片显示 -->
      <img v-if="picUrl" :src="serverUrl + picUrl" class="avatar" />
      <!-- 未上传时的加号图标 -->
      <el-icon v-else class="avatar-uploader-icon"><Plus /></el-icon>
    </el-upload>
  </template>
  
  <script setup lang="ts">
  import { ref, watch } from 'vue'
  import type { UploadProps } from 'element-plus'
  import { ElMessage } from 'element-plus'
  import { Plus } from '@element-plus/icons-vue'
  // @ts-ignore
  const serverUrl = import.meta.env.VITE_APP_SERVER_URL
  const actionApi = ref(`${serverUrl}/news/upload_pic/`)
  
  /**
   * Props 定义：父组件可配置的参数
   */
  const props = defineProps({
    // 是否显示文件列表（默认隐藏）
    showFileList: {
      type: Boolean,
      default: false,
    },
    // 初始图片地址（可选，用于回显已上传的图片）
    modelValue: {
      type: String,
      default: '',
    },
  })
  
  /**
   * Emits 定义：向父组件传递事件
   */
  const emit = defineEmits(['update:modelValue', 'upload-success'])
  
  // 组件内部图片地址状态
  const picUrl = ref(props.modelValue)
  
  // 监听父组件传入的初始图片（用于回显）
  watch(
    () => props.modelValue,
    (newValue) => {
      picUrl.value = newValue
    },
    { immediate: true },
  )
  
  /**
   * 上传成功回调
   * @param response 接口返回数据
   * @param uploadFile 上传文件信息
   */
  const handleAvatarSuccess: UploadProps['onSuccess'] = (response, uploadFile) => {
    // 生成本地预览 URL
    picUrl.value = URL.createObjectURL(uploadFile.raw!)
    // 向父组件传递最终图片地址
    emit('upload-success', response.data.url)
    // 支持 v-model 双向绑定
    emit('update:modelValue', response.data.url)
  }
  
  /**
   * 上传前校验（格式、大小）
   * @param rawFile 原始文件
   */
  const beforeAvatarUpload: UploadProps['beforeUpload'] = (rawFile) => {
    // 格式校验
    if (!['image/jpeg', 'image/png'].includes(rawFile.type)) {
      ElMessage.error('只能上传 JPG/PNG 格式图片！')
      return false
    }
    // 大小校验（2M 限制）
    if (rawFile.size / 1024 / 1024 > 2) {
      ElMessage.error('图片大小不能超过 2MB！')
      return false
    }
    return true
  }
  </script>
  
  <style scoped>
  .avatar-uploader {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    width: 100px; /* 可通过 props 扩展 */
    height: 100px; /* 可通过 props 扩展 */
    cursor: pointer;
  }
  
  .avatar {
    width: 100%;
    height: 100%;
    object-fit: cover;
    border-radius: 10px;
  }
  
  .avatar-uploader-icon {
    font-size: 28px;
    color: #8c939d;
  }
  </style>
  