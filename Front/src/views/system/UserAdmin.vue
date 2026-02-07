<template>

  <div class="panel user-admin">

    <!-- 搜索栏 -->

    <el-form :inline="true" :model="searchForm" class="search-form" @submit.prevent>

      <el-form-item label="工号">

        <el-input

          v-model="searchForm.employeeId"

          placeholder="请输入工号"

          clearable

          @keyup.enter="fetchList"

        />

      </el-form-item>

      <el-form-item label="姓名">

        <el-input

          v-model="searchForm.username"

          placeholder="请输入姓名"

          clearable

          @keyup.enter="fetchList"

        />

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



    <!-- 操作按钮 -->
    <div class="toolbar">

      <el-button type="primary" @click="openDialog('add')">

        <el-icon><Plus /></el-icon>新增用户

      </el-button>

      <el-button type="success" @click="openImportDialog">

        <el-icon><UploadFilled /></el-icon>导入用户

      </el-button>

      <el-button type="danger" :disabled="!multipleSelection.length" @click="handleBatchDelete">

        <el-icon><Delete /></el-icon>批量删除

      </el-button>

    </div>



    <!-- 用户列表 -->

    <el-table

      :data="userList"

      border

      style="width: 100%"

      @selection-change="handleSelectionChange"

      row-key="id"

    >

      <el-table-column type="selection" width="50" />

      <el-table-column prop="employeeId" label="工号" width="180" />

      <el-table-column prop="username" label="姓名" width="200" />
      <el-table-column prop="idCard" label="身份证号" width="200" />
      <el-table-column label="状态" width="120">

        <template #default="{ row }">

          <el-tag :type="row.is_active ? 'success' : 'danger'">

            {{ row.is_active ? '激活' : '锁定' }}

          </el-tag>

        </template>

      </el-table-column>

      <el-table-column label="角色" width="150">

        <template #default="{ row }">

          <el-tag :type="row.is_superuser ? 'warning' : 'info'">

            {{ row.is_superuser ? '超级管理员' : '普通用户' }}

          </el-tag>

        </template>

      </el-table-column>

      <el-table-column label="操作" fixed="right" width="620">

        <template #default="{ row }">

          <el-button size="small" type="primary" @click="openDialog('edit', row)">

            <el-icon><Edit /></el-icon>编辑

          </el-button>

          <el-button

            size="small"

            :type="row.is_active ? 'warning' : 'success'"

            @click="handleToggleActive(row)"

          >

            <el-icon><Lock /></el-icon>{{ row.is_active ? '锁定' : '激活' }}

          </el-button>

          <el-button

            size="small"

            :type="row.is_staff ? 'info' : 'primary'"

            @click="handleToggleStaff(row)"

          >

            <el-icon><User /></el-icon>{{ row.is_staff ? '取消普通管理员' : '设置为普通管理员' }}

          </el-button>

          <el-button

            size="small"

            :type="row.is_superuser ? 'info' : 'warning'"

            @click="handleToggleSuperuser(row)"

          >

            <el-icon><User /></el-icon>{{ row.is_superuser ? '取消超级管理员' : '设置为超级管理员' }}

          </el-button>

          <el-button size="small" type="info" @click="handleResetPassword(row)">

            <el-icon><Refresh /></el-icon>重置密码

          </el-button>

          <el-button size="small" type="danger" @click="handleDelete(row)">

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

      :page-sizes="[15, 30, 45, 100]"

      background

      @current-change="fetchList"

      @size-change="fetchList"

      class="pagination"

    />



    <!-- 新增/编辑用户 Dialog -->

    <el-dialog v-model="dialogVisible" :title="dialogTitle" width="600px" @close="resetDialog">

      <el-form :model="form" :rules="rules" ref="formRef" label-width="100px">

        <el-form-item label="工号" prop="employeeId">

          <el-input v-model="form.employeeId" placeholder="请输入工号" />

        </el-form-item>

        <el-form-item label="用户名" prop="username">
          <el-input v-model="form.username" placeholder="请输入用户名" />
        </el-form-item>
        <el-form-item label="身份证号" prop="idCard">
          <el-input v-model="form.idCard" placeholder="请输入身份证号" />
        </el-form-item>
