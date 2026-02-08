<template>
  <div class="panel">
    <!-- 操作按钮区 -->
    <div class="toolbar">
      <el-button type="primary" @click="openDialog('add')">
        <el-icon><Plus /></el-icon>
        新增职称分类
      </el-button>
      <el-button type="danger" :disabled="selectedIds.length === 0" @click="batchDelete">
        <el-icon><Delete /></el-icon>
        批量删除
      </el-button>
      <el-button @click="fetchCategories">
        <el-icon><Refresh /></el-icon>
        刷新
      </el-button>
    </div>

    <!-- 搜索区 -->
    <div class="search-bar">
      <el-input
        v-model="searchName"
        placeholder="搜索分类名称"
        clearable
        style="width: 300px; margin-right: 10px"
        @clear="handleSearch"
        @keyup.enter="handleSearch"
      >
        <template #prefix>
          <el-icon><Search /></el-icon>
        </template>
      </el-input>
      <el-select
        v-model="searchStatus"
        placeholder="状态"
        clearable
        style="width: 150px; margin-right: 10px"
        @change="handleSearch"
      >
        <el-option label="启用" :value="'true'" />
        <el-option label="禁用" :value="'false'" />
      </el-select>
      <el-button type="primary" @click="handleSearch">
        <el-icon><Search /></el-icon>
        搜索
      </el-button>
    </div>

    <!-- 职称分类树形表格 -->
    <el-table
      :data="categoryTree"
      row-key="id"
      border
      default-expand-all
      style="margin-top: 20px; width: 100%"
      :tree-props="{ children: 'children', hasChildren: 'hasChildren' }"
      :indent="40"
      :header-cell-style="{ textAlign: 'center' }"
      :row-class-name="rowClassName"
      @selection-change="handleSelectionChange"
    >
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column type="index" label="序号" width="80" align="center" />
      <el-table-column prop="name" label="分类名称" min-width="200">
        <template #default="{ row }">
          <span class="category-name">{{ row.name }}</span>
        </template>
      </el-table-column>
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
      <el-table-column label="状态" width="100" align="center">
        <template #default="{ row }">
          <el-tag :type="row.is_active ? 'success' : 'danger'" size="small">
            {{ row.is_active ? '启用' : '禁用' }}
          </el-tag>
        </template>
      </el-table-column>
      <el-table-column prop="title_count" label="职称数" width="100" align="center">
        <template #default="{ row }">
          <el-tag type="info" size="small">{{ row.title_count }}</el-tag>
        </template>
      </el-table-column>
      <el-table-column prop="description" label="描述" min-width="180" show-overflow-tooltip />
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
            size="small"
            :type="scope.row.is_active ? 'warning' : 'success'"
            @click.stop="toggleStatus(scope.row)"
          >
            {{ scope.row.is_active ? '禁用' : '启用' }}
          </el-button>
          <el-button
            size="small"
            type="danger"
            @click.stop="deleteCategory(scope.row)"
          >
            删除
          </el-button>
        </template>
      </el-table-column>
    </el-table>
  </div>

  <!-- 新增/编辑对话框 -->
  <el-dialog
    :title="dialogTitle"
    v-model="dialogVisible"
    width="600px"
    :close-on-click-modal="false"
  >
    <el-form :model="form" :rules="rules" ref="formRef" label-width="100px">
      <el-form-item label="分类名称" prop="name">
        <el-input
          v-model="form.name"
          placeholder="请输入分类名称"
          clearable
          maxlength="100"
          show-word-limit
        />
      </el-form-item>
      <el-form-item label="上级分类" prop="parent">
        <el-tree-select
          v-model="form.parent"
          :data="categoryTreeOptions"
          placeholder="请选择上级分类（不选则为顶级分类）"
          clearable
          filterable
          check-strictly
          :render-after-expand="false"
          style="width: 100%"
        />
      </el-form-item>
      <el-form-item label="排序" prop="order">
        <el-input-number
          v-model="form.order"
          :min="0"
          :max="9999"
          controls-position="right"
          style="width: 100%"
        />
      </el-form-item>
      <el-form-item label="状态" prop="is_active">
        <el-switch
          v-model="form.is_active"
          active-text="启用"
          inactive-text="禁用"
        />
      </el-form-item>
      <el-form-item label="描述" prop="description">
        <el-input
          v-model="form.description"
          type="textarea"
          placeholder="请输入分类描述"
          :rows="4"
          maxlength="300"
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
</template>

