<template>
  <div class="panel">
    <!-- 操作按钮区 -->
    <div class="toolbar">
      <el-button type="primary" @click="openDialog('add')">
        <el-icon><Plus /></el-icon>
        新增员工档案
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
      <el-button @click="fetchProfiles">
        <el-icon><Refresh /></el-icon>
        刷新
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
        v-model="searchDepartment"
        placeholder="部门"
        clearable
        style="width: 200px; margin-right: 10px"
        @change="handleSearch"
      >
        <el-option
          v-for="dept in departmentOptions"
          :key="dept.value"
          :label="dept.label"
          :value="dept.value"
        />
      </el-select>
      <el-select
        v-model="searchStatus"
        placeholder="状态"
        clearable
        style="width: 150px; margin-right: 10px"
        @change="handleSearch"
      >
        <el-option label="在职" value="active" />
        <el-option label="离职" value="leave" />
        <el-option label="退休" value="retire" />
      </el-select>
      <el-button type="primary" @click="handleSearch">
        <el-icon><Search /></el-icon>
        搜索
      </el-button>
    </div>

    <!-- 员工档案表格 -->
    <el-table
      :data="profileList"
      border
      style="margin-top: 20px; width: 100%"
      :header-cell-style="{ textAlign: 'center' }"
      @selection-change="handleSelectionChange"
    >
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column type="index" label="序号" width="80" align="center" />
      <el-table-column prop="employeeId" label="工号" width="120" align="center" />
      <el-table-column prop="realName" label="姓名" width="120" align="center" />
      <el-table-column prop="gender_display" label="性别" width="80" align="center" />
      <el-table-column prop="idCard" label="身份证号" width="180" align="center" />
      <el-table-column prop="department_name" label="部门" min-width="150" show-overflow-tooltip />
      <el-table-column prop="telephone" label="联系电话" width="130" align="center" />
      <el-table-column prop="email" label="邮箱" min-width="180" show-overflow-tooltip />
      <el-table-column label="状态" width="100" align="center">
        <template #default="{ row }">
          <el-tag
            :type="row.status === 'active' ? 'success' : row.status === 'leave' ? 'danger' : 'info'"
            size="small"
          >
            {{ row.status_display }}
          </el-tag>
        </template>
      </el-table-column>
      <el-table-column prop="entry_date" label="入职日期" width="120" align="center" />
      <el-table-column label="操作" width="200" align="center" fixed="right">
        <template #default="scope">
          <el-button
            size="small"
            type="primary"
            @click.stop="openDialog('edit', scope.row)"
          >
            编辑
          </el-button>
          <el-button
            size="small"
            type="danger"
            @click.stop="deleteProfile(scope.row)"
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
    width="800px"
    :close-on-click-modal="false"
  >
    <el-form :model="form" :rules="rules" ref="formRef" label-width="100px">
      <el-row :gutter="20">
        <el-col :span="12">
          <el-form-item label="工号" prop="employeeId">
            <el-input
              v-model="form.employeeId"
              placeholder="请输入工号"
              clearable
              maxlength="100"
              :disabled="dialogType === 'edit'"
            />
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="姓名" prop="realName">
            <el-input
              v-model="form.realName"
              placeholder="请输入姓名"
              clearable
              maxlength="100"
            />
          </el-form-item>
        </el-col>
      </el-row>

      <el-row :gutter="20">
        <el-col :span="12">
          <el-form-item label="身份证号" prop="idCard">
            <el-input
              v-model="form.idCard"
              placeholder="请输入身份证号"
              clearable
              maxlength="18"
            />
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="性别" prop="gender">
            <el-select v-model="form.gender" placeholder="请选择性别" style="width: 100%">
              <el-option label="男" value="male" />
              <el-option label="女" value="female" />
            </el-select>
          </el-form-item>
        </el-col>
      </el-row>

      <el-row :gutter="20">
        <el-col :span="12">
          <el-form-item label="出生日期" prop="birth_date">
            <el-date-picker
              v-model="form.birth_date"
              type="date"
              placeholder="请选择出生日期"
              style="width: 100%"
              format="YYYY-MM-DD"
              value-format="YYYY-MM-DD"
            />
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="入职日期" prop="entry_date">
            <el-date-picker
              v-model="form.entry_date"
              type="date"
              placeholder="请选择入职日期"
              style="width: 100%"
              format="YYYY-MM-DD"
              value-format="YYYY-MM-DD"
            />
          </el-form-item>
        </el-col>
      </el-row>

      <el-row :gutter="20">
        <el-col :span="12">
          <el-form-item label="部门" prop="department">
            <el-select
              v-model="form.department"
              placeholder="请选择部门"
              clearable
              filterable
              style="width: 100%"
            >
              <el-option
                v-for="dept in departmentOptions"
                :key="dept.value"
                :label="dept.label"
                :value="dept.value"
              />
            </el-select>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="员工状态" prop="status">
            <el-select v-model="form.status" placeholder="请选择状态" style="width: 100%">
              <el-option label="在职" value="active" />
              <el-option label="离职" value="leave" />
              <el-option label="退休" value="retire" />
            </el-select>
          </el-form-item>
        </el-col>
      </el-row>

      <el-row :gutter="20">
        <el-col :span="12">
          <el-form-item label="联系电话" prop="telephone">
            <el-input
              v-model="form.telephone"
              placeholder="请输入联系电话"
              clearable
              maxlength="11"
            />
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="邮箱" prop="email">
            <el-input
              v-model="form.email"
              placeholder="请输入邮箱"
              clearable
            />
          </el-form-item>
        </el-col>
      </el-row>

      <el-form-item label="家庭住址" prop="address">
        <el-input
          v-model="form.address"
          placeholder="请输入家庭住址"
          clearable
          maxlength="300"
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
    title="导入员工档案"
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
</template>

