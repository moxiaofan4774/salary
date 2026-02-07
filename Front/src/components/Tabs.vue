<template>
  <div class="tabs-wrapper">
    <el-tabs
      v-model="activeTab"
      type="card"
      closable
      @tab-click="handleTabClick"
      @tab-remove="handleTabRemove"
      class="custom-tabs"
    >
      <el-tab-pane
        v-for="tab in tabsList"
        :key="tab.path"
        :label="tab.title"
        :name="tab.path"
        :closable="tab.closable"
      >
        <!-- 标签页内容为空，因为这是导航标签，内容由路由控制 -->
      </el-tab-pane>
    </el-tabs>
  </div>
</template>

<script setup>
import { useTabsStore } from '@/stores/tabsStore.js'
import { storeToRefs } from 'pinia'

// 引入 Pinia Store
const tabsStore = useTabsStore()
// 解构响应式数据
const { tabsList, activeTab } = storeToRefs(tabsStore)
// 解构方法
const { switchTab, closeTab } = tabsStore

/**
 * 处理标签页点击事件
 * @param {Object} tab - 被点击的标签页对象
 */
const handleTabClick = (tab) => {
  // tab.paneName 是 el-tab-pane 的 name 属性值，对应我们的 path
  switchTab(tab.paneName)
}

/**
 * 处理标签页移除事件
 * @param {string} targetName - 要移除的标签页的 name
 */
const handleTabRemove = (targetName) => {
  closeTab(targetName)
}
</script>

<style scoped>
.tabs-wrapper {
  /* 确保标签页容器占满宽度 */
  width: 100%;
}

.custom-tabs {
  /* 自定义标签页样式 */
  margin: 0;
}

/* 自定义标签页的样式，使其更符合系统设计 */
.custom-tabs :deep(.el-tabs__header) {
  margin: 0;
  background: #f5f7fa;
  border-bottom: 1px solid #ebeef5;
  box-shadow: 0 2px 8px #f0f1f2;
}

.custom-tabs :deep(.el-tabs__nav-wrap) {
  padding: 0 10px;
}

.custom-tabs :deep(.el-tabs__item) {
  height: 35px;
  line-height: 35px;
  font-size: 14px;
  color: #303133;
  border-radius: 4px 4px 0 0;
  margin-right: 4px;
  padding: 0 15px;
  transition: all 0.2s;
}

.custom-tabs :deep(.el-tabs__item.is-active) {
  color: #409eff;

}



/* 关闭图标样式 */
.custom-tabs :deep(.el-tabs__item .el-icon-close) {
  font-size: 12px;
  margin-left: 6px;
  color: #bcbaba;
  transition: color 0.2s;
}

.custom-tabs :deep(.el-tabs__item .el-icon-close:hover) {
  color: #409eff;
}

/* 隐藏标签页内容区域，因为我们只需要标签导航 */
.custom-tabs :deep(.el-tabs__content) {
  display: none;
}

/* 调整标签页导航的定位 */
.custom-tabs :deep(.el-tabs__nav-scroll) {
  overflow-x: auto;
  overflow-y: hidden;
}

/* 自定义滚动条样式 */
.custom-tabs :deep(.el-tabs__nav-scroll)::-webkit-scrollbar {
  height: 3px;
}

.custom-tabs :deep(.el-tabs__nav-scroll)::-webkit-scrollbar-track {
  background: #f1f1f1;
}

.custom-tabs :deep(.el-tabs__nav-scroll)::-webkit-scrollbar-thumb {
  background: #c1c1c1;
  border-radius: 3px;
}

.custom-tabs :deep(.el-tabs__nav-scroll)::-webkit-scrollbar-thumb:hover {
  background: #a8a8a8;
}
</style>
