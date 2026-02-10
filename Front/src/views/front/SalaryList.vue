<template>
  <div class="salary-list-page">
    <el-page-header class="salary-header" content="薪资列表" @back="handleBack" />
    <div class="quick-actions" style="display: none;">
      <div
        class="quick-card"
        v-for="action in quickActions"
        :key="action.id"
        @click="handleAction(action)"
      >
        <div class="quick-top">
          <component :is="action.icon" class="quick-icon" />
          <div>
            <div class="quick-title">{{ action.title }}</div>
            <div class="quick-desc">{{ action.desc }}</div>
          </div>
        </div>
      </div>
    </div>

    <div class="list-wrapper">
      <template v-if="yearAndMonthList.length">
        <transition-group name="fade-up" tag="div">
          <el-card
            v-for="item in yearAndMonthList"
            :key="item.id"
            shadow="never"
            class="salary-item"
            @click="goToDetail(item)"
          >
            <div class="item-header">
              <span class="header-text">{{ item.yearLabel }}</span>
              <span class="header-tag"></span>
            </div>
            <div class="item-body">
              <div class="month">{{ item.monthLabel }}</div>
              <div class="amount">
                <span class="amount-label">实发：</span>
                <span class="amount-number">{{ formatAmount(item.netSalary) }}</span>
                <span class="amount-unit">元</span>
              </div>
            </div>
            <div class="item-footer">
              应发：<span class="income">{{ formatAmount(item.income) }}元</span><br />
              
              扣款：<span class="deduction">{{ formatAmount(item.deduction) }}元</span>
            </div>
          </el-card>
        </transition-group>
      </template>
      <el-empty v-else class="empty-block" description="暂无薪资记录" />
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted, markRaw } from 'vue'
import { useRouter } from 'vue-router'
import { ElMessage } from 'element-plus'
import { Search, TrendCharts, Printer } from '@element-plus/icons-vue'
import yearAndMonthApi from '@/api/salary/yearAndMonthApi'
import { useUserStore } from '@/stores/userStore'

const router = useRouter()
const userStore = useUserStore()
const yearAndMonthList = ref([])
const quickActions = [
  {
    id: 'searchByMonth',
    title: '查询统计',
    desc: '',
    icon: markRaw(Search),
  },
  {
    id: 'salaryCompare',
    title: '薪资对比',
    desc: '',
    icon: markRaw(TrendCharts),
  },
  {
    id: 'salaryPrint',
    title: '打印明细',
    desc: '',
    icon: markRaw(Printer),
  },
]

// 统一货币格式化工具方法
const currencyFormatter = new Intl.NumberFormat('zh-CN', {
  minimumFractionDigits: 2,
  maximumFractionDigits: 2,
})
const formatAmount = (value) => currencyFormatter.format(Number(value) || 0)

// 拉取用户薪资列表
const getUserSalaryList = async () => {
  try {
    const idCard = userStore.userData.idCard
    if (!idCard) {
      ElMessage.error('无法获取用户信息')
      return
    }
    const res = await yearAndMonthApi.getUserSalaryList(idCard)
    if (res.data && res.data.code === 200) {
      const raw = res.data.results || []
      yearAndMonthList.value = raw.sort((a, b) => {
        const keyA = a.year * 100 + a.month
        const keyB = b.year * 100 + b.month
        return keyB - keyA
      })
    } else {
      ElMessage.error(res.data?.message || '获取薪资列表失败')
      yearAndMonthList.value = []
    }
  } catch (error) {
    console.error('获取薪资列表失败：', error)
    ElMessage.error('获取薪资列表失败，请稍后重试')
    yearAndMonthList.value = []
  }
}

const goToDetail = (item) => {
  router.push({ name: 'salaryDetails', query: { id: item.id } })
}

const handleAction = (action) => {
  if (action.id === 'searchByMonth') {
    router.push({ name: 'salarySearchByMonth' })
  }
  if (action.id === 'salaryCompare') {
    router.push({ name: 'salaryCompare' })
  }

  if (action.id === 'salaryPrint') {
    router.push({ name: 'salaryPrint' })
  }
}


const handleBack = () => {
  // window.location.href = 'https://authserver.tyu.edu.cn/authserver/login?service=https://gzcx.tyu.edu.cn/salaryList/'
  router.push({ name: 'frontLogin' })
}

