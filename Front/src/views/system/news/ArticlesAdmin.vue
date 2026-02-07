<template>
  <div class="panel">
        <div class="articles-admin-page">
    <div class="articles-admin">
      <div class="category-panel">
        <el-card shadow="never" class="category-card">
          <template #header>
            <div class="category-card__header">
              <el-icon size="18" class="category-card__icon">
                <CollectionTag />
              </el-icon>
              <span>文章类别</span>
            </div>
          </template>
          <el-scrollbar class="category-scroll">
            <el-tree
              ref="treeRef"
              class="category-tree"
              :data="categoryOptions"
              node-key="uuid"
              :props="treeProps"
              highlight-current
              :indent="18"
              :expand-on-click-node="false"
              empty-text="暂无分类"
              @node-click="handleCategoryClick"
            />
          </el-scrollbar>
        </el-card>
      </div>

      <div class="article-panel">
        <div v-if="selectedCategory" class="article-panel__content">
          <div class="panel article-panel__top">
            <div class="category-meta">
              <span class="category-meta__label">当前类别：</span>
              <span class="category-meta__name">{{ selectedCategory.name }}</span>
            </div>

            <el-form
              class="search-form"
              :inline="true"
              :model="searchFormData"
              @submit.prevent="handleSearch"
            >
              <el-form-item label="文章标题">
                <el-input
                  v-model="searchFormData.title"
                  placeholder="搜索文章标题"
                  clearable
                  @clear="handleSearch"
                />
              </el-form-item>

              <el-form-item>
                <el-button type="primary" @click="handleSearch">搜索</el-button>
                <el-button @click="handleReset">重置</el-button>
              </el-form-item>
            </el-form>


          </div>

          <div class="panel article-panel__bottom">
            <div class="action-buttons">
              <el-button type="primary" @click="showDrawer">新增文章</el-button>
              <el-button type="danger" @click="deleteChecked">批量删除</el-button>
            </div>
            <el-table
              :data="dataList"
              row-key="id"
              style="width: 100%"
              @selection-change="handleSelectionChange"
              border
            >
              <el-table-column type="selection" width="40" fixed />
              <el-table-column property="title" label="标题" />
              <el-table-column property="category.name" label="分类" />
              <el-table-column property="author.username" label="创建人" />
              <el-table-column label="文章状态">
                <template #default="scope">
                  <el-tag v-if="scope.row.is_check" type="primary" style="margin: 0 5px">正常</el-tag>
                  <el-tag v-else type="danger" style="margin: 0 5px">下架</el-tag>
                  <el-tag v-if="scope.row.is_delete" type="primary" style="margin: 0 5px">已删除</el-tag>
                  <el-tag v-if="scope.row.is_top" type="success" style="margin: 0 5px">置顶</el-tag>
                </template>
              </el-table-column>
              <el-table-column label="操作" fixed="right" width="260">
                <template #default="scope">
                  <el-button type="primary" @click="modInfo(scope.row.id)">修改</el-button>
                  <el-button type="warning" @click="openTransferDialog(scope.row)">转移</el-button>
                  <el-button type="danger" @click="delInfo(scope.row.id)">删除</el-button>
                </template>
              </el-table-column>
            </el-table>

            <el-pagination
              v-model:current-page="searchFormData.pageNum"
              v-model:page-size="searchFormData.pageSize"
              :page-sizes="[10, 20, 50, 100]"
              background
              layout="total, sizes, prev, pager, next, jumper"
              :total="total"
              @size-change="handleSizeChange"
              @current-change="handleCurrentChange"
              style="padding-top: 20px"
            />
          </div>
        </div>

        <div v-else class="panel article-panel__empty">
          <el-empty description="请选择左侧的文章类别" />
        </div>
      </div>
    </div>

    <el-drawer
      v-model="drawerVisible"
      direction="rtl"
      size="70%"
      :close-on-click-modal="false"
      @close="drawerCancel"
    >
      <template #header>
        <h3>{{ title }}</h3>
      </template>
      <template #default>
        <el-form ref="articleForm" label-width="80px" :model="addFormData" :rules="rules">
          <el-row :gutter="20">
            <el-col :span="16">
              <el-form-item label="文章标题" prop="title">
                <el-input v-model="addFormData.title" placeholder="请输入文章标题"></el-input>
              </el-form-item>
              <div style="border: 1px dashed #ccc; min-height: 600px; margin-bottom: 20px">
                <BasicEditor ref="editorRef" v-model="addFormData.content"></BasicEditor>
              </div>
            </el-col>

            <el-col :span="8">
              <el-form-item label="文章作者" prop="author">
                <el-input
                  v-model="adminData.username"
                  placeholder="请输入文章作者"
                  disabled
                ></el-input>
              </el-form-item>

              <el-form-item label="所属类别">
                <el-input
                  :model-value="selectedCategory?.name || ''"
                  placeholder="请选择左侧类别"
                  disabled
                ></el-input>
              </el-form-item>

              <el-form-item label="文章封面" prop="pic">
                <AvatarUploader v-model="currentPic" @upload-success="handleUpload" />
              </el-form-item>

              <el-form-item label="点击量" prop="sort">
                <el-input-number
                  v-model="addFormData.hits"
                  :min="0"
                  controls-position="right"
                  style="width: 80px"
                ></el-input-number>
              </el-form-item>
              <el-form-item label="时间" prop="create_date">
                <el-date-picker
                  v-model="addFormData.create_date"
                  type="date"
                  placeholder="点击选择日期"
                  value-format="YYYY-MM-DD"
                  style="width: 100%"
                />
              </el-form-item>

              <el-form-item label="状态" prop="is_check">
                <el-radio-group v-model="addFormData.is_check">
                  <el-radio value="1">正常</el-radio>
                  <el-radio value="0">下架</el-radio>
                </el-radio-group>
              </el-form-item>

              <el-form-item label="置顶" prop="is_top">
                <el-radio-group v-model="addFormData.is_top">
                  <el-radio value="1">是</el-radio>
                  <el-radio value="0">否</el-radio>
                </el-radio-group>
              </el-form-item>

              <el-form-item label="热点" prop="is_hot">
                <el-radio-group v-model="addFormData.is_hot">
                  <el-radio value="1">是</el-radio>
                  <el-radio value="0">否</el-radio>
                </el-radio-group>
              </el-form-item>
              <el-form-item label="外部链接" prop="out_link">
                <el-input
                  v-model="addFormData.out_link"
                  placeholder="填写该字段后，点击标题将跳转到该地址"
                ></el-input>
              </el-form-item>
            </el-col>
          </el-row>
        </el-form>
      </template>
      <template #footer>
        <div style="flex: auto">
          <el-button @click="drawerCancel">取消</el-button>
          <el-button type="primary" @click="addFormConfirm">确定</el-button>
        </div>
      </template>
    </el-drawer>

    <el-dialog
      v-model="transferDialogVisible"
      title="转移文章类别"
      width="420px"
      :close-on-click-modal="false"
      @closed="resetTransferDialog"
    >
      <el-form label-width="80px">
        <el-form-item label="目标分类">
          <el-cascader
            v-model="transferForm.category"
            :options="categoryOptions"
            :props="cascaderProps"
            placeholder="请选择目标分类"
            clearable
            style="width: 100%"
          />
        </el-form-item>
      </el-form>
      <template #footer>
        <el-button @click="transferDialogVisible = false" :disabled="transferLoading">取消</el-button>
        <el-button type="primary" :loading="transferLoading" @click="confirmTransfer">确定</el-button>
      </template>
    </el-dialog>
  </div>
  </div>

