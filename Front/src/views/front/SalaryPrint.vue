
<template>
  <div class="salary-print-page">
    <el-page-header class="salary-header" content="薪资明细打印" @back="handleBack" />

    <section class="search-panel">
      <div class="search-card">
        <div class="search-card-header">
          <p class="card-title">选择时间跨度</p>
          <p class="card-subtitle">仅支持最近一年的薪资明细，如需更早记录请联系 人力资源部</p>
        </div>

        <div class="range-tabs">
          <button
            v-for="option in quickRanges"
            :key="option.id"
            class="range-tab"
            :class="{ active: option.id === activeQuickRange }"
            @click="handleRangeSelect(option.id)"
          >
            {{ option.label }}
          </button>
        </div>

        <div class="option-row">
          <span class="option-label">自定义起止</span>
          <div class="option-content">
            <el-date-picker
              v-model="dateRange"
              type="daterange"
              unlink-panels
              range-separator="至"
              start-placeholder="开始日期"
              end-placeholder="结束日期"
              value-format="YYYY-MM-DD"
              :clearable="true"
            />
          </div>
        </div>
        <p class="error-text" v-if="rangeState.error">{{ rangeState.error }}</p>

        <div class="action-row">
          <el-button
            class="download-button"
            type="primary"
            :loading="pdfLoading"
            :disabled="pdfLoading || downloadDisabled"
            @click="handleGeneratePdf"
          >
            {{ downloadDisabled ? 'PDF 已生成，请查收' : '生成 PDF 文件' }}
          </el-button>
          <p v-if="downloadDisabled" class="success-text">
            PDF 已生成并自动下载至本地，请妥善保管。
          </p>
          <p class="note-text">PDF 仅供个人留存与申报使用，不得擅自外传或改动。</p>
          <div class="tips-block">
            <p class="tips-title">温馨提示</p>
            <ol>
              <li>本功能仅提供近一年的工资单打印，更多历史记录请联系人力资源部协助。</li>              
              <li>下载文件包含个人敏感信息，请妥善加密存放，勿对外传播。</li>
            </ol>
          </div>
        </div>
      </div>
    </section>

    <section class="result-panel">
      <div class="panel-header">
        <h3>筛选结果</h3>
        <span class="panel-hint" v-if="rangeState.label">{{ rangeState.label }}</span>
      </div>
      <div class="panel-body result-body" v-loading="loading" element-loading-text="数据加载中...">
        <el-empty v-if="!filteredRecords.length" description="请选择时间范围以查看可打印的记录" />
        <div v-else class="result-list">
          <div class="result-card" v-for="record in filteredRecords" :key="record.id">
            <div class="card-header">
              <p class="month-label">{{ record.label }}</p>
              <span class="card-tag">可打印</span>
            </div>
            <div class="card-body">
              <div class="amount-row">
                <span class="row-label">实发</span>
                <span class="row-value highlight">{{ formatAmount(record.netSalary) }} 元</span>
              </div>
              <div class="amount-row">
                <span class="row-label">应发</span>
                <span class="row-value">{{ formatAmount(record.income) }} 元</span>
              </div>
              <div class="amount-row">
                <span class="row-label">扣款</span>
                <span class="row-value deduction">{{ formatAmount(record.deduction) }} 元</span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
</template>
<script setup>
import { ref, reactive, computed, onMounted, watch, watchEffect } from 'vue'
import { useRouter } from 'vue-router'
import dayjs from 'dayjs'
import { ElMessage, ElMessageBox } from 'element-plus'

import yearAndMonthApi from '@/api/salary/yearAndMonthApi'
import { useUserStore } from '@/stores/userStore'

const router = useRouter()
const userStore = useUserStore()

const quickRanges = [
  { id: '3m', label: '近三月', months: 3 },
  { id: '6m', label: '近半年', months: 6 },
  { id: '12m', label: '近一年', months: 12 },
]

const activeQuickRange = ref('')
const dateRange = ref([])
const monthsData = ref([])
const loading = ref(false)
const pdfLoading = ref(false)
const downloadDisabled = ref(false)
const detailCache = reactive({})
const rangeState = reactive({
  startKey: null,
  endKey: null,
  type: 'quick',
  label: '',
  error: '',
})

const earliestAllowedKey = computed(() => {
  const limit = dayjs().subtract(11, 'month')
  return limit.year() * 100 + (limit.month() + 1)
})

