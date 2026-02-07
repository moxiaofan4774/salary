import userHttp from '@/util/userHttp'

/**
 * 前台用户薪资查询 API
 * 所有接口都需要用户登录后才能访问
 */
const userSalaryApi = {
  /**
   * 获取当前用户的年月列表
   */
  getMyYearMonthList() {
    return userHttp.get('/salary/yearAndMonth/')
  },

  /**
   * 通过身份证号获取应发工资数据
   * @param {string} idCard - 身份证号
   */
  getYingFaByIdCard(idCard) {
    return userHttp.get('/salary/salaryYingFa/getListByIdCard/', {
      params: { idCard }
    })
  },

  /**
   * 通过身份证号获取扣款数据
   * @param {string} idCard - 身份证号
   */
  getKouKuanByIdCard(idCard) {
    return userHttp.get('/salary/salaryKouKuan/getListByIdCard/', {
      params: { idCard }
    })
  },

  /**
   * 获取指定年月的薪资详情
   * @param {string} yearMonthId - 年月ID
   */
  getSalaryDetail(yearMonthId) {
    return userHttp.get(`/salary/yearAndMonth/${yearMonthId}/`)
  },
}

export default userSalaryApi
