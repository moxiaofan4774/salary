<template>
  <div class="salary-search-page">
    <el-page-header class="salary-header" content="薪资对比查询" @back="handleBack" />

    <section class="search-panel">
      <div class="search-card">
        <div class="search-card-header">
          <p class="card-title">选择年月</p>
          <p class="card-subtitle">请选择需要对比的两个工资发放月份</p>
        </div>
        <div class="search-option-list">
          <div class="date-picker-group">
            <div class="date-picker-item">
              <span class="date-label">开始日期</span>
              <el-date-picker
                v-model="firstMonth"
                type="month"
                value-format="YYYY-MM"
                placeholder="开始日期"
                class="full-width-picker"
              />
            </div>
            <div class="date-picker-item">
              <span class="date-label">结束日期</span>
              <el-date-picker
                v-model="secondMonth"
                type="month"
                value-format="YYYY-MM"
                placeholder="结束日期"
                class="full-width-picker"
              />
            </div>
          </div>
          <div class="option-row action-row">
            <el-button class="compare-button" type="primary" :loading="loading" @click="handleCompare">
              点击进行详细查询
            </el-button>
          </div>
          <p class="month-hint" v-if="availableMonthsHint">
            可用月份示例：{{ availableMonthsHint }}
          </p>
        </div>
      </div>
    </section>

    <section class="result-panel">
      <div class="panel-header">
        <h3>对比结果</h3><h3>(橙色背景行即为数额不同的项)</h3>
      </div>
      <div class="panel-body result-body">
        <el-empty v-if="!hasResult" description="请选择两个有效月份后进行对比" />
        <div v-else class="table-wrapper">
          <table class="compare-table">
            <thead>
              <tr>
                <th class="label-col">栏目</th>
                <th>{{ monthLabels.left }}</th>
                <th>{{ monthLabels.right }}</th>
              </tr>
            </thead>
            <tbody>
              <tr
                v-for="row in tableRows"
                :key="row.key"
                :class="[
                  row.type === 'section' ? 'section-row' : '',
                  row.isDifferent && row.type !== 'section' ? 'diff-row' : ''
                ]"
              >
                <td
                  class="label-col"
                  :colspan="row.type === 'section' ? 3 : 1"
                >
                  {{ row.label }}
                </td>
                <template v-if="row.type !== 'section'">
                  <td :class="['value-cell', row.leftClass]">
                    {{ formatAmount(row.leftValue) }}
                  </td>
                  <td :class="['value-cell', row.rightClass]">
                    {{ formatAmount(row.rightValue) }}
                  </td>
                </template>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </section>
  </div>
</template>

<script setup>
import { ref, computed, onMounted } from 'vue'
import { useRouter } from 'vue-router'
import { ElMessage } from 'element-plus'

import yearAndMonthApi from '@/api/salary/yearAndMonthApi'
import { useUserStore } from '@/stores/userStore'

const router = useRouter()
const userStore = useUserStore()

const monthsData = ref([])
const firstMonth = ref('')
const secondMonth = ref('')
const loading = ref(false)
const comparison = ref({ left: null, right: null })

const handleBack = () => {
  if (window.history.length > 1) {
    window.history.back()
  } else {
    router.push({ name: 'frontLogin' })
  }
}

const currencyFormatter = new Intl.NumberFormat('zh-CN', {
  minimumFractionDigits: 2,
  maximumFractionDigits: 2
})
const formatAmount = (value) => currencyFormatter.format(Number(value) || 0)
const getNetAmount = (entry) => (entry?.yingfa?.shifagongzhi || 0) - (entry?.koukuan?.heji || 0)

const hasResult = computed(() => Boolean(comparison.value.left && comparison.value.right))
const monthLabels = computed(() => {
  if (!hasResult.value) {
    return { left: '', right: '' }
  }
  return {
    left: comparison.value.left.label,
    right: comparison.value.right.label
  }
})

const availableMonthsHint = computed(() => {
  if (!monthsData.value.length) return ''
  const labels = monthsData.value
    .map((item) => `${item.year}.${String(item.month).padStart(2, '0')}`)
    .sort((a, b) => (a < b ? 1 : -1))
  return labels.slice(0, 6).join('、')
})

const detailKey = (panelName, label) => `panel::${panelName}::${label}`
const summaryKey = (field) => `summary::${field}`

const buildAmountMap = (entry) => {
  const map = {}
  if (!entry) return map
  const income = Number(entry.yingfa?.shifagongzhi) || 0
  const deduction = Number(entry.koukuan?.heji) || 0
  map[summaryKey('income')] = income
  map[summaryKey('deduction')] = deduction
  map[summaryKey('net')] = income - deduction

  entry.detailPanels?.forEach((panel) => {
    panel.items.forEach((detail) => {
      if (detail.type === 'amount') {
        map[detailKey(panel.name, detail.label)] = Number(detail.value) || 0
      }
    })
  })
  return map
}