</template>

<script lang="ts" setup>
import { ElMessage, ElMessageBox } from 'element-plus'
import { onMounted, ref, reactive, nextTick } from 'vue'
import BasicEditor from '@/components/BasicEditor.vue'
import { useAdminStore } from '@/stores/adminStore'
import AvatarUploader from '@/components/AvatarUploader.vue'
import articleApi from '@/api/news/articleApi'
import categoryApi from '@/api/news/categoriesApi'
import dayjs from 'dayjs'
import { storeToRefs } from 'pinia'
import { CollectionTag } from '@element-plus/icons-vue'
import adminHttp from '@/util/adminHttp'

type AdminData = { username?: string; [key: string]: any }
type CategoryNode = {
  uuid: string
  name: string
  children?: CategoryNode[]
}

const currentPic = ref('')
const handleUpload = (url: string) => {
  addFormData.value.pic = url
}

const adminStore = useAdminStore()
const { adminData } = storeToRefs(adminStore) as { adminData: import('vue').Ref<AdminData> }
const editorRef = ref<any>(null)
const title = ref('新增文章')
const htmlContent = ref('')

const treeRef = ref()
const categoryOptions = ref<CategoryNode[]>([])
const treeProps = {
  label: 'name',
  children: 'children',
}
const cascaderProps = {
  value: 'uuid',
  label: 'name',
  children: 'children',
  emitPath: false,
  checkStrictly: true,
}
const selectedCategory = ref<CategoryNode | null>(null)
const transferDialogVisible = ref(false)
const transferArticleId = ref<number | null>(null)
const transferForm = ref({ category: '' })
const transferLoading = ref(false)

