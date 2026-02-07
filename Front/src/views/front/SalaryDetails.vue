<template>
  <div class="salary-page">
    <el-page-header class="salary-navbar" content="薪资发放明细" @back="handleBack" />

    <section class="salary-header">
      <div class="month-picker">
        <span>{{ selectedMonth || '请选择月份' }}</span>
       
      </div>
      <div class="amount">{{ formatAmount(summary.netSalary) }}</div>
      <p class="amount-desc">实发金额</p>
    </section>
    <el-alert
      class="salary-tip"
      type="warning"
      :closable="false"
      show-icon
      description="薪酬数据涉及隐私，请注意保密"
    />
    <section class="summary-cards">
      <el-card shadow="hover" class="summary-card">
        <div class="card-info">
          <p class="card-title">应发金额：</p>
          <small>应发金额 = 应发工资 - 代扣公积金</small>
        </div>
        <div class="card-amount positive">{{ summary.incomeFormula }}</div>
      </el-card>
      <el-card shadow="hover" class="summary-card">
        <div class="card-info">
          <p class="card-title">扣款金额：</p>
          <small></small>
        </div>
        <div class="card-amount negative">- {{ formatAmount(summary.deductionTotal) }}</div>
      </el-card>
    </section>

    <el-alert
      class="salary-tip"
      type="primary"
      :closable="false"
      show-icon
      :description="noticeText"
    />

    <div class="detail-block">
      <el-collapse v-model="activePanels" class="detail-collapse">
        <el-collapse-item v-for="panel in detailPanels" :key="panel.name" :name="panel.name">
          <template #title>
            <span class="collapse-title">{{ panel.title }}</span>
          </template>
          <div class="detail-row" v-for="item in panel.items" :key="item.label">
            <span class="row-label">{{ item.label }}</span>
            <span
              class="row-value"
              :class="[
                item.type === 'amount'
                  ? panel.name === 'deduction'
                    ? 'value-negative'
                    : 'value-positive'
                  : 'value-text',
                item.extraClass || ''
              ]"
            >
              <template v-if="item.type === 'amount'">
                {{ formatAmount(item.value) }}
              </template>
              <template v-else>
                {{ formatText(item.value) }}
              </template>
            </span>
          </div>
        </el-collapse-item>
      </el-collapse>
    </div>

    
  </div>
</template>

<script setup>
import { ref, onMounted, computed } from 'vue'
import { useRoute } from 'vue-router'
import { ElMessage } from 'element-plus'

import { useUserStore } from '@/stores/userStore'
import yearAndMonthApi from '@/api/salary/yearAndMonthApi'

const route = useRoute()
const userStore = useUserStore()
// 薪资发放数据
const yingfaData = ref(null)
const koukuanData = ref(null)
const yearMonthData = ref(null)
// 提示文案（来自年月备注）
const noticeText = computed(() => yearMonthData.value?.beizhu || '暂无备注信息')

// 汇总信息
const summary = computed(() => {
  if (!yingfaData.value || !koukuanData.value) {
    return {
      netSalary: 0,
      incomeTotal: 0,
      incomeFormula: '',
      deductionTotal: 0,
    }
  }

  const yingfa = yingfaData.value.yingfagongzi || 0
  const daikou = yingfaData.value.daikouzhufanggongjijin || 0
  const shifa = yingfaData.value.shifagongzhi || 0
  const koukuan = koukuanData.value.heji || 0

  const netSalary = shifa - koukuan
  const incomeTotal = yingfa - daikou

  return {
    netSalary,
    incomeTotal,
    incomeFormula: `${formatAmount(incomeTotal)}`,
    deductionTotal: koukuan,
  }
})

// 明细分组
const detailPanels = computed(() => {
  if (!yingfaData.value || !koukuanData.value) return []

  const yingfa = yingfaData.value
  const koukuan = koukuanData.value

  const amountItem = (label, value, extraClass = '') => ({
    label,
    value: Number(value) || 0,
    type: 'amount',
    extraClass,
  })

  const textItem = (label, value) => ({
    label,
    value,
    type: 'text',
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
        
        amountItem('补发工资', yingfa.bufagongzi),
        amountItem('补发独生费', yingfa.bufadushengfei),      
        
        amountItem('应发工资', yingfa.yingfagongzi),   
        amountItem('代扣住房公积金(单位12%  个人6%)', yingfa.daikouzhufanggongjijin, 'value-negative'),
        amountItem('应发合计', yingfa.shifagongzhi),
      ],
    },
    {
      name: 'deduction',
      title: '扣款明细',
      items: [
        amountItem('代扣住房公积金(个人6%)', koukuan.daikouzhufanggongjijin, 'value-negative'),
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
    },
  ]
})

const activePanels = ref(['income', 'deduction'])

