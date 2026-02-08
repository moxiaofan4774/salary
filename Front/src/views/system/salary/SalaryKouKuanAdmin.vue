<template>
  <div class="panel salary-admin">
    <div class="layout-container">
      <!-- 左侧年月侧边栏 -->
      <div class="sidebar">
        <div class="sidebar-header">
          <el-icon><Calendar /></el-icon>
          <span>年月列表</span>
        </div>
        <div class="sidebar-content">
          <div
            v-for="item in yearMonthList"
            :key="item.id"
            :class="['sidebar-item', { active: selectedYearMonthId === item.id }]"
            @click="handleYearMonthClick(item.id)"
          >
            <span>{{ item.year }}年{{ item.month }}月</span>
          </div>
          <div v-if="!yearMonthList.length" class="empty-text">
            暂无年月数据
          </div>
        </div>
      </div>

      <!-- 右侧主内容区 -->
      <div class="main-content">
        <el-form :inline="true" :model="searchForm" class="search-form" @submit.prevent>
          <el-form-item label="身份证号">
            <el-input v-model="searchForm.shenfenzhenghao" placeholder="请输入身份证号" clearable @keyup.enter="fetchList" />
          </el-form-item>
          <el-form-item label="姓名">
            <el-input v-model="searchForm.xingming" placeholder="请输入姓名" clearable @keyup.enter="fetchList" />
          </el-form-item>
          <el-form-item>
            <el-button type="primary" @click="fetchList">
              <el-icon><Search /></el-icon>搜索
            </el-button>
            <el-button @click="resetSearch">
              <el-icon><Refresh /></el-icon>重置
            </el-button>
          </el-form-item>
        </el-form>

        <div class="toolbar">
          <el-button type="primary" @click="openDialog('add')">
            <el-icon><Plus /></el-icon>新增扣款记录
          </el-button>
          <el-button type="success" @click="openImportDialog">
            <el-icon><UploadFilled /></el-icon>导入数据
          </el-button>
          <el-button @click="handleDownloadTemplate">
            <el-icon><Download /></el-icon>下载模板
          </el-button>
          <el-button type="danger" :disabled="!multipleSelection.length" @click="handleBatchDelete">
            <el-icon><Delete /></el-icon>批量删除
          </el-button>
        </div>

        <el-table
          :data="dataList"
          border
          style="width: 100%"
          row-key="id"
          @selection-change="handleSelectionChange"
        >
          <el-table-column type="selection" width="50" />
          <el-table-column prop="shenfenzhenghao" label="身份证号" min-width="160" />
        <el-table-column prop="xingming" label="姓名" min-width="120" />
       
          <el-table-column prop="heji" label="代扣合计" min-width="120" />
          <el-table-column label="操作" fixed="right" width="220">
            <template #default="{ row }">
              <el-button size="small" type="primary" @click="openDialog('edit', row)">
                <el-icon><Edit /></el-icon>编辑
              </el-button>
              <el-button size="small" type="danger" @click="handleDelete(row.id)">
                <el-icon><Delete /></el-icon>删除
              </el-button>
            </template>
          </el-table-column>
        </el-table>

        <!-- 分页 -->
        <el-pagination
          v-model:current-page="pagination.pageNum"
          v-model:page-size="pagination.pageSize"
          :total="pagination.total"
          layout="total, prev, pager, next, sizes"
          :page-sizes="[20, 40, 60, 100]"
          background
          @current-change="fetchList"
          @size-change="fetchList"
          class="pagination"
        />
      </div>
    </div>

    <el-dialog v-model="dialogVisible" :title="dialogTitle" width="720px" @close="resetDialog">
      <el-form :model="form" :rules="rules" ref="formRef" label-width="140px">
        <el-form-item label="身份证号" prop="shenfenzhenghao">
          <el-input v-model="form.shenfenzhenghao" placeholder="请输入身份证号" />
        </el-form-item>
        <el-form-item label="姓名" prop="xingming">
          <el-input v-model="form.xingming" placeholder="请输入姓名" />
        </el-form-item>
        <el-form-item label="代扣住房公积金">
          <el-input-number v-model="form.daikouzhufanggongjijin" :min="0" :precision="2" />
        </el-form-item>
        <el-form-item label="医疗保险">
          <el-input-number v-model="form.yiliaobaoxian" :min="0" :precision="2" />
        </el-form-item>
        <el-form-item label="补缴医疗保险">
          <el-input-number v-model="form.bujiaoyiliaobaoxian" :min="0" :precision="2" />
        </el-form-item>
        <el-form-item label="养老保险">
          <el-input-number v-model="form.yanglaobaoxian" :min="0" :precision="2" />
        </el-form-item>
        <el-form-item label="补缴养老">
          <el-input-number v-model="form.bujiaoyanlao" :min="0" :precision="2" />
        </el-form-item>
        <el-form-item label="职业年金">
          <el-input-number v-model="form.zhiyenianjin" :min="0" :precision="2" />
        </el-form-item>
        <el-form-item label="补缴年金">
          <el-input-number v-model="form.bujiaojiannian" :min="0" :precision="2" />
        </el-form-item>
        <el-form-item label="失业保险">
          <el-input-number v-model="form.shiyebaoxian" :min="0" :precision="2" />
        </el-form-item>
        <el-form-item label="补缴失业">
          <el-input-number v-model="form.bujiaoshiye" :min="0" :precision="2" />
        </el-form-item>
        <el-form-item label="个人所得税">
          <el-input-number v-model="form.gerensuodeshui" :min="0" :precision="2" />
        </el-form-item>
        <el-form-item label="合计">
          <el-input-number v-model="form.heji" :min="0" :precision="2" />
        </el-form-item>
      </el-form>
      <template #footer>
        <el-button @click="dialogVisible = false">
          <el-icon><Close /></el-icon>取消
        </el-button>
        <el-button type="primary" @click="handleSubmit">
          <el-icon><Check /></el-icon>确定
        </el-button>
      </template>
    </el-dialog>

    <!-- 导入数据 Dialog -->
    <el-dialog v-model="importDialogVisible" title="导入扣款数据" width="500px">
      <el-upload
        ref="uploadRef"
        :auto-upload="false"
        :limit="1"
        accept=".xlsx,.xls"
        :on-change="handleFileChange"
        :on-exceed="handleExceed"
        drag
      >
        <el-icon class="el-icon--upload"><UploadFilled /></el-icon>
        <div class="el-upload__text">
          将文件拖到此处,或<em>点击上传</em>
        </div>
        <template #tip>
          <div class="el-upload__tip">
            只能上传 xlsx/xls 文件
          </div>
        </template>
      </el-upload>

      <template #footer>
        <el-button @click="importDialogVisible = false">
          <el-icon><Close /></el-icon>取消
        </el-button>
        <el-button type="primary" @click="handleImportSubmit" :loading="importLoading">
          <el-icon><Check /></el-icon>确认导入
        </el-button>
      </template>
    </el-dialog>
  </div>
