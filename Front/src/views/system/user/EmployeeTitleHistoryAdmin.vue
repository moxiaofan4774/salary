<template>
  <div class="panel">
    <!-- 操作按钮区 -->
    <div class="toolbar">
      <el-button type="primary" @click="openDialog('add')">
        <el-icon><Plus /></el-icon>
        新增职称历史
      </el-button>
      <el-button type="danger" :disabled="selectedIds.length === 0" @click="batchDelete">
        <el-icon><Delete /></el-icon>
        批量删除
      </el-button>
      <el-button type="success" @click="handleImport">
        <el-icon><Upload /></el-icon>
        导入Excel
      </el-button>
      <el-button @click="handleExportTemplate">
        <el-icon><Download /></el-icon>
        下载模板
      </el-button>
      <el-button @click="handleRefresh">
        <el-icon><Refresh /></el-icon>
        刷新
      </el-button>
      <el-button type="info" @click="showStatistics">
        <el-icon><DataAnalysis /></el-icon>
        职称统计
      </el-button>
    </div>

    <!-- 搜索区 -->
    <div class="search-bar">
      <el-input
        v-model="searchEmployeeId"
        placeholder="搜索工号"
        clearable
        style="width: 200px; margin-right: 10px"
        @clear="handleSearch"
        @keyup.enter="handleSearch"
      >
        <template #prefix>
          <el-icon><Search /></el-icon>
        </template>
      </el-input>
      <el-input
        v-model="searchRealName"
        placeholder="搜索姓名"
        clearable
        style="width: 200px; margin-right: 10px"
        @clear="handleSearch"
        @keyup.enter="handleSearch"
      >
        <template #prefix>
          <el-icon><Search /></el-icon>
        </template>
      </el-input>
      <el-select
        v-model="searchTitleCategory"
        placeholder="职称分类"
        clearable
        style="width: 200px; margin-right: 10px"
        @change="handleSearch"
      >
        <el-option
          v-for="cat in titleCategoryOptions"
          :key="cat.value"
          :label="cat.label"
          :value="cat.value"
        />
      </el-select>
      <el-select
        v-model="searchIsCurrent"
        placeholder="是否当前职称"
        clearable
        style="width: 150px; margin-right: 10px"
        @change="handleSearch"
      >
        <el-option label="是" value="true" />
        <el-option label="否" value="false" />
      </el-select>
      <el-button type="primary" @click="handleSearch">
        <el-icon><Search /></el-icon>
        搜索
      </el-button>
    </div>

    <!-- 职称历史表格 -->
    <el-table
      :data="historyList"
      border
      style="margin-top: 20px; width: 100%"
      :header-cell-style="{ textAlign: 'center' }"
      @selection-change="handleSelectionChange"
    >
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column type="index" label="序号" width="80" align="center" />
      <el-table-column prop="employee_id" label="工号" width="120" align="center" />
      <el-table-column prop="employee_name" label="姓名" width="120" align="center" />
      <el-table-column prop="title_name" label="职称" min-width="150" show-overflow-tooltip />
      <el-table-column prop="start_date" label="开始日期" width="120" align="center" />
      <el-table-column prop="end_date" label="结束日期" width="120" align="center">
        <template #default="{ row }">
          {{ row.end_date || '至今' }}
        </template>
      </el-table-column>
      <el-table-column prop="duration" label="持续时间(年)" width="120" align="center">
        <template #default="{ row }">
          <el-tag type="info" size="small">{{ row.duration }}</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="是否当前" width="100" align="center">
        <template #default="{ row }">
          <el-tag :type="row.is_current ? 'success' : 'info'" size="small">
            {{ row.is_current ? '是' : '否' }}
          </el-tag>
        </template>
      </el-table-column>
      <el-table-column prop="certificate_number" label="证书编号" width="150" align="center" />
      <el-table-column label="操作" width="280" align="center" fixed="right">
        <template #default="scope">
          <el-button
            size="small"
            type="primary"
            @click.stop="openDialog('edit', scope.row)"
          >
            编辑
          </el-button>
          <el-button
            v-if="!scope.row.is_current"
            size="small"
            type="success"
            @click.stop="setCurrent(scope.row)"
          >
            设为当前
          </el-button>
          <el-button
            size="small"
            type="danger"
            @click.stop="deleteHistory(scope.row)"
          >
            删除
          </el-button>
        </template>
      </el-table-column>
    </el-table>

    <!-- 分页 -->
    <div class="pagination">
      <el-pagination
        v-model:current-page="currentPage"
        v-model:page-size="pageSize"
        :page-sizes="[10, 20, 50, 100]"
        :total="total"
        layout="total, sizes, prev, pager, next, jumper"
        @size-change="handleSizeChange"
        @current-change="handleCurrentChange"
      />
    </div>
  </div>

  <!-- 新增/编辑对话框 -->
  <el-dialog
    :title="dialogTitle"
    v-model="dialogVisible"
    width="700px"
    :close-on-click-modal="false"
  >
    <el-form :model="form" :rules="rules" ref="formRef" label-width="100px">
      <el-form-item label="员工" prop="employee">
        <el-select
          v-model="form.employee"
          placeholder="请选择员工"
          filterable
          remote
          :remote-method="searchEmployees"
          :loading="employeeLoading"
          style="width: 100%"
          :disabled="dialogType === 'edit'"
        >
          <el-option
            v-for="emp in employeeOptions"
            :key="emp.value"
            :label="`${emp.employeeId} - ${emp.label}`"
            :value="emp.value"
          />
        </el-select>
      </el-form-item>

      <el-form-item label="职称分类" prop="title_category">
        <el-select
          v-model="form.title_category"
          placeholder="请选择职称分类"
          filterable
          style="width: 100%"
        >
          <el-option
            v-for="cat in titleCategoryOptions"
            :key="cat.value"
            :label="cat.label"
            :value="cat.value"
          />
        </el-select>
      </el-form-item>

      <el-row :gutter="20">
        <el-col :span="12">
          <el-form-item label="开始日期" prop="start_date">
            <el-date-picker
              v-model="form.start_date"
              type="date"
              placeholder="请选择开始日期"
              style="width: 100%"
              format="YYYY-MM-DD"
              value-format="YYYY-MM-DD"
            />
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="结束日期" prop="end_date">
            <el-date-picker
              v-model="form.end_date"
              type="date"
              placeholder="请选择结束日期（不填表示至今）"
              style="width: 100%"
              format="YYYY-MM-DD"
              value-format="YYYY-MM-DD"
            />
          </el-form-item>
        </el-col>
      </el-row>

      <el-form-item label="是否当前" prop="is_current">
        <el-switch
          v-model="form.is_current"
          active-text="是"
          inactive-text="否"
        />
      </el-form-item>

      <el-form-item label="证书编号" prop="certificate_number">
        <el-input
          v-model="form.certificate_number"
          placeholder="请输入证书编号"
          clearable
          maxlength="100"
        />
      </el-form-item>

      <el-form-item label="备注" prop="remark">
        <el-input
          v-model="form.remark"
          type="textarea"
          placeholder="请输入备注"
          :rows="4"
          maxlength="500"
          show-word-limit
        />
      </el-form-item>
    </el-form>
    <template #footer>
      <el-button @click="dialogVisible = false">取消</el-button>
      <el-button type="primary" @click="submitForm" :loading="submitLoading">
        确定
      </el-button>
    </template>
  </el-dialog>

  <!-- 导入Excel对话框 -->
  <el-dialog
    title="导入职称历史"
    v-model="importDialogVisible"
    width="600px"
    :close-on-click-modal="false"
  >
    <el-upload
      ref="uploadRef"
      :auto-upload="false"
      :limit="1"
      accept=".xlsx,.xls"
      :on-change="handleFileChange"
      :on-exceed="handleExceed"
      drag
    >
      <el-icon class="el-icon--upload"><upload-filled /></el-icon>
      <div class="el-upload__text">
        将文件拖到此处，或<em>点击上传</em>
      </div>
      <template #tip>
        <div class="el-upload__tip">
          只能上传 xlsx/xls 文件，请先下载模板填写数据
        </div>
      </template>
    </el-upload>
    <template #footer>
      <el-button @click="importDialogVisible = false">取消</el-button>
      <el-button type="primary" @click="submitImport" :loading="importLoading">
        确定导入
      </el-button>
    </template>
  </el-dialog>

  <!-- 统计对话框 -->
  <el-dialog
    title="职称统计"
    v-model="statisticsVisible"
    width="600px"
  >
    <el-table :data="statisticsData" border style="width: 100%">
      <el-table-column prop="title_category__name" label="职称分类" min-width="200" />
      <el-table-column prop="count" label="人数" width="120" align="center">
        <template #default="{ row }">
          <el-tag type="primary" size="large">{{ row.count }}</el-tag>
        </template>
      </el-table-column>
    </el-table>
  </el-dialog>