const searchFormData = ref({
  title: '',
  pageNum: 1,
  pageSize: 10,
})
const dataList = ref<any[]>([])
const total = ref(0)

const getEditorValue = () => {
  return editorRef.value ? editorRef.value.valueHtml : ''
}

const queryDataList = () => {
  if (!selectedCategory.value) {
    dataList.value = []
    total.value = 0
    return
  }
  const params = {
    ...searchFormData.value,
    category: selectedCategory.value.uuid,
  }
  articleApi.getList(params).then((response) => {
    if (response.status === 200) {
      dataList.value = response.data.results
      total.value = response.data.count
    } else {
      ElMessage.error('获取数据失败')
    }
  })
}

const handleSearch = () => {
  if (!selectedCategory.value) {
    ElMessage.warning('请先选择文章类别')
    return
  }
  searchFormData.value.pageNum = 1
  queryDataList()
}

const handleReset = () => {
  searchFormData.value.title = ''
  handleSearch()
}

const handleCategoryClick = (node: CategoryNode) => {
  selectedCategory.value = node
  searchFormData.value.pageNum = 1
  multipleSelection.value = []
  queryDataList()
}

const fetchCategoryOptions = async () => {
  const res = await categoryApi.getList()
  if (res.status === 200) {
    categoryOptions.value = res.data
  }
}

const openTransferDialog = (row) => {
  transferArticleId.value = row.id
  transferForm.value = {
    category: row.category?.uuid || '',
  }
  transferDialogVisible.value = true
}

const confirmTransfer = async () => {
  if (!transferArticleId.value) {
    ElMessage.error('未找到文章信息')
    return
  }
  if (!transferForm.value.category) {
    ElMessage.warning('请选择目标分类')
    return
  }
  transferLoading.value = true
  try {
    const response = await adminHttp({
      url: `/news/articles/${transferArticleId.value}/`,
      method: 'patch',
      data: {
        category: transferForm.value.category,
      },
    })
    if (response.status === 200) {
      ElMessage.success('转移成功')
      transferDialogVisible.value = false
      queryDataList()
    } else {
      ElMessage.error('转移失败')
    }
  } catch (error) {
    ElMessage.error('转移失败')
  } finally {
    transferLoading.value = false
  }
}

const resetTransferDialog = () => {
  transferForm.value = { category: '' }
  transferArticleId.value = null
  transferLoading.value = false
}