const leftAmountMap = computed(() => buildAmountMap(comparison.value.left))
const rightAmountMap = computed(() => buildAmountMap(comparison.value.right))

const isDifferent = (key) => {
  if (!hasResult.value) return false
  const leftVal = leftAmountMap.value[key]
  const rightVal = rightAmountMap.value[key]
  if (leftVal === undefined || rightVal === undefined) return false
  return Math.abs(leftVal - rightVal) > 0.005
}

const fetchMonthList = async () => {
  const idCard = userStore.userData.idCard
  if (!idCard) return
  try {
    const res = await yearAndMonthApi.getUserSalaryList(idCard)
    if (res.data && res.data.code === 200) {
      monthsData.value = res.data.results || []
    }
  } catch (error) {
    console.error('获取月份失败', error)
  }
}

const findMonthRecord = (value) => {
  if (!value) return null
  const [year, month] = value.split('-')
  const monthNumber = Number(month)
  return monthsData.value.find(
    (item) => Number(item.year) === Number(year) && Number(item.month) === monthNumber
  )
}

const fetchDetail = async (record, idCard) => {
  const detailRes = await yearAndMonthApi.getSalaryDetail(record.id, idCard)
  if (!(detailRes.data && detailRes.data.code === 200)) {
    throw new Error(detailRes.data?.message || '获取详情失败')
  }
  const { yingfa, koukuan } = detailRes.data.data
  return {
    id: record.id,
    label: `${record.year}年${String(record.month).padStart(2, '0')}月`,
    yingfa,
    koukuan,
    detailPanels: buildDetailPanels(yingfa, koukuan)
  }
}

const handleCompare = async () => {
  if (!firstMonth.value || !secondMonth.value) {
    ElMessage.warning('请先选择开始日期和结束日期')
    return
  }

  // 验证结束日期必须大于开始日期
  if (secondMonth.value <= firstMonth.value) {
    ElMessage.warning('结束日期必须大于开始日期')
    return
  }

  const idCard = userStore.userData.idCard
  if (!idCard) {
    ElMessage.error('无法获取用户信息')
    return
  }

  const firstRecord = findMonthRecord(firstMonth.value)
  const secondRecord = findMonthRecord(secondMonth.value)

  if (!firstRecord || !secondRecord) {
    ElMessage.warning('所选月份没有可对比的数据')
    return
  }

  loading.value = true
  try {
    const [left, right] = await Promise.all([
      fetchDetail(firstRecord, idCard),
      fetchDetail(secondRecord, idCard)
    ])
    comparison.value = { left, right }
  } catch (error) {
    console.error('对比失败', error)
    ElMessage.error(error.message || '对比失败，请稍后再试')
  } finally {
    loading.value = false
  }
}

const buildDetailPanels = (yingfa, koukuan) => {
  if (!yingfa && !koukuan) return []

  const amountItem = (label, value, extraClass = '') => ({
    label,
    value: Number(value) || 0,
    type: 'amount',
    extraClass
  })

  const panels = []
  if (yingfa) {
    panels.push({
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
        amountItem('实发工资', yingfa.shifagongzhi)
      ]
    })
  }

  if (koukuan) {
    panels.push({
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
        amountItem('合计', koukuan.heji, 'value-negative')
      ]
    })
  }

  return panels
}

onMounted(() => {
  fetchMonthList()
})

const findDetailValue = (entry, panelName, label) => {
  const panel = entry?.detailPanels?.find((item) => item.name === panelName)
  const detail = panel?.items.find((item) => item.label === label)
  return Number(detail?.value) || 0
}

const getPanelLabels = (panelName) => {
  const labelSet = new Set()
  const collect = (entry) => {
    entry?.detailPanels
      ?.find((panel) => panel.name === panelName)
      ?.items?.forEach((item) => {
        if (item.type === 'amount') {
          labelSet.add(item.label)
        }
      })
  }
  collect(comparison.value.left)
  collect(comparison.value.right)
  return Array.from(labelSet)
}

