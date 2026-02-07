<template>
    <div class="panel">
      <el-button type="primary" @click="openDialog('add')">新增分类</el-button>
      <el-table
        :data="categoryTree"
        row-key="uuid"
        border
        default-expand-all
        style="margin-top: 20px; width: 100%"
        :tree-props="{ children: 'children', hasChildren: 'hasChildren' }"
        :indent="40"
        :header-cell-style="{textAlign: 'center'}"
        :row-class-name="rowClassName"
      >
        <el-table-column type="index" label="序号" width="80" align="center" />
        <el-table-column prop="name" label="名称" min-width="180" />
        <el-table-column prop="order" label="排序" width="120" align="center">
          <template #default="scope">
            <span class="order-value">{{ scope.row.order }}</span>
            <el-button
              text
              type="primary"
              size="small"
              @click.stop="handleUpdateOrder(scope.row)"
            >
              排序
            </el-button>
          </template>
        </el-table-column>
        <el-table-column label="栏目组" min-width="200" align="center">
          <template #default="{ row }">
            <el-tag
              v-if="getGroupName(row.group)"
              size="small"
              effect="plain"
              type="info"
            >
              {{ getGroupName(row.group) }}
            </el-tag>
            <span v-else>-</span>
          </template>
        </el-table-column>
        <el-table-column label="操作" width="180" align="center">
          <template #default="scope">
            <el-button size="small" type="primary" @click.stop="openDialog('edit', scope.row)"
              >编辑</el-button
            >
            <el-button size="small" type="danger" @click.stop="deleteCategory(scope.row)"
              >删除</el-button
            >
          </template> 
        </el-table-column>
      </el-table>
    </div>
  
    <el-dialog
      :title="dialogTitle"
      v-model="dialogVisible"
      width="500px"
      :close-on-click-modal="false"
    >
      <el-form :model="form" :rules="rules" ref="formRef" label-width="100px">
        <el-form-item label="名称" prop="name">
          <el-input v-model="form.name" placeholder="请输入分类名称" />
        </el-form-item>
        <el-form-item label="排序" prop="order">
          <el-input-number v-model="form.order" :min="0" />
        </el-form-item>
        <el-form-item label="描述" prop="desc">
          <el-input v-model="form.desc" type="textarea" placeholder="请输入描述" />
        </el-form-item>
        <el-form-item label="父级分类" prop="parent">
          <el-select v-model="form.parent" placeholder="请选择父级分类" clearable filterable>
            <el-option :key="''" :label="'无父级（顶级分类）'" :value="''" />
            <el-option
              v-for="item in flatCategoryList"
              :key="item.uuid"
              :label="item.name"
              :value="item.uuid"
            />
          </el-select>
        </el-form-item>
        <el-form-item label="栏目组" prop="group">
          <el-select v-model="form.group" placeholder="请选择栏目组" clearable filterable>
            <el-option
              v-for="group in categoryGroups"
              :key="group.id"
              :label="group.name"
              :value="group.id"
            />
          </el-select>
        </el-form-item>
      </el-form>
      <template #footer>
        <el-button @click="dialogVisible = false">取消</el-button>
        <el-button type="primary" @click="submitForm">确定</el-button>
      </template>
    </el-dialog>
  </template>
  
  <script setup>
  import { ref, reactive, onMounted, computed } from 'vue'
  import { ElMessage, ElMessageBox } from 'element-plus'
  import categoryApi from '@/api/news/categoriesApi'
  import categoryGroupAPI from '@/api/news/categoryGroup.js'
  import 'element-plus/dist/index.css'
  
  const categoryTree = ref([])
  const flatCategoryList = ref([])
  const categoryGroups = ref([])
  const groupNameMap = computed(() => {
    const map = {}
    categoryGroups.value.forEach((group) => {
      map[group.id] = group.name
    })
    return map
  })
  
  const dialogVisible = ref(false)
  const dialogTitle = ref('')
  const formRef = ref()
  const form = reactive({
    uuid: '',
    name: '',
    order: 0,
    desc: '',
    parent: '',
    group: '',
  })
  const rules = {
    name: [{ required: true, message: '名称为必填', trigger: 'blur' }],
    order: [{ required: true, message: '排序为必填', trigger: 'blur' }],
    group: [{ required: true, message: '栏目组为必填项', trigger: 'change' }],
  }
  
  const normalizeGroupValue = (value) => {
    if (value === undefined || value === null || value === '') {
      return ''
    }
    if (typeof value === 'object') {
      if ('id' in value) {
        return value.id
      }
      if ('uuid' in value) {
        return value.uuid
      }
    }
    return value
  }
  
  const getGroupName = (value) => {
    if (value === undefined || value === null || value === '') {
      return ''
    }
    if (typeof value === 'object') {
      return value.name || ''
    }
    if (groupNameMap.value[value]) {
      return groupNameMap.value[value]
    }
    if (typeof value === 'string') {
      return value
    }
    return ''
  }

  const fetchCategoryGroups = async () => {
    try {
      const res = await categoryGroupAPI.getList()
      if (res.status === 200) {
        const payload = res.data
        if (Array.isArray(payload)) {
          categoryGroups.value = payload
        } else if (payload && Array.isArray(payload.results)) {
          categoryGroups.value = payload.results
        } else if (payload && Array.isArray(payload.data)) {
          categoryGroups.value = payload.data
        } else {
          categoryGroups.value = []
        }
      } else {
        throw new Error()
      }
    } catch (error) {
      categoryGroups.value = []
      ElMessage.error('获取栏目组失败')
    }
  }
  
  const openDialog = (type, data = null) => {
    if (type === 'add') {
      dialogTitle.value = '新增分类'
      Object.assign(form, { uuid: '', name: '', order: 0, desc: '', parent: '', group: '' })
    } else if (type === 'edit' && data) {
      dialogTitle.value = '编辑分类'
      Object.assign(form, { ...data })
      form.parent = data.parent || ''
      form.group = normalizeGroupValue(data.group)
    }
    dialogVisible.value = true
  }
  
  const submitForm = () => {
    formRef.value.validate(async (valid) => {
      if (!valid) return

      // 将空字符串转换为 null，因为后端期望 parent 为 null 或 uuid
      const submitData = {
        ...form,
        parent: form.parent || null,
        group: normalizeGroupValue(form.group) || null,
      }

      if (form.uuid) {
        // 编辑
      
        const res = await categoryApi.update(form.uuid, submitData)
        if (res.status === 200) {
          ElMessage.success('编辑成功')
          dialogVisible.value = false
          fetchCategories()
        } else {
          ElMessage.error('编辑失败')
        }
      } else {
        // 新增
        // 构造不带 uuid 的对象
        const { uuid, ...createData } = submitData
        const res = await categoryApi.create(createData)
        if (res.status === 201) {
          ElMessage.success('新增成功')
          dialogVisible.value = false
          fetchCategories()
        } else {
          ElMessage.error('新增失败')
        }
      }
    })
  }
  
  const deleteCategory = (data) => {
    ElMessageBox.confirm('确定要删除该分类吗？', '提示', {
      confirmButtonText: '确定',
      cancelButtonText: '取消',
      type: 'warning',
    })
      .then(async () => {
        const res = await categoryApi.delete(data.uuid)
        if (res.status === 204) {
          ElMessage.success('删除成功')
          fetchCategories()
        } else {
          ElMessage.error('删除失败')
        }
      })
      .catch(() => {})
  }
  
  const fetchCategories = async () => {
    const res = await categoryApi.getList()
    if (res.status === 200) {
      categoryTree.value = res.data
      flatCategoryList.value = flatten(res.data)
    }
  }

  const rowClassName = ({ row }) => {
    return row.parent ? 'category-child-row' : 'category-parent-row'
  }

  const handleUpdateOrder = (row) => {
    ElMessageBox.prompt('请输入新的排序值', '调整排序', {
      confirmButtonText: '确定',
      cancelButtonText: '取消',
      inputValue: row.order,
      inputPattern: /^\d+$/,
      inputErrorMessage: '请输入非负整数',
    })
      .then(async ({ value }) => {
        const newOrder = Number(value)
        if (Number.isNaN(newOrder)) {
          ElMessage.error('请输入有效的数字')
          return
        }
        const res = await categoryApi.update(row.uuid, { order: newOrder })
        if (res.status === 200) {
          ElMessage.success('排序更新成功')
          fetchCategories()
        } else {
          ElMessage.error('排序更新失败')
        }
      })
      .catch(() => {})
  }
  
  // 扁平化分类列表用于父级下拉选择
  function flatten(list) {
    let arr = []
    list.forEach((item) => {
      arr.push({ uuid: item.uuid, name: item.name })
      if (item.children && item.children.length) {
        arr = arr.concat(flatten(item.children))
      }
    })
    return arr
  }
  
  onMounted(() => {
    fetchCategories()
    fetchCategoryGroups()
  })
</script>

<style scoped>
.order-value {
  display: inline-block;
  min-width: 32px;
  margin-right: 6px;
}
:deep(.category-parent-row) .el-table__cell {
  background-color: #f5f5f5 !important;
}
:deep(.category-child-row) .el-table__cell {
  background-color: #eefaf0 !important;
}
</style>