const modInfo = (newsId) => {
  if (!selectedCategory.value) {
    ElMessage.warning('请先选择文章类别')
    return
  }
  drawerVisible.value = true
  title.value = '编辑文章'
  if (editorRef.value) {
    editorRef.value.valueHtml = ''
  }

  articleApi.getOne(newsId).then((response) => {
    if (response.status === 200) {
      const data = response.data
      addFormData.value = {
        id: data.id,
        title: data.title,
        pic: data.pic || '',
        content: data.content || '',
        create_date: data.create_date || '',
        author: data.author?.id || adminData.value.id,
        out_link: data.out_link || '',
        is_check: data.is_check === true || data.is_check === 1 ? '1' : '0',
        is_top: data.is_top === true || data.is_top === 1 ? '1' : '0',
        is_hot: data.is_hot === true || data.is_hot === 1 ? '1' : '0',
        is_delete: data.is_delete === true || data.is_delete === 1 ? '1' : '0',
        hits: data.hits || 0,
      }
      currentPic.value = data.pic || ''
      nextTick(() => {
        if (editorRef.value && data.content) {
          editorRef.value.valueHtml = data.content
        }
      })
    } else {
      ElMessage.error('获取文章详情失败')
    }
  })
}

const delInfo = (id) => {
  ElMessageBox.confirm('确定要删除该文章吗？', '提示', {
    confirmButtonText: '确定',
    cancelButtonText: '取消',
    type: 'warning',
  })
    .then(() => {
      articleApi.delete(id).then((response) => {
        if (response.status === 204) {
          ElMessage.success('删除成功')
          queryDataList()
        } else {
          ElMessage.error('删除失败')
        }
      })
    })
    .catch(() => {
      ElMessage.info('已取消删除')
    })
}

const createDefaultForm = () => ({
  id: '',
  title: '',
  pic: '',
  content: '',
  create_date: '',
  author: adminData.value.id,
  out_link: '',
  is_check: '1',
  is_top: '0',
  is_hot: '0',
  is_delete: '0',
  hits: 0,
})

const addFormData = ref(createDefaultForm())
const multipleSelection = ref<number[]>([])
const handleSelectionChange = (val) => {
  multipleSelection.value = val.map((item) => item.id)
}

const deleteChecked = () => {
  if (!selectedCategory.value) {
    ElMessage.warning('请先选择文章类别')
    return
  }
  if (!multipleSelection.value.length) {
    ElMessage.warning('请选择需要删除的文章')
    return
  }
  ElMessageBox.confirm('确定要删除选中的文章吗？', '提示', {
    confirmButtonText: '确定',
    cancelButtonText: '取消',
    type: 'warning',
  })
    .then(() => {
      articleApi.deleteChecked(multipleSelection.value).then((response) => {
        if (response.status === 200) {
          ElMessage.success('删除成功')
          queryDataList()
        } else {
          ElMessage.error('删除失败')
        }
      })
    })
    .catch(() => {
      ElMessage.info('已取消删除')
    })
}

const handleSizeChange = (val: number) => {
  searchFormData.value.pageSize = val
  searchFormData.value.pageNum = 1
  queryDataList()
}

const handleCurrentChange = (val: number) => {
  searchFormData.value.pageNum = val
  queryDataList()
}

const drawerVisible = ref(false)
const showDrawer = () => {
  if (!selectedCategory.value) {
    ElMessage.warning('请先选择文章类别')
    return
  }
  title.value = '新增文章'
  drawerVisible.value = true
  addFormData.value = {
    ...createDefaultForm(),
    create_date: dayjs().format('YYYY-MM-DD'),
  }
  currentPic.value = ''
  nextTick(() => {
    if (editorRef.value) {
      editorRef.value.valueHtml = ''
    }
  })
}