</template>

<script setup>
import { ref, reactive, onMounted } from 'vue'
import { ElMessage, ElMessageBox } from 'element-plus'
import { Plus, Delete, Refresh, Search, DataAnalysis, Upload, Download, UploadFilled } from '@element-plus/icons-vue'
import employeeTitleHistoryApi from '@/api/user/employeeTitleHistoryApi'
import employeeProfileApi from '@/api/user/employeeProfileApi'
import titleCategoryApi from '@/api/user/titleCategoryApi'
import 'element-plus/dist/index.css'

// 数据
const historyList = ref([])
const selectedIds = ref([])
const searchEmployeeId = ref('')
const searchRealName = ref('')
const searchTitleCategory = ref('')
const searchIsCurrent = ref('')
const titleCategoryOptions = ref([])
const employeeOptions = ref([])
const employeeLoading = ref(false)

// 分页
const currentPage = ref(1)
const pageSize = ref(10)
const total = ref(0)

// 对话框
const dialogVisible = ref(false)
const dialogTitle = ref('')
const dialogType = ref('')
const submitLoading = ref(false)
const formRef = ref()

// 导入对话框
const importDialogVisible = ref(false)
const importLoading = ref(false)
const uploadRef = ref()
const uploadFile = ref(null)

// 统计对话框
const statisticsVisible = ref(false)
const statisticsData = ref([])