<script setup>
import { ref, reactive, onMounted } from 'vue'
import { ElMessage, ElMessageBox } from 'element-plus'
import { Plus, Delete, Refresh, Search, Upload, Download, UploadFilled } from '@element-plus/icons-vue'
import employeeProfileApi from '@/api/user/employeeProfileApi'
import departmentApi from '@/api/user/departmentApi'
import 'element-plus/dist/index.css'

// 数据
const profileList = ref([])
const selectedIds = ref([])
const searchEmployeeId = ref('')
const searchRealName = ref('')
const searchDepartment = ref('')
const searchStatus = ref('')
const departmentOptions = ref([])

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

// 表单数据
const form = reactive({
  id: '',
  user: '',
  employeeId: '',
  realName: '',
  idCard: '',
  gender: '',
  birth_date: '',
  department: '',
  telephone: '',
  email: '',
  address: '',
  entry_date: '',
  status: 'active',
  remark: '',
})

// 表单验证规则
const rules = {
  employeeId: [
    { required: true, message: '工号为必填项', trigger: 'blur' },
    { min: 1, max: 100, message: '长度在 1 到 100 个字符', trigger: 'blur' },
  ],
  realName: [
    { required: true, message: '姓名为必填项', trigger: 'blur' },
    { min: 2, max: 100, message: '长度在 2 到 100 个字符', trigger: 'blur' },
  ],
  idCard: [
    { required: true, message: '身份证号为必填项', trigger: 'blur' },
    { pattern: /^[1-9]\d{5}(18|19|20)\d{2}(0[1-9]|1[0-2])(0[1-9]|[12]\d|3[01])\d{3}[\dXx]$/, message: '请输入正确的身份证号', trigger: 'blur' },
  ],
  telephone: [
    { pattern: /^1[3-9]\d{9}$/, message: '请输入正确的手机号', trigger: 'blur' },
  ],
  email: [
    { type: 'email', message: '请输入正确的邮箱地址', trigger: 'blur' },
  ],
}

/**
 * 获取员工档案列表
 */
const fetchProfiles = async () => {
  try {
    const params = {
      pageNum: currentPage.value,
      pageSize: pageSize.value,
    }
    if (searchEmployeeId.value) {
      params.employeeId = searchEmployeeId.value
    }
    if (searchRealName.value) {
      params.realName = searchRealName.value
    }
    if (searchDepartment.value) {
      params.department_id = searchDepartment.value
    }
    if (searchStatus.value) {
      params.status = searchStatus.value
    }

    const res = await employeeProfileApi.getList(params)
    if (res.status === 200) {
      const data = res.data.results || res.data
      profileList.value = Array.isArray(data) ? data : []
      total.value = res.data.count || 0
    }
  } catch (error) {
    console.error('获取员工档案列表失败:', error)
    ElMessage.error('获取员工档案列表失败')
  }
}

/**
 * 获取部门选项
 */