const formatKey = (date) => date.year() * 100 + (date.month() + 1)
watchEffect(() => {
  rangeState.error = ''
  if (dateRange.value && dateRange.value.length === 2) {
    const [startRaw, endRaw] = dateRange.value
    const start = dayjs(startRaw)
    const end = dayjs(endRaw)
    if (end.isBefore(start)) {
      rangeState.error = '结束日期不能早于开始日期'
      rangeState.startKey = null
      rangeState.endKey = null
      rangeState.label = ''
      return
    }
    rangeState.startKey = formatKey(start)
    rangeState.endKey = formatKey(end)
    rangeState.type = 'custom'
    rangeState.label = `${start.format('YYYY.MM')} ～ ${end.format('YYYY.MM')}`
  } else if (activeQuickRange.value) {
    const option = quickRanges.find((item) => item.id === activeQuickRange.value) || quickRanges[0]
    const end = dayjs()
    const start = end.clone().subtract(option.months - 1, 'month')
    rangeState.startKey = formatKey(start)
    rangeState.endKey = formatKey(end)
    rangeState.type = 'quick'
    rangeState.label = option.label
  } else {
    rangeState.startKey = null
    rangeState.endKey = null
    rangeState.type = ''
    rangeState.label = ''
  }
})

let alerting = false
watch(
  () => rangeState.startKey,
  (startKey) => {
    if (!startKey) return
    if (startKey < earliestAllowedKey.value && rangeState.type === 'custom') {
      if (!alerting) {
        alerting = true
        ElMessageBox.alert(
          '最多只能查看最近一年的薪资，若需更早记录请联系 人力资源部。',
          '提示信息',
          { confirmButtonText: '我知道了' }
        ).finally(() => {
          alerting = false
        })
      }
      dateRange.value = []
    }
  }
)
const normalizedMonths = computed(() =>
  (monthsData.value || [])
    .map((item) => {
      const key = item.year * 100 + item.month
      const income = Number(item.income ?? item?.yingfa?.shifagongzhi ?? 0)
      const deduction = Number(item.deduction ?? item?.koukuan?.heji ?? 0)
      const netSalary = Number(item.netSalary ?? item?.shifagongzhi ?? income - deduction)
      return {
        ...item,
        key,
        label: `${item.year}年${String(item.month).padStart(2, '0')}月`,
        income,
        deduction,
        netSalary,
      }
    })
    .sort((a, b) => b.key - a.key)
)

const filteredRecords = computed(() => {
  if (!rangeState.startKey || !rangeState.endKey || rangeState.error) return []
  const startKey = Math.max(rangeState.startKey, earliestAllowedKey.value)
  const endKey = rangeState.endKey
  return normalizedMonths.value.filter(
    (item) => item.key >= startKey && item.key <= endKey
  )
})

const formatAmount = (value) => {
  const amount = Number(value) || 0
  return amount.toLocaleString('zh-CN', { minimumFractionDigits: 2, maximumFractionDigits: 2 })
}

const handleRangeSelect = (id) => {
  activeQuickRange.value = id
  dateRange.value = []
  downloadDisabled.value = false
}

const handleBack = () => {
  if (window.history.length > 1) {
    window.history.back()
  } else {
    router.push({ name: 'salaryList' })
  }
}
const getJsPDF = async () => {
  if (window.__salaryPdfVendor) return window.__salaryPdfVendor
  try {
    const module = await import('jspdf')
    const JsPDFClass = module.default || module.jsPDF
    window.__salaryPdfVendor = JsPDFClass
    return JsPDFClass
  } catch (error) {
    ElMessage.error('请先安装 jspdf 依赖：npm install jspdf')
    error.silent = true
    throw error
  }
}

const fetchDetail = async (record) => {
  if (detailCache[record.id]) {
    return detailCache[record.id]
  }
  const idCard = userStore.userData.idCard
  const res = await yearAndMonthApi.getSalaryDetail(record.id, idCard)
  if (!(res.data && res.data.code === 200)) {
    throw new Error(res.data?.message || '获取薪资明细失败')
  }
  detailCache[record.id] = res.data.data
  return detailCache[record.id]
}

const buildDetailPanels = (yingfa, koukuan) => {
  if (!yingfa && !koukuan) return []
  const amountItem = (label, value) => ({
    label,
    value: Number(value) || 0,
  })

  const panels = []
  if (yingfa) {
    panels.push({
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
        amountItem('代扣住房公积金', yingfa.daikouzhufanggongjijin),
        amountItem('补发工资', yingfa.bufagongzi),
        amountItem('补发独生费', yingfa.bufadushengfei),
        amountItem('应发工资', yingfa.yingfagongzi),
        amountItem('实发工资', yingfa.shifagongzhi),
      ],
    })
  }

  if (koukuan) {
    panels.push({
      title: '扣款明细',
      items: [
        amountItem('代扣住房公积金', koukuan.daikouzhufanggongjijin),
        amountItem('医疗保险', koukuan.yiliaobaoxian),
        amountItem('补缴医疗保险', koukuan.bujiaoyiliaobaoxian),
        amountItem('养老保险', koukuan.yanglaobaoxian),
        amountItem('补缴养老', koukuan.bujiaoyanglao),
        amountItem('职业年金', koukuan.zhiyenianjin),
        amountItem('补缴年金', koukuan.bujiaonianjin),
        amountItem('失业保险', koukuan.shiyebaoxian),
        amountItem('补缴失业', koukuan.bujiaoshiye),
        amountItem('个人所得税', koukuan.gerensuodeshui || koukuan.gerensudeshui),
        amountItem('扣款合计', koukuan.heji),
      ],
    })
  }

  return panels
}