// 表单数据
const form = reactive({
  id: '',
  employee: '',
  title_category: '',
  start_date: '',
  end_date: '',
  is_current: false,
  certificate_number: '',
  remark: '',
})

// 表单验证规则
const rules = {
  employee: [
    { required: true, message: '员工为必选项', trigger: 'change' },
  ],
  title_category: [
    { required: true, message: '职称分类为必选项', trigger: 'change' },
  ],
  start_date: [
    { required: true, message: '开始日期为必填项', trigger: 'change' },
  ],
}

/**
 * 获取职称历史列表
 */
const fetchHistories = async () => {
  try {
    const params = {
      page: currentPage.value,
      page_size: pageSize.value,
    }
    if (searchEmployeeId.value) {
      params.employeeId = searchEmployeeId.value
    }
    if (searchRealName.value) {
      params.realName = searchRealName.value
    }
    if (searchTitleCategory.value) {
      params.title_category_id = searchTitleCategory.value
    }
    if (searchIsCurrent.value) {
      params.is_current = searchIsCurrent.value === 'true'
    }

    const res = await employeeTitleHistoryApi.getList(params)
    if (res.status === 200) {
      const data = res.data.results || res.data
      historyList.value = Array.isArray(data) ? data : []
      total.value = res.data.count || 0
    }
  } catch (error) {
    console.error('获取职称历史列表失败:', error)
    ElMessage.error('获取职称历史列表失败')
  }
}

/**
 * 获取职称分类选项
 */
const fetchTitleCategoryOptions = async () => {
  try {
    const res = await titleCategoryApi.getOptions()
    if (res.status === 200 && res.data.code === 200) {
      titleCategoryOptions.value = res.data.data
    }
  } catch (error) {
    console.error('获取职称分类选项失败:', error)
  }
}

/**
 * 搜索员工（支持工号或姓名）
 */
const searchEmployees = async (query) => {
  if (!query) {
    employeeOptions.value = []
    return
  }

  employeeLoading.value = true
  try {
    // 同时按工号和姓名搜索，让后端返回匹配的结果
    const params = {
      page_size: 20,
    }

    // 如果输入的是纯数字，优先按工号搜索
    if (/^\d+$/.test(query)) {
      params.employeeId = query
    } else {
      // 否则按姓名搜索
      params.realName = query
    }

    const res = await employeeProfileApi.getList(params)
    if (res.status === 200) {
      const data = res.data.results || res.data
      employeeOptions.value = data.map((emp) => ({
        value: emp.id,
        label: emp.realName,
        employeeId: emp.employeeId,
      }))
    }
  } catch (error) {
    console.error('搜索员工失败:', error)
  } finally {
    employeeLoading.value = false
  }
}

