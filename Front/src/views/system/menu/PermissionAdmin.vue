<template>
  <div class="panel">
    <el-button type="primary" @click="openDialog('add')">新增权限</el-button>
    <el-table :data="permissionList" border style="margin-top: 20px; width: 100%">
      <el-table-column prop="name" label="权限名称" min-width="150" />
      <el-table-column prop="code" label="权限编码" min-width="150" />
      <el-table-column prop="desc" label="描述" min-width="200" />
      <el-table-column prop="type" label="类型" width="100">
        <template #default="scope">
          <el-tag v-if="scope.row.type === 'menu'" type="primary">菜单权限</el-tag>
          <el-tag v-else-if="scope.row.type === 'function'" type="success">功能权限</el-tag>
          <el-tag v-else type="info">其他</el-tag>
        </template>
      </el-table-column>
      <el-table-column prop="is_active" label="状态" width="80">
        <template #default="scope">
          <el-tag v-if="scope.row.is_active" type="success">启用</el-tag>
          <el-tag v-else type="danger">禁用</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="操作" width="200">
        <template #default="scope">
          <el-button size="small" type="primary" @click="openDialog('edit', scope.row)"
            >编辑</el-button
          >
          <el-button size="small" type="danger" @click="deletePermission(scope.row)"
            >删除</el-button
          >
        </template>
      </el-table-column>
    </el-table>
  </div>

  <!-- 权限表单弹窗 -->
  <el-dialog
    :title="dialogTitle"
    v-model="dialogVisible"
    width="500px"
    :close-on-click-modal="false"
  >
    <el-form :model="form" :rules="rules" ref="formRef" label-width="100px">
      <el-form-item label="权限名称" prop="name">
        <el-input v-model="form.name" placeholder="请输入权限名称" />
      </el-form-item>
      <el-form-item label="权限编码" prop="code">
        <el-input v-model="form.code" placeholder="请输入权限编码" />
      </el-form-item>
      <el-form-item label="权限类型" prop="type">
        <el-select v-model="form.type" placeholder="请选择权限类型">
          <el-option label="菜单权限" value="menu" />
          <el-option label="功能权限" value="function" />
          <el-option label="其他" value="other" />
        </el-select>
      </el-form-item>
      <el-form-item label="描述" prop="desc">
        <el-input v-model="form.desc" type="textarea" placeholder="请输入描述" />
      </el-form-item>
      <el-form-item label="状态" prop="is_active">
        <el-switch v-model="form.is_active" />
      </el-form-item>
    </el-form>
    <template #footer>
      <el-button @click="dialogVisible = false">取消</el-button>
      <el-button type="primary" @click="submitForm">确定</el-button>
    </template>
  </el-dialog>

  <!-- 权限统计 -->
  <div class="stats-panel">
    <el-row :gutter="20">
      <el-col :span="6">
        <el-card>
          <div class="stat-item">
            <div class="stat-number">{{ permissionList.length }}</div>
            <div class="stat-label">总权限数</div>
          </div>
        </el-card>
      </el-col>
      <el-col :span="6">
        <el-card>
          <div class="stat-item">
            <div class="stat-number">{{ activePermissions.length }}</div>
            <div class="stat-label">启用权限</div>
          </div>
        </el-card>
      </el-col>
      <el-col :span="6">
        <el-card>
          <div class="stat-item">
            <div class="stat-number">{{ menuPermissions.length }}</div>
            <div class="stat-label">菜单权限</div>
          </div>
        </el-card>
      </el-col>
      <el-col :span="6">
        <el-card>
          <div class="stat-item">
            <div class="stat-number">{{ functionPermissions.length }}</div>
            <div class="stat-label">功能权限</div>
          </div>
        </el-card>
      </el-col>
    </el-row>
  </div>
</template>

<script setup>
import { ref, reactive, computed, onMounted } from 'vue'
import { ElMessage, ElMessageBox } from 'element-plus'
import roleApi from '@/api/role/roleApi'

// 数据定义
const permissionList = ref([])

// 权限表单相关
const dialogVisible = ref(false)
const dialogTitle = ref('')
const formRef = ref()
const form = reactive({
  id: '',
  name: '',
  code: '',
  type: 'menu',
  desc: '',
  is_active: true,
})

const rules = {
  name: [{ required: true, message: '权限名称为必填', trigger: 'blur' }],
  code: [{ required: true, message: '权限编码为必填', trigger: 'blur' }],
  type: [{ required: true, message: '权限类型为必填', trigger: 'change' }],
}

// 计算属性
const activePermissions = computed(() => {
  return permissionList.value.filter((p) => p.is_active)
})

const menuPermissions = computed(() => {
  return permissionList.value.filter((p) => p.type === 'menu')
})

const functionPermissions = computed(() => {
  return permissionList.value.filter((p) => p.type === 'function')
})

// 获取权限列表
async function fetchPermissionList() {
  try {
    const res = await roleApi.getAllPermissions()
    if (res.status === 200) {
      permissionList.value = res.data
    }
  } catch (error) {
    console.error('获取权限列表失败', error)
    ElMessage.error('获取权限列表失败')
  }
}

// 打开权限表单弹窗
function openDialog(type, data = null) {
  if (type === 'add') {
    dialogTitle.value = '新增权限'
    Object.assign(form, { id: '', name: '', code: '', type: 'menu', desc: '', is_active: true })
  } else if (type === 'edit' && data) {
    dialogTitle.value = '编辑权限'
    Object.assign(form, { ...data })
  }
  dialogVisible.value = true
}

// 提交权限表单
function submitForm() {
  formRef.value.validate(async (valid) => {
    if (!valid) return

    // 这里需要根据你的权限API调整
    try {
      if (form.id) {
        // 编辑 - 需要实现权限更新API
        ElMessage.success('编辑成功')
        dialogVisible.value = false
        fetchPermissionList()
      } else {
        // 新增 - 需要实现权限创建API
        ElMessage.success('新增成功')
        dialogVisible.value = false
        fetchPermissionList()
      }
    } catch (error) {
      ElMessage.error('操作失败')
    }
  })
}

// 删除权限
function deletePermission(data) {
  ElMessageBox.confirm('确定要删除该权限吗？', '提示', {
    confirmButtonText: '确定',
    cancelButtonText: '取消',
    type: 'warning',
  })
    .then(async () => {
      // 这里需要实现权限删除API
      ElMessage.success('删除成功')
      fetchPermissionList()
    })
    .catch(() => {})
}

onMounted(() => {
  fetchPermissionList()
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

.stats-panel {
  margin-top: 20px;
}

.stat-item {
  text-align: center;
  padding: 20px;
}

.stat-number {
  font-size: 32px;
  font-weight: bold;
  color: #409eff;
  margin-bottom: 8px;
}

.stat-label {
  font-size: 14px;
  color: #666;
}
</style>