onMounted(() => {
  getUserSalaryList()
})
</script>

<style scoped>
:global(body) {
  background: #f6f6f6;
}


.quick-actions {
  display: grid;
  grid-template-columns: repeat(3, minmax(0, 1fr));
  gap: 12px;
  padding: 16px 16px 0;
}

.quick-card {
  background: linear-gradient(135deg, #e9f0ff, #f7fbff);
  border-radius: 18px;
  padding: 14px 16px;
  box-shadow: 0 10px 24px rgba(42, 125, 252, 0.12);
  border: 1px solid rgba(34, 120, 255, 0.1);
  cursor: pointer;
  transition: transform 0.2s ease, box-shadow 0.2s ease;
}

.quick-card:hover {
  transform: translateY(-2px);
  box-shadow: 0 12px 28px rgba(34, 120, 255, 0.2);
}

.quick-title {
  font-size: 16px;
  font-weight: 600;
  color: #1657bd;
  margin-bottom: 4px;
}

.quick-desc {
  font-size: 13px;
  color: #7b8fb2;
}

.quick-top {
  display: flex;
  align-items: center;
  gap: 12px;
}

.quick-icon {
  width: 34px;
  height: 34px;
  color: #2a7dfc;
  background: rgba(42, 125, 252, 0.15);
  border-radius: 12px;
  padding: 6px;
}

.salary-list-page {
  min-height: 100vh;
  background-color: #f8fbff;
  padding-top: 64px;
  width: 100%;
  max-width: 600px;
  margin: 0 auto;
  box-shadow: 0 12px 40px rgba(42, 125, 252, 0.08);
}

.salary-header {
  position: fixed;
  top: 0;
  left: 50%;
  transform: translateX(-50%);
  width: 100%;
  max-width: 600px;
  box-sizing: border-box;
  z-index: 10;
  background-color: #f8fbff;
  padding: 12px 16px;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
}

.salary-header :deep(.el-page-header__content) {
  font-size: 16px;
  font-weight: 600;
  color: #2d2d2d;
  margin-left: 0;
}

.salary-header :deep(.el-page-header__left) {
  color: #606266;
}

.list-wrapper {
  padding: 10px 12px 20px;
  display: flex;
  flex-direction: column;
  gap: 12px;
}

.salary-item {
  margin-bottom: 20px;
  border-radius: 18px;
  background: linear-gradient(135deg, #e9f0ff, #f7fbff);
  box-shadow: 0 12px 24px rgba(42, 125, 252, 0.12);
  border: 1px solid rgba(34, 120, 255, 0.12);
  position: relative;
  cursor: pointer;
  transition: transform 0.2s ease, box-shadow 0.2s ease;
}

.salary-item:hover {
  transform: translateY(-2px);
  box-shadow: 0 16px 28px rgba(34, 120, 255, 0.2);
}

.salary-item::before {
  content: '';
  position: absolute;
  left: 14px;
  top: 16px;
  bottom: 16px;
  width: 3px;
  background: #2a7dfc;
  border-radius: 999px;
}

.item-header {
  display: flex;
  align-items: center;
  gap: 8px;
  color: #2a7dfc;
  font-size: 13px;
  font-weight: 600;
  padding-left: 18px;
}

.item-body {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 8px 0 6px 18px;
}

.month {
  font-size: 26px;
  font-weight: 700;
  color: #2d2d2d;
}

.amount {
  display: flex;
  align-items: center;
  gap: 6px;
  color: #2d2d2d;
}

.amount-label {
  font-size: 16px;
  color: #9a9a9a;
  font-weight: 500;
}

.amount-number {
  font-size: 22px;
  font-weight: 700;
}

.amount-unit {
  font-size: 13px;
  color: #8a8a8a;
}

.item-footer {
  padding: 15px 10px 0;
  font-size: 16px;
  color: #9a9a9a;
  text-align: right;
}

.item-footer .income {
  color: #2a7dfc;
  font-weight: 600;
}

.item-footer .deduction {
  color: #ff4d4f;
  font-weight: 600;
}

.empty-block {
  margin-top: 120px;
}

.fade-up-enter-active,
.fade-up-leave-active {
  transition: all 0.2s ease;
}

.fade-up-enter-from,
.fade-up-leave-to {
  opacity: 0;
  transform: translateY(10px);
}
</style>
