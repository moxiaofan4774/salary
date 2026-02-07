import { createRouter, createWebHistory } from 'vue-router'
import { useAdminStore } from '@/stores/adminStore'
import { useUserStore } from '@/stores/userStore'
import { ElMessage } from 'element-plus'
import { showToast } from '@nutui/nutui'

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
      children: [
        {
          path: '/adminHome',
          name: 'adminHome',
          component: () => import('@/views/system/AdminHome.vue'),
          meta: { title: '主控制台', closable: true, requiresAuth: true },
        },
        {
          path: '/bannersAdmin',
          name: 'bannersAdmin',
          component: () => import('@/views/system/news/AdminBanners.vue'),
          meta: { title: '轮播图管理', closable: true, requiresAuth: true },
        },
        {
          path: '/categoryGroupAdmin',
          name: 'categoryGroupAdmin',
          component: () => import('@/views/system/news/CategoryGroupAdmin.vue'),
          meta: { title: '栏目组管理', closable: true, requiresAuth: true },
        },
        {
          path: '/categoryAdmin',
          name: 'categoryAdmin',
          component: () => import('@/views/system/news/CategoryAdmin.vue'),
          meta: { title: '分类管理', closable: true, requiresAuth: true },
        },        

        {
          path: '/articlesAdmin',
          name: 'articlesAdmin',
          component: () => import('@/views/system/news/ArticlesAdmin.vue'),
          meta: { title: '文章管理', closable: true, requiresAuth: true },
        },
        
        {
          path: '/changePassword',
          name: 'changePassword',
          component: () => import('@/views/system/ChangePassword.vue'),
          meta: { title: '修改密码', closable: true, requiresAuth: true },
        },
        {
          path: '/userAdmin',
          name: 'userAdmin',
          component: () => import('@/views/system/UserAdmin.vue'),
          meta: { title: '用户管理', closable: true, requiresAuth: true },
        },
        
        {
          path: '/menuAdmin',
          name: 'menuAdmin',
          component: () => import('@/views/system/menu/MenuAdmin.vue'),
          meta: { title: '菜单管理', closable: true, requiresAuth: true },
        },
        {
          path: '/roleAdmin',
          name: 'roleAdmin',
          component: () => import('@/views/system/menu/RoleAdmin.vue'),
          meta: { title: '角色管理', closable: true, requiresAuth: true },
        },
        {
          path: '/yearAndMonthAdmin',
          name: 'yearAndMonthAdmin',
          component: () => import('@/views/system/salary/YearAndMonthAdmin.vue'),
          meta: { title: '年月管理', closable: true, requiresAuth: true },
        },
        {
          path: '/salaryYingFaAdmin',
          name: 'salaryYingFaAdmin',
          component: () => import('@/views/system/salary/SalaryYingFaAdmin.vue'),
          meta: { title: '应发工资管理', closable: true, requiresAuth: true },
        },
        {
          path: '/salaryKouKuanAdmin',
          name: 'salaryKouKuanAdmin',
          component: () => import('@/views/system/salary/SalaryKouKuanAdmin.vue'),
          meta: { title: '扣款管理', closable: true, requiresAuth: true },
        },
       
      ]
    },
    {
      path: '/',
      name: 'frontLogin',
      component:() => import('@/views/front/Login-localLogin.vue'),
    },
    {
      path: '/loginSuccess',
      name: 'loginSuccess',
      component:() => import('@/views/front/LoginSuccess.vue'),
    },
    {
      path:'/salaryList',
      name: 'salaryList',
      component: () => import('@/views/front/SalaryList.vue'),
      meta: { requiresFrontAuth: true }
    },
 
    {
      path:'/salaryDetails',
      name: 'salaryDetails',
      component: () => import('@/views/front/SalaryDetails.vue'),
      meta: { requiresFrontAuth: true }
    },

    {
      path:'/salarySearchByMonth',
      name: 'salarySearchByMonth',
      component: () => import('@/views/front/SalarySearchByMonth.vue'),
      meta: { requiresFrontAuth: true }
    },
    {
      path:'/salaryCompare',
      name: 'salaryCompare',
      component: () => import('@/views/front/SalaryCompare.vue'),
      meta: { requiresFrontAuth: true }
    },
    {
      path:'/salaryPrint',
      name: 'salaryPrint',
      component: () => import('@/views/front/SalaryPrint.vue'),
      meta: { requiresFrontAuth: true }
    },
 
  ],
})

// 全局前置路由守卫
router.beforeEach((to, from, next) => {
  const adminStore = useAdminStore()
  const userStore = useUserStore()

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
