import publicHttp from '@/util/publicHttp'
import adminHttp from '@/util/adminHttp'
import userHttp from '@/util/userHttp'

// 应发工资管理API
export default {
  // 获取所有应发工资
  getList(params = {}) {
    return publicHttp.get('/salary/salaryYingFa/', { params })
  },

  getListByIdCard(idCard) {
    return userHttp.get(`/salary/salaryYingFa/getListByIdCard/?idCard=${idCard}`)
  },

  getOne(id) {
    return adminHttp.get(`/salary/salaryYingFa/${id}/`)
  },


  // 创建应发工资
  create(data) {
    return adminHttp.post('/salary/salaryYingFa/', data)
  },

  // 更新应发工资
  update(id, data) {
    return adminHttp.put(`/salary/salaryYingFa/${id}/`, data)
  },

  // 删除应发工资
  delete(id) {
    return adminHttp.delete(`/salary/salaryYingFa/${id}/`)
  },

  deleteChecked: (ids) => {
    return adminHttp({
      url: `/salary/salaryYingFa/deleteChecked/`,
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
    return adminHttp.post('/salary/salaryYingFa/importExcel/', formData, {
      headers: {
        'Content-Type': 'multipart/form-data'
      }
    })
  },

}
