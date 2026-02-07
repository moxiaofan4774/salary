<template>
    <div class="panel">
      <el-button type="primary" :icon="Plus" @click="showDialog">新增</el-button>
  
      <br /><br />
      <el-table :data="dataList" row-key="id" style="width: 100%" border :cell-style="{textAlign: 'center'}" :header-cell-style="{textAlign: 'center'}">
        <el-table-column type="index" label="序号" width="80" />
        <el-table-column property="name" label="名称" />
        <el-table-column property="pic" label="图片">
          <template #default="scope">
            <img :src="serverUrl + scope.row.pic" style="width: 240px; height: 70px" />
          </template>
        </el-table-column>
        <el-table-column property="order" label="排序" />
        <el-table-column property="link_url" label="链接地址" />
        <el-table-column label="是否显示">
          <template #default="scope">
            <el-switch v-model="scope.row.is_show" @change="modIsShow(scope.row)" />
          </template>
        </el-table-column>
  
        <el-table-column label="操作" fixed="right">
          <template #default="scope">
            <el-button type="primary" @click="modInfo(scope.row)">编辑</el-button>
            <el-button type="danger" @click="delInfo(scope.row.id)">删除</el-button>
          </template>
        </el-table-column>
      </el-table>
    </div>
  
    <el-dialog
      title="新增"
      v-model="dialogVisible"
      width="600px"
      draggable
      :close-on-click-modal="false"
      @close="cancle"
    >
      <el-form ref="addForm" :model="itemData" :rules="rules" label-width="100px">
        <el-form-item label="名称" prop="name">
          <el-input v-model="itemData.name" placeholder="请输入名称"></el-input>
        </el-form-item>
        <el-form-item label="图片" prop="pic">
          <AvatarUploader v-model="currentPic" @upload-success="handleUpload" />
        </el-form-item>
        <el-form-item label="链接地址" prop="link_url">
          <el-input v-model="itemData.link_url">#</el-input>
        </el-form-item>
        <el-form-item label="排序" prop="order">
          <el-input-number v-model="itemData.order" :min="0" :max="100" />
        </el-form-item>
  
        <el-form-item label="备注">
          <el-input v-model="itemData.desc" type="textarea" placeholder="请输入备注"></el-input>
        </el-form-item>
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button type="primary" @click="addDone" :icon="Edit">确定</el-button>
          <el-button @click="cancle" :icon="Delete">取消</el-button>
        </div>
      </template>
    </el-dialog>
  </template>
  
  <script lang="ts" setup>
  import { ElMessage, ElMessageBox } from 'element-plus'
  import { onMounted, ref, reactive } from 'vue'
  import { Plus, Delete, Edit, Tools } from '@element-plus/icons-vue'
  import AvatarUploader from '@/components/AvatarUploader.vue'
  import bannerApi from '@/api/news/bannerApi.js'
  // @ts-ignore
  const serverUrl = import.meta.env.VITE_APP_SERVER_URL
  // 用于 v-model 回显的图片地址
  const currentPic = ref('')
  const handleUpload = (url: string) => {
    itemData.value.pic = url
  }
  
  const dialogVisible = ref(false)
  const dataList = ref([])
  
  const queryDataList = () => {
    bannerApi.getList().then((response) => {
      if (response.status == 200) {
        dataList.value = response.data
      } else {
        ElMessage.error('获取数据失败!')
      }
    })
  }
  const itemData = ref({
    id: '',
    name: '',
    order: 0,
    desc: '',
    link_url: '#',
    is_show: 1,
    pic: '',
  })
  
  const addForm = ref(null)
  const addDone = () => {
    // 调用表单校验（异步）
    addForm.value.validate((valid) => {
      if (valid) {
        // 校验通过：执行提交逻辑（如调用 API）
        //如果uuid不为空，则修改，
        if (!itemData.value.id) {
          bannerApi.create(itemData.value).then((response) => {
            if (response.status == 201) {
              dialogVisible.value = false
              ElMessage.success('新增成功！')
              init()
            } else {
              ElMessage.error('新增失败！')
            }
          })
        } else {
          bannerApi.update(itemData.value.id, itemData.value).then((response) => {
            if (response.status == 200) {
              dialogVisible.value = false
              ElMessage.success('修改成功！')
              init()
            } else {
              ElMessage.error('修改失败！')
            }
          })
        }
      } else {
        // 校验不通过：提示错误，弹窗不关闭
        ElMessage.error('请填写完整表单内容！')
      }
    })
  }
  
  const modIsShow = async (row) => {
    const oldValue = row.is_show
    try {
      // 可加 loading 状态
      const res = await bannerApi.updateStatus(row.id, 'is_show', row.is_show)
      if (res.status === 200) {
        ElMessage.success('设置成功！')
        // 不用刷新全表
      } else {
        throw new Error()
      }
    } catch {
      ElMessage.error('设置失败！')
      row.is_show = oldValue // 回滚
    }
  }
  const showDialog = () => {
    dialogVisible.value = true
    currentPic.value = ''
  }
  const cancle = () => {
    itemData.value = {
      id: '',
      name: '',
      order: 0,
      desc: '',
      link_url: '#',
      is_show: 1,
      pic: '',
    }
    dialogVisible.value = false
  }
  // 表单验证规则
  const rules = reactive({
    name: [{ required: true, message: '名称为必填', trigger: 'blur' }],
  
    link_url: [{ required: true, message: '链接地址为必填', trigger: 'blur' }],
  
    // 其他字段验证可按需补充
  })
  const modInfo = (row) => {
    itemData.value = row
    currentPic.value = row.pic
    dialogVisible.value = true
  }
  
  const delInfo = (id) => {
    ElMessageBox.confirm('确定要删除吗?', '提醒', {
      confirmButtonText: '确定',
      cancelButtonText: '取消',
      type: 'warning',
    })
      .then(() => {
        bannerApi.delete(id).then((response) => {
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
  
  const init = () => {
    queryDataList()
    cancle()
  }
  onMounted(() => {
    init()
  })
  </script>
  
  <style scoped lang="scss"></style>
  