<template>
  <div class="panel menu-admin-panel">
    <el-button type="primary" @click="openDialog('add')">新增菜单</el-button>
    <el-table
      ref="menuTableRef"
      :data="menuTree"
      row-key="id"
      border
      style="margin-top: 20px; width: 100%"
      :tree-props="{ children: 'children', hasChildren: 'hasChildren' }"
      :indent="40"
    >
     
      <el-table-column prop="title" label="菜单名称" width="200">
        <template #default="scope">
          <span
            class="menu-title-cell"
            :class="{ 'is-expandable': hasChildMenus(scope.row) }"
            @click.stop="handleMenuTitleClick(scope.row)"
          >
            {{ scope.row.title }}
          </span>
        </template>
      </el-table-column>   
      <el-table-column label="前端路由路径" >
        <template #default="scope">
          <el-tag type="success">{{ scope.row.path }}</el-tag>
        </template>
      </el-table-column>
     
      
      <el-table-column prop="order" label="排序" width="100" />
      <el-table-column prop="icon" label="图标" width="100">
        <template #default="scope">
          <el-icon v-if="scope.row.icon">
            <component :is="iconComponents[scope.row.icon]" />
          </el-icon>
        </template>
      </el-table-column>
   
      <el-table-column label="操作" >
        <template #default="scope">
          <el-button size="small" type="primary" @click.stop="openDialog('edit', scope.row)"
            >编辑</el-button
          >
          <el-button size="small" type="danger" @click.stop="deleteMenu(scope.row)">删除</el-button>
        </template>
      </el-table-column>
    </el-table>
  </div>

  <el-dialog
    :title="dialogTitle"
    v-model="dialogVisible"
    width="700px"
    :close-on-click-modal="false"
  >
    <el-form :model="form" :rules="rules" ref="formRef" label-width="120px">
      <el-form-item label="名称" prop="title" class="form-item-no-wrap">
        <el-input v-model="form.title" placeholder="请输入菜单名称" />
      </el-form-item>
      <el-form-item label="前端路由路径" prop="path" class="form-item-no-wrap">
        <el-input v-model="form.path" placeholder="请输入前端路由路径" />
      </el-form-item>
  
      <el-form-item label="排序" prop="order" class="form-item-no-wrap">
        <el-input-number
          v-model="form.order"
          :min="0"
          :precision="0"
          :controls="true"
          placeholder="请输入排序"
        />
      </el-form-item>
      <el-form-item label="meta_id" prop="meta_id" class="form-item-no-wrap">
        <el-input-number
          v-model="form.meta_id"
          :min="0"
          :precision="0"
          :controls="true"
          placeholder="请输入 meta_id"
        />
      </el-form-item>
      <el-form-item label="图标" prop="icon" class="form-item-no-wrap">
        <el-select v-model="form.icon" placeholder="请选择图标" clearable filterable>
          <el-option
            v-for="item in iconOptions"
            :key="item.name"
            :label="item.name"
            :value="item.name"
          >
            <el-icon><component :is="item.component" /></el-icon>
            <span style="margin-left: 8px">{{ item.name }}</span>
          </el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="父级菜单" prop="parent" class="form-item-no-wrap">
        <el-select v-model="parentSelectValue" placeholder="请选择父级菜单" clearable filterable>
          <el-option :key="ROOT_PARENT" label="无父级（顶级菜单）" :value="ROOT_PARENT" />
          <el-option
            v-for="item in flatMenuList"
            :key="item.id"
            :label="item.label"
            :value="item.id"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="是否可关闭" prop="closable" class="form-item-no-wrap">
        <el-switch v-model="form.closable" />
      </el-form-item>
      <el-form-item label="菜单描述" prop="describe" class="form-item-no-wrap">
        <el-input v-model="form.describe" placeholder="请输入菜单描述" />
      </el-form-item>
    </el-form>
    <template #footer>
      <el-button @click="dialogVisible = false">取消</el-button>
      <el-button type="primary" @click="submitForm">确定</el-button>
    </template>
  </el-dialog>
</template>

<script setup>
import { ref, reactive, onMounted, watch, computed } from 'vue'
import { ElMessage, ElMessageBox } from 'element-plus'
import menuApi from '@/api/menu/menuApi'
import * as ElementPlusIconsVue from '@element-plus/icons-vue'

const menuTree = ref([])
const flatMenuList = ref([])
const ROOT_PARENT = '__ROOT__'
const parentSelectValue = ref(ROOT_PARENT)
const iconComponents = ElementPlusIconsVue
const iconOptions = computed(() =>
  Object.entries(ElementPlusIconsVue).map(([name, component]) => ({
    name,
    component,
  })),
)
const menuTableRef = ref(null)

