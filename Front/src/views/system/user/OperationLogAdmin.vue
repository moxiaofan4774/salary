<template>
  <div class="operation-log-container">
    <!-- 搜索栏 -->
    <div class="search-bar">
      <el-input
        v-model="searchOperatorName"
        placeholder="操作人姓名"
        clearable
        style="width: 200px; margin-right: 10px"
      />
      <el-select
        v-model="searchAction"
        placeholder="操作类型"
        clearable
        style="width: 150px; margin-right: 10px"
      >
        <el-option label="创建" value="CREATE" />
        <el-option label="更新" value="UPDATE" />
        <el-option label="删除" value="DELETE" />
        <el-option label="查询" value="RETRIEVE" />
      </el-select>
      <el-select
        v-model="searchResourceType"
        placeholder="资源类型"
        clearable
        style="width: 180px; margin-right: 10px"
      >
        <el-option label="用户信息" value="UserInfo" />
        <el-option label="角色" value="Role" />
        <el-option label="部门" value="Department" />
        <el-option label="职称分类" value="TitleCategory" />
        <el-option label="员工档案" value="EmployeeProfile" />
        <el-option label="职称历史" value="EmployeeTitleHistory" />
      </el-select>
      <el-date-picker
        v-model="dateRange"
        type="daterange"
        range-separator="至"
        start-placeholder="开始日期"
        end-placeholder="结束日期"
        style="width: 240px; margin-right: 10px"
        value-format="YYYY-MM-DD"
      />
      <el-button type="primary" @click="handleSearch">
        <el-icon><Search /></el-icon>
        搜索
      </el-button>
      <el-button @click="handleRefresh">
        <el-icon><Refresh /></el-icon>
        刷新
      </el-button>
    </div>

    <!-- 操作日志表格 -->
    <el-table
      :data="logList"
      border
      style="width: 100%; margin-top: 20px"
      v-loading="loading"
    >
      <el-table-column type="index" label="序号" width="60" align="center" />
      <el-table-column prop="operator_name" label="操作人" width="120" />
      <el-table-column prop="action_display" label="操作类型" width="100" align="center">
        <template #default="{ row }">
          <el-tag
            :type="getActionTagType(row.action)"
            size="small"
          >
            {{ row.action_display }}
          </el-tag>
        </template>
      </el-table-column>
      <el-table-column prop="resource_type" label="资源类型" width="150">
        <template #default="{ row }">
          {{ getResourceTypeDisplay(row.resource_type) }}
        </template>
      </el-table-column>
      <el-table-column prop="resource_name" label="资源名称" min-width="200" show-overflow-tooltip />
      <el-table-column prop="ip_address" label="IP地址" width="140" />
      <el-table-column prop="created_at" label="操作时间" width="180">
        <template #default="{ row }">
          {{ formatDateTime(row.created_at) }}
        </template>
      </el-table-column>
    </el-table>

    <!-- 分页 -->
    <el-pagination
      v-model:current-page="currentPage"
      v-model:page-size="pageSize"
      :page-sizes="[10, 20, 50, 100]"
      :total="total"
      layout="total, sizes, prev, pager, next, jumper"
      @size-change="handleSizeChange"
      @current-change="handlePageChange"
      style="margin-top: 20px; justify-content: flex-end"
    />
  </div>
</template>

<script setup>
import { ref, reactive, onMounted } from 'vue'
import { ElMessage } from 'element-plus'
import { Search, Refresh } from '@element-plus/icons-vue'
import operationLogApi from '@/api/user/operationLogApi'
import 'element-plus/dist/index.css'

// 数据
const logList = ref([])
const loading = ref(false)
const total = ref(0)
const currentPage = ref(1)
const pageSize = ref(20)

// 搜索条件
const searchOperatorName = ref('')
const searchAction = ref('')
const searchResourceType = ref('')
const dateRange = ref([])

/**
 * 获取操作日志列表
 */
const fetchLogs = async () => {
  loading.value = true
  try {
    const params = {
      pageNum: currentPage.value,
      pageSize: pageSize.value,
    }

    if (searchOperatorName.value) {
      params.operator_name = searchOperatorName.value
    }
    if (searchAction.value) {
      params.action = searchAction.value
    }
    if (searchResourceType.value) {
      params.resource_type = searchResourceType.value
    }
    if (dateRange.value && dateRange.value.length === 2) {
      params.start_date = dateRange.value[0]
      params.end_date = dateRange.value[1]
    }

    const res = await operationLogApi.getList(params)
    if (res.status === 200) {
      logList.value = res.data.results || []
      total.value = res.data.count || 0
    }
  } catch (error) {
    console.error('获取操作日志失败:', error)
    ElMessage.error('获取操作日志失败')
  } finally {
    loading.value = false
  }
}

/**
 * 搜索处理
 */
const handleSearch = () => {
  currentPage.value = 1
  fetchLogs()
}

/**
 * 刷新处理（清空查询条件）
 */
const handleRefresh = () => {
  searchOperatorName.value = ''
  searchAction.value = ''
  searchResourceType.value = ''
  dateRange.value = []
  currentPage.value = 1
  fetchLogs()
}

/**
 * 分页大小变化
 */
const handleSizeChange = (val) => {
  pageSize.value = val
  currentPage.value = 1
  fetchLogs()
}

/**
 * 页码变化
 */
const handlePageChange = (val) => {
  currentPage.value = val
  fetchLogs()
}

/**
 * 获取操作类型标签颜色
 */
const getActionTagType = (action) => {
  const typeMap = {
    CREATE: 'success',
    UPDATE: 'warning',
    DELETE: 'danger',
    RETRIEVE: 'info',
  }
  return typeMap[action] || ''
}

/**
 * 获取资源类型显示名称
 */
const getResourceTypeDisplay = (resourceType) => {
  const displayMap = {
    UserInfo: '用户信息',
    Role: '角色',
    Department: '部门',
    TitleCategory: '职称分类',
    EmployeeProfile: '员工档案',
    EmployeeTitleHistory: '职称历史',
  }
  return displayMap[resourceType] || resourceType
}

/**
 * 格式化日期时间
 */
const formatDateTime = (dateTimeStr) => {
  if (!dateTimeStr) return ''
  const date = new Date(dateTimeStr)
  const year = date.getFullYear()
  const month = String(date.getMonth() + 1).padStart(2, '0')
  const day = String(date.getDate()).padStart(2, '0')
  const hours = String(date.getHours()).padStart(2, '0')
  const minutes = String(date.getMinutes()).padStart(2, '0')
  const seconds = String(date.getSeconds()).padStart(2, '0')
  return `${year}-${month}-${day} ${hours}:${minutes}:${seconds}`
}

// 组件挂载时获取数据
onMounted(() => {
  fetchLogs()
})
</script>

<style scoped>
.operation-log-container {
  padding: 20px;
}

.search-bar {
  display: flex;
  align-items: center;
  flex-wrap: wrap;
  gap: 10px;
}
</style>