</template>

<script setup>
import { ref, reactive, computed, onMounted } from 'vue'
import { ElMessage, ElMessageBox } from 'element-plus'
import { Plus, Edit, Delete, Refresh, Search, Close, Check, UploadFilled, Calendar, Download } from '@element-plus/icons-vue'
import salaryKouKuanApi from '@/api/salary/salaryKouKuanApi'
import yearAndMonthAPI from '@/api/salary/yearAndMonthApi'

const dataList = ref([])
const dialogVisible = ref(false)
const formRef = ref(null)
const multipleSelection = ref([])
const editingId = ref('')
const pagination = reactive({ pageNum: 1, pageSize: 20, total: 0 })

// 年月列表相关
const yearMonthList = ref([])
const selectedYearMonthId = ref('') // 存储选中的年月ID

// 导入相关
const importDialogVisible = ref(false)
const importLoading = ref(false)
const uploadRef = ref(null)
const excelFile = ref(null)

const searchForm = reactive({
  shenfenzhenghao: '',
  xingming: '',
})

const form = reactive({
  id: '',
  shenfenzhenghao: '',
  xingming: '',
  daikouzhufanggongjijin: 0,
  yiliaobaoxian: 0,
  bujiaoyiliaobaoxian: 0,
  yanglaobaoxian: 0,
  bujiaoyanlao: 0,
  zhiyenianjin: 0,
  bujiaojiannian: 0,
  shiyebaoxian: 0,
  bujiaoshiye: 0,
  gerensuodeshui: 0,
  heji: 0,
})

