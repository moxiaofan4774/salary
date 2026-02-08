import { createRouter, createWebHistory } from 'vue-router'
import { useAdminStore } from '@/stores/adminStore'
import { useUserStore } from '@/stores/userStore'
import { ElMessage } from 'element-plus'
import { showToast } from '@nutui/nutui'
import adminRoutes from './adminIndex'
import frontRoutes from './frontIndex'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/login',
      name: 'Login',
      component: () => import('@/views/system/Login.vue')
    },
    {
      path: '/adminIndex',
      name: 'AdminIndex',
      component: () => import('@/views/system/AdminIndex.vue'),
      redirect: '/adminHome',
      meta: { requiresAuth: true },
      children: adminRoutes
    },
    ...frontRoutes

  ],
})

// 全局前置路由守卫
router.beforeEach((to, from, next) => {
  const adminStore = useAdminStore()
  const userStore = useUserStore()

  // 设置页面标题
  if (to.meta.title) {
    document.title = to.meta.title + ' - 薪资查询系统'
  } else {
    document.title = '薪资查询系统'
  }

  // 检查路由是否需要前台用户权限
  if (to.meta.requiresFrontAuth) {
    // 检查是否已登录（使用 userStore）
    if (userStore.isUserLogin) {
      // 已登录，允许访问
      next()
    } else {
      // 未登录，重定向到前台登录页
      showToast.text('请先登录')
      next({
        path: '/',
        query: { redirect: to.fullPath } // 保存目标路径，登录后可以跳转回来
      })
    }
  }
  // 检查路由是否需要管理员权限
  else if (to.meta.requiresAuth) {
    // 检查是否已登录（是否有 access token）
    if (adminStore.admin_access_token) {
      // 已登录，允许访问
      next()
    } else {
      // 未登录，重定向到后台登录页
      ElMessage.warning('请先登录')
      next({
        path: '/login',
        query: { redirect: to.fullPath } // 保存目标路径，登录后可以跳转回来
      })
    }
  } else {
    // 不需要权限验证的路由，直接放行
    next()
  }
})

export default router
