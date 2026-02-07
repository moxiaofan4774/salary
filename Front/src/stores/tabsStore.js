// src/store/tabsStore.js
import { defineStore } from 'pinia'
import { ref } from 'vue'
import { useRouter } from 'vue-router'

export const useTabsStore = defineStore('tabs', () => {
  const router = useRouter()
  // 标签列表：{ title, path, closable }
  const defaultTabs = [{ title: '主控制台', path: '/adminHome', closable: false }]
  const tabsList = ref(defaultTabs.map((tab) => ({ ...tab })))
  // 当前激活的标签 path
  const activeTab = ref(defaultTabs[0].path)

  // 1. 新增标签（避免重复）
  const addTab = (route) => {
    const { path, meta } = route
    const { title, closable = true } = meta // 路由 meta 配置标题和关闭状态
    // 检查是否已存在该标签
    const isExist = tabsList.value.some((item) => item.path === path)
    if (!isExist) {
      tabsList.value.push({ title, path, closable })
    }
    // 激活当前标签
    activeTab.value = path
  }

  // 2. 切换标签（跳转路由）
  const switchTab = (path) => {
    activeTab.value = path
    router.push(path) // 联动路由跳转
  }

  // 3. 关闭标签（删除后自动切换到上一个标签）
  const closeTab = (path) => {
    const index = tabsList.value.findIndex((item) => item.path === path)
    if (index === -1) return

    // 删除标签
    tabsList.value.splice(index, 1)

    // 切换到新的激活标签（优先取最后一个，否则回退到首页）
    if (path === activeTab.value) {
      const newActive = tabsList.value.at(-1)?.path || '/adminHome'
      activeTab.value = newActive
      router.push(newActive) // 联动路由
    }
  }

  const resetTabs = () => {
    tabsList.value = defaultTabs.map((tab) => ({ ...tab }))
    activeTab.value = defaultTabs[0].path
  }

  return { tabsList, activeTab, addTab, switchTab, closeTab, resetTabs }
})
