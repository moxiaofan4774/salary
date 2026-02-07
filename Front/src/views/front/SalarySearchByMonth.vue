<template>
  <div class="salary-search-page">
    <el-page-header class="salary-header" content="按时间区间进行查询" @back="handleBack" />

    <section class="search-panel">
      <div class="panel-header">
        <h3>查询条件</h3>
        <div class="panel-actions">
          <el-date-picker
            v-model="dateRange"
            type="daterange"
            unlink-panels
            range-separator="至"
            start-placeholder="开始日期"
            end-placeholder="结束日期"
            value-format="YYYY-MM-DD"
          />
          <el-button class="search-button" type="primary" plain :icon="Search" :loading="loading" @click="handleSearch">
            点击进行详细查询
          </el-button>
        </div>
      </div>
    </section>

    <section class="summary-panel" v-if="searchResults.length">
      <div class="summary-card positive">
        <span class="summary-label">总应发</span>
        <span class="summary-value">{{ formatAmount(totalIncome) }} 元</span>
      </div>
      <div class="summary-card negative">
        <span class="summary-label">总扣款</span>
        <span class="summary-value">{{ formatAmount(totalDeduction) }} 元</span>
      </div>
      <div class="summary-card neutral">
        <span class="summary-label">总实发</span>
        <span class="summary-value">{{ formatAmount(totalNetSalary) }} 元</span>
      </div>
    </section>

    <section class="result-panel">
      <div class="panel-header">
        <h3>查询结果</h3>
      </div>
      <div class="panel-body result-body">
        <el-empty v-if="!searchResults.length" description="请选择时间范围并进行查询" />
        <div v-else class="result-list">
          <el-collapse v-model="activePanels" class="result-collapse">
            <el-collapse-item
              v-for="item in searchResults"
              :key="item.id"
              :name="item.id"
            >
              <template #title>
                <div class="collapse-title">
                  <span>{{ item.label }} 详情</span>
                  <span class="collapse-amount">
                    应发:{{ formatAmount(item.yingfa?.shifagongzhi || 0) }} 元 ,
                    <span class="collapse-deduction">
                      扣款: {{ formatAmount(item.koukuan?.heji || 0) }} 元
                    </span>
                  </span>
                </div>
              </template>
              <div class="detail-block">
                <div class="detail-row">
                  <span class="row-label">应发合计</span>
                  <span class="row-value value-positive">
                    {{ formatAmount(item.yingfa?.shifagongzhi || 0) }}
                  </span>
                </div>
                <div class="detail-row">
                  <span class="row-label">扣款合计</span>
                  <span class="row-value value-negative">
                    {{ formatAmount(item.koukuan?.heji || 0) }}
                  </span>
                </div>

                <div
                  class="panel-section"
                  v-for="panel in item.detailPanels"
                  :key="panel.name"
                >
                  <p class="section-title">{{ panel.title }}</p>
                  <div
                    class="panel-row"
                    v-for="detail in panel.items"
                    :key="detail.label"
                  >
                    <span class="row-label">{{ detail.label }}</span>
                    <span
                      class="row-value"
                      :class="[
                        detail.type === 'amount'
                          ? detail.extraClass || (panel.name === 'deduction' ? 'value-negative' : 'value-positive')
                          : 'value-text'
                      ]"
                    >
                      <template v-if="detail.type === 'amount'">
                        {{ formatAmount(detail.value) }}
                      </template>
                      <template v-else>
                        {{ formatText(detail.value) }}
                      </template>
                    </span>
                  </div>
                </div>
              </div>
            </el-collapse-item>
          </el-collapse>
        </div>
      </div>
    </section>
  </div>
</template>

<script setup>
import { Search } from '@element-plus/icons-vue'
import { ref, computed } from 'vue'
import { useRouter } from 'vue-router'
import dayjs from 'dayjs'
import { ElMessage } from 'element-plus'

import yearAndMonthApi from '@/api/salary/yearAndMonthApi'
import { useUserStore } from '@/stores/userStore'

const router = useRouter()
const userStore = useUserStore()

const dateRange = ref([])
const searchResults = ref([])
const activePanels = ref([])
const loading = ref(false)

const handleBack = () => {
  if (window.history.length > 1) {
    window.history.back()
  } else {
    router.push({ name: 'frontLogin' })
  }
}

