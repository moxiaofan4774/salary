<template>
  <div class="panel">
    <el-button type="primary" @click="openDialog('add')">新增角色</el-button>
    <el-table :data="roleList" border style="margin-top: 20px; width: 100%">
      <el-table-column prop="name" label="角色名称" min-width="120" />
      <el-table-column prop="desc" label="描述" min-width="100" />
      <el-table-column label="菜单权限" >
        <template #default="scope">
          <div class="role-menu-list">
            <div
              v-for="menu in buildRoleMenuLabels(scope.row.menus || [])"
              :key="menu.id + '-' + menu.depth"
              class="role-menu-item"
            >
              <el-tag
                size="small"
                :type="menu.depth === 0 ? 'primary' : 'info'"
                :style="{ marginLeft: menu.depth * 12 + 'px' }"
              >
                {{ menu.title }}
              </el-tag>
            </div>
            <el-tag v-if="!(scope.row.menus && scope.row.menus.length)" size="small" type="info">
              暂无菜单
            </el-tag>
          </div>
        </template>
      </el-table-column>
      <el-table-column label="用户列表" >
        <template #default="scope">
          <div class="role-user-list">
            <el-tag
              v-for="user in scope.row.users || []"
              :key="user.id"
              type="success"
              size="small"
              class="role-user-tag"
            >
              {{ user.username }}
            </el-tag>
            <el-tag v-if="!(scope.row.users && scope.row.users.length)" size="small" type="info">
              暂无用户
            </el-tag>
          </div>
        </template>
      </el-table-column>
      <el-table-column prop="user_count" label="用户数量"  />
      <el-table-column prop="permission_count" label="权限数量" />
      <el-table-column prop="is_active" label="状态" >
        <template #default="scope">
          <el-tag v-if="scope.row.is_active" type="success">启用</el-tag>
          <el-tag v-else type="danger">禁用</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="操作" min-width="200">
        <template #default="scope">
          <el-button size="small" type="primary" @click="openDialog('edit', scope.row)"
            >编辑</el-button
          >
          <el-button size="small" type="success" @click="openPermissionDialog(scope.row)"
            >更改权限</el-button
          >
          <el-button size="small" type="warning" @click="openUserDialog(scope.row)">增减用户</el-button>
          <el-button size="small" type="danger" @click="deleteRole(scope.row)">删除</el-button>
        </template>
      </el-table-column>
    </el-table>
  </div>

  <!-- 角色表单弹窗 -->
  <el-dialog
    :title="dialogTitle"
    v-model="dialogVisible"
    width="500px"
    :close-on-click-modal="false"
  >
    <el-form :model="form" :rules="rules" ref="formRef" label-width="100px">
      <el-form-item label="角色名称" prop="name">
        <el-input v-model="form.name" placeholder="请输入角色名称" />
      </el-form-item>
      <el-form-item label="角色编码" prop="code">
        <el-input v-model="form.code" placeholder="请输入角色编码" />
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

  <!-- 权限分配弹窗 -->
  <el-dialog
    title="权限分配"
    v-model="permissionDialogVisible"
    width="700px"
    :close-on-click-modal="false"
  >
    <div v-if="selectedRole">
      <h4>角色：{{ selectedRole.name }}</h4>
      <el-row :gutter="20" class="permission-transfer">
        <el-col :span="12">
          <div class="permission-panel">
            <div class="panel-title">可选权限</div>
            <el-tree
              ref="permissionTreeRef"
              :data="permissionTree"
              show-checkbox
              node-key="id"
              default-expand-all
              :props="treeProps"
              @check="handlePermissionCheck"
            />
          </div>
        </el-col>
        <el-col :span="12">
          <div class="permission-panel">
            <div class="panel-title">
              已选权限（{{ selectedPermissionNames.length }}）
            </div>
            <div class="selected-tags">
              <el-empty v-if="!selectedPermissionNames.length" description="暂无选择" />
              <el-tag
                v-else
                v-for="name in selectedPermissionNames"
                :key="name"
                type="info"
                class="selected-tag"
              >
                {{ name }}
              </el-tag>
            </div>
          </div>
        </el-col>
      </el-row>
    </div>
    <template #footer>
      <el-button @click="permissionDialogVisible = false">取消</el-button>
      <el-button type="primary" @click="submitPermissions">确定</el-button>
    </template>
  </el-dialog>

  <!-- 用户分配弹窗 -->
  <el-dialog
    title="用户分配"
    v-model="userDialogVisible"
    width="600px"
    :close-on-click-modal="false"
  >
    <div v-if="selectedRole">
      <h4>角色：{{ selectedRole.name }}</h4>
      <el-transfer
        v-model="selectedUsers"
        :data="allUsers"
        :titles="['可选用户', '已选用户']"
        :props="{
          key: 'id',
          label: 'username',
        }"
        style="margin-top: 20px"
      />
    </div>
    <template #footer>
      <el-button @click="userDialogVisible = false">取消</el-button>
      <el-button type="primary" @click="submitUsers">确定</el-button>
    </template>
  </el-dialog>
