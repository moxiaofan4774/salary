<template>
  <div class="panel">
    <el-row :gutter="20">
      <!-- 菜单列表 -->
      <el-col :span="12">
        <div class="menu-panel">
          <h3>菜单列表</h3>
          <el-table
            :data="menuList"
            row-key="id"
            border
            default-expand-all
            style="margin-top: 20px"
            :tree-props="{ children: 'children', hasChildren: 'hasChildren' }"
            :indent="40"
            @row-click="handleMenuClick"
            :row-class-name="getRowClassName"
          >
            <el-table-column prop="name" label="菜单名称" />
            <el-table-column prop="path" label="路由" />
            <el-table-column prop="permission_code" label="权限码" />
            <el-table-column label="权限状态" width="100">
              <template #default="scope">
                <el-tag v-if="scope.row.has_permission" type="success">有权限</el-tag>
                <el-tag v-else type="danger">无权限</el-tag>
              </template>
            </el-table-column>
          </el-table>
        </div>
      </el-col>

      <!-- 权限管理 -->
      <el-col :span="12">
        <div class="permission-panel">
          <h3>权限管理</h3>
          <div v-if="selectedMenu" class="selected-menu">
            <el-descriptions :column="1" border>
              <el-descriptions-item label="菜单名称">{{ selectedMenu.name }}</el-descriptions-item>
              <el-descriptions-item label="路由路径">{{ selectedMenu.path }}</el-descriptions-item>
              <el-descriptions-item label="权限码">{{
                selectedMenu.permission_code
              }}</el-descriptions-item>
            </el-descriptions>
          </div>

          <!-- 权限分配表单 -->
          <el-form
            v-if="selectedMenu"
            :model="permissionForm"
            :rules="permissionRules"
            ref="permissionFormRef"
            label-width="120px"
            style="margin-top: 20px"
          >
            <el-form-item label="选择角色" prop="group_id">
              <el-select v-model="permissionForm.group_id" placeholder="请选择角色" clearable>
                <el-option
                  v-for="group in availableGroups"
                  :key="group.id"
                  :label="group.name"
                  :value="group.id"
                />
              </el-select>
            </el-form-item>
            <el-form-item label="权限码" prop="permission_code">
              <el-input v-model="permissionForm.permission_code" placeholder="请输入权限码" />
            </el-form-item>
            <el-form-item label="全局访问">
              <el-switch v-model="permissionForm.global_access" />
            </el-form-item>
            <el-form-item>
              <el-button type="primary" @click="assignPermission">分配权限</el-button>
              <el-button @click="checkMenuPermission">检查权限</el-button>
            </el-form-item>
          </el-form>

          <!-- 当前用户角色信息 -->
          <div class="user-roles" style="margin-top: 20px">
            <h4>当前用户角色</h4>
            <el-tag
              v-for="role in userRoles"
              :key="role.id"
              type="info"
              style="margin-right: 8px; margin-bottom: 8px"
            >
              {{ role.name }}
            </el-tag>
          </div>
        </div>
      </el-col>
    </el-row>
  </div>
</template>

<script setup>
import { ref, reactive, onMounted } from 'vue'
import { ElMessage } from 'element-plus'
import menuApi from '@/api/menu/menuApi'

// 数据定义
const menuList = ref([])
const selectedMenu = ref(null)
const availableGroups = ref([])
const userRoles = ref([])

// 权限表单
const permissionFormRef = ref()
const permissionForm = reactive({
  group_id: '',
  permission_code: '',
  global_access: false,
})

const permissionRules = {
  group_id: [{ required: true, message: '请选择角色', trigger: 'change' }],
  permission_code: [{ required: true, message: '请输入权限码', trigger: 'blur' }],
}

// 获取菜单列表
async function fetchMenuList() {
  try {
    const res = await menuApi.getList()
    if (res.status === 200) {
      menuList.value = res.data
      // 为每个菜单添加权限检查状态
      await checkAllMenuPermissions()
    }
  } catch (error) {
    console.error('获取菜单列表失败', error)
    ElMessage.error('获取菜单列表失败')
  }
}