const rules = {
  shenfenzhenghao: [{ required: true, message: '请输入身份证号', trigger: 'blur' }],
  xingming: [{ required: true, message: '请输入姓名', trigger: 'blur' }],
}

const isEdit = computed(() => !!editingId.value)
const dialogTitle = computed(() => (isEdit.value ? '编辑扣款记录' : '新增扣款记录'))

// 获取年月列表
async function fetchYearMonthList() {
  try {
    const res = await yearAndMonthAPI.getList()
    if (res.status === 200) {
      yearMonthList.value = Array.isArray(res.data?.results) ? res.data.results : res.data
    }
  } catch (error) {
    console.error('获取年月列表失败:', error)
  }
}

// 处理年月点击事件
function handleYearMonthClick(yearMonthId) {
  selectedYearMonthId.value = yearMonthId
  pagination.pageNum = 1 // 重置到第一页
  fetchList()
}

async function fetchList() {
  // 如果没有选择年月，不加载数据
  if (!selectedYearMonthId.value) {
    dataList.value = []
    pagination.total = 0
    return
  }

  try {
    // 构建查询参数，只传递非空值
    const params = {
      pageNum: pagination.pageNum,
      pageSize: pagination.pageSize,
      year_month_id: selectedYearMonthId.value  // UUID字符串格式
    }

    if (searchForm.shenfenzhenghao && searchForm.shenfenzhenghao.trim()) {
      params.shenfenzhenghao = searchForm.shenfenzhenghao.trim()
    }
    if (searchForm.xingming && searchForm.xingming.trim()) {
      params.xingming = searchForm.xingming.trim()
    }

    const res = await salaryKouKuanApi.getList(params)
    if (res.status === 200 && res.data) {
      dataList.value = res.data.results || []
      pagination.total = res.data.count || 0
    }
  } catch (error) {
    console.error('获取数据失败:', error)
    ElMessage.error('获取数据失败')
  }
}

function resetSearch() {
  searchForm.shenfenzhenghao = ''
  searchForm.xingming = ''
  fetchList()
}

function resetDialog() {
  Object.assign(form, {
    id: '',
    shenfenzhenghao: '',
    xingming: '',
    daikouzhufanggongjijin: 0,
    yiliaobaoxian: 0,
    bujiaoyiliaobaoxian: 0,
    yanglaobaoxian: 0,
    bujiaoyanlao: 0,
    zhiyenianjin: 0,
    bujiaojiannian: 0,
    shiyebaoxian: 0,
    bujiaoshiye: 0,
    gerensuodeshui: 0,
    heji: 0,
  })
  formRef.value?.clearValidate()
}

function openDialog(type, row) {
  // 新增时检查是否选择了年月
  if (type === 'add' && !selectedYearMonthId.value) {
    ElMessage.warning('请先在左侧选择年月')
    return
  }

  if (type === 'edit' && row) {
    editingId.value = row.id
    Object.assign(form, row)
  } else {
    editingId.value = ''
    resetDialog()
  }
  dialogVisible.value = true
}

function handleSubmit() {
  formRef.value?.validate(async (valid) => {
    if (!valid) return
    try {
      // 创建提交数据，新增时添加 year_month 外键ID
      const submitData = { ...form }
      if (!isEdit.value) {
        submitData.year_month = selectedYearMonthId.value
      }

      if (isEdit.value) {
        const res = await salaryKouKuanApi.update(editingId.value, submitData)
        if (res.status === 200) {
          ElMessage.success('编辑成功')
          dialogVisible.value = false
          fetchList()
        }
      } else {
        const res = await salaryKouKuanApi.create(submitData)
        if (res.status === 201) {
          ElMessage.success('新增成功')
          dialogVisible.value = false
          fetchList()
        }
      }
    } catch (error) {
      ElMessage.error(isEdit.value ? '编辑失败' : '新增失败')
    }
  })
}

function handleDelete(id) {
  ElMessageBox.confirm('确定要删除该记录吗？', '提示', {
    confirmButtonText: '确定',
    cancelButtonText: '取消',
    type: 'warning',
  }).then(async () => {
    try {
      const res = await salaryKouKuanApi.delete(id)
      if (res.status === 204) {
        ElMessage.success('删除成功')
        fetchList()
      }
    } catch (error) {
      ElMessage.error('删除失败')
    }
  })
}