</template>

<script setup>
import { ref, reactive, onMounted, nextTick } from 'vue'
import { ElMessage, ElMessageBox } from 'element-plus'
import roleApi from '@/api/role/roleApi'
import userApi from '@/api/user/userApi'
import menuApi from '@/api/menu/menuApi'

// 数据定义
const roleList = ref([])
const permissionTree = ref([])
const allUsers = ref([])

// 角色表单相关
const dialogVisible = ref(false)
const dialogTitle = ref('')
const formRef = ref()
const form = reactive({
  id: '',
  name: '',
  code: '',
  desc: '',
  is_active: true,
})

const rules = {
  name: [{ required: true, message: '角色名称为必填', trigger: 'blur' }],
  code: [{ required: true, message: '角色编码为必填', trigger: 'blur' }],
}

// 权限分配相关
const permissionDialogVisible = ref(false)
const selectedRole = ref(null)
const selectedPermissions = ref([])
const selectedPermissionNames = ref([])
const permissionTreeRef = ref()
const treeProps = {
  children: 'children',
  label: 'title',
}

// 用户分配相关
const userDialogVisible = ref(false)
const selectedUsers = ref([])

// 获取角色列表
async function fetchRoleList() {
  try {
    const res = await roleApi.getList()
    if (res.status === 200) {
      roleList.value = res.data
    }
  } catch (error) {
    console.error('获取角色列表失败', error)
    ElMessage.error('获取角色列表失败')
  }
}

// 获取所有权限
async function fetchAllPermissions() {
  try {
    const res = await menuApi.getList()
    if (res.status === 200) {
      permissionTree.value = (res.data || []).map((item) => normalizeNode(item))
    }
  } catch (error) {
    console.error('获取权限列表失败', error)
    ElMessage.error('获取权限列表失败')
  }
}

// 获取所有用户
async function fetchAllUsers() {
  try {
    const res = await userApi.getSimpleList()
    if (res.status === 200) {
      allUsers.value = res.data
    }
  } catch (error) {
    console.error('获取用户列表失败', error)
    ElMessage.error('获取用户列表失败')
  }
}

// 打开角色表单弹窗
function openDialog(type, data = null) {
  if (type === 'add') {
    dialogTitle.value = '新增角色'
    Object.assign(form, { id: '', name: '', code: '', desc: '', is_active: true })
  } else if (type === 'edit' && data) {
    dialogTitle.value = '编辑角色'
    Object.assign(form, { ...data })
  }
  dialogVisible.value = true
}

// 提交角色表单
function submitForm() {
  formRef.value.validate(async (valid) => {
    if (!valid) return
    if (form.id) {
      // 编辑
      const res = await roleApi.update(form.id, form)
      if (res.status === 200) {
        ElMessage.success('编辑成功')
        dialogVisible.value = false
        fetchRoleList()
      } else {
        ElMessage.error('编辑失败')
      }
    } else {
      // 新增
      const { id, ...createData } = form
      const res = await roleApi.create(createData)
      if (res.status === 201) {
        ElMessage.success('新增成功')
        dialogVisible.value = false
        fetchRoleList()
      } else {
        ElMessage.error('新增失败')
      }
    }
  })
}

// 删除角色
function deleteRole(data) {
  ElMessageBox.confirm('确定要删除该角色吗？', '提示', {
    confirmButtonText: '确定',
    cancelButtonText: '取消',
    type: 'warning',
  })
    .then(async () => {
      const res = await roleApi.delete(data.id)
      if (res.status === 204) {
        ElMessage.success('删除成功')
        fetchRoleList()
      } else {
        ElMessage.error('删除失败')
      }
    })
    .catch(() => {})
}