// 获取可用角色
async function fetchAvailableGroups() {
  try {
    const res = await menuApi.getAvailableGroups()
    if (res.status === 200) {
      availableGroups.value = res.data
    }
  } catch (error) {
    console.error('获取角色列表失败', error)
    ElMessage.error('获取角色列表失败')
  }
}

// 获取当前用户角色
async function fetchUserRoles() {
  try {
    const res = await menuApi.getUserRoles()
    if (res.status === 200) {
      userRoles.value = res.data
    }
  } catch (error) {
    console.error('获取用户角色失败', error)
    ElMessage.error('获取用户角色失败')
  }
}

// 菜单点击事件
function handleMenuClick(row) {
  selectedMenu.value = row
  // 重置权限表单
  permissionForm.group_id = ''
  permissionForm.permission_code = row.permission_code || ''
  permissionForm.global_access = false
}

// 分配权限
async function assignPermission() {
  if (!selectedMenu.value) {
    ElMessage.warning('请先选择菜单')
    return
  }

  try {
    const res = await menuApi.assignPermission(selectedMenu.value.id, permissionForm)
    if (res.status === 200) {
      ElMessage.success('权限分配成功')
      // 重新检查权限状态
      await checkAllMenuPermissions()
    } else {
      ElMessage.error('权限分配失败')
    }
  } catch (error) {
    console.error('权限分配失败', error)
    ElMessage.error('权限分配失败')
  }
}

// 检查菜单权限
async function checkMenuPermission() {
  if (!selectedMenu.value) {
    ElMessage.warning('请先选择菜单')
    return
  }

  try {
    const res = await menuApi.checkPermission(selectedMenu.value.id)
    if (res.status === 200) {
      const hasPermission = res.data.has_permission
      ElMessage.info(`当前用户${hasPermission ? '有' : '无'}该菜单权限`)
      // 更新菜单权限状态
      updateMenuPermissionStatus(selectedMenu.value.id, hasPermission)
    }
  } catch (error) {
    console.error('检查权限失败', error)
    ElMessage.error('检查权限失败')
  }
}

// 检查所有菜单权限状态
async function checkAllMenuPermissions() {
  for (const menu of menuList.value) {
    await checkMenuPermissionRecursive(menu)
  }
}

// 递归检查菜单权限
async function checkMenuPermissionRecursive(menu) {
  try {
    const res = await menuApi.checkPermission(menu.id)
    if (res.status === 200) {
      menu.has_permission = res.data.has_permission
    }
  } catch (error) {
    menu.has_permission = false
  }

  // 递归检查子菜单
  if (menu.children && menu.children.length > 0) {
    for (const child of menu.children) {
      await checkMenuPermissionRecursive(child)
    }
  }
}

// 更新菜单权限状态
function updateMenuPermissionStatus(menuId, hasPermission) {
  const updateMenuStatus = (menus) => {
    for (const menu of menus) {
      if (menu.id === menuId) {
        menu.has_permission = hasPermission
        return true
      }
      if (menu.children && menu.children.length > 0) {
        if (updateMenuStatus(menu.children)) {
          return true
        }
      }
    }
    return false
  }
  updateMenuStatus(menuList.value)
}

// 获取行样式
function getRowClassName({ row }) {
  if (row.id === selectedMenu.value?.id) {
    return 'selected-row'
  }
  return ''
}

onMounted(() => {
  fetchMenuList()
  fetchAvailableGroups()
  fetchUserRoles()
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

.menu-panel,
.permission-panel {
  background: #f8f9fa;
  padding: 20px;
  border-radius: 8px;
  height: 600px;
  overflow-y: auto;
}

.menu-panel h3,
.permission-panel h3 {
  margin-top: 0;
  margin-bottom: 20px;
  color: #333;
  font-size: 18px;
}

.selected-menu {
  margin-bottom: 20px;
}

.user-roles h4 {
  margin-bottom: 10px;
  color: #666;
}

:deep(.selected-row) {
  background-color: #e6f7ff !important;
}

:deep(.el-table__row:hover) {
  cursor: pointer;
}
</style>
