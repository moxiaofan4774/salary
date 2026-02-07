<template>
  <el-sub-menu v-if="hasChildren" :index="groupIndex">
    <template #title>
      <el-icon v-if="currentIcon">
        <component :is="currentIcon" />
      </el-icon>
      <span>{{ item.title }}</span>
    </template>
    <MenuTreeItem
      v-for="child in item.children"
      :key="child.id"
      :item="child"
      :icon-map="iconMap"
    />
  </el-sub-menu>
  <el-menu-item v-else :index="leafIndex">
    <el-icon v-if="currentIcon">
      <component :is="currentIcon" />
    </el-icon>
    <span>{{ item.title }}</span>
  </el-menu-item>
</template>

<script setup>
import { computed } from 'vue'
import * as ElementPlusIconsVue from '@element-plus/icons-vue'

defineOptions({ name: 'MenuTreeItem' })

const props = defineProps({
  item: {
    type: Object,
    required: true,
  },
  iconMap: {
    type: Object,
    default: () => ElementPlusIconsVue,
  },
})

const hasChildren = computed(() => Array.isArray(props.item.children) && props.item.children.length > 0)
const groupIndex = computed(() => `group-${props.item.id}`)
const leafIndex = computed(() => {
  if (!props.item.path) {
    return `menu-${props.item.id}`
  }
  return props.item.path.startsWith('/') ? props.item.path : `/${props.item.path}`
})

const currentIcon = computed(() => {
  if (!props.item.icon) return null
  const direct = props.iconMap[props.item.icon]
  if (direct) return direct
  const normalized = normalizeIconName(props.item.icon)
  return props.iconMap[normalized] || null
})

function normalizeIconName(name) {
  if (!name) return ''
  if (/^[A-Z]/.test(name)) {
    return name
  }
  return name
    .toString()
    .split(/[-_\s]/)
    .filter(Boolean)
    .map((part) => part.charAt(0).toUpperCase() + part.slice(1))
    .join('')
}
</script>