<script setup>
import { ref, reactive, onMounted, computed } from 'vue'
import { ElMessage, ElMessageBox } from 'element-plus'
import { Plus, Delete, Refresh, Search } from '@element-plus/icons-vue'
import titleCategoryApi from '@/api/user/titleCategoryApi'
import 'element-plus/dist/index.css'

// 数据
const categoryTree = ref([])
const flatCategoryList = ref([])
const selectedIds = ref([])
const searchName = ref('')
const searchStatus = ref('')

// 对话框
const dialogVisible = ref(false)
const dialogTitle = ref('')
const submitLoading = ref(false)
const formRef = ref()

// 表单数据
const form = reactive({
  id: '',
  name: '',
  parent: null,
  order: 0,
  is_active: true,
  description: '',
})

// 表单验证规则
const rules = {
  name: [
    { required: true, message: '分类名称为必填项', trigger: 'blur' },
    { min: 2, max: 100, message: '长度在 2 到 100 个字符', trigger: 'blur' },
  ],
  order: [{ required: true, message: '排序为必填项', trigger: 'blur' }],
}

// 计算属性：树形选择器数据
const categoryTreeOptions = computed(() => {
  return buildTreeSelectOptions(categoryTree.value, form.id)
})

/**
 * 构建树形选择器数据（排除当前编辑的分类及其子分类）
 */
function buildTreeSelectOptions(list, excludeId = null) {
  const options = []
  for (const item of list) {
    if (item.id === excludeId) {
      continue // 排除当前编辑的分类
    }
    const option = {
      value: item.id,
      label: item.name,
      children: item.children ? buildTreeSelectOptions(item.children, excludeId) : [],
    }
    options.push(option)
  }
  return options
}

/**
 * 获取职称分类列表
 */
const fetchCategories = async () => {
  try {
    const params = {}
    if (searchName.value) {
      params.name = searchName.value
    }
    if (searchStatus.value !== '') {
      params.is_active = searchStatus.value === 'true'
    }

    const res = await titleCategoryApi.getList(params)
    if (res.status === 200) {
      // 如果有搜索条件，返回的是扁平列表，需要构建树形结构
      const data = res.data.results || res.data
      if (searchName.value || searchStatus.value !== '') {
        // 有搜索条件时，显示扁平列表
        categoryTree.value = data
      } else {
        // 无搜索条件时，获取树形结构
        const treeRes = await titleCategoryApi.getTree()
        if (treeRes.status === 200 && treeRes.data.code === 200) {
          categoryTree.value = treeRes.data.data
        } else {
          categoryTree.value = buildTree(data)
        }
      }
      flatCategoryList.value = flatten(categoryTree.value)
    }
  } catch (error) {
    console.error('获取职称分类列表失败:', error)
    ElMessage.error('获取职称分类列表失败')
  }
}

/**
 * 构建树形结构
 */
function buildTree(list, parentId = null) {
  const tree = []
  for (const item of list) {
    if (item.parent === parentId) {
      const children = buildTree(list, item.id)
      if (children.length > 0) {
        item.children = children
      }
      tree.push(item)
    }
  }
  return tree
}

/**
 * 扁平化分类列表
 */
function flatten(list) {
  let arr = []
  list.forEach((item) => {
    arr.push({
      id: item.id,
      name: item.name,
      title_count: item.title_count,
      is_active: item.is_active,
      parent: item.parent,
      order: item.order,
      description: item.description
    })
    if (item.children && item.children.length) {
      arr = arr.concat(flatten(item.children))
    }
  })
  return arr
}

/**
 * 搜索处理
 */
const handleSearch = () => {
  fetchCategories()
}