const dialogVisible = ref(false)
const dialogTitle = ref('')
const formRef = ref()
const form = reactive({
  id: '',
  title: '',
  path: '',
  order: 0,
  icon: '',
  parent: null,
  closable: true,
  meta_id: 0,
  describe: '',
})
const rules = {
  title: [{ required: true, message: '名称为必填项', trigger: 'blur' }],
  path: [{ required: true, message: '前端路由路径为必填项', trigger: 'blur' }],
  order: [{ required: true, message: '排序为必填项', trigger: 'blur' }],
  meta_id: [{ required: true, message: '菜单 meta_id 为必填项', trigger: 'blur' }],
}

// 打开新增/编辑弹窗
function openDialog(type, data = null) {
  if (type === 'add') {
    dialogTitle.value = '新增菜单'
    Object.assign(form, {
      id: '',
      title: '',
      path: '',    
      order: 0,
      icon: '',
      parent: null,
      closable: true,
      meta_id: 0,
      describe: '',
    })
    // 确保数字字段类型正确
    form.order = 0
    form.meta_id = 0
  } else if (type === 'edit' && data) {
    dialogTitle.value = '编辑菜单'
    Object.assign(form, { ...data })
    // 确保数字字段类型正确
    form.order = Number(data.order) || 0
    form.meta_id = Number(data.meta_id) || 0
    form.parent = data.parent || null
  }
  parentSelectValue.value = form.parent ?? ROOT_PARENT
  dialogVisible.value = true
}

// 提交表单（新增 / 编辑）
function submitForm() {
  formRef.value.validate(async (valid) => {
    if (!valid) return
    if (form.id) {
      // 编辑
      const res = await menuApi.update(form.id, form)
      if (res.status === 200) {
        ElMessage.success('编辑成功')
        dialogVisible.value = false
        fetchMenus()
      } else {
        ElMessage.error('编辑失败')
      }
    } else {
      // 新增
      const { id, ...createData } = form
      const res = await menuApi.create(createData)
      if (res.status === 201) {
        ElMessage.success('新增成功')
        dialogVisible.value = false
        fetchMenus()
      } else {
        ElMessage.error('新增失败')
      }
    }
  })
}

// 删除菜单
function deleteMenu(data) {
  ElMessageBox.confirm('确定要删除该菜单吗？', '提示', {
    confirmButtonText: '确定',
    cancelButtonText: '取消',
    type: 'warning',
  })
    .then(async () => {
      const res = await menuApi.delete(data.id)
      if (res.status === 204) {
        ElMessage.success('删除成功')
        fetchMenus()
      } else {
        ElMessage.error('删除失败')
      }
    })
    .catch(() => {})
}



// 获取菜单列表
async function fetchMenus() {
  const res = await menuApi.getList()

  if (res.status === 200) {
    menuTree.value = res.data
    flatMenuList.value = flatten(res.data)
  }
}

// 扁平化菜单列表用于父级下拉选择
function flatten(list, depth = 0) {
  let arr = []
  list.forEach((item) => {
    arr.push({
      id: item.id,
      title: item.title,
      label: `${depth ? '  '.repeat(depth) + '|-- ' : ''}${item.title}`,
    })
    if (item.children && item.children.length) {
      arr = arr.concat(flatten(item.children, depth + 1))
    }
  })
  return arr
}

// 判断父子层级，避免给叶子节点设置无意义的点击
function hasChildMenus(row) {
  return Array.isArray(row?.children) && row.children.length > 0
}

// 点击菜单标题时同步切换展开/折叠
function handleMenuTitleClick(row) {
  if (!hasChildMenus(row) || !menuTableRef.value) return
  menuTableRef.value.toggleRowExpansion(row)
}

watch(parentSelectValue, (val) => {
  if (val === ROOT_PARENT || val === undefined || val === null || val === '') {
    form.parent = null
    parentSelectValue.value = ROOT_PARENT
  } else {
    form.parent = val
  }
})

onMounted(() => {
  fetchMenus()
})
</script>

<style scoped>
.panel {
  padding: 20px;
  background: #fff;
  border-radius: 8px;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
  margin-bottom: 20px;
}

.menu-admin-panel {
  max-height: calc(100vh - 160px);
  overflow-y: auto;
}

.menu-title-cell {
  display: inline-flex;
  align-items: center;
  line-height: 1.4;
  color: #606266;
}

.menu-title-cell.is-expandable {
  cursor: pointer;
  color: #409eff;
}

.menu-title-cell.is-expandable:hover {
  text-decoration: underline;
}

/* 防止表单项标签文字换行 */
.form-item-no-wrap :deep(.el-form-item__label) {
  white-space: nowrap;
  word-break: keep-all;
  overflow: hidden;
  text-overflow: ellipsis;
}

/* 确保标签有足够的宽度 */
.form-item-no-wrap :deep(.el-form-item__label) {
  min-width: 120px;
  flex-shrink: 0;
}
</style>