const currencyFormatter = new Intl.NumberFormat('zh-CN', {
  minimumFractionDigits: 2,
  maximumFractionDigits: 2,
})
const formatAmount = (value) => currencyFormatter.format(Number(value) || 0)
const formatText = (value) => {
  if (value === null || value === undefined || value === '') return '--'
  return String(value)
}

const totalIncome = computed(() =>
  searchResults.value.reduce((sum, item) => sum + (item.yingfa?.shifagongzhi || 0), 0)
)
const totalDeduction = computed(() =>
  searchResults.value.reduce((sum, item) => sum + (item.koukuan?.heji || 0), 0)
)
const totalNetSalary = computed(() => totalIncome.value - totalDeduction.value)

const handleSearch = async () => {
  if (!dateRange.value || dateRange.value.length !== 2) {
    ElMessage.warning('请选择开始和结束日期')
    return
  }

  const idCard = userStore.userData.idCard
  if (!idCard) {
    ElMessage.error('无法获取用户信息')
    return
  }

  const start = dayjs(dateRange.value[0])
  const end = dayjs(dateRange.value[1])
  if (end.isBefore(start)) {
    ElMessage.warning('结束日期不能早于开始日期')
    return
  }

  loading.value = true
  try {
    const listRes = await yearAndMonthApi.getUserSalaryList(idCard)
    if (!(listRes.data && listRes.data.code === 200)) {
      ElMessage.error(listRes.data?.message || '获取数据失败')
      return
    }

    const startKey = start.year() * 100 + (start.month() + 1)
    const endKey = end.year() * 100 + (end.month() + 1)

    const filtered = (listRes.data.results || []).filter((item) => {
      const key = item.year * 100 + item.month
      return key >= startKey && key <= endKey
    })

    const results = []
    for (const item of filtered) {
      const detailRes = await yearAndMonthApi.getSalaryDetail(item.id, idCard)
      if (detailRes.data && detailRes.data.code === 200) {
        const { yingfa, koukuan } = detailRes.data.data
        results.push({
          id: item.id,
          label: `${item.year}年${String(item.month).padStart(2, '0')}月`,
          sortKey: item.year * 100 + item.month,
          yingfa,
          koukuan,
          detailPanels: buildDetailPanels(yingfa, koukuan),
        })
      }
    }

    searchResults.value = results.sort((a, b) => b.sortKey - a.sortKey)
    activePanels.value = []
  } catch (error) {
    console.error('薪资查询失败：', error)
    ElMessage.error('查询失败，请稍后重试')
  } finally {
    loading.value = false
  }
}

const buildDetailPanels = (yingfa, koukuan) => {
  if (!yingfa || !koukuan) return []

  const amountItem = (label, value, extraClass = '') => ({
    label,
    value: Number(value) || 0,
    type: 'amount',
    extraClass,
  })

  return [
    {
      name: 'income',
      title: '应发明细',
      items: [
        amountItem('保留津贴', yingfa.baoliujintie),
        amountItem('住房补贴', yingfa.zhufangbutie),
        amountItem('住房公积金', yingfa.zhufanggongjijin),
        amountItem('独生子女费', yingfa.dushengfei),
        amountItem('卫生费', yingfa.weishengfei),
        amountItem('岗位工资', yingfa.gangweigongzi),
        amountItem('教龄津贴', yingfa.jiaohulingjintie),
        amountItem('薪级工资', yingfa.xinjigongzi),
        amountItem('基础绩效奖', yingfa.jichujixiaojiang),
        amountItem('基础性绩效工资', yingfa.jichuxingjixiaogongzi),
        amountItem('冬季取暖费', yingfa.dongjiqunuanfei),
        amountItem('其他补发工资', yingfa.qitabufagongzi),
        amountItem('临时工资', yingfa.linshigongzi),
        amountItem('年终绩效考核优秀奖', yingfa.nianzhongjikaoheyouxiujiang),
        amountItem('代扣住房公积金', yingfa.daikouzhufanggongjijin, 'value-negative'),
        amountItem('补发工资', yingfa.bufagongzi),
        amountItem('补发独生费', yingfa.bufadushengfei),
        amountItem('应发工资', yingfa.yingfagongzi),
        amountItem('实发工资', yingfa.shifagongzhi),
      ],
    },
    {
      name: 'deduction',
      title: '扣款明细',
      items: [
        amountItem('代扣住房公积金', koukuan.daikouzhufanggongjijin, 'value-negative'),
        amountItem('医疗保险', koukuan.yiliaobaoxian, 'value-negative'),
        amountItem('补缴医疗保险', koukuan.bujiaoyiliaobaoxian, 'value-negative'),
        amountItem('养老保险', koukuan.yanglaobaoxian, 'value-negative'),
        amountItem('补缴养老', koukuan.bujiaoyanglao, 'value-negative'),
        amountItem('职业年金', koukuan.zhiyenianjin, 'value-negative'),
        amountItem('补缴年金', koukuan.bujiaonianjin, 'value-negative'),
        amountItem('失业保险', koukuan.shiyebaoxian, 'value-negative'),
        amountItem('补缴失业', koukuan.bujiaoshiye, 'value-negative'),
        amountItem('个人所得税', koukuan.gerensuodeshui || koukuan.gerensudeshui, 'value-negative'),
        amountItem('合计', koukuan.heji, 'value-negative'),
      ],
    },
  ]
}
</script>

