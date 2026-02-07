import publicHttp from '@/util/publicHttp'
import adminHttp from '@/util/adminHttp'
import userHttp from '@/util/userHttp'

// 年月管理API
export default {
  // 获取所有年月
  getList() {
    return publicHttp.get('/salary/yearAndMonth/')
  },

  // 获取用户的薪资列表（包含应发、扣款、实发）
  getUserSalaryList(idCard) {
    return userHttp.get('/salary/yearAndMonth/getUserSalaryList/', {
      params: { idCard }
    })
  },

  // 获取指定年月的薪资详情
  getSalaryDetail(yearMonthId, idCard) {
    return userHttp.get('/salary/yearAndMonth/getSalaryDetail/', {
      params: { yearMonthId, idCard }
    })
  },

  getOne(id) {
    return adminHttp.get(`/salary/yearAndMonth/${id}/`)
  },


  // 创建年月
  create(data) {
    return adminHttp.post('/salary/yearAndMonth/', data)
  },

  // 更新年月
  update(id, data) {
    return adminHttp.put(`/salary/yearAndMonth/${id}/`, data)
  },

  // 删除年月
  delete(id) {
    return adminHttp.delete(`/salary/yearAndMonth/${id}/`)
  },

}
