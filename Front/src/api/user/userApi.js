import adminHttp from '@/util/adminHttp'

const userApi = {
  getList: (params = {}) => {
    return adminHttp({
      url: '/user/users/',
      method: 'get',
      params: {
        ...params,
      },
    })
  },

  getOne: (id) => {
    return adminHttp({
      url: `/user/users/${id}/`,
      method: 'get',
    })
  },

  create: (data) => {
    return adminHttp({
      url: '/user/users/',
      method: 'post',
      data,
    })
  },

  update: (id, data) => {
    return adminHttp({
      url: `/user/users/${id}/`,
      method: 'put',
      data,
    })
  },

  delete: (id) => {
    return adminHttp({
      url: `/user/users/${id}/`,
      method: 'delete',
    })
  },

  deleteChecked: (ids) => {
    return adminHttp({
      url: `/user/users/deleteChecked/`,
      method: 'post',
      data: { ids: ids },
    })
  },

  toggleActive: (id) => {
    return adminHttp({
      url: `/user/users/${id}/toggle_active/`,
      method: 'post',
    })
  },

  toggleSuperuser: (id) => {
    return adminHttp({
      url: `/user/users/${id}/toggle_superuser/`,
      method: 'post',
    })
  },

  toggleStaff: (id) => {
    return adminHttp({
      url: `/user/users/${id}/toggle_staff/`,
      method: 'post',
    })
  },
  resetPassword: (id) => {
    return adminHttp({
      url: `/user/users/${id}/reset_password/`,
      method: 'post',
    })
  },

  getSimpleList: () => {
    return adminHttp({
      url: '/user/users/all/',
      method: 'get',
    })
  },

  batchImport: (users) => {
    return adminHttp({
      url: '/user/users/batch_import/',
      method: 'post',
      data: { users },
    })
  },

  // 导入Excel（高性能版本）
  importExcel: (file) => {
    const formData = new FormData()
    formData.append('file', file)
    return adminHttp.post('/user/users/import_excel/', formData, {
      headers: {
        'Content-Type': 'multipart/form-data'
      }
    })
  },
}

export default userApi