const fetchDepartmentOptions = async () => {
  try {
    const res = await departmentApi.getOptions()
    if (res.status === 200 && res.data.code === 200) {
      departmentOptions.value = res.data.data
    }
  } catch (error) {
    console.error('获取部门选项失败:', error)
  }
}

/**
 * 搜索处理
 */
const handleSearch = () => {
  currentPage.value = 1
  fetchProfiles()
}

/**
 * 分页大小变化
 */
const handleSizeChange = (val) => {
  pageSize.value = val
  currentPage.value = 1
  fetchProfiles()
}

/**
 * 当前页变化
 */
const handleCurrentChange = (val) => {
  currentPage.value = val
  fetchProfiles()
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
const openDialog = (type, data = null) => {
  dialogType.value = type
  if (type === 'add') {
    dialogTitle.value = '新增员工档案'
    Object.assign(form, {
      id: '',
      user: '',
      employeeId: '',
      realName: '',
      idCard: '',
      gender: '',
      birth_date: '',
      department: '',
      telephone: '',
      email: '',
      address: '',
      entry_date: '',
      status: 'active',
      remark: '',
    })
  } else if (type === 'edit' && data) {
    dialogTitle.value = '编辑员工档案'
    Object.assign(form, {
      id: data.id,
      user: data.user,
      employeeId: data.employeeId,
      realName: data.realName,
      idCard: data.idCard,
      gender: data.gender || '',
      birth_date: data.birth_date || '',
      department: data.department || '',
      telephone: data.telephone || '',
      email: data.email || '',
      address: data.address || '',
      entry_date: data.entry_date || '',
      status: data.status || 'active',
      remark: data.remark || '',
    })
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
        employeeId: form.employeeId,
        realName: form.realName,
        idCard: form.idCard,
        gender: form.gender || null,
        birth_date: form.birth_date || null,
        department: form.department || null,
        telephone: form.telephone || null,
        email: form.email || null,
        address: form.address || null,
        entry_date: form.entry_date || null,
        status: form.status,
        remark: form.remark || null,
      }

      if (form.id) {
        // 编辑
        submitData.user = form.user
        const res = await employeeProfileApi.update(form.id, submitData)
        if (res.status === 200) {
          ElMessage.success('编辑成功')
          dialogVisible.value = false
          fetchProfiles()
        } else {
          ElMessage.error(res.data.message || '编辑失败')
        }
      } else {
        // 新增 - 需要创建用户
        // 这里简化处理，实际应该先创建用户或选择已有用户
        ElMessage.warning('新增功能需要先创建用户账号，建议使用Excel导入')
      }
    } catch (error) {
      console.error('提交失败:', error)
      ElMessage.error(error.response?.data?.message || '操作失败')
    } finally {
      submitLoading.value = false
    }
  })
}

/**
 * 删除员工档案
 */
const deleteProfile = (row) => {
  ElMessageBox.confirm(
    `确定要删除员工档案"${row.realName}"吗？`,
    '提示',
    {
      confirmButtonText: '确定',
      cancelButtonText: '取消',
      type: 'warning',
    }
  )
    .then(async () => {
      try {
        const res = await employeeProfileApi.delete(row.id)
        if (res.status === 200 || res.status === 204) {
          ElMessage.success('删除成功')
          fetchProfiles()
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
    ElMessage.warning('请选择要删除的员工档案')
    return
  }

  ElMessageBox.confirm(
    `确定要删除选中的 ${selectedIds.value.length} 个员工档案吗？`,
    '提示',
    {
      confirmButtonText: '确定',
      cancelButtonText: '取消',
      type: 'warning',
    }
  )
    .then(async () => {
      try {
        const res = await employeeProfileApi.deleteChecked(selectedIds.value)
        if (res.status === 200 && res.data.code === 200) {
          ElMessage.success(res.data.message)
          selectedIds.value = []
          fetchProfiles()
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
    const res = await employeeProfileApi.importExcel(uploadFile.value)
    if (res.status === 200 && res.data.code === 200) {
      ElMessage.success(res.data.message)
      importDialogVisible.value = false
      uploadFile.value = null
      if (uploadRef.value) {
        uploadRef.value.clearFiles()
      }
      fetchProfiles()

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
    const res = await employeeProfileApi.exportTemplate()
    const blob = new Blob([res.data], {
      type: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
    })
    const url = window.URL.createObjectURL(blob)
    const link = document.createElement('a')
    link.href = url
    link.download = 'employee_profile_template.xlsx'
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
  fetchProfiles()
  fetchDepartmentOptions()
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