// 获取薪资详情
const getSalaryDetail = async () => {
  try {
    const yearMonthId = route.query.id
    const idCard = userStore.userData.idCard

    if (!yearMonthId || !idCard) {
      ElMessage.error('缺少查询参数')
      return
    }

    const res = await yearAndMonthApi.getSalaryDetail(yearMonthId, idCard)

    if (res.data && res.data.code === 200) {
      const data = res.data.data
      yingfaData.value = data.yingfa
      koukuanData.value = data.koukuan
      yearMonthData.value = data.yearMonth

      if (data.yearMonth) {
        const label = `${data.yearMonth.year}年${String(data.yearMonth.month).padStart(2, '0')}月`
        selectedMonth.value = label
        pickerValue.value = label
      }
    } else {
      ElMessage.error(res.data?.message || '获取薪资详情失败')
    }
  } catch (error) {
    console.error('获取薪资详情失败:', error)
    ElMessage.error('获取薪资详情失败，请稍后重试')
  }
}

const selectedMonth = ref('')
const showMonthPicker = ref(false)
const pickerValue = ref('')

const currencyFormatter = new Intl.NumberFormat('zh-CN', {
  minimumFractionDigits: 2,
  maximumFractionDigits: 2,
})
const formatAmount = (value) => currencyFormatter.format(Number(value) || 0)
const formatText = (value) => {
  if (value === null || value === undefined || value === '') return '--'
  return String(value)
}

// 确认选择月份
const handleMonthConfirm = () => {
  if (!pickerValue.value) {
    ElMessage.warning('请选择月份')
    return
  }
  selectedMonth.value = pickerValue.value
  showMonthPicker.value = false
}

const handleBack = () => {
  if (window.history.length > 1) {
    window.history.back()
  }
}

onMounted(() => {
  getSalaryDetail()
})
</script>

<style scoped>
:global(body) {
  background: #f6f8fb;
}

.salary-page {
  position: relative;
  min-height: 100vh;
  background-color: #f8fbff;
  padding-top: 60px;
  width: 100%;
  max-width: 600px;
  margin: 0 auto;
  box-shadow: 0 12px 40px rgba(42, 125, 252, 0.08);
  overflow: auto;
}

.salary-navbar {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  box-sizing: border-box;
  z-index: 10;
  background-color: #f8fbff;
  padding: 12px 16px;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
}

.salary-header {
  background: linear-gradient(135deg, #4c9fff, #2a7dfc);
  color: #fff;
  text-align: center;
  padding: 18px 16px 24px;
  border-radius: 0 0 24px 24px;
  margin: -10px 0 12px;
}

.month-picker {
  display: inline-flex;
  align-items: center;
  gap: 4px;
  background: rgba(255, 255, 255, 0.2);
  padding: 6px 16px;
  border-radius: 999px;
  font-size: 14px;
  cursor: pointer;
}

.picker-icon {
  font-size: 14px;
}

.amount {
  font-size: 40px;
  font-weight: 700;
  margin-top: 18px;
}

.amount-desc {
  margin: 0;
  opacity: 0.85;
}

.summary-cards {
  padding: 0px;
  margin: 20px 12px;
  display: grid;
  row-gap: 12px;
}

.summary-card {
  padding: 10px;
  border-radius: 16px;
  background-color: rgba(255, 255, 255, 0.92);
  box-shadow: 0 6px 18px rgba(50, 119, 255, 0.15);
  border: none;
}

.summary-card .el-card__body {
  display: grid;
  grid-template-columns: 1fr auto;
  align-items: center;
  column-gap: 12px;
  padding: 16px;
}

.card-info {
  display: flex;
  flex-direction: column;
  justify-content: center;
}

.card-title {
  font-size: 15px;
  margin: 0 0 4px;
  color: #2b2b2b;
}

.summary-card small {
  color: #999;
}

.card-amount {
  font-size: 22px;
  font-weight: 600;
  text-align: right;
}

.card-amount.positive {
  margin-top: -40px;
  color: #1657bd;
}

.card-amount.negative {
  margin-top: -30px;
  color: #ff4d4f;
}

.salary-tip {
  
  width: 96%;
  margin: 0 12px;
  border-radius: 12px;
  box-shadow: 0 8px 20px rgba(74, 37, 242, 0.2);
}

.detail-block {
  margin: 12px;
  background-color: rgba(255, 255, 255, 0.95);
  border-radius: 16px;
  padding: 4px 0;
  box-shadow: 0 6px 18px rgba(42, 125, 252, 0.08);
}

.detail-collapse {
  border-radius: 16px;
  width: 96%;
  margin-left: 5px;
  border: none;
}

.collapse-title {
  margin-left: 20px;
  font-size: 16px;
  font-weight: 600;
  color: #2a7dfc;
}

.detail-row {
  display: flex;
  justify-content: space-between;
  padding: 10px 20px;
  border-bottom: 1px solid #f1f1f5;
}

.detail-row:last-child {
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

.row-value.value-positive {
  color: #2a7dfc;
}

.row-value.value-negative {
  color: #ff4d4f;
}

.row-value.value-text {
  color: #2a7dfc;
}

.row-value-red {
  font-weight: 600;
  font-size: 15px;
  color: #ff1119;
}

.month-dialog :deep(.el-dialog__body) {
  padding-top: 0;
}

.dialog-header {
  font-size: 16px;
  font-weight: 600;
  text-align: center;
  width: 100%;
}

.dialog-footer {
  display: flex;
  justify-content: flex-end;
  gap: 12px;
}
</style>