/**
 * 搜索处理
 */
const handleSearch = () => {
  currentPage.value = 1
  fetchHistories()
}

/**
 * 刷新处理（清空查询条件）
 */
const handleRefresh = () => {
  searchEmployeeId.value = ''
  searchRealName.value = ''
  searchTitleCategory.value = ''
  searchIsCurrent.value = ''
  currentPage.value = 1
  fetchHistories()
}

/**
 * 分页大小变化
 */
const handleSizeChange = (val) => {
  pageSize.value = val
  currentPage.value = 1
  fetchHistories()
}

/**
 * 当前页变化
 */
const handleCurrentChange = (val) => {
  currentPage.value = val
  fetchHistories()
}

/**
 * 选择变化处理
 */
const handleSelectionChange = (selection) => {
  selectedIds.value = selection.map((item) => item.id)
}

/**
 * 打开对话框
 */
const openDialog = async (type, data = null) => {
  dialogType.value = type
  if (type === 'add') {
    dialogTitle.value = '新增职称历史'
    Object.assign(form, {
      id: '',
      employee: '',
      title_category: '',
      start_date: '',
      end_date: '',
      is_current: false,
      certificate_number: '',
      remark: '',
    })
    employeeOptions.value = []
  } else if (type === 'edit' && data) {
    dialogTitle.value = '编辑职称历史'
    Object.assign(form, {
      id: data.id,
      employee: data.employee,
      title_category: data.title_category,
      start_date: data.start_date,
      end_date: data.end_date || '',
      is_current: data.is_current,
      certificate_number: data.certificate_number || '',
      remark: data.remark || '',
    })
    // 设置当前员工选项
    employeeOptions.value = [{
      value: data.employee,
      label: data.employee_name,
      employeeId: data.employee_id,
    }]
  }
  dialogVisible.value = true
}

/**
 * 提交表单
 */
const submitForm = () => {
  formRef.value.validate(async (valid) => {
    if (!valid) return

    submitLoading.value = true
    try {
      const submitData = {
        employee: form.employee,
        title_category: form.title_category,
        start_date: form.start_date,
        end_date: form.end_date || null,
        is_current: form.is_current,
        certificate_number: form.certificate_number || null,
        remark: form.remark || null,
      }

      if (form.id) {
        // 编辑
        const res = await employeeTitleHistoryApi.update(form.id, submitData)
        if (res.status === 200) {
          ElMessage.success('编辑成功')
          dialogVisible.value = false
          fetchHistories()
        } else {
          ElMessage.error(res.data.message || '编辑失败')
        }
      } else {
        // 新增
        const res = await employeeTitleHistoryApi.create(submitData)
        if (res.status === 201) {
          ElMessage.success('新增成功')
          dialogVisible.value = false
          fetchHistories()
        } else {
          ElMessage.error(res.data.message || '新增失败')
        }
      }
    } catch (error) {
      console.error('提交失败:', error)
      ElMessage.error(error.response?.data?.message || error.response?.data?.detail || '操作失败')
    } finally {
      submitLoading.value = false
    }
  })
}

/**
 * 设置当前职称
 */
const setCurrent = async (row) => {
  try {
    const res = await employeeTitleHistoryApi.setCurrent(row.id)
    if (res.status === 200 && res.data.code === 200) {
      ElMessage.success(res.data.message)
      fetchHistories()
    } else {
      ElMessage.error(res.data.message || '操作失败')
    }
  } catch (error) {
    console.error('设置当前职称失败:', error)
    ElMessage.error('操作失败')
  }
}

/**
 * 删除职称历史
 */
const deleteHistory = (row) => {
  ElMessageBox.confirm(
    `确定要删除"${row.employee_name}"的职称历史"${row.title_name}"吗？`,
    '提示',
    {
      confirmButtonText: '确定',
      cancelButtonText: '取消',
      type: 'warning',
    }
  )
    .then(async () => {
      try {
        const res = await employeeTitleHistoryApi.delete(row.id)
        if (res.status === 200 || res.status === 204) {
          ElMessage.success('删除成功')
          fetchHistories()
        } else {
          ElMessage.error(res.data.message || '删除失败')
        }
      } catch (error) {
        console.error('删除失败:', error)
        ElMessage.error(error.response?.data?.message || '删除失败')
      }
    })
    .catch(() => {})
}

