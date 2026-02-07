
<template>
  <div class="panel">
    <el-button type="primary" :icon="Plus" @click="openDialog()">新增栏目组</el-button>

    <br /><br />
    <el-table
      :data="dataList"
      row-key="id"
      border
      style="width: 100%"
      :cell-style="{ textAlign: 'center' }"
      :header-cell-style="{ textAlign: 'center' }"
    >
      <el-table-column type="index" label="序号" width="80" />
      <el-table-column prop="name" label="名称" />
      <el-table-column label="操作" width="200" fixed="right">
        <template #default="scope">
          <el-button size="small" type="primary" @click="openDialog(scope.row)">编辑</el-button>
          <el-button size="small" type="danger" @click="handleDelete(scope.row.id)">删除</el-button>
        </template>
      </el-table-column>
    </el-table>
  </div>

  <el-dialog
    :title="dialogTitle"
    v-model="dialogVisible"
    width="460px"
    draggable
    :close-on-click-modal="false"
    @close="handleCancel"
  >
    <el-form ref="groupForm" :model="formData" :rules="rules" label-width="110px">
      <el-form-item label="栏目组名称" prop="name">
        <el-input v-model="formData.name" placeholder="请输入栏目组名称" />
      </el-form-item>
    </el-form>
    <template #footer>
      <div class="dialog-footer">
        <el-button type="primary" :icon="Edit" @click="handleSubmit">确定</el-button>
        <el-button :icon="Delete" @click="handleCancel">取消</el-button>
      </div>
    </template>
  </el-dialog>
</template>

<script setup>
import { ref, reactive, computed, onMounted } from 'vue'
import { ElMessage, ElMessageBox } from 'element-plus'
import { Plus, Delete, Edit } from '@element-plus/icons-vue'
import categoryGroupAPI from '@/api/news/categoryGroup.js'

const dataList = ref([])
const dialogVisible = ref(false)
const groupForm = ref()
const editingId = ref('')
const formData = reactive({
  name: '',
})
const isEdit = computed(() => !!editingId.value)
const dialogTitle = computed(() => (isEdit.value ? '编辑栏目组' : '新增栏目组'))

// 兼容不同接口返回结构，确保表格始终能拿到数组数据
const normalizeList = (payload) => {
  if (Array.isArray(payload)) {
    return payload
  }
  if (payload && Array.isArray(payload.results)) {
    return payload.results
  }
  if (payload && Array.isArray(payload.data)) {
    return payload.data
  }
  return []
}

const rules = reactive({
  name: [{ required: true, message: '栏目组名称不可为空', trigger: 'blur' }],
})

const fetchGroups = async () => {
  try {
    const res = await categoryGroupAPI.getList()
    if (res.status === 200) {

      dataList.value = normalizeList(res.data)
    } else {
      throw new Error()
    }
  } catch (error) {
    ElMessage.error('获取栏目组失败')
  }
}

const resetForm = () => {
  formData.name = ''
  groupForm.value && groupForm.value.clearValidate()
}

const openDialog = (row = null) => {
  if (row) {
    editingId.value = row.id
    formData.name = row.name
  } else {
    editingId.value = ''
    resetForm()
  }
  dialogVisible.value = true
  groupForm.value && groupForm.value.clearValidate()
}

const handleCancel = () => {
  dialogVisible.value = false
  editingId.value = ''
  resetForm()
}

const handleSubmit = () => {
  groupForm.value?.validate(async (valid) => {
    if (!valid) {
      return
    }
    const payload = {
      name: formData.name,
    }
    try {
      if (isEdit.value) {
        const res = await categoryGroupAPI.update(editingId.value, payload)
        if (res.status === 200) {
          ElMessage.success('编辑成功')
          dialogVisible.value = false
          fetchGroups()
        } else {
          throw new Error()
        }
      } else {
        const res = await categoryGroupAPI.create(payload)
        if (res.status === 201) {
          ElMessage.success('新增成功')
          dialogVisible.value = false
          fetchGroups()
        } else {
          throw new Error()
        }
      }
    } catch (error) {
      ElMessage.error(isEdit.value ? '编辑失败' : '新增失败')
    }
  })
}

const handleDelete = (id) => {
  ElMessageBox.confirm('确定要删除该栏目组吗？', '提示', {
    confirmButtonText: '确定',
    cancelButtonText: '取消',
    type: 'warning',
  })
    .then(async () => {
      try {
        const res = await categoryGroupAPI.delete(id)
        if (res.status === 204) {
          ElMessage.success('删除成功')
          fetchGroups()
        } else {
          throw new Error()
        }
      } catch (error) {
        ElMessage.error('删除失败')
      }
    })
    .catch(() => {})
}

onMounted(() => {
  fetchGroups()
})
</script>

<style scoped></style>
