export default[
    {
      path: '/frontLoginOnlyMe',
      name: 'frontLoginOnlyMe',
      component:() => import('@/views/front/Login-localLogin.vue'),
      meta: { title: '员工登录' }
    },{
      path: '/',
      name: 'frontLogin',
      component:() => import('@/views/front/Login.vue'),
      meta: { title: '员工登录' }
    },
    {
      path: '/loginSuccess',
      name: 'loginSuccess',
      component:() => import('@/views/front/LoginSuccess.vue'),
      meta: { title: '登录成功' }
    },
    {
      path:'/salaryList',
      name: 'salaryList',
      component: () => import('@/views/front/SalaryList.vue'),
      meta: { title: '工资列表', requiresFrontAuth: true }
    },

    {
      path:'/salaryDetails',
      name: 'salaryDetails',
      component: () => import('@/views/front/SalaryDetails.vue'),
      meta: { title: '工资详情', requiresFrontAuth: true }
    },

    {
      path:'/salarySearchByMonth',
      name: 'salarySearchByMonth',
      component: () => import('@/views/front/SalarySearchByMonth.vue'),
      meta: { title: '按月查询', requiresFrontAuth: true }
    },
    {
      path:'/salaryCompare',
      name: 'salaryCompare',
      component: () => import('@/views/front/SalaryCompare.vue'),
      meta: { title: '工资对比', requiresFrontAuth: true }
    },
    {
      path:'/salaryPrint',
      name: 'salaryPrint',
      component: () => import('@/views/front/SalaryPrint.vue'),
      meta: { title: '工资打印', requiresFrontAuth: true }
    },
]