<el-form-item label="邮箱" prop="email">

          <el-input v-model="form.email" placeholder="请输入邮箱（可选）" />

        </el-form-item>

        <el-form-item label="电话" prop="telephone">

          <el-input v-model="form.telephone" placeholder="请输入电话（可选）" />

        </el-form-item>

        <el-form-item label="密码" prop="password">

          <el-input

            v-model="form.password"

            type="text"

            :placeholder="dialogType === 'add' ? '默认密码为身份证号后8位' : '如需修改请输入新密码'"

            

          />

        </el-form-item>

        <el-form-item label="状态">

          <el-switch v-model="form.is_active" active-text="激活" inactive-text="锁定" />

        </el-form-item>

        <el-form-item label="超级管理员">

          <el-switch v-model="form.is_superuser" active-text="是" inactive-text="否" />

        </el-form-item>

      </el-form>

      <template #footer>

        <el-button @click="dialogVisible = false">

          <el-icon><Close /></el-icon>取消

        </el-button>

        <el-button type="primary" @click="handleSubmit">

          <el-icon><Check /></el-icon>保存

        </el-button>

      </template>

    </el-dialog>

    <!-- 导入用户 Dialog -->
    <el-dialog v-model="importDialogVisible" title="导入用户" width="500px">
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
          将文件拖到此处，或<em>点击上传</em>
        </div>
        <template #tip>
          <div class="el-upload__tip">
            只能上传 xlsx/xls 文件，文件名为 userlist.xlsx
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

import { ref, reactive, onMounted, watch } from 'vue'

import { ElMessage, ElMessageBox } from 'element-plus'

import {

  Plus,

  Edit,

  Delete,

  Refresh,

  UploadFilled,

  Search,

  Lock,

  User,

  Close,

  Check,

} from '@element-plus/icons-vue'

import userApi from '@/api/user/userApi'



const searchForm = reactive({

  employeeId: '',

  username: '',

})

const userList = ref([])

const multipleSelection = ref([])

const pagination = reactive({ pageNum: 1, pageSize: 15, total: 0 })

const dialogVisible = ref(false)

const dialogTitle = ref('')

const dialogType = ref('add')

const form = reactive({
  id: '',
  employeeId: '',
  username: '',
  idCard: '',
  email: '',
  telephone: '',
  password: '',
  is_active: true,
  is_staff: false,
  is_superuser: false,
})
const formRef = ref(null)

const rules = {
  employeeId: [{ required: true, message: '请输入工号', trigger: 'blur' }],
  username: [{ required: true, message: '请输入用户名', trigger: 'blur' }],
  idCard: [{ required: true, message: '请输入身份证号', trigger: 'blur' }],
  email: [{ type: 'email', message: '请输入正确的邮箱格式', trigger: 'blur' }],
}

// 导入相关
const importDialogVisible = ref(false)
const importLoading = ref(false)
const uploadRef = ref(null)
const excelFile = ref(null)
watch(
  () => form.idCard,
  (val) => {
    if (val && val.length >= 8) {
      form.password = val.slice(-8)
    } else {
      form.password = ''
    }
  },
)



// 获取用户列表

async function fetchList() {

  const params = {

    employeeId: searchForm.employeeId,

    username: searchForm.username,

    pageNum: pagination.pageNum,

    pageSize: pagination.pageSize,

  }

  try {

    const res = await userApi.getList(params)

    if (res.status === 200 && res.data) {

      userList.value = res.data.results || []

      pagination.total = res.data.count || 0

    } else {

      ElMessage.error(res.data?.message || '获取用户列表失败')

    }

  } catch (error) {

    console.error('获取用户列表失败:', error)

    ElMessage.error('获取用户列表失败')

  }

}



// 打开新增/编辑弹窗

function openDialog(type, row) {

  dialogType.value = type

  if (type === 'add') {

    dialogTitle.value = '新增用户'
    Object.assign(form, {
      id: '',
      employeeId: '',
      username: '',
      idCard: '',
      email: '',
      telephone: '',
      password: '',
      is_active: true,
      is_staff: false,

      is_superuser: false,

    })

    dialogVisible.value = true

  } else if (type === 'edit') {

    dialogTitle.value = '编辑用户'
    Object.assign(form, {
      ...row,
      password: '', // 编辑时密码默认为空
    })
    dialogVisible.value = true

  }

}



// 提交新增/编辑

async function handleSubmit() {

  await formRef.value.validate()
  let res
  const submitData = {
    employeeId: form.employeeId,
    username: form.username,
    idCard: form.idCard,
    email: form.email,
    telephone: form.telephone,
    is_active: form.is_active,
    is_staff: form.is_staff,
    is_superuser: form.is_superuser,

  }



  // 如果设置了密码，则添加密码字段

  if (form.password) {

    submitData.password = form.password

  }



  // 超级管理员自动设置is_staff

  if (form.is_superuser) {

    submitData.is_staff = true

  }



  if (dialogType.value === 'add') {

    res = await userApi.create(submitData)

    if (res && res.status === 201) {

      ElMessage.success('新增用户成功')

      dialogVisible.value = false

      fetchList()

    }

  } else {

    res = await userApi.update(form.id, submitData)

    if (res && res.status === 200) {

      ElMessage.success('编辑用户成功')

      dialogVisible.value = false

      fetchList()

    }

  }

}



