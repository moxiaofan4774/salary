import publicHttp from '@/util/publicHttp'
import adminHttp from '@/util/adminHttp'

// 扣款管理API
export default {
  // 获取所有扣款
  getList(params = {}) {
    return publicHttp.get('/salary/salaryKouKuan/', { params })
  },

  getOne(id) {
    return adminHttp.get(`/salary/salaryKouKuan/${id}/`)
  },

  // 创建扣款
  create(data) {
    return adminHttp.post('/salary/salaryKouKuan/', data)
  },

  // 更新扣款
  update(id, data) {
    return adminHttp.put(`/salary/salaryKouKuan/${id}/`, data)
  },

  // 删除扣款
  delete(id) {
    return adminHttp.delete(`/salary/salaryKouKuan/${id}/`)
  },

  deleteChecked: (ids) => {
    return adminHttp({
      url: `/salary/salaryKouKuan/deleteChecked/`,
      method: 'post',
      data:{'ids':ids}
    });
  },

  // 导入Excel
  importExcel(file, yearMonthId) {
    const formData = new FormData()
    formData.append('file', file)
    if (yearMonthId) {
      formData.append('year_month_id', yearMonthId)
    }
    return adminHttp.post('/salary/salaryKouKuan/importExcel/', formData, {
      headers: {
        'Content-Type': 'multipart/form-data'
      }
    })
  },

}