// 打开权限分配弹窗
async function openPermissionDialog(role) {
  selectedRole.value = role
  try {
    // 获取角色当前权限
    const res = await roleApi.getRolePermissions(role.id)
    if (res.status === 200) {
      selectedPermissions.value = res.data.map((p) => p.id)
    }
  } catch (error) {
    selectedPermissions.value = []
  }
  permissionDialogVisible.value = true
  await nextTick()
  if (permissionTreeRef.value) {
    permissionTreeRef.value.setCheckedKeys(selectedPermissions.value, true)
    refreshSelectedPermissionNames()
  }
}

// 提交权限分配
async function submitPermissions() {
  if (!selectedRole.value) return

  try {
    let permissionsPayload = selectedPermissions.value
    if (permissionTreeRef.value) {
      const checked = permissionTreeRef.value.getCheckedKeys()
      const halfChecked = permissionTreeRef.value.getHalfCheckedKeys()
      permissionsPayload = Array.from(new Set([...checked, ...halfChecked]))
    }
    const res = await roleApi.assignRolePermissions(selectedRole.value.id, {
      permissions: permissionsPayload,
    })
    if (res.status === 200) {
      ElMessage.success('权限分配成功')
      permissionDialogVisible.value = false
      fetchRoleList()
    } else {
      ElMessage.error('权限分配失败')
    }
  } catch (error) {
    console.error('权限分配失败', error)
    ElMessage.error('权限分配失败')
  }
}

// 打开用户分配弹窗
async function openUserDialog(role) {
  selectedRole.value = role
  try {
    // 获取角色当前用户
    const res = await roleApi.getRoleUsers(role.id)
    if (res.status === 200) {
      selectedUsers.value = res.data.map((u) => u.id)
    }
  } catch (error) {
    selectedUsers.value = []
  }
  userDialogVisible.value = true
}

// 提交用户分配
async function submitUsers() {
  if (!selectedRole.value) return

  try {
    const res = await roleApi.assignUsersToRole(selectedRole.value.id, {
      users: selectedUsers.value,
    })
    if (res.status === 200) {
      ElMessage.success('用户分配成功')
      userDialogVisible.value = false
      fetchRoleList()
    } else {
      ElMessage.error('用户分配失败')
    }
  } catch (error) {
    console.error('用户分配失败', error)
    ElMessage.error('用户分配失败')
  }
}

onMounted(() => {
  fetchRoleList()
  fetchAllPermissions()
  fetchAllUsers()
})

function handlePermissionCheck() {
  refreshSelectedPermissionNames()
}

function refreshSelectedPermissionNames() {
  if (!permissionTreeRef.value) return
  const checkedNodes = permissionTreeRef.value.getCheckedNodes(false, true)
  selectedPermissions.value = permissionTreeRef.value.getCheckedKeys()
  selectedPermissionNames.value = checkedNodes.map((node) => buildNodeLabel(node))
}

function buildNodeLabel(node) {
  if (!node || !node.title) return ''
  return node.title
}

function normalizeNode(node) {
  const children = Array.isArray(node.children)
    ? node.children.map((child) => normalizeNode(child))
    : []
  return {
    ...node,
    children,
  }
}

function buildRoleMenuLabels(menus, depth = 0) {
  const list = []
  ;(menus || []).forEach((menu) => {
    list.push({
      id: menu.id,
      title: menu.title || menu.name,
      depth,
    })
    if (menu.children && menu.children.length) {
      list.push(...buildRoleMenuLabels(menu.children, depth + 1))
    }
  })
  return list
}
</script>

<style scoped>
.panel {
  padding: 20px;
  background: #fff;
  border-radius: 8px;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
  margin-bottom: 20px;
}

h4 {
  margin: 0 0 20px 0;
  color: #333;
}

.role-menu-list,
.role-user-list {
  display: flex;
  flex-direction: column;
  gap: 6px;
}

.role-user-list {
  flex-direction: row;
  flex-wrap: wrap;
}

.role-user-tag {
  margin-bottom: 4px;
  margin-right: 4px;
}

.permission-transfer {
  margin-top: 20px;
}

.permission-panel {
  border: 1px solid #ebeef5;
  border-radius: 6px;
  padding: 12px;
  height: 360px;
  overflow: auto;
  background-color: #fafafa;
}

.panel-title {
  font-weight: 600;
  margin-bottom: 12px;
}

.selected-tags {
  display: flex;
  flex-wrap: wrap;
  gap: 8px;
}

.selected-tag {
  margin-right: 0;
}
</style>