const tableRows = computed(() => {
  if (!hasResult.value) return []
  const rows = []
  const leftEntry = comparison.value.left
  const rightEntry = comparison.value.right

  const pushSummaryRow = (field, label, getter, valueClass) => {
    const key = summaryKey(field)
    rows.push({
      key,
      label,
      leftValue: getter(leftEntry),
      rightValue: getter(rightEntry),
      leftClass: valueClass,
      rightClass: valueClass,
      type: 'amount',
      isDifferent: isDifferent(key)
    })
  }

  pushSummaryRow(
    'income',
    '应发合计',
    (entry) => entry?.yingfa?.shifagongzhi || 0,
    'value-positive'
  )
  pushSummaryRow(
    'deduction',
    '扣款合计',
    (entry) => entry?.koukuan?.heji || 0,
    'value-negative'
  )
  pushSummaryRow('net', '实发合计', (entry) => getNetAmount(entry), 'value-positive')

  const addPanelRows = (panelName, title, valueClass) => {
    rows.push({
      key: `section-${panelName}`,
      label: title,
      type: 'section',
      isDifferent: false
    })
    const labels = getPanelLabels(panelName)
    labels.forEach((label) => {
      const key = detailKey(panelName, label)
      rows.push({
        key,
        label,
        leftValue: findDetailValue(leftEntry, panelName, label),
        rightValue: findDetailValue(rightEntry, panelName, label),
        leftClass: valueClass,
        rightClass: valueClass,
        type: 'amount',
        isDifferent: isDifferent(key)
      })
    })
  }

  addPanelRows('income', '应发明细', 'value-positive')
  addPanelRows('deduction', '扣款明细', 'value-negative')

  return rows
})
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
.result-panel {
  margin: 20px 16px;
  background-color: #fff;
  border-radius: 16px;
  box-shadow: 0 6px 16px rgba(42, 125, 252, 0.08);
  padding: 6px 8px;
}

.panel-header {
  margin-bottom: 20px;
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

.search-card {
  background: linear-gradient(135deg, #f5f9ff 0%, #ffffff 85%);
  border-radius: 18px;
  padding: 12px;
  border: 1px solid rgba(42, 125, 252, 0.15);
  box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.6);
}

.search-card-header {
  padding: 12px 14px 6px;
  border-bottom: 1px solid rgba(42, 125, 252, 0.12);
}

.card-title {
  margin: 0;
  font-size: 16px;
  font-weight: 600;
  color: #1c5bd8;
}

.card-subtitle {
  margin: 6px 0 0;
  font-size: 12px;
  color: #7a88a8;
}

.search-option-list {
  padding: 6px 4px;
}

.date-picker-group {
  padding: 12px 8px;
  display: flex;
  flex-direction: column;
  align-items: center;
}

.date-picker-item {
  display: flex;
  align-items: center;
  margin-bottom: 16px;
  width: 60%;
}

.date-picker-item:last-child {
  margin-bottom: 0;
}

.date-label {
  font-size: 14px;
  color: #4c5c74;
  width: 90px;
  flex-shrink: 0;
}

.full-width-picker {
  flex: 1;
}

.full-width-picker :deep(.el-input__wrapper) {
  width: 100%;
}

.option-row {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 14px 8px;
  border-bottom: 1px solid #edf1fb;
}

.option-row:last-of-type {
  border-bottom: none;
}

.option-label {
  font-size: 14px;
  color: #4c5c74;
  flex: 0 0 90px;
}

.option-content {
  flex: 1;
  display: flex;
  justify-content: flex-end;
}

.option-row :deep(.el-date-editor.el-input) {
  width: 180px;
}

.action-row {
  flex-direction: column;
  align-items: stretch;
  border-bottom: none;
  padding: 18px 0 6px;
}

.compare-button {
  width: 100%;
  height: 44px;
  border-radius: 24px;
  font-size: 15px;
  font-weight: 600;
  background: linear-gradient(90deg, #2d7ffc, #46b0ff);
  border: none;
  box-shadow: 0 8px 18px rgba(45, 127, 252, 0.25);
}

.month-hint {
  margin: 6px 0 0;
  font-size: 12px;
  color: #ff4d4f;
  text-align: center;
}

.panel-body.result-body {
  padding: 0;
  border: none;
  min-height: auto;
}

.table-wrapper {
  width: 100%;
  overflow-x: auto;
}

.compare-table {
  width: 100%;
  border-collapse: collapse;
  background-color: #fff;
  border-radius: 16px;
  overflow: hidden;
  box-shadow: 0 10px 26px rgba(42, 125, 252, 0.08);
}

.compare-table thead {
  background-color: #eef5ff;
}

.compare-table th {
  padding: 12px 16px;
  text-align: left;
  font-weight: 600;
  color: #2a7dfc;
  font-size: 14px;
}

.compare-table td {
  padding: 12px 16px;
  font-size: 14px;
  border-bottom: 1px solid #f1f1f5;
}

.compare-table tr:last-child td {
  border-bottom: none;
}

.label-col {
  width: 40%;
  color: #4c4c4c;
  font-weight: 600;
}

.value-cell {
  width: 30%;
  font-weight: 600;
  text-align: right;
}

.section-row .label-col {
  color: #2a7dfc;
  font-size: 15px;
}

.section-row td {
  background-color: #f8fbff;
  border-bottom: 1px solid #e3edff;
}

.diff-row {
  background-color: rgba(255, 174, 71, 0.2);
}

.value-positive {
  color: #2a7dfc;
}

.value-negative {
  color: #ff4d4f;
}
</style>
