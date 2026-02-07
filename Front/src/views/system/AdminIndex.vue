<template>
  <el-container class="admin-layout">
    <el-aside class="aside-menu" width="220px">
      <el-menu
        background-color="#304156"
        class="el-menu-vertical-demo"
        :default-active="activeMenu"
        text-color="#eef"
        unique-opened
        router
      >
        <template v-if="menuLoading">
          <el-menu-item index="__loading" disabled>菜单加载中...</el-menu-item>
        </template>
        <template v-else-if="menuList.length">
          <MenuTreeItem
            v-for="item in menuList"
            :key="item.id"
            :item="item"
            :icon-map="iconMap"
          />
        </template>
        <el-menu-item v-else index="__empty" disabled>暂无可用菜单</el-menu-item>
      </el-menu>
    </el-aside>
    <el-container>
      <el-header class="admin-header">
        <div class="header-left">
          <el-icon>
            <Fold @click="toggleCollapse" />
          </el-icon>
        </div>
        <div class="header-right">
          <el-dropdown @command="handleCommand">
            <span class="el-dropdown-link">
              <el-icon><UserFilled /></el-icon>
              <span>{{ adminData?.username || '管理员' }}</span>
              <el-icon><ArrowDown /></el-icon>
            </span>
            <template #dropdown>
              <el-dropdown-menu>
                <el-dropdown-item command="changePassword">修改密码</el-dropdown-item>
                <el-dropdown-item command="logout">退出登录</el-dropdown-item>
              </el-dropdown-menu>
            </template>
          </el-dropdown>
        </div>
      </el-header>
      <Tabs />
      <el-main>
        <router-view />
      </el-main>
    </el-container>
  </el-container>
</template>

<script setup>
import { Fold, UserFilled, ArrowDown } from '@element-plus/icons-vue'
import { ref, computed, watch, onMounted } from 'vue'
import Tabs from '@/components/Tabs.vue'
import { useTabsStore } from '@/stores/tabsStore.js'
import { useAdminStore } from '@/stores/adminStore'
import { storeToRefs } from 'pinia'
import { useRouter, useRoute } from 'vue-router'
import menuApi from '@/api/menu/menuApi'
import MenuTreeItem from '@/views/system/menu/MenuTreeItem.vue'
import * as ElementPlusIconsVue from '@element-plus/icons-vue'

const router = useRouter()
const route = useRoute()
const tabsStore = useTabsStore()
const adminStore = useAdminStore()
const { adminData } = storeToRefs(adminStore)

const menuList = ref([])
const menuLoading = ref(false)
const iconMap = ElementPlusIconsVue

const defaultMenus = [
  { id: 'dashboard', title: '主控制台', path: '/adminHome', closable: false, children: [] },
]

const activeMenu = computed(() => route.path || '/adminHome')
const isSuperAdmin = computed(() => !!adminData.value?.is_superuser)
const isStaff = computed(() => !!adminData.value?.is_staff)

const toggleCollapse = () => {
  // 预留折叠逻辑（当前侧栏固定宽度）
}

const handleCommand = (command) => {
  if (command === 'changePassword') {
    router.push('/changePassword')
    return
  }
  if (command === 'logout') {
    tabsStore.resetTabs()
    adminStore.adminLogout()
    router.replace('/login')
  }
}

const fetchMenu = async () => {
  if (!isSuperAdmin.value && !isStaff.value) {
    menuList.value = []
    return
  }
  menuLoading.value = true
  try {
    let res
    if (isSuperAdmin.value) {
      res = await menuApi.getList()
    } else {
      const userId = adminData.value?.id
      if (!userId) {
        menuList.value = []
        return
      }
      res = await menuApi.getUserMenus(userId)
    }

    if (res?.status === 200 && Array.isArray(res.data) && res.data.length) {
      menuList.value = res.data
    } else if (isSuperAdmin.value) {
      menuList.value = defaultMenus
    } else {
      menuList.value = []
    }
  } catch (error) {
    menuList.value = isSuperAdmin.value ? defaultMenus : []
  } finally {
    menuLoading.value = false
  }
}

const ensureTab = (currentRoute) => {
  const path = currentRoute.path
  if (!path || path === '/') return
  const meta = currentRoute.meta || {}
  tabsStore.addTab({
    ...currentRoute,
    path,
    meta: {
      ...meta,
      title: meta.title || currentRoute.name || '未命名',
      closable: meta.closable ?? true,
    },
  })
}

watch(
  () => route.path,
  () => ensureTab(route),
  { immediate: true },
)

watch(
  () => [adminData.value?.id, isSuperAdmin.value, isStaff.value],
  () => fetchMenu(),
  { immediate: true },
)

onMounted(() => {
  fetchMenu()
})
</script>

<style scoped>
.admin-layout {
  min-height: 100vh;
}
.aside-menu {
  background-color: #304156;
  color: #eef;
  min-height: 100vh;
}
.admin-header {
  background-color: #fff;
  height: 60px;
  line-height: 60px;
  padding: 0 20px;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
}
.header-left {
  float: left;
}
.header-right {
  float: right;
}
.el-main {
  background-color: #f5f7fa;
  padding: 0;
}
</style>