const articleForm = ref()
const addFormConfirm = () => {
  if (!selectedCategory.value) {
    ElMessage.error('请先选择文章类别')
    return
  }
  if (!articleForm.value) return
  articleForm.value.validate((valid) => {
    if (valid) {
      addFormData.value.content = getEditorValue()
      const submitData = {
        ...addFormData.value,
        category: selectedCategory.value?.uuid,
      }
      if (!addFormData.value.id) {
        articleApi.create(submitData).then((response) => {
          if (response.status === 201) {
            ElMessage.success('新增成功')
            drawerCancel()
          } else {
            ElMessage.error('新增失败')
          }
        })
      } else {
        articleApi.update(addFormData.value.id, submitData).then((response) => {
          if (response.status === 200) {
            ElMessage.success('修改成功')
            drawerCancel()
          } else {
            ElMessage.error('修改失败')
          }
        })
      }
    } else {
      ElMessage.error('请填写完整表单内容')
    }
  })
}

const drawerCancel = () => {
  htmlContent.value = ''
  currentPic.value = ''
  if (editorRef.value) {
    editorRef.value.valueHtml = ''
  }
  addFormData.value = createDefaultForm()
  if (articleForm.value) {
    articleForm.value.resetFields()
  }
  drawerVisible.value = false
  queryDataList()
}

const init = () => {
  queryDataList()
}

onMounted(() => {
  init()
  fetchCategoryOptions()
})

const rules = reactive({
  title: [{ required: true, message: '标题为必填项', trigger: 'blur' }],
})
</script>

<style scoped>
.articles-admin-page {
  display: flex;
  flex-direction: column;
  gap: 20px;
}

.articles-admin {
  display: flex;

}

.category-panel {
  width: 220px;
  flex-shrink: 0;
}

.category-card {
  border: 1px solid var(--el-border-color);
  border-radius: 12px;
  box-shadow: var(--el-box-shadow-light);
}

.category-card__header {
  display: flex;
  align-items: center;
  gap: 8px;
  font-size: 15px;
  font-weight: 600;
  color: var(--el-text-color-primary);
}

.category-card__icon {
  color: var(--el-color-primary);
}

.category-scroll {
  max-height: 520px;
  padding: 6px 4px 10px 0;
}

.category-tree :deep(.el-tree-node__content) {
  height: 36px;
  border-radius: 8px;
  margin: 2px 4px;
  padding: 0 12px;
  transition: background-color 0.15s ease;
}

.category-tree :deep(.el-tree-node__content:hover) {
  background-color: var(--el-color-primary-light-9);
}

.category-tree :deep(.is-current > .el-tree-node__content) {
  background-color: var(--el-color-primary-light-8);
  color: var(--el-color-primary);
  font-weight: 600;
}

.category-tree :deep(.el-tree-node__label) {
  font-size: 14px;
  color: var(--el-text-color-regular);
}

.article-panel {
  flex: 1;
  display: flex;
  margin: 20px;
}

.article-panel__content {
  display: flex;
  flex-direction: column;
  gap: 16px;
  width: 100%;
}

.article-panel__top {
  display: flex;
  flex-direction: column;
  gap: 16px;
}

.search-form {
  display: flex;
  flex-wrap: wrap;
  gap: 12px;
}

.action-buttons {
  display: flex;
  flex-wrap: wrap;
  gap: 12px;
}

.article-panel__bottom {
  display: flex;
  flex-direction: column;
  gap: 16px;
}

.article-panel__empty {
  flex: 1;
  display: flex;
  align-items: center;
  justify-content: center;
}

.category-meta {
  font-weight: 500;
}

.avatar-uploader .avatar {
  width: 178px;
  height: 178px;
  display: block;
}
.avatar-uploader .el-upload {
  border: 1px dashed var(--el-border-color);
  border-radius: 6px;
  cursor: pointer;
  position: relative;
  overflow: hidden;
  transition: var(--el-transition-duration-fast);
}

.avatar-uploader .el-upload:hover {
  border-color: var(--el-color-primary);
}

.el-icon.avatar-uploader-icon {
  font-size: 28px;
  color: #8c939d;
  width: 178px;
  height: 178px;
  text-align: center;
}
</style>