/**
 * 批量删除
 */
const batchDelete = () => {
  if (selectedIds.value.length === 0) {
    ElMessage.warning('请选择要删除的职称历史记录')
    return
  }

  ElMessageBox.confirm(
    `确定要删除选中的 ${selectedIds.value.length} 条职称历史记录吗？`,
    '提示',
    {
      confirmButtonText: '确定',
      cancelButtonText: '取消',
      type: 'warning',
    }
  )
    .then(async () => {
      try {
        const res = await employeeTitleHistoryApi.deleteChecked(selectedIds.value)
        if (res.status === 200 && res.data.code === 200) {
          ElMessage.success(res.data.message)
          selectedIds.value = []
          fetchHistories()
        } else {
          ElMessage.error(res.data.message || '删除失败')
        }
      } catch (error) {
        console.error('批量删除失败:', error)
        ElMessage.error(error.response?.data?.message || '删除失败')
      }
    })
    .catch(() => {})
}

/**
 * 显示统计信息
 */
const showStatistics = async () => {
  try {
    const res = await employeeTitleHistoryApi.getStatistics()
    if (res.status === 200 && res.data.code === 200) {
      statisticsData.value = res.data.data
      statisticsVisible.value = true
    } else {
      ElMessage.error('获取统计信息失败')
    }
  } catch (error) {
    console.error('获取统计信息失败:', error)
    ElMessage.error('获取统计信息失败')
  }
}

/**
 * 打开导入对话框
 */
const handleImport = () => {
  uploadFile.value = null
  importDialogVisible.value = true
}

/**
 * 文件选择变化
 */
const handleFileChange = (file) => {
  uploadFile.value = file.raw
}

/**
 * 文件超出限制
 */
const handleExceed = () => {
  ElMessage.warning('只能上传一个文件')
}

/**
 * 提交导入
 */
const submitImport = async () => {
  if (!uploadFile.value) {
    ElMessage.warning('请选择要上传的文件')
    return
  }

  importLoading.value = true
  try {
    const res = await employeeTitleHistoryApi.importExcel(uploadFile.value)
    if (res.status === 200 && res.data.code === 200) {
      ElMessage.success(res.data.message)
      importDialogVisible.value = false
      uploadFile.value = null
      if (uploadRef.value) {
        uploadRef.value.clearFiles()
      }
      fetchHistories()

      // 如果有错误信息，显示详情
      if (res.data.data && res.data.data.errors && res.data.data.errors.length > 0) {
        ElMessageBox.alert(
          res.data.data.errors.join('\n'),
          '导入错误详情',
          {
            confirmButtonText: '确定',
            type: 'warning',
          }
        )
      }
    } else {
      ElMessage.error(res.data.message || '导入失败')
    }
  } catch (error) {
    console.error('导入失败:', error)
    ElMessage.error(error.response?.data?.message || '导入失败')
  } finally {
    importLoading.value = false
  }
}

/**
 * 下载模板
 */
const handleExportTemplate = async () => {
  try {
    const res = await employeeTitleHistoryApi.exportTemplate()
    const blob = new Blob([res.data], {
      type: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
    })
    const url = window.URL.createObjectURL(blob)
    const link = document.createElement('a')
    link.href = url
    link.download = 'employee_title_history_template.xlsx'
    link.click()
    window.URL.revokeObjectURL(url)
    ElMessage.success('模板下载成功')
  } catch (error) {
    console.error('下载模板失败:', error)
    ElMessage.error('下载模板失败')
  }
}

// 组件挂载时获取数据
onMounted(() => {
  fetchHistories()
  fetchTitleCategoryOptions()
})
</script>

<style scoped>
.panel {
  padding: 20px;
  background: #fff;
  border-radius: 4px;
}

.toolbar {
  margin-bottom: 20px;
}

.search-bar {
  display: flex;
  align-items: center;
  margin-bottom: 20px;
  padding: 15px;
  background: #f5f7fa;
  border-radius: 4px;
}

.pagination {
  margin-top: 20px;
  display: flex;
  justify-content: flex-end;
}

:deep(.el-table) {
  font-size: 14px;
}

:deep(.el-table th) {
  background-color: #f5f7fa;
  color: #606266;
  font-weight: 600;
}

:deep(.el-button + .el-button) {
  margin-left: 8px;
}
</style>