/**
 * 表格行类名
 */
const rowClassName = ({ row }) => {
  return row.parent ? 'category-child-row' : 'category-parent-row'
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
  if (type === 'add') {
    dialogTitle.value = '新增职称分类'
    Object.assign(form, {
      id: '',
      name: '',
      parent: null,
      order: 0,
      is_active: true,
      description: '',
    })
  } else if (type === 'edit' && data) {
    dialogTitle.value = '编辑职称分类'
    Object.assign(form, {
      id: data.id,
      name: data.name,
      parent: data.parent || null,
      order: data.order,
      is_active: data.is_active,
      description: data.description || '',
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
        name: form.name,
        parent: form.parent || null,
        order: form.order,
        is_active: form.is_active,
        description: form.description || '',
      }

      if (form.id) {
        // 编辑
        const res = await titleCategoryApi.update(form.id, submitData)
        if (res.status === 200) {
          ElMessage.success('编辑成功')
          dialogVisible.value = false
          fetchCategories()
        } else {
          ElMessage.error(res.data.message || '编辑失败')
        }
      } else {
        // 新增
        const res = await titleCategoryApi.create(submitData)
        if (res.status === 201) {
          ElMessage.success('新增成功')
          dialogVisible.value = false
          fetchCategories()
        } else {
          ElMessage.error(res.data.message || '新增失败')
        }
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
 * 切换状态
 */
const toggleStatus = async (row) => {
  try {
    const res = await titleCategoryApi.toggleActive(row.id)
    if (res.status === 200 && res.data.code === 200) {
      ElMessage.success(res.data.message)
      fetchCategories()
    } else {
      ElMessage.error(res.data.message || '操作失败')
    }
  } catch (error) {
    console.error('切换状态失败:', error)
    ElMessage.error('操作失败')
  }
}

/**
 * 删除职称分类
 */
const deleteCategory = (row) => {
  ElMessageBox.confirm(
    `确定要删除职称分类"${row.name}"吗？如果该分类有子分类，将无法删除。`,
    '提示',
    {
      confirmButtonText: '确定',
      cancelButtonText: '取消',
      type: 'warning',
    }
  )
    .then(async () => {
      try {
        const res = await titleCategoryApi.delete(row.id)
        if (res.status === 200 && res.data.code === 200) {
          ElMessage.success('删除成功')
          fetchCategories()
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
    ElMessage.warning('请选择要删除的职称分类')
    return
  }

  ElMessageBox.confirm(
    `确定要删除选中的 ${selectedIds.value.length} 个职称分类吗？`,
    '提示',
    {
      confirmButtonText: '确定',
      cancelButtonText: '取消',
      type: 'warning',
    }
  )
    .then(async () => {
      try {
        const res = await titleCategoryApi.deleteChecked(selectedIds.value)
        if (res.status === 200 && res.data.code === 200) {
          ElMessage.success(res.data.message)
          selectedIds.value = []
          fetchCategories()
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
 * 更新排序
 */
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
      try {
        const res = await titleCategoryApi.patch(row.id, { order: newOrder })
        if (res.status === 200) {
          ElMessage.success('排序更新成功')
          fetchCategories()
        } else {
          ElMessage.error('排序更新失败')
        }
      } catch (error) {
        console.error('排序更新失败:', error)
        ElMessage.error('排序更新失败')
      }
    })
    .catch(() => {})
}

// 组件挂载时获取数据
onMounted(() => {
  fetchCategories()
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

.category-name {
  font-weight: 500;
  color: #303133;
}

.order-value {
  display: inline-block;
  min-width: 32px;
  margin-right: 6px;
  font-weight: 500;
}

:deep(.category-parent-row) .el-table__cell {
  background-color: #f5f7fa !important;
  font-weight: 500;
}

:deep(.category-parent-row) .el-table__cell:last-child {
  background-color: #ffffff !important;
}

:deep(.category-child-row) .el-table__cell {
  background-color: #fafafa !important;
}

:deep(.category-child-row) .el-table__cell:last-child {
  background-color: #ffffff !important;
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
