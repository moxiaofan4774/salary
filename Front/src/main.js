import { createApp } from 'vue'
import { createPinia } from 'pinia'
import piniaPersist from 'pinia-plugin-persistedstate'

import App from './App.vue'
import router from './router'

import ElementPlus from 'element-plus'
import 'element-plus/dist/index.css'
import zhCn from 'element-plus/es/locale/lang/zh-cn' 
import './assets/global.css'


import NutUI from "@nutui/nutui";
import "@nutui/nutui/dist/style.css";


const app = createApp(App)

// 创建 Pinia 实例并添加持久化插件
const pinia = createPinia()
pinia.use(piniaPersist)

app.use(pinia)
app.use(router)
app.use(ElementPlus, {
  locale: zhCn,
})


app.use(NutUI)


app.mount('#app')
