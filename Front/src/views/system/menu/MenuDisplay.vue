<template>
  <div class="panel">
    <el-row :gutter="20">
      <!-- 用户菜单树 -->
      <el-col :span="12">
        <div class="menu-panel">
          <h3>用户菜单树</h3>
          <el-tree
            :data="userMenuTree"
            :props="treeProps"
            node-key="id"
            default-expand-all
            :expand-on-click-node="false"
            @node-click="handleNodeClick"
            class="menu-tree"
          >
            <template #default="{ node, data }">
              <span class="custom-tree-node">
                <el-icon v-if="data.icon" style="margin-right: 8px">
                  <component :is="iconMap[data.icon]" />
                </el-icon>
                <span>{{ data.name }}</span>
                <el-tag
                  v-if="data.has_permission"
                  type="success"
                  size="small"
                  style="margin-left: 8px"
                  >有权限</el-tag
                >
                <el-tag v-else type="danger" size="small" style="margin-left: 8px">无权限</el-tag>
              </span>
            </template>
          </el-tree>
        </div>
      </el-col>

      <!-- 菜单详情 -->
      <el-col :span="12">
        <div class="detail-panel">
          <h3>菜单详情</h3>
          <div v-if="selectedMenu" class="menu-detail">
            <el-descriptions :column="1" border>
              <el-descriptions-item label="菜单名称">{{ selectedMenu.name }}</el-descriptions-item>
              <el-descriptions-item label="路由路径">{{ selectedMenu.path }}</el-descriptions-item>
              <el-descriptions-item label="权限码">{{
                selectedMenu.permission_code
              }}</el-descriptions-item>
              <el-descriptions-item label="排序">{{ selectedMenu.order }}</el-descriptions-item>
              <el-descriptions-item label="是否激活">
                <el-tag v-if="selectedMenu.is_active" type="success">激活</el-tag>
                <el-tag v-else type="danger">未激活</el-tag>
              </el-descriptions-item>
              <el-descriptions-item label="权限状态">
                <el-tag v-if="selectedMenu.has_permission" type="success">有权限</el-tag>
                <el-tag v-else type="danger">无权限</el-tag>
              </el-descriptions-item>
            </el-descriptions>

            <!-- 权限检查 -->
            <div style="margin-top: 20px">
              <el-button type="primary" @click="checkPermission">检查权限</el-button>
              <el-button @click="previewMenu">预览菜单</el-button>
            </div>

            <!-- 权限检查结果 -->
            <div v-if="permissionResult" style="margin-top: 20px">
              <el-alert
                :title="permissionResult.has_permission ? '权限检查通过' : '权限检查失败'"
                :type="permissionResult.has_permission ? 'success' : 'error'"
                :description="permissionResult.message || ''"
                show-icon
              />
            </div>
          </div>

          <!-- 当前用户信息 -->
          <div class="user-info" style="margin-top: 20px">
            <h4>当前用户信息</h4>
            <el-descriptions :column="1" border>
              <el-descriptions-item label="用户角色">
                <el-tag
                  v-for="role in userRoles"
                  :key="role.id"
                  type="info"
                  style="margin-right: 8px"
                >
                  {{ role.name }}
                </el-tag>
              </el-descriptions-item>
            </el-descriptions>
          </div>
        </div>
      </el-col>
    </el-row>

    <!-- 菜单预览弹窗 -->
    <el-dialog
      title="菜单预览"
      v-model="previewVisible"
      width="600px"
      :close-on-click-modal="false"
    >
      <div v-if="selectedMenu">
        <h4>{{ selectedMenu.name }}</h4>
        <p><strong>路由：</strong>{{ selectedMenu.path }}</p>
        <p><strong>权限码：</strong>{{ selectedMenu.permission_code }}</p>
        <p><strong>描述：</strong>{{ selectedMenu.desc || '暂无描述' }}</p>

        <!-- 模拟菜单渲染 -->
        <div class="menu-preview">
          <el-menu
            :default-active="selectedMenu.path"
            class="preview-menu"
            background-color="#545c64"
            text-color="#fff"
            active-text-color="#ffd04b"
          >
            <el-menu-item :index="selectedMenu.path">
              <el-icon v-if="selectedMenu.icon">
                <component :is="iconMap[selectedMenu.icon]" />
              </el-icon>
              <span>{{ selectedMenu.name }}</span>
            </el-menu-item>
          </el-menu>
        </div>
      </div>
    </el-dialog>
  </div>
</template>

<script setup>
import { ref, reactive, onMounted } from 'vue'
import { ElMessage } from 'element-plus'
import menuApi from '@/api/menu/menuApi'
import {
  HomeFilled,
  Document,
  Menu as IconMenu,
  Location,
  Setting,
  Fold,
  UserFilled,
  ArrowDown,
  Expand,
  Plus,
} from '@element-plus/icons-vue'

// 图标映射表
const iconMap = {
  HomeFilled,
  Document,
  IconMenu,
  Location,
  Setting,
  Fold,
  UserFilled,
  ArrowDown,
  Expand,
  Plus,
}

// 数据定义
const userMenuTree = ref([])
const selectedMenu = ref(null)
const userRoles = ref([])
const permissionResult = ref(null)
const previewVisible = ref(false)

// 树形配置
const treeProps = {
  children: 'children',
  label: 'name',
}

// 获取用户菜单树
async function fetchUserMenus() {
  try {
    const res = await menuApi.getUserMenus()
    if (res.status === 200) {
      userMenuTree.value = res.data
      // 为每个菜单添加权限检查状态
      await checkAllMenuPermissions()
    }
  } catch (error) {
    console.error('获取用户菜单失败', error)
    ElMessage.error('获取用户菜单失败')
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

// 节点点击事件
function handleNodeClick(data) {
  selectedMenu.value = data
  permissionResult.value = null
}

// 检查权限
async function checkPermission() {
  if (!selectedMenu.value) {
    ElMessage.warning('请先选择菜单')
    return
  }

  try {
    const res = await menuApi.checkPermission(selectedMenu.value.id)
    if (res.status === 200) {
      permissionResult.value = res.data
      ElMessage.info(`权限检查完成：${res.data.has_permission ? '有权限' : '无权限'}`)
    }
  } catch (error) {
    console.error('检查权限失败', error)
    ElMessage.error('检查权限失败')
  }
}

// 预览菜单
function previewMenu() {
  if (!selectedMenu.value) {
    ElMessage.warning('请先选择菜单')
    return
  }
  previewVisible.value = true
}

// 检查所有菜单权限状态
async function checkAllMenuPermissions() {
  for (const menu of userMenuTree.value) {
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

onMounted(() => {
  fetchUserMenus()
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
.detail-panel {
  background: #f8f9fa;
  padding: 20px;
  border-radius: 8px;
  height: 600px;
  overflow-y: auto;
}

.menu-panel h3,
.detail-panel h3 {
  margin-top: 0;
  margin-bottom: 20px;
  color: #333;
  font-size: 18px;
}

.menu-tree {
  background: transparent;
}

.custom-tree-node {
  display: flex;
  align-items: center;
  width: 100%;
}

.menu-detail {
  margin-bottom: 20px;
}

.user-info h4 {
  margin-bottom: 10px;
  color: #666;
}

.menu-preview {
  margin-top: 20px;
  border: 1px solid #dcdfe6;
  border-radius: 4px;
  overflow: hidden;
}

.preview-menu {
  width: 100%;
}

:deep(.el-tree-node__content:hover) {
  background-color: #f5f7fa;
}

:deep(.el-tree-node__content) {
  padding: 8px 0;
}
</style>