function handleBatchDelete() {
  if (!multipleSelection.value.length) return
  ElMessageBox.confirm('确定要批量删除选中记录吗？', '提示', {
    confirmButtonText: '确定',
    cancelButtonText: '取消',
    type: 'warning',
  }).then(async () => {
    try {
      const ids = multipleSelection.value.map((item) => item.id)
      const res = await salaryKouKuanApi.deleteChecked(ids)
      if (res && res.data.code === 200) {
        ElMessage.success(res.data.message || '批量删除成功')
        fetchList()
      }
    } catch (error) {
      ElMessage.error('批量删除失败')
    }
  })
}

function handleSelectionChange(val) {
  multipleSelection.value = val
}

// 打开导入对话框
function openImportDialog() {
  // 检查是否选择了年月
  if (!selectedYearMonthId.value) {
    ElMessage.warning('请先在左侧选择年月')
    return
  }
  importDialogVisible.value = true
  excelFile.value = null
}

// 文件选择变化
function handleFileChange(file) {
  excelFile.value = file.raw
}

// 文件超出限制
function handleExceed() {
  ElMessage.warning('只能上传一个文件')
}

// 提交导入
async function handleImportSubmit() {
  if (!excelFile.value) {
    ElMessage.warning('请先选择要上传的文件')
    return
  }

  importLoading.value = true

  try {
    // 传递 year_month_id 参数给后端
    const res = await salaryKouKuanApi.importExcel(excelFile.value, selectedYearMonthId.value)

    if (res && res.data && res.data.code === 200) {
      ElMessage.success(res.data.message || '导入成功')

      // 如果有错误信息,显示详细错误
      if (res.data.data?.error_messages && res.data.data.error_messages.length > 0) {
        setTimeout(() => {
          ElMessageBox.alert(
            res.data.data.error_messages.join('\n'),
            '部分导入失败',
            {
              confirmButtonText: '确定',
              type: 'warning',
            }
          )
        }, 500)
      }

      importDialogVisible.value = false
      excelFile.value = null
      if (uploadRef.value) {
        uploadRef.value.clearFiles()
      }
      fetchList()
    } else {
      const errorMsg = res?.data?.message || '导入失败'
      ElMessage.error(errorMsg)
    }
  } catch (error) {
    console.error('导入失败:', error)
    const errorMsg = error.response?.data?.message || error.message || '导入失败,请检查文件格式'
    ElMessage.error(errorMsg)
  } finally {
    importLoading.value = false
  }
}

// 下载模板
function handleDownloadTemplate() {
  const link = document.createElement('a')
  link.href = '/templates/salary_koukuan_template.xlsx'
  link.download = 'salary_koukuan_template.xlsx'
  link.click()
  ElMessage.success('模板下载成功')
}

onMounted(() => {
  fetchYearMonthList()
  // 不在初始加载时获取数据，等待用户点击年月
})
</script>

<style scoped>
.salary-admin {
  padding: 16px 20px;
  height: calc(100vh - 100px);
  overflow: hidden;
}

.layout-container {
  display: flex;
  height: 100%;
  gap: 16px;
}

.sidebar {
  width: 160px;
  background: #fff;
  border: 1px solid #e4e7ed;
  border-radius: 4px;
  display: flex;
  flex-direction: column;
  overflow: hidden;
}

.sidebar-header {
  padding: 16px;
  border-bottom: 1px solid #e4e7ed;
  display: flex;
  align-items: center;
  gap: 8px;
  font-weight: 600;
  font-size: 14px;
  color: #303133;
}

.sidebar-content {
  flex: 1;
  overflow-y: auto;
  padding: 8px 0;
}

.sidebar-item {
  padding: 12px 20px;
  cursor: pointer;
  transition: all 0.3s;
  color: #606266;
  font-size: 14px;
}

.sidebar-item:hover {
  background: #f5f7fa;
  color: #409eff;
}

.sidebar-item.active {
  background: #ecf5ff;
  color: #409eff;
  font-weight: 500;
  border-right: 3px solid #409eff;
}

.empty-text {
  padding: 20px;
  text-align: center;
  color: #909399;
  font-size: 14px;
}

.main-content {
  flex: 1;
  display: flex;
  flex-direction: column;
  overflow: hidden;
}

.toolbar {
  margin-bottom: 16px;
}

.search-form {
  margin-bottom: 16px;
}

.pagination {
  margin-top: 16px;
}
</style>