const arrayBufferToBase64 = (buffer) => {
  let binary = ''
  const bytes = new Uint8Array(buffer)
  const chunkSize = 0x8000
  for (let i = 0; i < bytes.length; i += chunkSize) {
    const chunk = bytes.subarray(i, i + chunkSize)
    binary += String.fromCharCode.apply(null, chunk)
  }
  return btoa(binary)
}

let fontBase64Cache = null
const ensureChineseFont = async () => {
  if (fontBase64Cache) return fontBase64Cache
  const response = await fetch('/fonts/SimHei.ttf')
  if (!response.ok) {
    throw new Error('字体文件加载失败')
  }
  const buffer = await response.arrayBuffer()
  fontBase64Cache = arrayBufferToBase64(buffer)
  return fontBase64Cache
}

const applyChineseFont = async (doc) => {
  const fontData = await ensureChineseFont()
  doc.addFileToVFS('SimHei.ttf', fontData)
  doc.addFont('SimHei.ttf', 'SimHei', 'normal')
  doc.setFont('SimHei')
}

const renderPanelColumn = (doc, startX, startY, columnWidth, panel, valueColor) => {
  let y = startY
  if (!panel) {
    doc.setFontSize(12)
    doc.setTextColor(122, 136, 168)
    doc.text('暂无数据', startX, y)
    return y + 8
  }
  doc.setFontSize(13)
  doc.setTextColor(42, 125, 252)
  doc.text(panel.title, startX, y)
  y += 6
  doc.setFontSize(10.5)
  panel.items.forEach((item) => {
    doc.setTextColor(74, 82, 110)
    doc.text(item.label, startX, y)
    doc.setTextColor(...valueColor)
    doc.text(formatAmount(item.value), startX + columnWidth, y, { align: 'right' })
    y += 6
  })
  return y
}
const handleGeneratePdf = async () => {
  if (rangeState.error) {
    ElMessage.warning(rangeState.error)
    return
  }
  if (!filteredRecords.value.length) {
    ElMessage.warning('当前时间范围内没有可打印的记录')
    return
  }
  downloadDisabled.value = false
  pdfLoading.value = true
  try {
    const JsPDF = await getJsPDF()
    const doc = new JsPDF({ unit: 'mm', format: 'a4' })
    await applyChineseFont(doc)
    doc.setFontSize(12)

    for (let index = 0; index < filteredRecords.value.length; index += 1) {
      const record = filteredRecords.value[index]
      if (index > 0) {
        doc.addPage()
      }
      let y = 24
      doc.setTextColor(42, 125, 252)
      doc.setFontSize(18)
      doc.text(`${record.label} 薪资明细`, 14, y)
      y += 8
      doc.setFontSize(11)
      doc.setTextColor(90, 90, 90)
      doc.text(`生成时间：${dayjs().format('YYYY-MM-DD HH:mm')}`, 14, y)
      y += 6
      doc.text(`查询范围：${rangeState.label}`, 14, y)
      y += 8
      doc.setFontSize(12)
      doc.setTextColor(0, 0, 0)
      doc.text(`实发：${formatAmount(record.netSalary)} 元`, 14, y)
      doc.setTextColor(33, 103, 241)
      doc.text(`应发：${formatAmount(record.income)} 元`, 90, y)
      doc.setTextColor(255, 77, 79)
      doc.text(`扣款：${formatAmount(record.deduction)} 元`, 150, y)
      y += 10

      const detail = await fetchDetail(record)
      const panels = buildDetailPanels(detail.yingfa, detail.koukuan)
      const incomePanel = panels.find((panel) => panel.title === '应发明细')
      const deductionPanel = panels.find((panel) => panel.title === '扣款明细')

      const leftColumnWidth = 80
      renderPanelColumn(doc, 14, y, leftColumnWidth, incomePanel, [33, 103, 241])
      renderPanelColumn(doc, 110, y, leftColumnWidth, deductionPanel, [255, 77, 79])

      doc.setFontSize(10)
      doc.setTextColor(122, 136, 168)
      doc.text('注：本 PDF 仅供本人留存与个税申报使用，禁止扩散或篡改。', 14, 285)
    }

    const fileLabel = rangeState.label || dayjs().format('YYYYMMDD')
    doc.save(`薪资明细-${fileLabel}.pdf`)
    ElMessage.success('PDF 生成成功')
  } catch (error) {
    if (!error.silent) {
      ElMessage.error(error.message || '生成 PDF 失败，请稍后再试')
    }
  } finally {
    pdfLoading.value = false
    downloadDisabled.value = true
  }
}

