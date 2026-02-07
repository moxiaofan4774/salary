<template>
  <div>
    <div>
      <Toolbar
        :editor="editorRef"
        :defaultConfig="toolbarConfig"
        :mode="mode"
        style="border-bottom: 1px dashed #ccc"
      />
      <Editor
        :defaultConfig="editorConfig"
        :mode="mode"
        v-model="valueHtml"
        style="height: 500px; overflow-y: hidden"
        @onCreated="handleCreated"
        @onChange="handleChange"
        @onDestroyed="handleDestroyed"
        @onFocus="handleFocus"
        @onBlur="handleBlur"
        @customAlert="customAlert"
      />
    </div>
  </div>
</template>

<script>
import '@wangeditor/editor/dist/css/style.css'
import { onBeforeUnmount, ref, shallowRef, onMounted } from 'vue'
import { Editor, Toolbar } from '@wangeditor/editor-for-vue'
const serverUrl = import.meta.env.VITE_APP_SERVER_URL
export default {
  components: { Editor, Toolbar },
  setup() {
    // 编辑器实例，必须用 shallowRef，重要！
    const editorRef = shallowRef()

    // 内容 HTML
    const valueHtml = ref('')

    // 模拟 ajax 异步获取内容
    onMounted(() => {
      setTimeout(() => {
        // valueHtml.value = ''
      }, 200)
    })

    const toolbarConfig = {}
    toolbarConfig.excludeKeys = [
      'video', // 排除菜单组，写菜单组 key 的值即可
      'uploadVideo', // 排除菜单组，写菜单组 key 的值即可
    ]
    const editorConfig = {
      placeholder: '请输入内容...',
      MENU_CONF: {
        uploadImage: {
          server: `${serverUrl}/news/upload_pic/`, // 上传图片地址
          // server: 'http://127.0.0.1:8000/news/upload_pic/', // 上传图片地址

          fieldName: 'file',
          // 选择文件时的类型限制，默认为 ['image/*'] 。如不想限制，则设置为 []
          allowedFileTypes: ['image/*'],
          meta: {},
          metaWithUrl: true, // 参数拼接到 url 上
          headers: { Accept: 'text/x-json' },

          maxFileSize: 10 * 1024 * 1024, // 10M

          base64LimitSize: 5 * 1024, // 5kb 以下插入 base64

          customInsert(res, insertFn) {
            // res 是后端返回的数据
            // 假设 res.data.url 是相对路径
            const relativeUrl = res.data.url
            const fullUrl = serverUrl + relativeUrl
            insertFn(fullUrl, '', '') // 插入完整 URL
          },
          onBeforeUpload(files) {
            // console.log('onBeforeUpload', files)
            return files // 返回哪些文件可以上传
            // return false 会阻止上传
          },
          onProgress(progress) {
            // console.log('onProgress', progress)
          },
          onSuccess(file, res) {
            // 后端返回的相对路径（如："/upload/xxx.jpg"）
            const relativeUrl = res.data.url

            // 拼接完整 URL
            const fullUrl = serverUrl + relativeUrl
            console.log(fullUrl)
            // 返回给 WangEditor 需要的格式
            return {
              errno: 0, // 0 表示成功
              data: { url: fullUrl }, // 图片地址数组（WangEditor 要求格式）
            }
          },
          onFailed(file, res) {
            // alert(res.message)
            console.log('onFailed', file, res)
          },
          onError(file, err, res) {
            // alert(err.message)
            console.error('onError', file, err, res)
          },

          timeout: 10 * 1000, // 超时时间
        },
      },
    }

    // 组件销毁时，也及时销毁编辑器，重要！
    onBeforeUnmount(() => {
      const editor = editorRef.value
      if (editor == null) return

      editor.destroy()
    })

    // 编辑器回调函数
    const handleCreated = (editor) => {
      editorRef.value = editor // 记录 editor 实例，重要！
      editor.setHtml(valueHtml.value)
    }
    const handleChange = (editor) => {}
    const handleDestroyed = (editor) => {}
    const handleFocus = (editor) => {}
    const handleBlur = (editor) => {
      valueHtml.value = editor.getHtml()
      // console.log('blur', valueHtml.value)
    }
    const customAlert = (info, type) => {}
    const customPaste = (editor, event, callback) => {}

    const setHtml = (html) => {
      valueHtml.value = html
      if (editorRef.value) {
        editorRef.value.setHtml(html)
      }
    }

    return {
      editorRef,
      mode: 'default',
      valueHtml,
      toolbarConfig,
      editorConfig,
      handleCreated,
      handleChange,
      handleDestroyed,
      handleFocus,
      handleBlur,
      customAlert,
      customPaste,
      setHtml,
    }
  },
}
</script>