// 切换用户激活状态

async function handleToggleActive(row) {

  const action = row.is_active ? '锁定' : '激活'

  ElMessageBox.confirm(`确定${action}该用户吗？`, '提示', { type: 'warning' }).then(

    async () => {

      const res = await userApi.toggleActive(row.id)

      if (res && res.data.code === 200) {

        ElMessage.success(res.data.message)

        fetchList()

      }

    },

  )

}



// 切换普通管理员（is_staff）

async function handleToggleStaff(row) {

  const action = row.is_staff ? '取消普通管理员资格' : '设置为普通管理员'

  ElMessageBox.confirm(`确定${action}吗？`, '提示', { type: 'warning' }).then(async () => {

    const res = await userApi.toggleStaff(row.id)

    if (res && res.data.code === 200) {

      ElMessage.success(res.data.message)

      fetchList()

    }

  })

}



// 切换用户超级管理员状态

async function handleToggleSuperuser(row) {

  const action = row.is_superuser ? '取消超级管理员' : '设置为超级管理员'

  ElMessageBox.confirm(`确定${action}吗？`, '提示', { type: 'warning' }).then(async () => {

    const res = await userApi.toggleSuperuser(row.id)

    if (res && res.data.code === 200) {

      ElMessage.success(res.data.message)

      fetchList()

    }

  })

}

// 删除单条

// 重置密码

async function handleResetPassword(row) {

  ElMessageBox.confirm('确认将该用户密码重置为身份证后8位吗？', '提示', { type: 'warning' }).then(

    async () => {

      const res = await userApi.resetPassword(row.id)

      if (res && res.data.code === 200) {

        ElMessage.success(res.data.message || '密码已重置为身份证后8位')

      }

    },

  )

}

function handleDelete(row) {

  ElMessageBox.confirm('确定要删除该用户吗？', '提示', { type: 'warning' }).then(async () => {

    const res = await userApi.delete(row.id)

    if (res && res.status === 204) {

      ElMessage.success('删除用户成功')

      fetchList()

    } else if (res && res.data.code === 400) {

      ElMessage.error(res.data.message)

    }

  })

}



// 批量删除

function handleBatchDelete() {

  if (!multipleSelection.value.length) return

  ElMessageBox.confirm('确定要批量删除选中的用户吗？', '提示', { type: 'warning' }).then(

    async () => {

      const ids = multipleSelection.value.map((item) => item.id)

      const res = await userApi.deleteChecked(ids)

      if (res && res.data.code === 200) {

        ElMessage.success(res.data.message)

        fetchList()

      } else if (res && res.data.code === 400) {

        ElMessage.error(res.data.message)

      }

    },

  )

}



// 选择项变化

function handleSelectionChange(val) {

  multipleSelection.value = val

}



// 重置搜索

function resetSearch() {

  searchForm.employeeId = ''

  searchForm.username = ''

  fetchList()

}

function resetDialog() {
  form.username = ''
  form.employeeId = ''
  form.idCard = ''
  form.email = ''
  form.telephone = ''
  form.password = ''
  form.is_active = true
  form.is_staff = false

  form.is_superuser = false

}

// 打开导入对话框
function openImportDialog() {
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

// 提交导入（高性能版本 - 直接上传Excel文件）
async function handleImportSubmit() {
  if (!excelFile.value) {
    ElMessage.warning('请先选择要上传的文件')
    return
  }

  importLoading.value = true

  try {
    // 直接上传Excel文件到后端
    const res = await userApi.importExcel(excelFile.value)

    if (res && res.data && res.data.code === 200) {
      ElMessage.success(res.data.message || '导入成功')

      // 如果有错误信息，显示详细错误
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
    console.error('导入用户失败:', error)
    const errorMsg = error.response?.data?.message || error.message || '导入失败，请检查文件格式'
    ElMessage.error(errorMsg)
  } finally {
    importLoading.value = false
  }
}



onMounted(() => {

  fetchList()

})

</script>



<style scoped>

.user-admin {

  padding: 10px 20px;

}

.toolbar {

  margin-bottom: 16px;

}

.search-form {

  margin-bottom: 16px;

}

.pagination {

  margin-top: 16px;

  text-align: right;

}

</style>

