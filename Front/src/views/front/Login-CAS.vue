<template>
    <div>
        <h1>跳转CAS登录页</h1>
    </div>
</template>

<script setup>
import { ref, reactive,onMounted } from 'vue'
import casApi from '@/api/user/casApi'

onMounted(() => {
  casLogin()
})

const casLogin = async () => {
  try {
    const res = await casApi.getCasLoginUrl()
    console.log(res.data.cas_login_url)
    // 跳转至CAS登录地址
    window.location.href = res.data.cas_login_url
  } catch (err) {
    alert('获取CAS登录地址失败：' + err.message)
  }
}
</script>

<style scoped></style>