<style scoped>
:global(body) {
  background: #f6f6f6;
}

.salary-search-page {
  min-height: 100vh;
  background-color: #f8fbff;
  padding-top: 64px;
  width: 100%;
  max-width: 600px;
  margin: 0 auto;
  box-shadow: 0 12px 40px rgba(42, 125, 252, 0.08);
  padding-bottom: 40px;
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
}

.search-panel,
.result-panel,
.summary-panel {
  margin: 20px 16px;
  background-color: #fff;
  border-radius: 16px;
  box-shadow: 0 6px 16px rgba(42, 125, 252, 0.08);
  padding: 16px 18px;
}

.panel-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  flex-wrap: wrap;
  gap: 12px;
}

.panel-header h3 {
  margin: 0;
  font-size: 16px;
  color: #2a7dfc;
}

.panel-actions {
  display: flex;
  gap: 12px;
  flex-wrap: wrap;
}

.search-button {
  flex: 1 1 100%;
}

.summary-panel {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
  gap: 12px;
}

.summary-card {
  padding: 12px 16px;
  border-radius: 12px;
  display: flex;
  justify-content: space-between;
  font-weight: 600;
}

.summary-card.positive {
  background: rgba(42, 125, 252, 0.08);
  color: #1657bd;
}

.summary-card.negative {
  background: rgba(255, 77, 79, 0.08);
  color: #ff4d4f;
}

.summary-card.neutral {
  background: rgba(0, 196, 140, 0.08);
  color: #00a572;
  grid-column: 1 / -1;
}

.panel-body.result-body {
  padding: 0;
  border: none;
  min-height: auto;
}

.result-list {
  padding: 0;
}

.result-collapse :deep(.el-collapse-item) {
  border-radius: 16px;
  border: 1px solid transparent;
  margin-bottom: 14px;
  overflow: hidden;
  transition: border-color 0.2s ease, box-shadow 0.2s ease;
}

.result-collapse :deep(.el-collapse-item.is-active) {
  border-color: rgba(42, 125, 252, 0.3);
  box-shadow: 0 10px 26px rgba(42, 125, 252, 0.1);
}

.result-collapse :deep(.el-collapse-item__header) {
  transition: background-color 0.2s ease;
  padding: 0;
  border-radius: 0;
  background-color: transparent;
}

.result-collapse :deep(.el-collapse-item.is-active > .el-collapse-item__header) {
  background-color: #eef5ff;
}

.collapse-title {
  display: flex;
  justify-content: space-between;
  align-items: center;
  width: 100%;
  font-weight: 600;
  color: #2a7dfc;
  padding: 10px 18px;
}

.collapse-amount {
    padding-right: 30px;
  font-size: 14px;
  color: #1657bd;
}

.collapse-deduction {
  margin-left: 8px;
  color: #ff4d4f;
  font-size: 13px;
}

.detail-block {
  padding: 4px 12px 12px;
}

.detail-row,
.panel-row {
  display: flex;
  justify-content: space-between;
  padding: 8px 0;
  border-bottom: 1px solid #f1f1f5;
}

.detail-row:last-child,
.panel-row:last-child {
  border-bottom: none;
}

.row-label {
  font-size: 14px;
  color: #4c4c4c;
}

.row-value {
  font-weight: 600;
  font-size: 15px;
}

.value-positive {
  color: #2a7dfc;
}

.value-negative {
  color: #ff4d4f;
}

.value-text {
  color: #333;
}

.panel-section {
  margin-top: 12px;
}

.section-title {
  font-size: 15px;
  font-weight: 600;
  color: #2a7dfc;
  margin: 12px 0 6px;
}
</style>