const getUserSalaryList = async () => {
  loading.value = true
  try {
    const idCard = userStore.userData.idCard
    if (!idCard) {
      ElMessage.error('无法获取用户信息')
      return
    }
    const res = await yearAndMonthApi.getUserSalaryList(idCard)
    if (res.data && res.data.code === 200) {
      monthsData.value = res.data.results || []
    } else {
      ElMessage.error(res.data?.message || '获取薪资记录失败')
    }
  } catch (error) {
    console.error('获取薪资列表失败:', error)
    ElMessage.error('获取薪资记录失败，请稍后再试')
  } finally {
    loading.value = false
  }
}

onMounted(() => {
  getUserSalaryList()
})
</script>
<style scoped>
:global(body) {
  background: #f6f6f6;
}

.salary-print-page {
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
  padding: 16px 18px;
}

.search-card {
  background: linear-gradient(135deg, #f5f9ff, #ffffff 85%);
  border-radius: 18px;
  padding: 12px;
  border: 1px solid rgba(42, 125, 252, 0.15);
}

.search-card-header {
  padding: 12px 14px 8px;
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

.range-tabs {
  display: flex;
  gap: 10px;
  padding: 16px 10px 8px;
  flex-wrap: wrap;
}

.range-tab {
  flex: 1 1 80px;
  border: 1px solid rgba(42, 125, 252, 0.2);
  border-radius: 999px;
  padding: 10px 0;
  background: transparent;
  color: #2a7dfc;
  font-size: 14px;
  font-weight: 600;
  cursor: pointer;
  transition: all 0.2s ease;
}

.range-tab.active {
  background: linear-gradient(90deg, #2d7ffc, #46b0ff);
  color: #fff;
  border-color: transparent;
  box-shadow: 0 6px 16px rgba(45, 127, 252, 0.3);
}

.option-row {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 12px 6px 0;
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
  width: 220px;
}

.error-text {
  color: #ff4d4f;
  font-size: 12px;
  margin: 6px 8px 0;
}

.action-row {
  padding: 18px 4px 6px;
  display: flex;
  flex-direction: column;
  gap: 8px;
  align-items: stretch;
}

.download-button {
  width: 100%;
  height: 44px;
  border-radius: 24px;
  font-size: 15px;
  font-weight: 600;
  background: linear-gradient(90deg, #2d7ffc, #46b0ff);
  border: none;
  box-shadow: 0 8px 18px rgba(45, 127, 252, 0.25);
}

.note-text {
  font-size: 12px;
  color: #7a88a8;
  text-align: center;
  margin: 0;
}

.panel-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  gap: 8px;
}

.panel-header h3 {
  margin: 0;
  font-size: 16px;
  color: #2a7dfc;
}

.panel-hint {
  font-size: 13px;
  color: #7a88a8;
}

.panel-body.result-body {
  padding: 0;
  border: none;
  min-height: auto;
}

.result-list {
  display: flex;
  flex-direction: column;
  gap: 12px;
  padding-top: 6px;
}

.result-card {
  background: #fdfefe;
  border-radius: 16px;
  padding: 16px;
  box-shadow: 0 8px 20px rgba(42, 125, 252, 0.08);
  border: 1px solid rgba(42, 125, 252, 0.08);
}

.card-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 10px;
}

.month-label {
  margin: 0;
  font-size: 18px;
  font-weight: 600;
  color: #2a7dfc;
}

.card-tag {
  font-size: 12px;
  color: #1c7dfa;
  background: rgba(42, 125, 252, 0.12);
  padding: 4px 10px;
  border-radius: 999px;
}

.card-body {
  display: flex;
  flex-direction: column;
  gap: 6px;
}

.amount-row {
  display: flex;
  justify-content: space-between;
  font-size: 14px;
}

.row-label {
  color: #7a88a8;
}

.row-value {
  font-weight: 600;
  color: #2a7dfc;
}

.row-value.deduction {
  color: #ff4d4f;
}

.row-value.highlight {
  font-size: 16px;
}
</style>
