<template>
    <div class="panel">
      <el-form :inline="true" :model="searchFormData">
        <el-form-item label="文章标题">
          <el-input
            v-model="searchFormData.title"
            placeholder="搜索文章标题"
            clearable
            @clear="queryDataList"
          />
        </el-form-item>
  
        <el-form-item>
          <el-button type="primary" @click="queryDataList">搜索</el-button>
        </el-form-item>
      </el-form>
    </div>
  
    <div class="panel">
      <el-button type="primary" @click="showDrawer" style="margin-top: 10px">新增文章</el-button>
      <el-button type="danger" @click="deleteChecked" style="margin-top: 10px">批量删除</el-button>
      <br /><br />
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
            <el-tag v-if="scope.row.is_check" type="primary" style="margin: 0px 5px">正常</el-tag>
            <el-tag v-else="scope.row.is_check" type="danger" style="margin: 0px 5px">下架</el-tag>
            <el-tag v-if="scope.row.is_delete" type="primary" style="margin: 0px 5px">已删除</el-tag>
            <el-tag v-if="scope.row.is_top" type="success" style="margin: 0px 5px">置顶</el-tag>
          </template>
        </el-table-column>
  
        <el-table-column label="操作" fixed="right">
          <template #default="scope">
            <el-button type="primary" @click="modInfo(scope.row.id)">修改</el-button>
            <el-button type="danger" @click="delInfo(scope.row.id)">删除</el-button>
          </template>
        </el-table-column>
      </el-table>
  
      <!--分页区-->
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
          <!-- 左右布局 -->
          <el-row :gutter="20">
            <!-- 左侧富文本编辑器 -->
  
            <el-col :span="16">
              <el-form-item label="文章标题" prop="title">
                <el-input v-model="addFormData.title" placeholder="请输入文章标题"></el-input>
              </el-form-item>
              <div style="border: 1px dashed #ccc; min-height: 600px; margin-bottom: 20px">
                <BasicEditor ref="editorRef" v-model="addFormData.content"></BasicEditor>
              </div>
            </el-col>
            <!-- 右侧表单 -->
            <el-col :span="8">
              <el-form-item label="文章作者" prop="author">
                <el-input
                  v-model="adminData.username"
                  placeholder="请输入文章作者"
                  disabled
                ></el-input>
              </el-form-item>
              <el-form-item label="分类" prop="category">
                <el-cascader
                  v-model="addFormData.category"
                  :options="categoryOptions"
                  :props="cascaderProps"
                  clearable
                  filterable
                  placeholder="请选择分类"
                  style="width: 100%"
                />
              </el-form-item>
              <el-form-item label="文章封面" prop="pic">
                <AvatarUploader v-model="currentPic" @upload-success="handleUpload" />
              </el-form-item>
              <el-form-item label="点击数" prop="sort">
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
  </template>
  
  <script lang="ts" setup>
  import { ElMessage, ElMessageBox } from 'element-plus'
  import { onMounted, ref, reactive } from 'vue'
  import { Plus } from '@element-plus/icons-vue'
  import BasicEditor from '@/components/BasicEditor.vue'
  import { useAdminStore } from '@/stores/adminStore'
  import AvatarUploader from '@/components/AvatarUploader.vue'
  import articleApi from '@/api/news/articleApi'
  import categoryApi from '@/api/news/categoriesApi'
  import { nextTick } from 'vue'
  import dayjs from 'dayjs'
  import { storeToRefs } from 'pinia'
  // 用于 v-model 回显的图片地址
  const currentPic = ref('')
  const handleUpload = (url: string) => {
    addFormData.value.pic = url
  }
  
  const adminStore = useAdminStore()
  type AdminData = { username?: string; [key: string]: any }
  const { adminData } = storeToRefs(adminStore) as { adminData: import('vue').Ref<AdminData> }
  //editor的值
  const editorRef = ref(null) // 富文本组件实例
  const title = ref('新增文章')
  const htmlContent = ref('')
  
  const getEditorValue = () => {
    // 获取富文本内容
    return editorRef.value ? editorRef.value.valueHtml : ''
  }
  
  const searchFormData = ref({
    title: '',
    pageNum: 1,
    pageSize: 10,
  })
  const dataList = ref([])
  const total = ref(0)
  const queryDataList = () => {
    articleApi.getList(searchFormData.value).then((response) => {
      if (response.status == 200) {
        dataList.value = response.data.results
        total.value = response.data.count
      } else {
        ElMessage.error('获取数据失败!')
      }
    })
  }
  const categoryOptions = ref([])
  const cascaderProps = {
    value: 'uuid',
    label: 'name',
    children: 'children',
    emitPath: true,
    checkStrictly: true,
  }
  
  // 获取分类树数据
  const fetchCategoryOptions = async () => {
    const res = await categoryApi.getList()
    if (res.status === 200) {
      categoryOptions.value = res.data
    }
  }
  
  const modInfo = (newsId) => {
    drawerVisible.value = true
    title.value = '编辑文章'

    articleApi.getOne(newsId).then((response) => {
      if (response.status == 200) {
        const data = response.data
       

        // 分类回显
        let categoryPath = []
        if (data.category && data.category.uuid) {
          categoryPath = findCategoryPath(categoryOptions.value, data.category.uuid)
        }

        

        // 赋值
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
          category: categoryPath || [],
        }

        // 图片回显
        currentPic.value = data.pic || ''

        // 等待 DOM 更新后再设置富文本编辑器内容
        nextTick(() => {
          if (editorRef.value && data.content) {
            editorRef.value.valueHtml = data.content
            htmlContent.value = data.content
          }
        })
      } else {
        ElMessage.error('获取信息错误！')
      }
    })
  }
  const delInfo = (id) => {
    ElMessageBox.confirm('确定要删除吗?', '提醒', {
      confirmButtonText: '确定',
      cancelButtonText: '取消',
      type: 'warning',
    })
      .then(() => {
        articleApi.delete(id).then((response) => {
          if (response.status == 204) {
            ElMessage.success('删除成功！')
            queryDataList()
          } else {
            ElMessage.error('删除失败！')
          }
        })
      })
      .catch(() => {
        ElMessage.info('取消删除！')
      })
  }
  const addFormData = ref({
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
    category: [], // 新增 category 字段
  })
  //复选框选择的数据
  const multipleSelection = ref([])
  const handleSelectionChange = (val) => {
    multipleSelection.value = val.map((item) => {
      return item.id
    })
  }
  //删除选中的数据
  const deleteChecked = () => {
    ElMessageBox.confirm('确定要删除吗?', '提醒', {
      confirmButtonText: '确定',
      cancelButtonText: '取消',
      type: 'warning',
    })
      .then(() => {
        articleApi.deleteChecked(multipleSelection.value).then((response) => {
          if (response.status == 200) {
            ElMessage.success('删除成功！')
            queryDataList()
          } else {
            ElMessage.error('删除失败！')
          }
        })
      })
      .catch(() => {
        ElMessage.info('取消删除！')
      })
  }
  //pagesize change
  const handleSizeChange = (val: number) => {
    queryDataList()
  }
  
  //currentPage change
  const handleCurrentChange = (val: number) => {
    queryDataList()
  }
  
  const drawerVisible = ref(false)
  const showDrawer = () => {
    title.value = '新增文章'
    drawerVisible.value = true

    // 新增时重置表单
    addFormData.value = {
      id: '',
      title: '',
      pic: '',
      content: '',
      create_date: dayjs().format('YYYY-MM-DD'), // 默认当前日期
      author: adminData.value.id,
      out_link: '',
      is_check: '1',
      is_top: '0',
      is_hot: '0',
      is_delete: '0',
      hits: 0,
      category: [], // 新增 category 字段
    }

    // 清空富文本编辑器和图片
    currentPic.value = ''
    nextTick(() => {
      if (editorRef.value) {
        editorRef.value.valueHtml = ''
      }
    })
  }
  
  const articleForm = ref(null)
  // 新增/编辑时，addFormData.category 需为 [parentUuid, childUuid] 形式
  // 提交时，取 addFormData.category 的最后一个 uuid 作为分类 id
  const addFormConfirm = () => {
    articleForm.value.validate((valid) => {
      if (valid) {
        addFormData.value.content = getEditorValue()
        // 只传最后一级分类uuid
        const categoryPath = addFormData.value.category
        const categoryId = Array.isArray(categoryPath)
          ? categoryPath[categoryPath.length - 1]
          : categoryPath
        const submitData = {
          ...addFormData.value,
          category: categoryId,
        }
  
        // 如果uuid不为空，则修改
        if (!addFormData.value.id) {
          articleApi.create(submitData).then((response) => {
            if (response.status == 201) {
              drawerVisible.value = false
              ElMessage.success('新增成功！')
              init()
              drawerCancel()
            } else {
              ElMessage.error('新增失败！')
            }
          })
        } else {
          articleApi.update(addFormData.value.id, submitData).then((response) => {
            if (response.status == 200) {
              drawerVisible.value = false
              ElMessage.success('修改成功！')
              init()
              drawerCancel()
            } else {
              ElMessage.error('修改失败！')
            }
          })
        }
      } else {
        ElMessage.error('请填写完整表单内容！')
      }
    })
  }
  
  const drawerCancel = () => {
    htmlContent.value = ''
    currentPic.value = ''

    // 清空富文本编辑器
    if (editorRef.value) {
      editorRef.value.valueHtml = ''
    }

    // 重置表单
    addFormData.value = {
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
      category: [], // 新增 category 字段
    }

    // 重置表单验证
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
    title: [{ required: true, message: '标题为必填', trigger: 'blur' }],
    category: [{ required: true, message: '分类为必填', trigger: 'blur' }],
  
    // 其他字段验证可按需补充
  })
  
  // 递归查找分类路径
  function findCategoryPath(options, targetUuid, path = []) {
    for (const item of options) {
      const newPath = [...path, item.uuid]
      if (item.uuid === targetUuid) return newPath
      if (item.children && item.children.length) {
        const childPath = findCategoryPath(item.children, targetUuid, newPath)
        if (childPath) return childPath
      }
    }
    return null
  }
  </script>
  
  <style scoped>
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
  