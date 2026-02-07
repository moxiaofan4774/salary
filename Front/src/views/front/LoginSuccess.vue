

<template>
<h1></h1>
</template>

<script setup>
import {ref, onMounted} from 'vue'
import casApi from '@/api/user/casApi.js'
import {useUserStore} from '@/stores/userStore'

const userStore = useUserStore()

onMounted(()=>{
  getUserInfo()
})

const getUserInfo = async () => {
  try {
    const urlParams = new URLSearchParams(window.location.search)
    const ticket = urlParams.get('ticket')
    if (ticket) {
      const res = await casApi.getCasLoginInfo({"ticket":ticket})
      if(res.data.code==200){
        const { token, refresh, user } = res.data.data
        userStore.userLogin(user,token, refresh)
        // 清理URL中的ticket参数（优化体验）
        window.history.replaceState({}, document.title, window.location.pathname)
        // 跳转到首页（按需调整）
        window.location.href = '/salaryList/'
      }else{
        console.log('没有获取到userToken')
      }


    }else {
      console.log('没有有效的返回ticket!')
    }
  }
  catch(err){
    alert(err.message)
  }
}




</script>

<style scoped>



</style>