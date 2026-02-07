<template>
  <div class="panel">
    <el-button type="primary" :icon="Plus" @click="openDialog()">新增年月</el-button>

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
    
      <el-table-column prop="year_month" label="时间" width="120" />
      <el-table-column prop="beizhu" style="width: 50%" label="备注" />

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
    <el-form ref="yearMonthForm" :model="formData" :rules="rules" label-width="110px">
      <el-form-item label="年份" prop="year">
        <el-input-number
          v-model="formData.year"
          :min="2000"
          :max="2100"
          placeholder="请输入年份"
          style="width: 100%"
        />
      </el-form-item>
      <el-form-item label="月份" prop="month">
        <el-input-number
          v-model="formData.month"
          :min="1"
          :max="12"
          placeholder="请输入月份"
          style="width: 100%"
        />
      </el-form-item>
      <el-form-item label="年月">
        <el-input
          :value="computedYearMonth"
          disabled
          placeholder="自动生成"
          style="width: 100%"
        />
      </el-form-item>
      <el-form-item label="备注">
        <el-input
          v-model="formData.beizhu"
          type="textarea"
          :rows="3"
          placeholder="请输入备注（可选）"
        />
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
import yearAndMonthAPI from '@/api/salary/yearAndMonthApi.js'

const dataList = ref([])
const dialogVisible = ref(false)
const yearMonthForm = ref()
const editingId = ref('')
const formData = reactive({
  year: new Date().getFullYear(),
  month: new Date().getMonth() + 1,
  beizhu: '',
})
const isEdit = computed(() => !!editingId.value)
const dialogTitle = computed(() => (isEdit.value ? '编辑年月' : '新增年月'))

// 计算年月字段
const computedYearMonth = computed(() => {
  if (formData.year && formData.month) {
    const monthStr = formData.month.toString().padStart(2, '0')
    return `${formData.year}-${monthStr}`
  }
  return ''
})

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
  year: [
    { required: true, message: '年份不可为空', trigger: 'blur' },
    { type: 'number', min: 2000, max: 2100, message: '年份范围为2000-2100', trigger: 'blur' }
  ],
  month: [
    { required: true, message: '月份不可为空', trigger: 'blur' },
    { type: 'number', min: 1, max: 12, message: '月份范围为1-12', trigger: 'blur' }
  ],
})

const fetchYearMonths = async () => {
  try {
    const res = await yearAndMonthAPI.getList()
    if (res.status === 200) {
      dataList.value = normalizeList(res.data)
    } else {
      throw new Error()
    }
  } catch (error) {
    ElMessage.error('获取年月列表失败')
  }
}

const resetForm = () => {
  formData.year = new Date().getFullYear()
  formData.month = new Date().getMonth() + 1
  formData.beizhu = ''
  yearMonthForm.value && yearMonthForm.value.clearValidate()
}

const openDialog = (row = null) => {
  if (row) {
    editingId.value = row.id
    formData.year = row.year
    formData.month = row.month
    formData.beizhu = row.beizhu || ''
  } else {
    editingId.value = ''
    resetForm()
  }
  dialogVisible.value = true
  yearMonthForm.value && yearMonthForm.value.clearValidate()
}

const handleCancel = () => {
  dialogVisible.value = false
  editingId.value = ''
  resetForm()
}

const handleSubmit = () => {
  yearMonthForm.value?.validate(async (valid) => {
    if (!valid) {
      return
    }
    const payload = {
      year: formData.year,
      month: formData.month,
      year_month: computedYearMonth.value,
      beizhu: formData.beizhu,
    }
    try {
      if (isEdit.value) {
        const res = await yearAndMonthAPI.update(editingId.value, payload)
        if (res.status === 200) {
          ElMessage.success('编辑成功')
          dialogVisible.value = false
          fetchYearMonths()
        } else {
          throw new Error()
        }
      } else {
        const res = await yearAndMonthAPI.create(payload)
        if (res.status === 201) {
          ElMessage.success('新增成功')
          dialogVisible.value = false
          fetchYearMonths()
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
  ElMessageBox.confirm('确定要删除该年月吗？', '提示', {
    confirmButtonText: '确定',
    cancelButtonText: '取消',
    type: 'warning',
  })
    .then(async () => {
      try {
        const res = await yearAndMonthAPI.delete(id)
        if (res.status === 204) {
          ElMessage.success('删除成功')
          fetchYearMonths()
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
  fetchYearMonths()
})
</script>

<style scoped></style>
